using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml;

using CommonLib.Web;
using CommonLib.Utils;
using System.Data;
using CommonLib.DB;

namespace CommonLib.Web
{
    public class CAccount
    {
        private CXmlUtil xmlUtil = null;

        private CWebSql webSql = null;

        public string GetMenuAuth(string adminId)
        {
            string result = string.Empty;

            StringBuilder param = new StringBuilder();
            param.Append(adminId);

            // DB조회
            DataSet ds = WebSql.SelectSql(3805, param.ToString());

            // XML로 변환
            result = XmlUtil.GetXml(ds, "Menu");

            return result;
        }

        public string GetDutyAuth(string dutyNo)
        {
            string result = string.Empty;

            StringBuilder param = new StringBuilder();
            param.Append(dutyNo);

            // DB조회
            DataSet ds = WebSql.SelectSql(3826, param.ToString());

            // XML로 변환
            result = XmlUtil.GetXml(ds, "Auth");

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
