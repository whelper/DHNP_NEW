using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Text;
using AdminSite.m_master;
using CommonLib.Utils;
using System.Data;

namespace AdminSite.cate
{
	public partial class cate_list : PageBase
	{
		private DataSet ds = null;
		
		protected void Page_Load(object sender, EventArgs e)
		{

			if (!IsPostBack)
			{

				getList();

				if (CStringUtil.IsNullOrEmpty(_cate_no) == false && ("r".Equals(_dbjob) || "d".Equals(_dbjob) == false))
				{
					getDetail();
				}
				else if (CStringUtil.IsNullOrEmpty(_cate_no) == false && "d".Equals(_dbjob))
				{
					Proc();
				}
				
			}
			else
			{
				//System.Diagnostics.Debug.Write(_dbjob);
				Proc();


			}
			
			/*if (!IsPostBack)
			{
				if (CStringUtil.IsNullOrEmpty(VCatgNo) == false && "S".Equals(CRUD))
				{
					// 수정 모드일때, 버튼 텍스트 수정으로 변경
					hSaveMode.Value = "U";

					SearchDetail();
				}
				else if (CStringUtil.IsNullOrEmpty(VCatgNo) == false && "SA".Equals(CRUD))
				{
					// 수정 모드일때, 버튼 텍스트 수정으로 변경
					hSaveMode.Value = "R";
					hUprCatgNo.Value = VCatgNo;
					SearchDetail();
					catg_nm.Value = null;
					
				}
				else if (CStringUtil.IsNullOrEmpty(VCatgNo) == false && "D".Equals(CRUD))
				{
					RemoveData();
				}

				SearchData();
			}*/
		}

		/// <summary>
		/// 데이터 리스트 조회
		/// </summary>
		private void getList()
		{
			StringBuilder param = new StringBuilder();
			param.Append(LANG_CD);
			SetDataList(3900, param.ToString());
		}

		/// <summary>
		/// 데이터 상세
		/// </summary>
		private void getDetail()
		{
			StringBuilder param = new StringBuilder();
			param.Append(_cate_no);
			dbjob.Value = ("".Equals(_dbjob) == false) ? _dbjob : "u";
			ds = GetDataSet(3902, param.ToString());

			 
			if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
			{
				
				if (dbjob.Value == "r")
				{
					category.Value = ds.Tables[0].Rows[0]["CATE_CD"].ToString();
					parent_id.Value = _cate_no;
					lbl_cate.InnerHtml = ds.Tables[0].Rows[0]["CATE_NAME"].ToString() + " &gt; ";
					
				}
				else {
					cate_no.Value = _cate_no;
					category_name.Value = ds.Tables[0].Rows[0]["CATE_NAME"].ToString();
				}
			}
		}

		

		private void Proc()
		{
			StringBuilder param = new StringBuilder();

			param.Append(LANG_CD);
			param.Append(CConst.DB_PARAM_DELIMITER).Append(_dbjob);
			param.Append(CConst.DB_PARAM_DELIMITER).Append(parent_id.Value);
			param.Append(CConst.DB_PARAM_DELIMITER).Append(category.Value);
			param.Append(CConst.DB_PARAM_DELIMITER).Append(category_name.Value);
			param.Append(CConst.DB_PARAM_DELIMITER).Append(sort_no.Value);
			param.Append(CConst.DB_PARAM_DELIMITER).Append(_cate_no);
			string[] result = ExecuteQueryResult(3901, param.ToString());

			if (result == null)
			{
				ClientScript.RegisterClientScriptBlock(this.GetType(), "test", CWebUtil.MsgBox("시스템 오류가 발생 했습니다."));
			}
			else if (result[0].Equals("00") == false)
			{
				// 추가 실패
				ClientScript.RegisterClientScriptBlock(this.GetType(), "test", CWebUtil.MsgBox(result[1]));
			}
			else
			{
				Response.Redirect("./cate_list.aspx?LANG_CD=" + LANG_CD);
			}	
		}
		#region GET-SET


		protected string LANG_CD
		{
			get{return (Request["lang_cd"] is null) ? "KOR" : Request["lang_cd"]; }
		}

		protected string _dbjob
		{
			get { return (Request["dbjob"] is null) ? "i" : Request["dbjob"]; }
		}

		protected string _cate_no
		{
			get { return Request["cate_no"]; }
		}




		#endregion

		protected void btnSave_Click(object sender, EventArgs e)
		{
			Proc();
			Response.Redirect("./cate_list.aspx?LANG_CD=" + LANG_CD);
		}

		

		
	}
}