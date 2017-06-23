using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

using CommonLib.Utils;
using AdminSite.m_master;
using System.Data;

namespace AdminSite.evt
{
    public partial class event_result : PageBase
    {
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
            StringBuilder param = new StringBuilder();
            param.Append(" ").Append(nowPageNo.Value);
            param.Append(",").Append(Request["ee_seq_no"]);
            param.Append(",'").Append(start_date.Value).Append("'");
            param.Append(",'").Append(end_date.Value).Append("'");

            // 데이터 카운트 조회
            String proc_nm = "USP_ADMIN_4001_EVT_EVENT_RESULT_LIST_COUNT_S";

            System.Diagnostics.Debug.WriteLine("1 proc_nm:" + proc_nm + param.ToString());

            DataSet ds_count = GetDataSet(proc_nm + param.ToString());
            this.SetDataCount(ds_count);


            System.Diagnostics.Debug.WriteLine("EVENT=" + DataTotalCount);


            if (DataTotalCount > 0)
            {
                // 실 데이터 조회
                proc_nm = "USP_ADMIN_4001_EVT_EVENT_RESULT_LIST_S ";

                System.Diagnostics.Debug.WriteLine("2 proc_nm:" + proc_nm + param.ToString());

                DataSet ds = GetDataSet(proc_nm + param.ToString());
                this.SetDataRow(ds); // by renamaster
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

        protected void btn_Excel_Click(object sender, EventArgs e)
        {
            StringBuilder param = new StringBuilder();
            param.Append(" ").Append(nowPageNo.Value);
            param.Append(",").Append(Request["ee_seq_no"]);
            param.Append(",'").Append(start_date.Value).Append("'");
            param.Append(",'").Append(end_date.Value).Append("'");

            String proc_nm = "USP_ADMIN_4001_EVT_EVENT_RESULT_LIST_S ";
                        
            DataSet ds = GetDataSet(proc_nm + param.ToString());
            this.SetDataRow(ds); // by renamaster

            System.Diagnostics.Debug.WriteLine("2 proc_nm:" + proc_nm + param.ToString() + " GetRowCount(0):" + GetRowCount(0));

            StringBuilder sb = new StringBuilder();
            if (GetRowCount() > 0)
            {
                String[] arr_col_header = { "SEQ_NO", "EVT_TTL","REG_DT" };
                String[] arr_col = { "SEQ_NO", "EVT_TTL", "REG_DT"};

                for (int j = 0; j < arr_col_header.Length; j++)
                {
                    sb.Append(arr_col_header[j]).Append(",");                    
                }

                foreach (string item in GetData(0, "CONT_Q").Split(new string[] { "|" }, StringSplitOptions.None)) {
                    sb.Append(item).Append(",");
                }

                sb.Append("\n");

                for (int i = 0; i < GetRowCount(); i++)
                {
                    for (int j = 0; j < arr_col.Length; j++)
                    {
                        sb.Append("\"" + GetData(i, arr_col[j]) + "\"").Append(",");
                    }

                    foreach (string item in GetData(i, "CONT_A").Split(new string[] { "|" }, StringSplitOptions.None))
                    {
                        sb.Append(item).Append(",");
                    }

                    sb.Append("\n");
                }
            }

            Response.Charset = "euc-kr";
            Response.ContentEncoding = System.Text.Encoding.GetEncoding("euc-kr");

            Response.ClearContent();
            Response.AddHeader("content-disposition", "attachment;filename=event_result.csv");
            Response.ContentType = "application/excel";
            Response.Write(sb);
            Response.End();
        }
    }
}