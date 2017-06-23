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
    /// Summary description for promotion
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class promotion : System.Web.Services.WebService
    {

        [WebMethod]
        public XmlDocument GetNewList(int now_page, string title)
        {
            XmlDocument doc = new XmlDocument();

            CPromotion promotion = new CPromotion();
            doc.InnerXml = promotion.GetNewList(now_page, title);

            return doc;
        }

        [WebMethod]
        public XmlDocument GetGlobalList(int now_page, string title)
        {
            XmlDocument doc = new XmlDocument();

            CPromotion promotion = new CPromotion();
            doc.InnerXml = promotion.GetGlobalList(now_page, title);

            return doc;
        }
    }
}
