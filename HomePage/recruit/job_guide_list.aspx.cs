using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using HomePage.m_master;
using System.Text;
using CommonLib.Utils;
using System.Data;

namespace HomePage.recruit
{
    public partial class job_guide_list : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetControls();

                InitControls();

                SearchData();
            }
        }

        /// <summary>
        /// 컨트롤 데이터 셋팅
        /// </summary>
        private void SetControls()
        {
            StringBuilder param = new StringBuilder();
            param.Append("RCM_JOBGROUP");

            DataSet ds = GetDataSet(2, param.ToString());

            rcm_jobgroup.Items.Add(new ListItem("선택", ""));

            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    rcm_jobgroup.Items.Add(new ListItem(ds.Tables[0].Rows[i]["COMM_CD_NM"].ToString(), ds.Tables[0].Rows[i]["COMM_CD"].ToString()));
                }
            }

            param.Length = 0;
            param.Append("RCM_CAREER");

            DataSet dsCareer = GetDataSet(2, param.ToString());

            rcm_career.Items.Add(new ListItem("선택", ""));

            if (dsCareer != null && dsCareer.Tables.Count > 0 && dsCareer.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < dsCareer.Tables[0].Rows.Count; i++)
                {
                    rcm_career.Items.Add(new ListItem(dsCareer.Tables[0].Rows[i]["COMM_CD_NM"].ToString(), dsCareer.Tables[0].Rows[i]["COMM_CD"].ToString()));
                }
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
            //rcmResult = rcm_ing.Checked ? rcm_ing.Value : rcmResult;
            //rcmResult = rcm_end.Checked ? rcm_end.Value : rcmResult;

            StringBuilder param = new StringBuilder();
            param.Append(nowPageNo.Value);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(rcm_jobgroup.SelectedValue);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(rcm_career.SelectedValue);

            // 데이터 카운트 조회
            SetDataCount(1531, param.ToString());

            if (DataTotalCount > 0)
            {
                // 실 데이터 조회
                SetDataList(1532, param.ToString());
            }
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