using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

namespace AdminSite.page
{
    public class paging
    {
        /// <summary>
        /// 게시판 페이징 
        /// </summary>
        /// <param name="listTotalCount">리스트(row) 총수</param>
        /// <param name="pageNo">현재 페이지 번호</param>
        /// <param name="listCount">표현될 리스트(row) 수</param>
        /// <returns></returns>
        public static String getPageNo(int listTotalCount, int pageNo, int listCount)
        {
            int pageunit = 10; // 표현될 번호 임계치
            int page_tcnt = (listTotalCount + listCount - 1) / listCount;
            int startpage = (((pageNo - 1) / pageunit) * pageunit) + 1;
            int endpage = startpage + pageunit - 1;

            if (endpage > page_tcnt)
            {
                endpage = page_tcnt;
            }

            StringBuilder sb = new StringBuilder();

            sb.Append("<div class='pagination pagination-centered mTB30'><ul>");


            if (pageNo > 1)
            {
                sb.Append("<li class='active'><a href='javascript:movePage(1)'>First</a></li>");
                sb.Append("<li><a href='javascript:movePage(" + (pageNo - 1) + ")'>◀</a></li>");
            }

            // 페이지 번호 리스트
            for (int i = startpage; i <= endpage; i++)
            {

                if (pageNo == i)
                {
                    sb.Append("<li  class='active'><a href='#'>" + i.ToString() + "</a></li>");
                }
                else
                {
                    sb.Append("<li><a href='javascript:movePage(" + i.ToString() + ")'>" + i.ToString() + "</a></li>");
                }
            }


            if (pageNo < page_tcnt)
            {
                sb.Append("<li><a href='javascript:movePage(" + (pageNo + 1) + ")'>▶</a></li>");
                sb.Append("<li><a href='javascript:movePage(" + page_tcnt + ")'>Last</a></li>");

            }
            sb.Append("</ul></div>");

            return sb.ToString();
        }
    }
}