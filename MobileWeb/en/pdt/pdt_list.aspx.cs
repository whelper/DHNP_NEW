using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;

using MobileWeb.m_master;
using CommonLib.Utils;

namespace MobileWeb.en.pdt
{
	public partial class pdt_list : PageBase
	{
		private const string LANG_CD = "ENG";
		private const string CATG_NO1 = "2";
		private const string PROD_TYPE_CD = "PROD_GODL"; // 제품유형 코드 - 관납제품
		private const string UPR_CATG_NO = "1";
		private DataSet catgDs = null;
		CommonLib.Web.CCommonCode code = new CommonLib.Web.CCommonCode();
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				SearchData();

				InitControls();

				SetControls();
			}

		}

		/// <summary>
		/// 데이터 조회
		/// </summary>
		private void SearchData()
		{
			StringBuilder param = new StringBuilder();
			param.Append(1);
			param.Append(LANG_CD);
			param.Append(CConst.DB_PARAM_DELIMITER).Append(category); // 1차 카테고리(동물의약품)
			param.Append(CConst.DB_PARAM_DELIMITER).Append(CatgNo2); // 2차 카테고리 (항생.소독제)
			param.Append(CConst.DB_PARAM_DELIMITER).Append(PROD_TYPE_CD); // 제품유형 코드
			param.Append(CConst.DB_PARAM_DELIMITER).Append(CStringUtil.GetInitial(LANG_CD, "S", ProdInitial));
			param.Append(CConst.DB_PARAM_DELIMITER).Append(CStringUtil.GetInitial(LANG_CD, "E", ProdInitial));
			param.Append(CConst.DB_PARAM_DELIMITER).Append(SearchText); // 태그명으로 검색
			param.Append(CConst.DB_PARAM_DELIMITER).Append(prod_sorting.SelectedValue.ToString()); //정렬

			SetDataList(2001, param.ToString());

		}

		/// <summary>
		/// 초기화 컨트롤들 (파라미터에 의한 셋팅)
		/// </summary>
		private void InitControls()
		{
			search_text.Value = SearchText;
		}

		/// <summary>
		/// DB를 통해 동적으로 셋팅해야 되는 컨트롤
		/// 분류관련 selectbox류들
		/// </summary>
		private void SetControls()
		{
			StringBuilder param = new StringBuilder();
			/*param.Append(LANG_CD);
			param.Append(CConst.DB_PARAM_DELIMITER).Append(UPR_CATG_NO);
			param.Append(CConst.DB_PARAM_DELIMITER).Append("2");
			DataSet ds = GetDataSet(1, param.ToString());
			*/
			param.Append(LANG_CD);
			param.Append(CConst.DB_PARAM_DELIMITER).Append(category);
			DataSet ds =  GetDataSet(1106, param.ToString());
			catgDs = ds;
			catg_no2.Items.Add(new ListItem("Select Category", ""));

			if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
			{
				string _category = String.Empty;
				for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
				{
					_category = ds.Tables[0].Rows[i]["CATE_CD"].ToString();
					if (_category.Length > 4) continue;
					catg_no2.Items.Add(new ListItem(ds.Tables[0].Rows[i]["CATE_NAME"].ToString(), ds.Tables[0].Rows[i]["CATE_CD"].ToString()));

					//System.Diagnostics.Debug.WriteLine("파라미터: " + CatgNo2 + ", DB: " + ds.Tables[0].Rows[i]["CATG_NO"].ToString());

					if (category.Equals(ds.Tables[0].Rows[i]["CATE_CD"].ToString()))
					{
						catg_no2.SelectedIndex = i + 1;
					}
				}
			}
		}

		#region GET-SET

		protected string ProdInitial
		{
			get
			{
				if (Request["prod_initial"] == null)
				{
					return "";
				}
				else
				{
					return Request["prod_initial"];
				}
			}
		}

		protected string category
		{
			get { return (Request["category"] != null) ? Request["category"] : "01"; }
			set { category = value; }
		}

		protected string categoryName
		{
			get { return code.getCategoryName(category.Substring(0, 2)); }
		}

		protected string CatgNo2
		{
			get
			{
				if (Request["catg_no2"] == null)
				{
					return "0";
				}
				else
				{
					category = Request["catg_no2"];
					return Request["catg_no2"];
				}
			}
		}

		protected string SearchText
		{
			get
			{
				if (CStringUtil.IsNullOrEmpty(Request["search_text"]))
				{
					if (CStringUtil.IsNullOrEmpty(search_text.Value) == false)
					{
						return search_text.Value;
					}
					else
					{
						return "";
					}
				}
				else
				{
					return Request["search_text"];
				}
			}
		}

		/// <summary>
		/// 사용자 화면 컨트롤을 위한 카테고리 자릿수 제한
		/// </summary>
		protected int cutLimit
		{
			get { return (category.Length > 4) ? category.Length - 2 : category.Length; }
		}


		protected DataSet CatgDs
		{
			get
			{
				return catgDs;
			}
		}

		protected string menu
		{
			get { return (Request["menu"] != null) ? Request["menu"] : "0101"; }
		}

		#endregion

		#region 이벤트 메소드

		/// <summary>
		/// 조회 버튼 클릭
		/// 
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		protected void btnSearch_Click(object sender, EventArgs e)
		{
			Response.Redirect("pdt_list.aspx?prod_initial=" + ProdInitial + "&catg_no2=" + catg_no2.SelectedValue + "&search_text=" + search_text.Value);
		}

		#endregion
	}
}