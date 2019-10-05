using IgniteAimlDataApp.Model;
using System;
using System.Collections.Generic;
using System.Linq;

namespace IgniteAimlDataApp.DataLogic
{
    public class DataProcess
    {
        public List<ForecastingData> GetProcessedDataForScore(int storeID1, int itemID2, int weeksToPredict)
        {
            // Load forecasting data and filter by ids needed for prediction.
            var forecastingData = DataAccess.GetForecastingDataFromLocal("ForecastingData")
                                            .Where(item => item.ID1 == storeID1 && item.ID2 == itemID2)
                                            .ToList();
            // Add dates for weeks to predict.
            forecastingData = AddWeeksToPredict(forecastingData, weeksToPredict, storeID1, itemID2);
            // Create Lag Features
            forecastingData = CreateLagFeatures(forecastingData);
            return forecastingData;

        }
        public List<ForecastingData> AddWeeksToPredict(List<ForecastingData> forecastData, int weeksToPredict, int storeID1, int itemID2)
        {
            var latestData = forecastData.OrderByDescending(data => data.Time).First();
            var latestDate = latestData.Time;
            var latestRdpi = latestData.RDPI;

            for (int i = 0; i < weeksToPredict; i++)
            {
                latestDate = latestDate.AddDays(7);
                var forcastingDataItem = new ForecastingData
                {
                    ID1 = storeID1,
                    ID2 = itemID2,
                    Time = latestDate,
                    Value = 0,
                    RDPI = latestRdpi,
                    DatesInWeek = new List<DateTime>()
                };
                // Populate dates in week for new items.
                for (var dt = forcastingDataItem.Time; dt <= forcastingDataItem.Time.AddDays(6); dt = dt.AddDays(1))
                {
                    forcastingDataItem.DatesInWeek.Add(dt);
                }
                // Create Time Features for new week.
                forcastingDataItem = CreateTimeFeatures(forcastingDataItem);
                // Create Fourier Features for new week.
                forcastingDataItem = CreateFourierFeatures(forcastingDataItem);
                forecastData.Add(forcastingDataItem);
            }
            return forecastData;

        }
        public ForecastingData CreateFourierFeatures(ForecastingData forecastData)
        {
            // Set seasonality to 52 which is the number of weeks in a year.

            var seasonality = 52;

            forecastData.FreqCos1 = Math.Cos(forecastData.WeekOfYear * 2 * Math.PI * 1 / seasonality);
            forecastData.FreqSin1 = Math.Sin(forecastData.WeekOfYear * 2 * Math.PI * 1 / seasonality);

            forecastData.FreqCos2 = Math.Cos(forecastData.WeekOfYear * 2 * Math.PI * 2 / seasonality);
            forecastData.FreqSin2 = Math.Sin(forecastData.WeekOfYear * 2 * Math.PI * 2 / seasonality);

            forecastData.FreqCos3 = Math.Cos(forecastData.WeekOfYear * 2 * Math.PI * 3 / seasonality);
            forecastData.FreqSin3 = Math.Sin(forecastData.WeekOfYear * 2 * Math.PI * 3 / seasonality);

            forecastData.FreqCos4 = Math.Cos(forecastData.WeekOfYear * 2 * Math.PI * 4 / seasonality);
            forecastData.FreqSin4 = Math.Sin(forecastData.WeekOfYear * 2 * Math.PI * 4 / seasonality);


            return forecastData;
        }

        public ForecastingData CreateTimeFeatures(ForecastingData forecastData)
        {

            // Note: These properties could be set at the model level but to better illustrate the 
            // concepts of time series it was more clear to put them in a method with the other
            // data time processing steps.

            forecastData.Year = forecastData.Time.Year;
            forecastData.Month = forecastData.Time.Month;
            forecastData.WeekOfMonth = Convert.ToInt32(Math.Ceiling(forecastData.Time.Day / 7.0));
            forecastData.WeekOfYear = Convert.ToInt32(Math.Ceiling(forecastData.Time.DayOfYear / 7.0));

            // 4th Friday in November
            forecastData.IsBlackFriday = forecastData.DatesInWeek.Any(date => date.Month == 11 &&
                                                            date.DayOfWeek == DayOfWeek.Friday
                                                            && date.Day > 22
                                                            && date.Day < 29);

            // 1st Monday in September
            forecastData.IsUsLaborDay = forecastData.DatesInWeek.Any(date => date.Month == 9
                                                     && date.DayOfWeek == DayOfWeek.Monday
                                                     && date.Day < 8);
            // 25th of December
            forecastData.IsChristmasDay = forecastData.DatesInWeek.Any(date => date.Month == 12 && date.Day == 25);
            // 1st of January
            forecastData.IsUsNewYearsDay = forecastData.DatesInWeek.Any(date => date.Month == 1 && date.Day == 1);

            return forecastData;
        }

        public List<ForecastingData> CreateLagFeatures(List<ForecastingData> forecastData)
        {
            // Populate Lag features for previous 26 weeks.

            for (int i = forecastData.Count - 1; i > 26; i--)
            {
                forecastData[i].Lag1 = forecastData[i - 1].Value;
                forecastData[i].Lag2 = forecastData[i - 2].Value;
                forecastData[i].Lag3 = forecastData[i - 3].Value;
                forecastData[i].Lag4 = forecastData[i - 4].Value;
                forecastData[i].Lag5 = forecastData[i - 5].Value;
                forecastData[i].Lag6 = forecastData[i - 6].Value;
                forecastData[i].Lag7 = forecastData[i - 7].Value;
                forecastData[i].Lag8 = forecastData[i - 8].Value;
                forecastData[i].Lag9 = forecastData[i - 9].Value;
                forecastData[i].Lag10 = forecastData[i - 10].Value;
                forecastData[i].Lag11 = forecastData[i - 11].Value;
                forecastData[i].Lag12 = forecastData[i - 12].Value;
                forecastData[i].Lag13 = forecastData[i - 13].Value;
                forecastData[i].Lag14 = forecastData[i - 14].Value;
                forecastData[i].Lag15 = forecastData[i - 15].Value;
                forecastData[i].Lag16 = forecastData[i - 16].Value;
                forecastData[i].Lag17 = forecastData[i - 17].Value;
                forecastData[i].Lag18 = forecastData[i - 18].Value;
                forecastData[i].Lag19 = forecastData[i - 19].Value;
                forecastData[i].Lag20 = forecastData[i - 20].Value;
                forecastData[i].Lag21 = forecastData[i - 21].Value;
                forecastData[i].Lag22 = forecastData[i - 22].Value;
                forecastData[i].Lag23 = forecastData[i - 23].Value;
                forecastData[i].Lag24 = forecastData[i - 24].Value;
                forecastData[i].Lag25 = forecastData[i - 25].Value;
                forecastData[i].Lag26 = forecastData[i - 26].Value;
            }


            return forecastData;
        }
    }
}
