using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HomePage.m_master;


namespace HomePage.products
{
	public partial class bio_rnd1 : PageBase
	{
		
		private const string LANG_CD = "KOR";
		private const string CATG_NO1 = "3";
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		#region GET-SET
		protected string RepCatal
		{
			get
			{
				return getCatalogURL("03", LANG_CD);
			}
		}
		#endregion
	}
}