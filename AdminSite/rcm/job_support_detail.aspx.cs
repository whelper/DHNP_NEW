using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdminSite.m_master;
using System.Text;
using CommonLib.Utils;
using System.Data;

namespace AdminSite.rcm
{
    public partial class job_support_detail : PageBase
    {
        private string supportNo = string.Empty;
        private string regSeqNo = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {   
            SearchData();

            InitControls();
        }

        /// <summary>
        /// 컨트롤 초기화
        /// </summary>
        private void InitControls()
        {
            if (GetRowCount(0) <= 0)
            {
                CWebUtil.jsAlertAndRedirect(this, "지원자 정보가 존재하지 않습니다.", "job_support_list.aspx?reg_seq_no=" + RegSeqNo);
            }
            else if (GetDataTableCount(6) < 1)
            {
                CWebUtil.jsAlertAndRedirect(this, "조회할 권한이 없습니다.", "job_support_list.aspx?reg_seq_no=" + RegSeqNo);
            }
            else
            {
                if ("Y".Equals(GetData(0, 0, "SUCC_YN")))
                {
                    succ_y.Checked = true;
                }
                else if ("N".Equals(GetData(0, 0, "SUCC_YN")))
                {
                    succ_n.Checked = true;
                }
            }
        }

        /// <summary>
        /// 데이터 조회
        /// </summary>
        private void SearchData()
        {
            StringBuilder param = new StringBuilder();
            param.Append(SupportNo);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(Session["admin_id"]);
            
            // 실 데이터 조회
            SetDataTableList(35300, param.ToString());
        }

        /// <summary>
        /// 데이터를 저장한다.
        /// </summary>
        /// <param name="mode"></param>
        private void SaveData(string mode)
        {
            string succ_yn = string.Empty;
            succ_yn = succ_y.Checked ? "Y" : succ_yn;
            succ_yn = succ_n.Checked ? "N" : succ_yn;

            if (mode.Equals("U") && succ_yn.Equals(""))
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "test", CWebUtil.MsgBox("합격/불합격 여부를 선택해 주세요."));
            }
            else
            {
                StringBuilder param = new StringBuilder();
                param.Append(SupportNo);
                param.Append(CConst.DB_PARAM_DELIMITER).Append(mode);
                param.Append(CConst.DB_PARAM_DELIMITER).Append(succ_yn);

                // 실 데이터 조회
                DataSet ds = GetDataSet(35301, param.ToString());

                if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    string result_cd = ds.Tables[0].Rows[0]["RESULT_CD"].ToString();
                    string result_msg = ds.Tables[0].Rows[0]["RESULT_MSG"].ToString();

                    if ("00".Equals(result_cd))
                    {
                        // 다른 페이지로 이동하는 경우 WebUtil쪽 이용한다.
                        Response.Redirect("job_support_list.aspx?reg_seq_no=" + RegSeqNo);
                    }
                    else
                    {
                        // 현재 화면으로 다시 돌아오면 이 방식을 그대로 사용
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "test", CWebUtil.MsgBox(result_msg));
                    }
                }
            }
        }

        #region Get-SET

        protected string RegSeqNo
        {
            get
            {
                if (Request["reg_seq_no"] != null)
                {
                    regSeqNo = Request["reg_seq_no"].ToString();
                }

                return regSeqNo;
            }
        }

        protected string SupportNo
        {
            get
            {
                if (Request["support_no"] != null)
                {
                    supportNo = Request["support_no"].ToString();
                }

                return supportNo;
            }
        }
        #endregion

        #region 이벤트 메소드

        /// <summary>
        /// 조회 버튼 클릭
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSave_Click(object sender, EventArgs e)
        {
            SaveData("U");
        }

        /// <summary>
        /// 조회 버튼 클릭
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnDel_Click(object sender, EventArgs e)
        {
            SaveData("D");
        }

        #endregion
    }
}