using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;

using CommonLib.Utils;
using AdminSite.m_master;

namespace AdminSite.pdt
{
    public partial class pdt_cha_info_list : PageBase
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
            param.Append(nowPageNo.Value);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(title.Value);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(start_date.Value);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(end_date.Value);

            // 데이터 카운트 조회
            SetDataCount(3221, param.ToString());

            System.Diagnostics.Debug.WriteLine("COUNT=" + DataTotalCount);


            if (DataTotalCount > 0)
            {
                // 실 데이터 조회
                SetDataList(3222, param.ToString());
            }
        }

		#region GET-SET
		protected string _category
		{
			get
			{
				return Request["category"];
			}
		}
		#endregion

		#region 이벤트 메소드

		/// <summary>
		/// 조회 버튼 클릭
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		protected void btnSearch_Click(object sender, EventArgs e)
        {
            // 페이지는 1로 초기화
            nowPageNo.Value = "1";

            SearchData();
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

        #endregion

    }
}