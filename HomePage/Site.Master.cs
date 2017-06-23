using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;

using CommonLib.DB;
using CommonLib.Utils;

namespace HomePage
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        private string LANG_CD = "KOR";
        private string parentUri = ""; // content 웹페이지 부모 Uri(폴더) 
        private string pageName = ""; // 웹페이지 이름

        CWebSql webSql = null;
        DataSet mds = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            ParserURL();
        }

        private void ParserURL()
        {
            parentUri = CWebUtil.GetWebpageParentURI(Request.Url.LocalPath, '/');
            pageName = CWebUtil.GetLastURI(Request.Url.LocalPath, '/');
        }

        /// <summary>
        /// 선택된 GNB영역 CSS
        /// </summary>
        /// <param name="parentUri"></param>
        /// <returns></returns>
        protected string GetGnbIndicator(string parentUri)
        {
            string css = "";

            if (parentUri.Equals(this.parentUri))
            {
                css = " onhover";
            }

            return css;
        }

        /// <summary>
        /// 데이터 조회
        /// </summary>
        private void SearchData()
        {
            StringBuilder param = new StringBuilder();
            param.Append(LANG_CD);

            mds = WebSql.SelectSql(1001, param.ToString());
        }

        #region GET-SET

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

        protected DataSet MDS
        {
            get
            {
                if (mds == null)
                {
                    SearchData();
                }

                return mds;
            }
        }

        #endregion
    }
}
