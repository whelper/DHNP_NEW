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
    /// Summary description for product 
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class product : System.Web.Services.WebService
    {

        [WebMethod]
        public XmlDocument GetProductList(int now_page, string lang_cd, string catg_no1, string catg_no2, string prod_type_cd, string prod_s_init_cd, string prod_e_init_cd, string prod_tag, string prod_sorting)
        {
            XmlDocument doc = new XmlDocument();

            CProduct product = new CProduct();
            doc.InnerXml = product.GetProductList(now_page, lang_cd, catg_no1, catg_no2, prod_type_cd, prod_s_init_cd, prod_e_init_cd, prod_tag, prod_sorting);

            return doc;
        }
    }
}
