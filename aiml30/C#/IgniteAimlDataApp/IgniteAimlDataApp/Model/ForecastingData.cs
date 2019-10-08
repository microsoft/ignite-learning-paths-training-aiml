using Newtonsoft.Json;
using System;
using System.Collections.Generic;

namespace IgniteAimlDataApp.Model
{
    public class ForecastingData
    {
        public int ID1 { get; set; }
        public int ID2 { get; set; }
        public DateTime Time { get; set; }
        public double Value { get; set; }
        public decimal RDPI { get; set; }
        public int Year { get; set; }
        public int Month { get; set; }
        public int WeekOfMonth { get; set; }
        public int WeekOfYear { get; set; }
        public bool IsUsNewYearsDay { get; set; }
        public bool IsUsLaborDay { get; set; }
        public bool IsBlackFriday { get; set; }
        public bool IsChristmasDay { get; set; }
        public double FreqCos1 { get; set; }
        public double FreqSin1 { get; set; }
        public double FreqCos2 { get; set; }
        public double FreqSin2 { get; set; }
        public double FreqCos3 { get; set; }
        public double FreqSin3 { get; set; }
        public double FreqCos4 { get; set; }
        public double FreqSin4 { get; set; }
        public double Lag1 { get; set; }
        public double Lag2 { get; set; }
        public double Lag3 { get; set; }
        public double Lag4 { get; set; }
        public double Lag5 { get; set; }
        public double Lag6 { get; set; }
        public double Lag7 { get; set; }
        public double Lag8 { get; set; }
        public double Lag9 { get; set; }
        public double Lag10 { get; set; }
        public double Lag11 { get; set; }
        public double Lag12 { get; set; }
        public double Lag13 { get; set; }
        public double Lag14 { get; set; }
        public double Lag15 { get; set; }
        public double Lag16 { get; set; }
        public double Lag17 { get; set; }
        public double Lag18 { get; set; }
        public double Lag19 { get; set; }
        public double Lag20 { get; set; }
        public double Lag21 { get; set; }
        public double Lag22 { get; set; }
        public double Lag23 { get; set; }
        public double Lag24 { get; set; }
        public double Lag25 { get; set; }
        public double Lag26 { get; set; }
        public List<DateTime> DatesInWeek { get; set; }

        public static ForecastingData FromCsv(string csvLine)
        {
            string[] values = csvLine.Split(',');
            ForecastingData forecastingData = new ForecastingData();
            forecastingData.ID1 = Convert.ToInt32(values[0]);
            forecastingData.ID2 = Convert.ToInt32(values[1]);
            forecastingData.Time = Convert.ToDateTime(values[2]);
            forecastingData.Value = Convert.ToDouble(values[3]);
            forecastingData.RDPI = Convert.ToDecimal(values[4]);
            return forecastingData;
        }


    }
}
