using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;

namespace XWingAgent
{
    public static class CConst
    {
        // Etrade 정보
        public static string XING_SERVER_URL = ConfigurationManager.AppSettings["XING_SERVER_URL"].ToString();
        public static int XING_SERVER_PORT = Convert.ToInt32(ConfigurationManager.AppSettings["XING_SERVER_PORT"]);
        public static string XING_USER_ID = ConfigurationManager.AppSettings["XING_USER_ID"].ToString();
        public static string XING_USER_PWD = ConfigurationManager.AppSettings["XING_USER_PWD"].ToString();

        /// <summary>
        /// 대한뉴팜 종목 코드
        /// </summary>
        public static string SH_CODE = ConfigurationManager.AppSettings["SH_CODE"].ToString();

        /// <summary>
        /// DB 파라미터 Delimiter (String형)
        /// </summary>
        public static string DB_PARAM_DELIMITER = "|";

        /// <summary>
        /// 데이터 가져오는 주기
        /// </summary>
        public static int DATA_CYCLE = 1000 * 60 * 5;

        /// <summary>
        /// 데이터 확인 주기 (연결 이상유무 체크)
        /// </summary>
        public static int DATA_CYCLE2 = 1000 * 60 * 10;

        /// <summary>
        /// 최대 데이터를 못가져온 시간(분)
        /// </summary>
        public static int MAX_DATA_FILE_TIME = 30;
    }
}
