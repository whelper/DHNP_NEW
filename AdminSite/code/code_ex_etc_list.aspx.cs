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

namespace AdminSite.code
{
    public partial class code_ex_etc_list : PageBase
    {
        /// <summary>
        /// 고정 매뉴 번호
        /// </summary>
        private const string UPR_CATG_NO = "10";

        /// <summary>
        /// 고정 언어코드
        /// </summary>
        //private const string LANG_CD = "KOR";

        /// <summary>
        /// 고정 DEPTH - 2depth만 들어감 (1depth는 DB에서 script로 직접 입력했다고 가정)
        /// </summary>
        private const string DEPTH = "2";

        private DataSet ds = null;

        private string catgNo = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (CStringUtil.IsNullOrEmpty(VCatgNo) == false && "S".Equals(CRUD))
                {
                    // 수정 모드일때, 버튼 텍스트 수정으로 변경
                    hSaveMode.Value = "U";

                    SearchDetail();
                }
                else if (CStringUtil.IsNullOrEmpty(VCatgNo) == false && "D".Equals(CRUD))
                {
                    RemoveData();
                }

                SearchData();
            }
        }

        /// <summary>
        /// 데이터 리스트 조회
        /// </summary>
        private void SearchData()
        {
            StringBuilder param = new StringBuilder();
            param.Append(LANG_CD);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(UPR_CATG_NO);

            SetDataList(3700, param.ToString());
        }

        /// <summary>
        /// 데이터 상세
        /// </summary>
        private void SearchDetail()
        {
            StringBuilder param = new StringBuilder();
            param.Append(LANG_CD);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(VCatgNo);

            ds = GetDataSet(3701, param.ToString());

            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                sort_ord.Value = ds.Tables[0].Rows[0]["SORT_ORD"].ToString();
                catg_nm.Value = ds.Tables[0].Rows[0]["CATG_NM"].ToString();
            }
        }

        /// <summary>
        /// 데이터 추가
        /// </summary>
        private void AddData()
        {
            StringBuilder param = new StringBuilder();
            param.Append(LANG_CD);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(UPR_CATG_NO);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(DEPTH);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(sort_ord.Value);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(""); // 로그인 관리자
            param.Append(CConst.DB_PARAM_DELIMITER).Append(catg_nm.Value);

            string[] result = ExecuteQueryResult(3702, param.ToString());

            if (result == null)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "test", CWebUtil.MsgBox("시스템 오류가 발생 했습니다."));
            }
            else if (result[0].Equals("00") == false)
            {
                // 추가 실패
                ClientScript.RegisterClientScriptBlock(this.GetType(), "test", CWebUtil.MsgBox(result[1]));
            }
        }

        /// <summary>
        /// 데이터 수정
        /// </summary>
        private void UpdateData()
        {
            StringBuilder param = new StringBuilder();
            param.Append(LANG_CD);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(UPR_CATG_NO);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(DEPTH);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(sort_ord.Value);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(""); // 수정자 ID
            param.Append(CConst.DB_PARAM_DELIMITER).Append(catg_nm.Value);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(VCatgNo);

            string[] result = ExecuteQueryResult(3703, param.ToString());

            if (result == null)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "test", CWebUtil.MsgBox("시스템 오류가 발생 했습니다."));
            }
            else if (result[0].Equals("00") == false)
            {
                // 추가 실패
                ClientScript.RegisterClientScriptBlock(this.GetType(), "test", CWebUtil.MsgBox(result[1]));
            }
        }

        /// <summary>
        /// 데이터 삭제
        /// </summary>
        private void RemoveData()
        {
            StringBuilder param = new StringBuilder();
            param.Append(LANG_CD);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(VCatgNo);

            string[] result = ExecuteQueryResult(3704, param.ToString());

            if (result == null)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "test", CWebUtil.MsgBox("시스템 오류가 발생 했습니다."));
            }
            else if (result[0].Equals("00") == false)
            {
                // 추가 실패
                ClientScript.RegisterClientScriptBlock(this.GetType(), "test", CWebUtil.MsgBox(result[1]));
            }
        }

        #region GET-SET

        protected string VCatgNo
        {
            get
            {
                return Request["catgNo"];
            }
        }

        protected string CRUD
        {
            get
            {
                return Request["crud"];
            }
        }

        protected string LANG_CD
        {
            get
            {
                if (Request["LANG_CD"] == null)
                {
                    // 기본은 국문
                    return "KOR";
                }
                else
                {
                    return Request["LANG_CD"];
                }
            }
        }

        #endregion

        #region 이벤트 메소드

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (hSaveMode.Value.Equals("U"))
            {
                UpdateData();
            }
            else
            {
                AddData();
            }

            Response.Redirect("./code_ex_etc_list.aspx?LANG_CD=" + LANG_CD);
        }

        #endregion
    }
}