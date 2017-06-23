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
    /// <summary>
    /// 공통코드, 카테고리, 제품 분류 등 전사 공통으로 가져오는 유형들을 정의한 클래스
    /// Ajax를 통해 가져올 수 있도록 Xml형식으로 리턴한다.
    /// </summary>
    public class CCommonCode
    {
        private static readonly ILog logger = LogManager.GetLogger(typeof(CCommonCode));

        private CXmlUtil xmlUtil = null;

        private CWebSql webSql = null;

        /// <summary>
        /// 제품유형을 가져온다.
        /// </summary>
        /// <param name="upperProdTypeNo"></param>
        /// <returns></returns>
        public string GetProductType(string upperProdTypeNo, string depth)
        {
            string result = string.Empty;

            StringBuilder param = new StringBuilder();
            param.Append(upperProdTypeNo);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(depth);

            // DB조회
            DataSet ds = WebSql.SelectSql(1, param.ToString());

            // XML로 변환
            result = XmlUtil.GetXml(ds, "ProductType");

            return result;
        }

        /// <summary>
        /// 카테고리를 가져온다.
        /// </summary>
        /// <returns></returns>
        public string GetCategory()
        {
            string result = string.Empty;

            return result;
        }

        /// <summary>
        /// 공통 코드를 가져온다.
        /// </summary>
        /// <param name="upperCode"></param>
        /// <returns></returns>
        public string GetCommonCode(string upperCode)
        {
            string result = string.Empty;

            return result;
        }

        /// <summary>
        /// 우편번호 검색
        /// </summary>
        /// <param name="text">검색어</param>
        /// <returns></returns>
        public string GetZipcode(string text)
        {
            string result = string.Empty;

            StringBuilder param = new StringBuilder();
            param.Append(text);

            // DB조회
            DataSet ds = WebSql.SelectSql(10, param.ToString());

            // XML로 변환
            result = XmlUtil.GetXml(ds, "Zipcode");

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
