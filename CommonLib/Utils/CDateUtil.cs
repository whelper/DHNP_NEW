using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Diagnostics;

namespace CommonLib.Utils
{
    public static class CDateUtil
    {        
        /// <summary>
        /// String.Format("{0:y yy yyy yyyy}", dt);  // "8 08 008 2008"   year
        /// String.Format("{0:M MM MMM MMMM}", dt);  // "3 03 Mar March"  month
        /// String.Format("{0:d dd ddd dddd}", dt);  // "9 09 Sun Sunday" day
        /// String.Format("{0:h hh H HH}",     dt);  // "4 04 16 16"      hour 12/24
        /// String.Format("{0:m mm}",          dt);  // "5 05"            minute
        /// String.Format("{0:s ss}",          dt);  // "7 07"            second
        /// String.Format("{0:f ff fff ffff}", dt);  // "1 12 123 1230"   sec.fraction
        /// String.Format("{0:F FF FFF FFFF}", dt);  // "1 12 123 123"    without zeroes
        /// String.Format("{0:t tt}",          dt);  // "P PM"            A.M. or P.M.
        /// String.Format("{0:z zz zzz}",      dt);  // "-6 -06 -06:00"   time zone
        /// </summary>
        /// <returns></returns>
        public static string getYYYYMMDD()
        {
            DateTime today = DateTime.Today;

            return String.Format("{0:yyyyMMdd}", today);
        }

        /// <summary>
        /// 오늘 날짜와 시간을 년월일시분으로 리턴한다
        /// </summary>
        /// <returns></returns>
        public static string getYYYYMMDDHHMM()
        {
            DateTime today = DateTime.Now;

            return String.Format("{0:yyyyMMddHHmm}", today);
        }

        /// <summary>
        /// 오늘 날짜를 년-월-일으로 리턴한다
        /// </summary>
        /// <returns></returns>
        public static string getYYYY_MM_DD()
        {
            DateTime today = DateTime.Now;

            return String.Format("{0:yyyy-MM-dd}", today);
        }

        /// <summary>
        /// 1주일 날짜를 년-월-일으로 리턴한다
        /// </summary>
        /// <returns></returns>
        public static string getYYYY_MM_DDLast()
        {
            DateTime today = DateTime.Now.AddDays(-7);

            return String.Format("{0:yyyy-MM-dd}", today);
        }


        /// <summary>
        /// 오늘 날짜와 시간을 년월일시분초으로 리턴한다
        /// </summary>
        /// <returns></returns>
        public static string getYYYYMMDDHHMMSS()
        {
            DateTime today = DateTime.Now;

            return String.Format("{0:yyyy-MM-dd HH:mm:ss}", today);
        }

        /// <summary>
        /// 입력한 포맷으로 리턴
        /// </summary>
        /// <param name="format"></param>
        /// <returns></returns>
        public static string getDate(string format)
        {
            DateTime today = DateTime.Now;

            string date = String.Format(format, today);

            return String.Format(format, today);
        }

        public static string GetYYYYMMDD(string date)
        {
            string result = date;

            try
            {
                if (date == null || date.Equals(""))
                    result = "";
                else if (date.Length == 8)
                {
                    string yyyy = date.Substring(0, 4);
                    string mm = date.Substring(4, 2);
                    string dd = date.Substring(6, 2);

                    result = yyyy + "-" + mm + "-" + dd;
                }
            }
            catch { }

            return result;
        }

        /// <summary>
        /// yyyyMMddhhmmssfff 밀리초까지 모든 시간 포맷을 리턴
        /// </summary>
        /// <returns></returns>
        public static string GetFullNowDate()
        {
            return String.Format("{0:yyyyMMddHHmmssfff}", DateTime.Now);
        }

        /// <summary>
        /// 스트링 데이트 타입(DateTime으로 Convert가능한 String)을 yyyy-MM-dd형식으로 리턴 
        /// </summary>
        /// <param name="date"></param>
        /// <returns></returns>
        public static string GetDateTimeToString(string date)
        {
            string result = date;

            try
            {
                result = String.Format("{0:yyyy-MM-dd}", Convert.ToDateTime(date));
            }
            catch
            {
            }

            return result;
        }

        public static string AddDateFromToday(int dd)
        {
            string result = "";

            try
            {
                result = String.Format("{0:yyyy-MM-dd}", DateTime.Now.AddDays(Convert.ToDouble(dd)));
            }
            catch
            {
            }

            return result;
        }

        /// <summary>
        /// 두날짜의 차이를 분단위로 리턴함
        /// </summary>
        /// <param name="sdate">피비교날짜</param>
        /// <param name="edate">비교날짜</param>
        /// <returns></returns>
        public static int GetDiffDate(string sdate, string edate)
        {
            int diffTime = 0;

            try
            {
                DateTime T1 = DateTime.Parse(sdate);
                DateTime T2 = DateTime.Parse(edate);

                TimeSpan TS = T2 - T1;
                int diffDay = TS.Days;
                int diffHour = TS.Hours;
                int diffMinute = TS.Minutes;

                diffTime = diffDay * 24 + diffHour * 60 + diffMinute;
            }
            catch (Exception e)
            {
                Debug.WriteLine(e.ToString());
            }

            return diffTime;
        }

        public static string AddYearFromToday(int dd)
        {
            string result = "";

            try
            {
                result = String.Format("{0:yyyy-MM-dd}", DateTime.Now.AddYears(dd));
            }
            catch
            {
            }

            return result;
        }
    }
}
