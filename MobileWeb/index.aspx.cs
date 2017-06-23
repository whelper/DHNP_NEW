using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

using MobileWeb.m_master;

namespace MobileWeb
{
    public partial class index : PageBase
    {
        private const string LANG_CD = "KOR";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SearchData();
                SetControls();
            }
        }

        private void SearchData()
        {
            StringBuilder param = new StringBuilder();
            param.Append(LANG_CD);

            SetDataTableList(2400, param.ToString());
        }

        private void SetControls()
        {
            txt_search.Attributes["placeholder"] = GetData(1, 0, "SRCH_TEXT");

            txt_search.Attributes["onkeypress"] = "if (event.keyCode==13){" + ClientScript.GetPostBackEventReference(btn_Search, txt_search.Value) + "; return false }";
        }

        /// <summary>
        /// 조회 버튼 클릭
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //SearchData();
            String searchText = txt_search.Value;
            Response.Redirect("search.aspx?search_text=" + searchText);

        }
    }
}