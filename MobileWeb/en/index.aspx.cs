using System;
using System.IO;
using System.Net;
using System.Net.Json;
using System.Text;
using MobileWeb.m_master;
using System.Xml;

namespace MobileWeb.en
{
    public partial class index : PageBase
    {
        private const string LANG_CD = "ENG";
		private string nv;
		private string nv_css;
		private string cv;
		private string cv_css;
		private string cr;
		private string cr_sign;

		protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SearchData();
                SetControls();
            }
        }

        private void SearchData()
        {
            StringBuilder param = new StringBuilder();
            param.Append(LANG_CD);

            SetDataTableList(2400, param.ToString());
			//GetStockForJson();
			GetStockForXML();
		}

        private void SetControls()
        {
            txt_search.Attributes["placeholder"] = GetData(1, 0, "SRCH_TEXT");

            txt_search.Attributes["onkeypress"] = "if (event.keyCode==13){" + ClientScript.GetPostBackEventReference(btn_Search, txt_search.Value) + "; return false }";
        }

        /// <summary>
        /// 조회 버튼 클릭
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //SearchData();
            String searchText = txt_search.Value;
            Response.Redirect("/en/search.aspx?search_text=" + searchText);
        }

		private void GetStockForXML()
		{
			String URLString = "http://asp1.krx.co.kr/servlet/krx.asp.XMLSise?code=054670";
			WebClient client = new WebClient();
			Stream stream = client.OpenRead(URLString);
			StreamReader reader = new StreamReader(stream);

			String xmlcon = reader.ReadToEnd().Trim();
			XmlDocument xmlDocument = new XmlDocument();
			xmlDocument.LoadXml(xmlcon);


			XmlNodeList elemList = xmlDocument.GetElementsByTagName("TBL_StockInfo");
			//System.Diagnostics.Debug.WriteLine("[" + elemList[0].Attributes["JongName"].Value + "]");

			float prevJuka = Int32.Parse(elemList[0].Attributes["PrevJuka"].Value.Replace(",", ""));
			float debi = Int32.Parse(elemList[0].Attributes["Debi"].Value.Replace(",", ""));
			int curJuka = Int32.Parse(elemList[0].Attributes["CurJuka"].Value.Replace(",", ""));
			int dungRak = Int32.Parse(elemList[0].Attributes["DungRak"].Value.Replace(",", ""));
			float f = (debi / prevJuka) * 100;
			//double f = (350f/12900f)*100;
			String v = (f >= 10) ? string.Format("{0:00.0}", f) : string.Format("{0:0.00}", f);


			this.nv = string.Format("{0:#,##0}", elemList[0].Attributes["CurJuka"].Value);
			this.cv = string.Format("{0:#,##0}", debi);
			this.cr = v;
			this.nv_css = "stand";
			this.cv_css = "stand";

			if (dungRak == 1 || dungRak == 2)
			{
				this.nv_css = "up";
				this.cv_css = "up";
				this.cr_sign = "+";
			}
			else
			{
				if (dungRak == 3) return;
				this.nv_css = "down";
				this.cv_css = "down";
				this.cr_sign = "-";
			}
			reader.Close();
		}

		private void GetStockForJson()
		{
			try
			{
				JsonObjectCollection objectCollection = (JsonObjectCollection)((JsonCollection)((JsonObjectCollection)((JsonCollection)((JsonObjectCollection)((JsonObjectCollection)new JsonTextParser().Parse(this.getJsonFromHttp("http://polling.finance.naver.com/api/realtime.nhn?query=SERVICE_ITEM:054670&callback=?")))["result"])["areas"])[0])["datas"])[0];
				int.Parse(objectCollection["nv"].GetValue().ToString());
				int.Parse(objectCollection["cv"].GetValue().ToString());
				int num = int.Parse(objectCollection["rf"].GetValue().ToString());
				this.nv = string.Format("{0:#,##0}", objectCollection["nv"].GetValue());
				this.cv = string.Format("{0:#,##0}", objectCollection["cv"].GetValue());
				this.cr = string.Format("{0}", objectCollection["cr"].GetValue());
				this.nv_css = "stand";
				this.cv_css = "stand";
				if (num == 1 || num == 2)
				{
					this.nv_css = "up";
					this.cv_css = "up";
					this.cr_sign = "+";
				}
				else
				{
					if (num != 4 && num != 5)
						return;
					this.nv_css = "down";
					this.cv_css = "down";
					this.cr_sign = "-";
				}
			}
			catch (Exception e) 
			{ 
			
			}
			
		}

		public string getJsonFromHttp(string requestUrl)
		{
			string empty = string.Empty;
			string end;
			try
			{
				end = new StreamReader(new WebClient().OpenRead(requestUrl)).ReadToEnd();
			}
			catch
			{
				return (string)null;
			}
			return end;
		}

		public string Nv
		{
			get
			{
				return this.nv;
			}
			set
			{
				this.nv = value;
			}
		}

		public string NvCss
		{
			get
			{
				return this.nv_css;
			}
			set
			{
				this.nv_css = value;
			}
		}

		public string Cv
		{
			get
			{
				return this.cv;
			}
			set
			{
				this.cv = value;
			}
		}

		public string CvCss
		{
			get
			{
				return this.cv_css;
			}
			set
			{
				this.cv_css = value;
			}
		}

		public string Cr
		{
			get
			{
				return this.cr;
			}
			set
			{
				this.cr = value;
			}
		}

		public string CrSign
		{
			get
			{
				return this.cr_sign;
			}
			set
			{
				this.cr_sign = value;
			}
		}
	}
}