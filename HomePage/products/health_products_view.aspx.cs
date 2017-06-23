using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;

using HomePage.m_master;
using CommonLib.Utils;

namespace HomePage.products
{
    public partial class health_products_view : PageBase
    {
        private const string LANG_CD = "KOR";
        private const string CATG_NO1 = "6";

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

            SetDataList(1103, param.ToString());
        }

        #region GET-SET
        protected string ProdCd
        {
            get
            {
                return Request["prod_cd"];
            }
        }

        protected string RepCatal
        {
            get
            {
                string catalog_url = "";

                StringBuilder param = new StringBuilder();
                param.Append(CATG_NO1);
                DataSet ds = GetDataSet(3231, param.ToString());

                if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    catalog_url = ds.Tables[0].Rows[0]["CATAL_URL"].ToString();
                }

                return catalog_url;
            }
        }
        #endregion
    }
}