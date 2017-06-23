using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CommonLib.Utils;
using System.Text;
using HomePage.m_master;

namespace HomePage.recruit
{
    public partial class job_guide_join : PageBase
    {
        private string regSeqNo = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (CStringUtil.IsNullOrEmpty(RegSeqNo))
                {
                    CWebUtil.jsAlertAndRedirect(this, "잘못된 경로로 진입하였습니다.", "/recruit/job_guide_list.aspx");
                }

                SearchData();

                if (CStringUtil.IsNullOrEmpty(GetData(0, "IS_PROCESSING")) || GetData(0, "IS_PROCESSING").Equals("N"))
                {
                    CWebUtil.jsAlertAndRedirect(this, "채용완료된 공고이거나 없는 채용공고 입니다.", "/recruit/job_guide_list.aspx");
                }
            }
        }

        protected void SearchData()
        {
            StringBuilder param = new StringBuilder();
            param.Append(RegSeqNo);
            param.Append(CConst.DB_PARAM_DELIMITER).Append("N");

            SetDataList(1533, param.ToString());
        }

        #region GET-SET

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

        protected string RcmdutyNo
        {
            get
            {
                if (Request["rcm_duty_no"] != null)
                {
                    regSeqNo = Request["rcm_duty_no"].ToString();
                }

                return regSeqNo;
            }
        }

        #endregion

        #region 이벤트 메소드

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Response.Redirect("./job_guide_join_sub.aspx?reg_seq_no=" + RegSeqNo + "&rcm_duty_no=" + RcmdutyNo);
        }
        #endregion
    }
}