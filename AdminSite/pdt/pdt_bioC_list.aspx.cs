using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;

using CommonLib.Utils;
using AdminSite.m_master;

namespace AdminSite.pdt
{
    public partial class pdt_bioC_list : PageBase
    {
        private const string LANG_CD = "KOR";
        private const string UPR_CATG_NO = "3";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetControls();

                SearchData();
            }
        }

        /// <summary>
        /// 데이터 조회
        /// </summary>
        private void SearchData()
        {
            StringBuilder param = new StringBuilder();
            param.Append(nowPageNo.Value);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(title.Value);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(LANG_CD);
            //param.Append(CConst.DB_PARAM_DELIMITER).Append(LANG_CD);
            //param.Append(CConst.DB_PARAM_DELIMITER).Append(UPR_CATG_NO);
            //param.Append(CConst.DB_PARAM_DELIMITER).Append(catg_no2.SelectedValue);
            //param.Append(CConst.DB_PARAM_DELIMITER).Append(prod_nm.Value);
            //param.Append(CConst.DB_PARAM_DELIMITER).Append(prod_cd.Value);

            //// 데이터 카운트 조회
            SetDataCount(3211, param.ToString());

            if (DataTotalCount > 0)
            {
                // 실 데이터 조회
                SetDataList(3212, param.ToString());
            }
        }

        private void SetControls()
        {
            // 나중에 위해 원형을 남겨둔다.
        }

        #region 이벤트 메소드

        /// <summary>
        /// 조회 버튼 클릭
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