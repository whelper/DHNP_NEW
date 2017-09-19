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
using CommonLib.DB;
using System.Data.SqlClient;

namespace AdminSite.pdt
{
    public partial class pdt_human_list : PageBase
    {
        private const string LANG_CD = "KOR";
        private const string UPR_CATG_NO = "1";
		CommonLib.Web.CCommonCode code = new CommonLib.Web.CCommonCode();

		protected void Page_Load(object sender, EventArgs e)
        {

			
			if (!IsPostBack)
            {
				nowPageNo.Value = _PAGE_NO;
				SetControls();
			}
			SearchData();
		}

        /// <summary>
        /// 데이터 조회
        /// </summary>
        private void SearchData()
        {
			string prodType = string.Empty; // 전체
			prodType = pdt_new.Checked ? pdt_new.Value : prodType;
			prodType = pdt_old.Checked ? pdt_old.Value : prodType;

			string c = (!catg.Value.Equals("")) ? catg.Value : _category;

			StringBuilder param = new StringBuilder();
            param.Append(nowPageNo.Value);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(LANG_CD);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(c);
            param.Append(CConst.DB_PARAM_DELIMITER).Append("");
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
            param.Append(_category);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(LANG_CD);

            DataSet ds = GetDataSet(4, param.ToString());

            catg_no2.Items.Add(new ListItem("선택", ""));

            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                for(int i=0; i < ds.Tables[0].Rows.Count; i++)
                {
                    catg_no2.Items.Add(new ListItem(ds.Tables[0].Rows[i]["CATE_NAME"].ToString(), ds.Tables[0].Rows[i]["CATE_CD"].ToString()));
                }
            }

			catg_no3.Items.Add(new ListItem("선택", ""));
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

		#region GET-SET
		protected string _category
		{
			get { return Request["category"]; }
		}


		protected string _catg
		{
			get { return catg.Value; }
		}

		protected string _category_name
		{
		
			get { return code.getCategoryName(_category); }
		}

		protected string _PAGE_NO
		{
			get
			{
				if (Request["page_no"] == null)
				{
					return "1";
				}
				else
				{
					return Request["page_no"];
				}
			}
		}


		#endregion
	}
}