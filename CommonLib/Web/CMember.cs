using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using CommonLib.Web;
using CommonLib.Utils;
using System.Data;
using CommonLib.DB;
using System.Diagnostics;

namespace CommonLib.Web
{
    public class CMember
    {
        private CXmlUtil xmlUtil = null;

        private CWebSql webSql = null;

        public string SetPassword(string id, string pass)
        {
            string result = string.Empty;

            try
            {
                string enc_pass = CSecureUtil.Encrypt(pass);

                /**
                 * 여기에 ID와 패스워드를 이용하여 DB의 데이터 변경 작업을 한다.
                
                // 예시
                StringBuilder param = new StringBuilder();
                param.Append(id);
                param.Append(CConst.DB_PARAM_DELIMITER).Append(enc_pass);

                // DB작업
                //DataSet ds = WebSql.SelectSql(호출프로시저번호, param.ToString());
                DataSet ds = WebSql.SelectSql(3805, param.ToString());
                
                 * 
                 * 
                 */

                // XML로 결과값 리턴
                result = XmlUtil.GetSingleXml(enc_pass);
            }
            catch (Exception e)
            {
                Debug.WriteLine(e.ToString()); 
            }

            return result;
        }

        public string Encrypt(string input)
        {
            string result = string.Empty;

            // XML로 결과값 리턴
            result = XmlUtil.GetSingleXml(CSecureUtil.Encrypt(input));

            return result;
        }

        public string Decrypt(string input)
        {
            string result = string.Empty;

            // XML로 변환
            result = XmlUtil.GetSingleXml(CSecureUtil.Decrypt(input, "abcdefghijklmnopqrstuvwxyz123456"));

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
