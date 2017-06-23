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
    public partial class pdt_bio_catalog_list : PageBase
    {
        private const string LANG_CD = "ENG";
        private const string CATG_NO1 = "2";
        private const string PROD_TYPE_CD = "PROD_GODL"; // 제품유형 코드 - 관납제품
        private DataSet catgDs = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SearchData();

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

            SetDataList(2003, param.ToString());

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

        protected DataSet CatgDs
        {
            get
            {
                return catgDs;
            }
        }

        #endregion
    }

}