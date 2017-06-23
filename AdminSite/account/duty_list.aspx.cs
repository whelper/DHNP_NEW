using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using AdminSite.m_master;
using CommonLib.Utils;
using System.Text;
using System.Data;
using System.Configuration;

namespace AdminSite.account
{
    public partial class duty_list : PageBase
    {
        // 직무의 depth는 1 고정
        private const int DUTY_DEPTH = 1;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (CStringUtil.IsNullOrEmpty(DutyNo) == false && "S".Equals(CRUD))
                {
                    // 수정 모드일때, 동적으로 readonly 속성 추가
                    duty_no.Attributes.Add("readonly", "readonly");

                    SetDetail();
                }
                else if (CStringUtil.IsNullOrEmpty(DutyNo) == false && "D".Equals(CRUD))
                {
                    DelData();
                }

                SearchData();
            }
        }

        /// <summary>
        /// 리스트 조회
        /// </summary>
        private void SearchData()
        {
            SetDataList(3811, null);
        }

        /// <summary>
        /// 상세 조회
        /// </summary>
        private void SetDetail()
        {
            DataSet ds = GetDataSet(3812, DutyNo);

            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                duty_no.Value = ds.Tables[0].Rows[0]["DUTY_NO"].ToString();
                duty_nm.Value = ds.Tables[0].Rows[0]["DUTY_NM"].ToString();
                sort_ord.Value = ds.Tables[0].Rows[0]["SORT_ORD"].ToString();
            }
        }

        private void AddData()
        {
            StringBuilder param = new StringBuilder();
            param.Append(duty_nm.Value);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(DUTY_DEPTH);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(sort_ord.Value);

            string[] result = ExecuteQueryResult(3813, param.ToString());

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
                Response.Redirect("duty_list.aspx");
            }
        }

        private void ModData()
        {
            StringBuilder param = new StringBuilder();
            param.Append(duty_nm.Value);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(DUTY_DEPTH);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(sort_ord.Value);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(duty_no.Value);

            string[] result = ExecuteQueryResult(3814, param.ToString());

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
                Response.Redirect("duty_list.aspx");
            }
        }

        private void DelData()
        {
            string[] result = ExecuteQueryResult(3815, DutyNo);

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

        #region Get-Set

        protected string DutyNo
        {
            get
            {
                return Request["duty_no"];
            }
        }

        protected string CRUD
        {
            get
            {
                return Request["crud"];
            }
        }

        #endregion

        #region 이벤트

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            AddData();

            SearchData();
        }

        protected void btnMod_Click(object sender, EventArgs e)
        {
            ModData();

            SearchData();
        }

        #endregion
    }
}