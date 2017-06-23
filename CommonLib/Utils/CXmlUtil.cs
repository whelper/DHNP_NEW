using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace CommonLib.Utils
{
    /// <summary>
    /// Xml로 만들어 주는 Util 모음 = 실제 엔진은 CXmlMaker이며 이 Class를 이용하여 만듬
    /// </summary>
    public class CXmlUtil
    {
        /// <summary>
        /// DataSet을 Xml형식으로 리턴한다.
        /// 멀티 RecordSet은 지원하지 않고, Table[0]에 대해서만 만듬에 주의
        /// </summary>
        /// <param name="ds"></param>
        /// <param name="rootName"></param>
        /// <returns></returns>
        public string GetXml(DataSet ds, string rootName)
        {
            string result = GetDefaultXml(CConst.CODE_EMPTY, CConst.CODE_EMPTY_MSG);

            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                CXmlMaker xmlMaker = new CXmlMaker();
                xmlMaker.StartXml();
                xmlMaker.StartTag("Result");
                xmlMaker.Tag("ResultCd", "00");
                xmlMaker.Tag("ResultMsg", "");

                xmlMaker.StartTag("List");
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    xmlMaker.StartTag(rootName);
                    foreach (DataColumn dc in ds.Tables[0].Columns)
                    {
                        if (dr[dc.ColumnName].GetType().Equals(typeof(System.String)))
                        {
                            xmlMaker.Tag(dc.ColumnName, dr[dc.ColumnName].ToString(), CXmlMaker.TagType.CDATA);
                        }
                        else
                        {
                            xmlMaker.Tag(dc.ColumnName, dr[dc.ColumnName].ToString());
                        }
                    }
                    xmlMaker.EndTag();
                }
                xmlMaker.EndTag();
                xmlMaker.EndTag();

                result = xmlMaker.ToString();
            }

            return result;
        }

        public string GetXml(List<Dictionary<string, string>> list, string rootName)
        {
            string result = GetDefaultXml(CConst.CODE_EMPTY, CConst.CODE_EMPTY_MSG);

            if (list != null && list.Count > 0)
            {
                CXmlMaker xmlMaker = new CXmlMaker();
                xmlMaker.StartXml();
                xmlMaker.StartTag("Result");
                xmlMaker.Tag("ResultCd", "00");
                xmlMaker.Tag("ResultMsg", "");

                xmlMaker.StartTag("List");
                foreach (Dictionary<string, string> dic in list)
                {
                    xmlMaker.StartTag(rootName);
                    foreach (string key in dic.Keys)
                    {
                        if (dic[key].GetType().Equals(typeof(System.String)))
                        {
                            xmlMaker.Tag(key, dic[key], CXmlMaker.TagType.CDATA);
                        }
                        else
                        {
                            xmlMaker.Tag(key, dic[key]);
                        }
                    }
                    xmlMaker.EndTag();
                }
                xmlMaker.EndTag();
                xmlMaker.EndTag();

                result = xmlMaker.ToString();
            }

            return result;
        }

        public string GetDefaultXml(string code, string msg)
        {
            CXmlMaker xmlMaker = new CXmlMaker();

            xmlMaker.StartXml();
            xmlMaker.StartTag("Result");
            xmlMaker.Tag("ResultCd", code);
            xmlMaker.Tag("ResultMsg", msg);
            xmlMaker.EndTag();

            return xmlMaker.ToString();
        }

        public string GetSingleXml(string input)
        {
            CXmlMaker xmlMaker = new CXmlMaker();

            xmlMaker.StartXml();
            xmlMaker.StartTag("Result");
            xmlMaker.Tag("Data", input);
            xmlMaker.EndTag();

            return xmlMaker.ToString();
        }
    }
}
