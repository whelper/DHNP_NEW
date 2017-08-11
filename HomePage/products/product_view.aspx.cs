﻿using System;
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
    public partial class human_new_view : PageBase
    {
        private const string LANG_CD = "KOR";
        private const string CATG_NO1 = "1";

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

		protected string category
		{
			get
			{
				return Request["category"];
			}
		}

		protected string RepCatal
        {
            get
            {
				return getCatalogURL(category, LANG_CD);
			}
        }
        #endregion
    }
}