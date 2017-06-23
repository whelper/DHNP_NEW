using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HomePage.m_master;
using System.Text;
using CommonLib.Utils;

namespace HomePage.invest
{
    public partial class treasury_stock : PageBase
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
            param.Append("KOR");

            SetDataList(1271, param.ToString());
        }
    }
}