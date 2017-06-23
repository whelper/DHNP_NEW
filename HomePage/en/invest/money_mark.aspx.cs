using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HomePage.m_master;
using CommonLib.Utils;
using System.Text;

namespace HomePage.en.invest
{
    public partial class money_mark : PageBase
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

            SetDataTableList(1231, param.ToString());
        }
    }
}