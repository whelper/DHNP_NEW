using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MobileWeb.m_master;
using System.Text;
using CommonLib.Utils;

namespace MobileWeb.inv
{
    public partial class invest_money_bill : PageBase
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
            param.Append("KOR");

            SetDataTableList(2212, param.ToString());
        }

    }
}