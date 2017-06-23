using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;

using CommonLib.Utils;
using HomePage.m_master;

namespace HomePage.en.main
{
    public partial class search : PageBase
    {
        private const string LANG_CD = "ENG";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitConrols();

                SearchData();
            }
        }

        private void InitConrols()
        {
            searchText.Value = Search_text;

            // 검색창 Enter키 이벤트
            searchText.Attributes["onkeypress"] = "if (event.keyCode==13){" + ClientScript.GetPostBackEventReference(btnSearch, searchText.Value) + "; return false }";
        }

        /// <summary>
        /// 데이터 조회
        /// </summary>
        private void SearchData()
        {
            StringBuilder param = new StringBuilder();
            param.Append(nowPageNo.Value);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(LANG_CD);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(searchText.Value);

            SetDataCount(1002, param.ToString());

            if (DataTotalCount > 0)
            {
                SetDataList(1003, param.ToString());
            }
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

        protected string CATG_NO1
        {
            get
            {
                if (Request["catg_no1"] == null)
                {
                    return "";
                }
                else
                {
                    return Request["catg_no1"];
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

            // 페이지는 1로 초기화
            nowPageNo.Value = "1";

            SearchData();
        }

        /// <summary>
        /// 페이지 번호 클릭
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void nowPageNo_ValueChanged(object sender, EventArgs e)
        {

            SearchData();
        }

        #endregion

    }
}