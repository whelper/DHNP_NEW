using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HomePage.m_master;
using System.Text;
using CommonLib.Utils;

namespace HomePage.en.invest
{
    public partial class money_bill : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SearchData();
            }
        }

        private void SearchData()
        {
            StringBuilder param = new StringBuilder();
            param.Append("ENG");

            SetDataTableList(1241, param.ToString());
        }
    }
}