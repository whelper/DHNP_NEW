using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using log4net;
using System.Data;
using System.Web;

using CommonLib.Utils;
using CommonLib.DB;

namespace CommonLib.Web
{
    public class CRecruit
    {
        private static readonly ILog logger = LogManager.GetLogger(typeof(CRecruit));

        private CXmlUtil xmlUtil = null;

        private CWebSql webSql = null;

        public string GetRecruitResult(string reg_seq_no, string name, string cellphone, string email)
        {
            string result = string.Empty;

            name = HttpUtility.UrlDecode(name);

            StringBuilder param = new StringBuilder();
            param.Append(reg_seq_no);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(name);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(cellphone);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(email);

            // DB조회
            DataSet ds = WebSql.SelectSql(1453, param.ToString());

            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                result = XmlUtil.GetDefaultXml(ds.Tables[0].Rows[0]["SUCC_YN"].ToString(), "");
            }
            else
            {
                result = XmlUtil.GetDefaultXml("C", "지원자 정보를 찾지 못했습니다. 입사지원 했던 정보 그대로 입력하셔야 합니다.");
            }

            return result;
        }

        public string GetRecruitMyInfo(string reg_seq_no, string name, string cellphone, string email)
        {
            string result = string.Empty;

            name = HttpUtility.UrlDecode(name);

            StringBuilder param = new StringBuilder();
            param.Append(reg_seq_no);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(name);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(cellphone);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(email);

            // DB조회
            DataSet ds = WebSql.SelectSql(1454, param.ToString());

            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                result = XmlUtil.GetDefaultXml(ds.Tables[0].Rows[0]["SUPPORT_NO"].ToString(), "");
            }
            else
            {
                result = XmlUtil.GetDefaultXml("C", "지원자 정보를 찾지 못했습니다. 입사지원 했던 정보 그대로 입력하셔야 합니다.");
            }

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
