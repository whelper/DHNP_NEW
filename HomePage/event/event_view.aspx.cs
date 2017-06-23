using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

using HomePage.m_master;
using System.Data;

namespace HomePage.evt
{
    public partial class event_view : PageBase
    {
        private string seqNo = "0";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SearchData();
            }
        }

        /// <summary>
        /// 데이터 조회
        /// </summary>
        private void SearchData()
        {
            string is_show = Request["is_show"];
            if (String.IsNullOrEmpty(is_show) == true) is_show = "Y";

            StringBuilder param = new StringBuilder();
            param.Append(" ").Append(SeqNo);
            param.Append(",'").Append(is_show).Append("'");
            
            String proc_nm = "USP_HOMEPAGE_4000_EVENT_DETAIL_S";

            System.Diagnostics.Debug.WriteLine("2 proc_nm:" + proc_nm + param.ToString());

            DataSet ds = GetDataSet(proc_nm + param.ToString());
            this.SetDataRow(ds); // by renamaster           
        }

        #region GET-SET

        private string SeqNo
        {
            get
            {
                if (Request["seq_no"] != null)
                {
                    seqNo = Request["seq_no"].ToString();
                }

                return seqNo;
            }
        }

        protected string DpSeqNo
        {
            get
            {
                if (Request["dp_seq_no"] == null)
                {
                    return SeqNo;
                }
                else
                {
                    return Request["dp_seq_no"];
                }
            }
        }

        #endregion

        protected void btnSave_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("btnSave_Click");

            string evt_ttl = Request["EVT_TTL"];
            string ee_seq_no = Request["EE_SEQ_NO"];
            string cont_q = Request["CONT_Q"];
            string cont_a = Request["CONT_A"];

            StringBuilder param = new StringBuilder();
            param.Append("'").Append(Request["EVT_TTL"]).Append("'");
            param.Append(",'").Append(Request["CONT_Q"]).Append("'");
            param.Append(",'").Append(Request["CONT_A"]).Append("'");
            param.Append(",").Append(Request["EE_SEQ_NO"]).Append("");


            String proc_nm = "USP_ADMIN_4000_EVT_EVENT_RESULT_I";

            DataSet ds = GetDataSet(proc_nm + param.ToString());

            this.SetDataRow(ds); // by renamaster    

            Response.Redirect("event_complete.aspx");
        }
    }
}