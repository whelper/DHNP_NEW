using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CommonLib.Utils;

namespace MobileWeb.en
{
    public partial class SiteSub : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected string GetRoot()
        {
            return CConst.MOBILE_ROOT;
        }
    }
}