using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using HomePage.m_master;
using System.Text;
using CommonLib.Utils;

namespace HomePage.recruit
{
    public partial class result_list : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SearchData();
            }
        }

        /// <summary>
        /// 데이터 조회
        /// </summary>
        private void SearchData()
        {
            string rcmResult = string.Empty; // 전체

            StringBuilder param = new StringBuilder();
            param.Append(nowPageNo.Value);

            // 데이터 카운트 조회
            SetDataCount(1451, param.ToString());

            if (DataTotalCount > 0)
            {
                // 실 데이터 조회
                SetDataList(1452, param.ToString());
            }
        }

        /// <summary>
        /// 페이지 번호 클릭
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void nowPageNo_ValueChanged(object sender, EventArgs e)
        {
            SearchData();
        }
    }
}