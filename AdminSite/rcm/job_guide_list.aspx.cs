using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdminSite.m_master;
using System.Text;
using CommonLib.Utils;

namespace AdminSite.rcm
{
    public partial class job_guide_list : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SearchData();
                InitControls();
            }
        }

        /// <summary>
        /// 컨트롤 초기화
        /// </summary>
        private void InitControls()
        {

        }

        /// <summary>
        /// 데이터 조회
        /// </summary>
        private void SearchData()
        {
            string rcmResult = string.Empty; // 전체
            rcmResult = rcm_ing.Checked ? rcm_ing.Value : rcmResult;
            rcmResult = rcm_end.Checked ? rcm_end.Value : rcmResult;

            StringBuilder param = new StringBuilder();
            param.Append(nowPageNo.Value);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(title.Value);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(rcmResult);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(Session["admin_id"]);

            // 데이터 카운트 조회
            SetDataCount(3521, param.ToString());

            if (DataTotalCount > 0)
            {
                // 실 데이터 조회
                SetDataList(3522, param.ToString());
            }

            rcm_all.Checked = true; 
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