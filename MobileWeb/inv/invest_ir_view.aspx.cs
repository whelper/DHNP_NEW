using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

using MobileWeb.m_master;
using CommonLib.Utils;

namespace MobileWeb.inv
{
    public partial class invest_ir_view : PageBase
    {
        private const string LANG_CD = "KOR";
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
            param.Append(CConst.DB_PARAM_DELIMITER).Append(LANG_CD);

            // 실 데이터 조회
            SetDataTableList(2202, param.ToString());
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

        #endregion
    }
}