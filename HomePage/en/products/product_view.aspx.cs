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

namespace HomePage.en.products
{
	public partial class product_view : PageBase
	{
		private const string LANG_CD = "ENG";
		private const string CATG_NO1 = "1";
		CommonLib.Web.CCommonCode code = new CommonLib.Web.CCommonCode();

		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				if (Request["prod_cd"] != null && Request["category"] != null)
				{
					SearchData();
				}
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
				return (!Request["prod_cd"].Equals(null)) ? Request["prod_cd"] : "";
			}

		}

		protected string category
		{
			get
			{
				return (Request["category"] != null) ? Request["category"] : "";
			}

		}

		protected string RepCatal
		{
			get
			{
				return (category != "") ? getCatalogURL(category.Substring(0, 2), LANG_CD) : "";
			}

		}

		protected string categoryName
		{
			get { return (category != "") ? code.getCategoryName(category.Substring(0, 2)) : ""; }
		}

		protected string categoryNameView
		{
			get { return code.getCategoryName(category); }
		}

		protected string menu
		{
			get { return (Request["menu"] != null) ? Request["menu"] : "0101"; }
		}
		#endregion
	}
}