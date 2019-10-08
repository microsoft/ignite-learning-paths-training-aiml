using IgniteAimlDataApp.DataLogic;
using System;
using System.Linq;
using System.Collections.Generic;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using Newtonsoft.Json;
using IgniteAimlDataApp.Model;
using System.Configuration;

namespace IgniteAimlDataApp
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Use default StoreId, ItemId and 4 weeks to predict? ");
            var useDefault = Console.ReadLine().ToUpper() == "Y";
            DataProcess dataprocess = new DataProcess();
            var predictionList = new List<ForecastingData>();

            if (useDefault)
            {
                var data = dataprocess.GetProcessedDataForScore(storeID1: 2, itemID2: 1, weeksToPredict: 4);
                predictionList = data.TakeLast(4).ToList();
            }
            else
            {
                // Get values from user to parse dataset. 
                Console.Write("Enter Store Id: ");
                var storeId = Convert.ToInt32(Console.ReadLine());
                Console.Write("Enter Item Id: ");
                var itemId = Convert.ToInt32(Console.ReadLine());
                Console.Write("Enter weeks to predict: ");
                var weeksToPredict = Convert.ToInt32(Console.ReadLine());

                // Get processed data.
                var data = dataprocess.GetProcessedDataForScore(storeId, itemId, weeksToPredict);
                predictionList = data.TakeLast(weeksToPredict).ToList();
            }

            //Post to api for predictions
            InvokeRequestResponseService(predictionList).Wait();

        }


        static async Task InvokeRequestResponseService(List<ForecastingData> predictionList)
        {
            string apiKey = ConfigurationManager.AppSettings["ApiKey"];

            var handler = new HttpClientHandler()
            {
                ClientCertificateOptions = ClientCertificateOption.Manual,
                ServerCertificateCustomValidationCallback =
                        (httpRequestMessage, cert, cetChain, policyErrors) => { return true; }
            };
            using (var client = new HttpClient(handler))
            {
                var scoreRequest = new
                {
                    //input object is a json with a string of input and a list of dict
                    Inputs = new Dictionary<string, List<ForecastingData>>() {
                        {
                            "input1",
                             predictionList
                        },
                    },
                    GlobalParameters = new Dictionary<string, string>()
                    {
                    }
                };

                // Replace this with the API key for the web service
                client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", apiKey);
                // TODO: Update with your URL here.
                client.BaseAddress = new Uri("");

                // WARNING: The 'await' statement below can result in a deadlock
                // if you are calling this code from the UI thread of an ASP.Net application.
                // One way to address this would be to call ConfigureAwait(false)
                // so that the execution does not attempt to resume on the original context.
                // For instance, replace code such as:
                //      result = await DoSomeTask()
                // with the following:
                //      result = await DoSomeTask().ConfigureAwait(false)

                var requestString = JsonConvert.SerializeObject(scoreRequest);
                var content = new StringContent(requestString);

                content.Headers.ContentType = new MediaTypeHeaderValue("application/json");

                HttpResponseMessage response = await client.PostAsync("", content);

                if (response.IsSuccessStatusCode)
                {
                    string result = await response.Content.ReadAsStringAsync();
                    Console.WriteLine("Result: {0}", result);
                    var forecastingResult = JsonConvert.DeserializeObject<dynamic>(result);
                    for (int i = 0; i < predictionList.Count(); i++)
                    {
                        Console.WriteLine("Date: {0} Result: {1}",
                                          predictionList[i].Time,
                                          Convert.ToInt32(forecastingResult.Results.output1[i].Forecast));
                    }

                }
                else
                {
                    Console.WriteLine(string.Format("The request failed with status code: {0}", response.StatusCode));

                    // Print the headers - they include the requert ID and the timestamp,
                    // which are useful for debugging the failure
                    Console.WriteLine(response.Headers.ToString());

                    string responseContent = await response.Content.ReadAsStringAsync();
                    Console.WriteLine(responseContent);
                }
            }
        }
    }
}


