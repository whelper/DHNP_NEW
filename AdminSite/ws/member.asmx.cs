using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

using CommonLib.Web;
using System.Xml;

namespace AdminSite.ws
{
    /// <summary>
    /// member의 요약 설명입니다.
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // ASP.NET AJAX를 사용하여 스크립트에서 이 웹 서비스를 호출하려면 다음 줄의 주석 처리를 제거합니다. 
    // [System.Web.Script.Services.ScriptService]
    public class member : System.Web.Services.WebService
    {   
        /// <summary>
        /// 암호화
        /// </summary>
        /// <param name="input">암호화할 String</param>
        /// <returns></returns>
        [WebMethod]
        public XmlDocument Encript(string input)
        {
            // 호출예시: http://localhost:52473/ws/member.asmx/Encript?input=1111 

            XmlDocument doc = new XmlDocument();

            CMember member = new CMember();
            doc.InnerXml = member.Encrypt(input);

            return doc;
        }

        /// <summary>
        /// 복호화
        /// </summary>
        /// <param name="input">복호화할 String</param>
        /// <returns></returns>
        [WebMethod]
        public XmlDocument Decript(string input)
        {
            // 호출예시
            // http://localhost:52473/ws/member.asmx/Decript?input=PGXjU6ib2mKYwtrh2i3fIQ%3D%3D

            XmlDocument doc = new XmlDocument();

            CMember member = new CMember();
            doc.InnerXml = member.Decrypt(input);

            return doc;
        }

        /// <summary>
        /// DB 회원 비밀번호 변경
        /// </summary>
        /// <param name="id"></param>
        /// <param name="pass"></param>
        /// <returns></returns>
        [WebMethod]
        public XmlDocument SetPassword(string id, string pass)
        {   
            XmlDocument doc = new XmlDocument();

            CMember member = new CMember();
            doc.InnerXml = member.SetPassword(id, pass);

            return doc;
        }
    }
}
