using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

using HomePage.m_master;

namespace HomePage.en
{
    public partial class index : PageBase
    {
        private const string LANG_CD = "ENG";

        protected void Page_Load(object sender, EventArgs e)
        {
            // 검색창 Enter키 이벤트
            name01.Attributes["onkeypress"] = "if (event.keyCode==13){" + ClientScript.GetPostBackEventReference(btn_Search, name01.Value) + "; return false }";

            if (!IsPostBack)
            {
                SearchData();
            }
        }

        private void SearchData()
        {
            StringBuilder param = new StringBuilder();
            param.Append(LANG_CD);

            SetDataTableList(1000, param.ToString());

            string searchText = string.Empty;

            if (GetDataTableCount(1) > 0)
            {
                searchText = GetData(1, 0, "SRCH_TEXT");
            }
            name01.Attributes["placeholder"] = searchText;

        }


        #region 이벤트 메소드

        /// <summary>
        /// 조회 버튼 클릭
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //SearchData();
            String searchText = name01.Value;
            Response.Redirect("/en/main/search.aspx?search_text=" + searchText);

        }

        #endregion
    }
}