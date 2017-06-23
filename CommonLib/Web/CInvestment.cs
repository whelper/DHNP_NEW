using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using log4net;
using CommonLib.Utils;
using CommonLib.DB;
using System.Data;

namespace CommonLib.Web
{
    public class CInvestment
    {
        private static readonly ILog logger = LogManager.GetLogger(typeof(CProduct));

        private CXmlUtil xmlUtil = null;

        private CWebSql webSql = null;

        /// <summary>
        /// IR 리스트를 가져온다.
        /// </summary>
        /// <param name="upperProdTypeNo"></param>
        /// <returns></returns>
        public string GetIrList(int now_page, string title, string lang_cd)
        {
            string result = string.Empty;

            StringBuilder param = new StringBuilder();
            param.Append(now_page);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(title);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(lang_cd);

            // DB조회
            DataSet ds = WebSql.SelectSql(2201, param.ToString());

            // XML로 변환
            result = XmlUtil.GetXml(ds, "Investment");

            return result;
        }

        /// <summary>
        /// 공고사항 리스트를 가져온다.
        /// </summary>
        /// <param name="upperProdTypeNo"></param>
        /// <returns></returns>
        public string GetNoticeList(int now_page, string title)
        {
            string result = string.Empty;

            StringBuilder param = new StringBuilder();
            param.Append(now_page);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(title);

            // DB조회
            DataSet ds = WebSql.SelectSql(2231, param.ToString());

            // XML로 변환
            result = XmlUtil.GetXml(ds, "Investment");

            return result;
        }

        #region GET-SET

        private CXmlUtil XmlUtil
        {
            get
            {
                if (xmlUtil == null)
                {
                    xmlUtil = new CXmlUtil();
                }

                return xmlUtil;
            }
        }

        private CWebSql WebSql
        {
            get
            {
                if (webSql == null)
                {
                    webSql = new CWebSql();
                }

                return webSql;
            }
        }

        #endregion
    }
}
