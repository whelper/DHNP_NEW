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
    public partial class stockholder : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SearchData();
            }
        }

        /// <summary>
        /// 데이터를 조회한다.
        /// </summary>
        private void SearchData()
        {
            StringBuilder param = new StringBuilder();
            param.Append("KOR");

            SetDataTableList(2222, param.ToString());

        }

    }
}