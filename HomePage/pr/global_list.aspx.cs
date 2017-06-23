using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

using HomePage.m_master;
using CommonLib.Utils;
using System.Data;

namespace HomePage.pr
{
    public partial class global_list : PageBase
    {
        private DataSet dsHeader = null;

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
            param.Append(CConst.DB_PARAM_DELIMITER).Append(s_search_type.Value);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(txt_search_value.Value);

            // 데이터 카운트 조회
            SetDataCount(1311, param.ToString());

            if (DataTotalCount > 0)
            {
                // 실 데이터 조회
                SetDataList(1312, param.ToString());
            }

            dsHeader = GetDataSet(1314, param.ToString());
        }

        #region GET-SET

        protected DataSet DsHeader
        {
            get
            {
                return dsHeader;
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