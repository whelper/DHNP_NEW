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
    /// 코드성 데이터를 XML로 반환하는 모음 Class
    /// Ajax 요청에 대응하기 위해 만듬
    /// </summary>
    [WebService(Namespace = "http://www.dhnp.co.kr/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    public class common : System.Web.Services.WebService
    {
        [WebMethod]
        public XmlDocument GetProductType(string upperProdTypeNo, string depth)
        {
            XmlDocument doc = new XmlDocument();

            CCommonCode code = new CCommonCode();
            doc.InnerXml = code.GetProductType(upperProdTypeNo, depth);

            return doc;
        }

        [WebMethod]
        public XmlDocument GetZipcode(string text)
        {
            XmlDocument doc = new XmlDocument();

            CCommonCode code = new CCommonCode();
            doc.InnerXml = code.GetZipcode(text);

            return doc;
        }
    }
}
