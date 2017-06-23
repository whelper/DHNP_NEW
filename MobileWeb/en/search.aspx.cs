using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

using MobileWeb.m_master;

namespace MobileWeb.en
{
    public partial class search : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitConrols();
            }
        }

        private void InitConrols()
        {
            search_text.Value = Search_text;

            // 검색창 Enter키 이벤트
            search_text.Attributes["onkeypress"] = "if (event.keyCode==13){" + ClientScript.GetPostBackEventReference(btnSearch, search_text.Value) + "; return false }";
        }

        #region GET-SET

        protected string Search_text
        {
            get
            {
                if (Request["search_text"] == null)
                {
                    return "";
                }
                else
                {
                    return Request["search_text"];
                }
            }
        }

        #endregion

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
        }

        #endregion
    }
}