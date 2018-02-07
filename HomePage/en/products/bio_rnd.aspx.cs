using System;
using HomePage.m_master;


namespace HomePage.en.products
{
	public partial class bio_rnd : PageBase
	{
		private const string LANG_CD = "ENG";
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