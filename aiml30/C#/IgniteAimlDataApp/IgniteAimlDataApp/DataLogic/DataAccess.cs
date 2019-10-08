using IgniteAimlDataApp.Model;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace IgniteAimlDataApp.DataLogic
{
    // Get data from local csv datasets.
    public static class DataAccess
    {
        public static List<ForecastingData> GetForecastingDataFromLocal(string fileName)
        {
            string sourceFile = $"{Environment.CurrentDirectory}\\Datasets\\{fileName}.csv";
            return File.ReadAllLines(sourceFile)
                                           .Skip(1)
                                           .Select(line => ForecastingData.FromCsv(line))
                                           .ToList();
        }
    }
}
