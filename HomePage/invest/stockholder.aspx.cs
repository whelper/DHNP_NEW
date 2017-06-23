using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using HomePage.m_master;
using CommonLib.Utils;

namespace HomePage.invest
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

            SetDataTableList(1261, param.ToString());

        }
    }
}