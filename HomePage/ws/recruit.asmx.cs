using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Xml;

using CommonLib.Web;

namespace HomePage.ws
{
    /// <summary>
    /// Summary description for recruit
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class recruit : System.Web.Services.WebService
    {

        [WebMethod]
        public XmlDocument GetRecruitResult(string reg_seq_no, string name, string cellphone, string email)
        {
            XmlDocument doc = new XmlDocument();

            CRecruit recruit = new CRecruit();
            doc.InnerXml = recruit.GetRecruitResult(reg_seq_no, name, cellphone, email);

            return doc;
        }

        [WebMethod]
        public XmlDocument GetRecruitMyInfo(string reg_seq_no, string name, string cellphone, string email)
        {
            XmlDocument doc = new XmlDocument();

            CRecruit recruit = new CRecruit();
            doc.InnerXml = recruit.GetRecruitMyInfo(reg_seq_no, name, cellphone, email);

            return doc;
        }
    }
}
