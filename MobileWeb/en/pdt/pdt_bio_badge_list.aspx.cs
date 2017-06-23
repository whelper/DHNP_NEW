using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;

using MobileWeb.m_master;
using CommonLib.Utils;

namespace MobileWeb.en.pdt
{
    public partial class pdt_bio_badge_list : PageBase
    {
        private const string LANG_CD = "ENG";
        private const string CATG_NO1 = "2";
        private const string PROD_TYPE_CD = "PROD_GODL"; // 제품유형 코드 - 관납제품
        private DataSet catgDs = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // 사용안함 ajax로 가져오도록 함
                //SearchData();

                InitControls();

                SetControls();
            }

        }

        /// <summary>
        /// 데이터 조회
        /// </summary>
        private void SearchData()
        {
            StringBuilder param = new StringBuilder();
            param.Append(LANG_CD);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(CATG_NO1); // 1차 카테고리(동물의약품)
            param.Append(CConst.DB_PARAM_DELIMITER).Append(""); // 2차 카테고리 (항생.소독제)
            param.Append(CConst.DB_PARAM_DELIMITER).Append(PROD_TYPE_CD); // 제품유형 코드
            param.Append(CConst.DB_PARAM_DELIMITER).Append(CStringUtil.GetInitial(LANG_CD, "S", ProdInitial));
            param.Append(CConst.DB_PARAM_DELIMITER).Append(CStringUtil.GetInitial(LANG_CD, "E", ProdInitial));
            param.Append(CConst.DB_PARAM_DELIMITER).Append(SearchText); // 태그명으로 검색

            SetDataList(2001, param.ToString());

        }

        /// <summary>
        /// 초기화 컨트롤들 (파라미터에 의한 셋팅)
        /// </summary>
        private void InitControls()
        {
            search_text.Value = SearchText;
        }

        /// <summary>
        /// DB를 통해 동적으로 셋팅해야 되는 컨트롤
        /// 분류관련 selectbox류들
        /// </summary>
        private void SetControls()
        {
        }

        #region GET-SET

        protected string ProdInitial
        {
            get
            {
                if (Request["prod_initial"] == null)
                {
                    return "";
                }
                else
                {
                    return Request["prod_initial"];
                }
            }
        }

        protected string SearchText
        {
            get
            {
                if (CStringUtil.IsNullOrEmpty(Request["search_text"]))
                {
                    if (CStringUtil.IsNullOrEmpty(search_text.Value) == false)
                    {
                        return search_text.Value;
                    }
                    else
                    {
                        return "";
                    }
                }
                else
                {
                    return Request["search_text"];
                }
            }
        }

        protected DataSet CatgDs
        {
            get
            {
                return catgDs;
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
            Response.Redirect("pdt_bio_badge_list.aspx?prod_initial=" + ProdInitial + "&search_text=" + search_text.Value);
        }

        #endregion
    }
}