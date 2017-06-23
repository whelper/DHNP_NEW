using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

using HomePage.m_master;
using System.Data;

namespace HomePage.products
{
    public partial class human_change_view : PageBase
    {
        private const string CATG_NO1 = "1";

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
            StringBuilder param = new StringBuilder();
            param.Append(SeqNo);

            // 실 데이터 조회
            SetDataList(1113, param.ToString());
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

        protected string RepCatal
        {
            get
            {
                string catalog_url = "";

                StringBuilder param = new StringBuilder();
                param.Append(CATG_NO1);
                DataSet ds = GetDataSet(3231, param.ToString());

                if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    catalog_url = ds.Tables[0].Rows[0]["CATAL_URL"].ToString();
                }

                return catalog_url;
            }
        }

        #endregion
    }
}