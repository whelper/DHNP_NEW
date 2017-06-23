using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;

namespace CommonLib.Utils
{
    /// <summary>
    /// 고정 const값을 가진 데이터 Class
    /// 전 사이트 & App 공통인 데이터만 여기에 선언
    /// 사이트별로 설정값이 다른 것은 각 프로젝트에서 선언하도록 한다.
    /// </summary>
    public static class CConst
    {
        /// <summary>
        /// DB 파라미터 Delimiter (CHAR형)
        /// </summary>
        public const char DB_PARAM_CHAR_DELIMITER = '|';

        /// <summary>
        /// DB 파라미터 Delimiter (String형)
        /// </summary>
        public const string DB_PARAM_DELIMITER = "|";

        /// <summary>
        /// 기본 시스템 오류 코드
        /// </summary>
        public const string CODE_ERROR = "99";

        /// <summary>
        /// 기본 데이터 없음 코드
        /// </summary>
        public const string CODE_EMPTY = "90";

        /// <summary>
        /// 기본 시스템 오류 메시지
        /// </summary>
        public const string CODE_ERROR_MSG = "시스템 오류가 발생 했습니다.";

        /// <summary>
        /// 기본 데이터 없음 메시지
        /// </summary>
        public const string CODE_EMPTY_MSG = "데이터가 없습니다.";

        /// <summary>
        /// 디렉토리 유형 - 대 매뉴 기준으로만 구분
        /// 물리적인 디렉토리 탐색 부하에 따라 더 세분화 예정
        /// </summary>
        public enum DIR_TYPE {
            DIR_MAIN                        // 메인관리
            , DIR_PRODUCT                   // 제품관리
            , DIR_PROMOTION                 // 홍보관리
            , DIR_INVESTMENT                // 투자관리
            , DIR_RECRUITMENT               // 채용관리 - admin용
            , DIR_RECRUITMENT_USER          // 채용 - 일반 사용자의 이미지
            , DIR_CUSTOMER                  // 고객관리
            , DIR_DIR_SMARTEDITOR           // 스마트에디터
        };

        /// <summary>
        /// 암호화 키
        /// </summary>
        public static string SECURIT_KEY = ConfigurationManager.AppSettings["AESKEY"].ToString();

        // 디렉토리 유형
        public static string DIR_ROOT_IMAGE_PATH = ConfigurationManager.AppSettings["DIR_ROOT_IMAGE_PATH"];
        public static string DOMAIN_IMAGE = ConfigurationManager.AppSettings["DOMAIN_IMAGE"];
        public static string DIR_MAIN = ConfigurationManager.AppSettings["DIR_MAIN"];
        public static string DIR_PRODUCT = ConfigurationManager.AppSettings["DIR_PRODUCT"];
        public static string DIR_PROMOTION = ConfigurationManager.AppSettings["DIR_PROMOTION"];
        public static string DIR_INVESTMENT = ConfigurationManager.AppSettings["DIR_INVESTMENT"];
        public static string DIR_RECRUITMENT = ConfigurationManager.AppSettings["DIR_RECRUITMENT"];
        public static string DIR_RECRUITMENT_USER = ConfigurationManager.AppSettings["DIR_RECRUITMENT_USER"];
        public static string DIR_CUSTOMER = ConfigurationManager.AppSettings["DIR_CUSTOMER"];
        public static string DIR_SMARTEDITOR = ConfigurationManager.AppSettings["DIR_SMARTEDITOR"];

        public static string ADMIN_ROOT = ConfigurationManager.AppSettings["ADMIN_ROOT"].ToString();
        public static string MOBILE_ROOT = ConfigurationManager.AppSettings["MOBILE_ROOT"].ToString();
    }
}
