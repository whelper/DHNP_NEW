using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;

using MobileWeb.m_master;
using CommonLib.Utils;

namespace MobileWeb.pdt
{
    public partial class pdt_bio_badge_view : PageBase
    {
        private const string LANG_CD = "KOR";

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
            param.Append(LANG_CD);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(ProdCd);

            SetDataList(2002, param.ToString());
        }

        #region GET-SET
        protected string ProdCd
        {
            get
            {
                return Request["prod_cd"];
            }
        }
        #endregion
    }
}