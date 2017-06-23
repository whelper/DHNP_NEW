using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

using CommonLib.Web;
using System.Xml;

namespace MobileWeb.ws
{
    /// <summary>
    /// Summary description for investment
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class investment : System.Web.Services.WebService
    {

        [WebMethod]
        public XmlDocument GetIrList(int now_page, string title, string lang_cd)
        {
            XmlDocument doc = new XmlDocument();

            CInvestment investment = new CInvestment();
            doc.InnerXml = investment.GetIrList(now_page, title, lang_cd);

            return doc;
        }

        [WebMethod]
        public XmlDocument GetNoticeList(int now_page, string title)
        {
            XmlDocument doc = new XmlDocument();

            CInvestment investment = new CInvestment();
            doc.InnerXml = investment.GetNoticeList(now_page, title);

            return doc;
        }
    }
}
