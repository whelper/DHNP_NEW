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
    public partial class pdt_human_list : PageBase
    {
        private const string LANG_CD = "KOR";
        private const string UPR_CATG_NO = "1";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetControls();

                SearchData();
            }
        }

        /// <summary>
        /// 데이터 조회
        /// </summary>
        private void SearchData()
        {
			string prodType = string.Empty; // 전체
			prodType = pdt_new.Checked ? pdt_new.Value : prodType;
			prodType = pdt_old.Checked ? pdt_old.Value : prodType;
		
	
			StringBuilder param = new StringBuilder();
            param.Append(nowPageNo.Value);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(LANG_CD);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(UPR_CATG_NO);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(catg_no2.SelectedValue);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(prod_nm.Value);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(prod_cd.Value);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(prodType);

            // 데이터 카운트 조회
            SetDataCount(3201, param.ToString());

            if (DataTotalCount > 0)
            {
                // 실 데이터 조회
                SetDataList(3202, param.ToString());
            }
        }

        private void SetControls()
        {
            StringBuilder param = new StringBuilder();
            param.Append(LANG_CD);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(UPR_CATG_NO);
            param.Append(CConst.DB_PARAM_DELIMITER).Append("2");

            DataSet ds = GetDataSet(1, param.ToString());

            catg_no2.Items.Add(new ListItem("선택", ""));

            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                for(int i=0; i < ds.Tables[0].Rows.Count; i++)
                {
                    catg_no2.Items.Add(new ListItem(ds.Tables[0].Rows[i]["CATG_NM"].ToString(), ds.Tables[0].Rows[i]["CATG_NO"].ToString()));
                }
            }

            // 전체에 기본 checked
            pdt_all.Checked = true; 
        }

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