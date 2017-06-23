using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using HomePage.m_master;
using CommonLib.Utils;

namespace HomePage.en.invest
{
    public partial class stock_info : PageBase
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
            param.Append("ENG");

            SetDataList(1251, param.ToString());
        }

    }
}