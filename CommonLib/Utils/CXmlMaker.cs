using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CommonLib.Utils
{
    /// <summary>
    /// Xml Maker
    /// </summary>
    public class CXmlMaker
    {
        StringBuilder objSb = null;

        Stack<string> m_stackTags = new Stack<string>();

        /// <summary>
        /// 생성자
        /// </summary>
        public CXmlMaker() { }

        const string DEFAULT_ENCODING = "utf-8";

        /// <summary>
        /// 입력된 encoding값으로 초기 xml 선언
        /// </summary>
        public void StartXml() { StartXml(DEFAULT_ENCODING); }
        /// <summary>
        /// 입력된 encoding값으로 초기 xml 선언
        /// </summary>
        /// <param name="encoding"></param>
        public void StartXml(string encoding)
        {
            objSb = null; objSb = new StringBuilder();
            objSb.AppendFormat("<?xml version=\"1.0\" encoding=\"{0}\"?>", encoding);
        }

        public void WriteStartXml() { WriteStartXml(DEFAULT_ENCODING); }
        public void WriteStartXml(string encoding) { StartXml(encoding); }

        /// <summary>
        /// 태그 시작
        /// </summary>
        /// <param name="tag"></param>
        public void StartTag(string tag)
        {
            objSb.AppendFormat("<{0}>", tag);
            m_stackTags.Push(tag);
        }
        public void WriteStartTag(string tag) { StartTag(tag); }

        /// <summary>
        /// xml node 시작, node를 닫지 않음
        /// </summary>
        /// <param name="tag"></param>
        public void StartTagOpen(string tag)
        {
            objSb.AppendFormat("<{0}", tag);
            m_stackTags.Push(tag);
        }

        /// <summary>
        /// node의 tag를 close
        /// </summary>
        public void StartTagClose()
        {
            objSb.Append(">");
        }
        public void WriteStartTagOpen(string tag) { StartTagOpen(tag); }
        public void WriteStartTagClose() { StartTagClose(); }

        public void Attr(string attr, string value) { objSb.AppendFormat(" {0}=\"{1}\"", attr, value); }
        public void Attr(string attr, int value) { objSb.AppendFormat(" {0}=\"{1}\"", attr, value); }
        public void Attr(string attr, bool value) { objSb.AppendFormat(" {0}=\"{1}\"", attr, value); }
        public void WriteAttr(string attr, string value) { Attr(attr, value); }
        public void WriteAttr(string attr, int value) { Attr(attr, value); }
        public void WriteAttr(string attr, bool value) { Attr(attr, value); }

        /// <summary>
        /// 특정 node의 tag를 닫음
        /// </summary>
        /// <param name="tag"></param>
        public void EndTag(string tag)
        {
            objSb.AppendFormat("</{0}>", tag);
            if (m_stackTags.Count > 0)
            {
                m_stackTags.Pop();
            }
        }

        /// <summary>
        /// 태그를 닫음
        /// </summary>
        public void EndTag()
        {
            if (m_stackTags.Count > 0)
            {
                string tag = m_stackTags.Pop();
                objSb.AppendFormat("</{0}>", tag);
            }
        }

        public void WriteEndTag(string tag) { EndTag(tag); }
        public void WriteEndTag() { EndTag(); }


        public enum TagType { None, CDATA };
        public void Tag(string tag, int value) { Tag(tag, value.ToString(), TagType.None); }
        public void Tag(string tag, long value) { Tag(tag, value.ToString(), TagType.None); }
        public void Tag(string tag, bool value) { Tag(tag, value.ToString(), TagType.None); }
        public void Tag(string tag, string value) { Tag(tag, value, TagType.None); }
        public void Tag(string tag, string value, TagType tagType)
        {
            string valueFormat = "{1}";
            if (tagType == TagType.CDATA) { valueFormat = "<![CDATA[{1}]]>"; }
            objSb.AppendFormat("<{0}>" + valueFormat + "</{0}>", tag, value);
        }


        public void WriteTag(string tag, int value) { WriteTag(tag, value, TagType.None); }
        public void WriteTag(string tag, int value, TagType tagType) { WriteTag(tag, value.ToString(), tagType); }
        public void WriteTag(string tag, bool value) { WriteTag(tag, value, TagType.None); }
        public void WriteTag(string tag, bool value, TagType tagType) { WriteTag(tag, value.ToString(), tagType); }
        public void WriteTag(string tag, string value) { WriteTag(tag, value, TagType.None); }
        public void WriteTag(string tag, string value, TagType tagType) { Tag(tag, value, tagType); }

        public override string ToString()
        {
            return objSb.ToString();
        }
    }
}
