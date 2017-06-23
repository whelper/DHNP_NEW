using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

using CommonLib.Utils;
using MobileWeb.m_master;

namespace MobileWeb.pr
{
    public partial class pr_new_list : PageBase
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
            StringBuilder param = new StringBuilder();
            param.Append(title.Value);

            System.Diagnostics.Debug.WriteLine("COUNT=" + DataTotalCount);


            // 실 데이터 조회
            SetDataList(2101, param.ToString());
            
        }

        #region 이벤트 메소드

        /// <summary>
        /// 조회 버튼 클릭
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            SearchData();
        }

        #endregion

    }
}