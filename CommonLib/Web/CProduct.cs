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
    public class CProduct
    {
        private static readonly ILog logger = LogManager.GetLogger(typeof(CProduct));

        private CXmlUtil xmlUtil = null;

        private CWebSql webSql = null;

        /// <summary>
        /// 제품유형을 가져온다.
        /// </summary>
        /// <param name="upperProdTypeNo"></param>
        /// <returns></returns>
        public string GetProductList(int now_page, string lang_cd, string catg_no1, string catg_no2, string prod_type_cd, string prod_s_init_cd, string prod_e_init_cd, string prod_tag)
        {
            string result = string.Empty;

            StringBuilder param = new StringBuilder();
            param.Append(now_page);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(lang_cd);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(catg_no1); // 1차 카테고리(동물의약품)
            param.Append(CConst.DB_PARAM_DELIMITER).Append(catg_no2); // 2차 카테고리 (항생.소독제)
            param.Append(CConst.DB_PARAM_DELIMITER).Append(prod_type_cd); // 제품유형 코드
            param.Append(CConst.DB_PARAM_DELIMITER).Append(CStringUtil.GetInitial(lang_cd, "S", prod_s_init_cd));
            param.Append(CConst.DB_PARAM_DELIMITER).Append(CStringUtil.GetInitial(lang_cd, "E", prod_e_init_cd));
            param.Append(CConst.DB_PARAM_DELIMITER).Append(prod_tag); // 태그명으로 검색

            // DB조회
            DataSet ds = WebSql.SelectSql(2001, param.ToString());

            // XML로 변환
            result = XmlUtil.GetXml(ds, "Products");

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
