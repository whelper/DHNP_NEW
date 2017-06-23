using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CommonLib.Utils
{
    public static class CWebUtil
    {
        public static string getUserId(Object obj)
        {
            if (obj == null)
                return "Unknown";
            else
            {
                return Convert.ToString(obj);
            }
        }
        /// <summary>
        /// debugging 유틸  
        /// </summary>
        /// <param name="msg"></param>
        /// <returns></returns>
        public static string MsgBox(string msg)
        {
            msg = msg.Replace("'", "\\'");
            msg = msg.Replace("\"", "\\\"");

            return string.Format("<script type=\"text/javascript\"> alert('{0}'); </script>", msg);
        }

        /// <summary>
        /// 마지막 URI 즉 웹페이지 주소 리턴
        /// </summary>
        /// <param name="url">URL</param>
        /// <param name="token">토큰</param>
        /// <returns></returns>
        public static string GetLastURI(string url, char token)
        {
            string[] array;
            array = url.Split(token);

            return array[array.Length - 1];
        }

        /// <summary>
        /// 웹페이지의 부모 즉 웹페이지 폴더 위치 이름 리턴
        /// </summary>
        /// <param name="url">URL</param>
        /// <param name="token">토큰</param>
        /// <returns></returns>
        public static string GetWebpageParentURI(string url, char token)
        {
            string[] array;
            array = url.Split(token);

            return array[array.Length - 2];
        }

        /// <summary>
        /// script alert and redirect
        /// </summary>
        /// <param name="instance"></param>
        /// <param name="Message"></param>
        /// <param name="url"></param>
        public static void jsAlertAndRedirect(System.Web.UI.Page instance, string Message, string url)
        {
            instance.Response.Write(@"<script language='javascript'>alert('" + Message + "');document.location.href='" + url + "'; </script>");
            instance.Response.End();
        }

        public static void jsWrite(System.Web.UI.Page instance, string tag)
        {
            instance.Response.Write(@"<script language='javascript'>" + tag + "</script>");
        }

        public static void jsAlertAndHistoryBack(System.Web.UI.Page instance, string Message)
        {
            instance.Response.Write(@"<script language='javascript'>alert('" + Message + "');history.back(-1); </script>");
            instance.Response.End();
        }
    }
}
