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
    public partial class rcm_auth_list : PageBase
    {
        // 직무의 depth는 1 고정
        private const int DUTY_DEPTH = 2;
        private string m_upr_duty_no = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (CStringUtil.IsNullOrEmpty(DutyNo) == false && "S".Equals(CRUD))
                {   
                    SetDetail();
                }
                else if (CStringUtil.IsNullOrEmpty(DutyNo) == false && "D".Equals(CRUD))
                {
                    DelData();
                }

                SearchData();

                SetControls();
            }
        }

        /// <summary>
        /// 리스트 조회
        /// </summary>
        private void SearchData()
        {
            SetDataList(3821, null);
        }

        private void SetControls()
        {
            DataSet ds = GetDataSet(3811, null);

            upr_duty_no.Items.Add(new ListItem("선택", ""));

            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {   
                    upr_duty_no.Items.Add(new ListItem(ds.Tables[0].Rows[i]["DUTY_NM"].ToString(), ds.Tables[0].Rows[i]["DUTY_NO"].ToString()));

                    if (CStringUtil.IsNullOrEmpty(m_upr_duty_no) == false && m_upr_duty_no.Equals(ds.Tables[0].Rows[i]["DUTY_NO"].ToString()))
                    {
                        upr_duty_no.SelectedIndex = i + 1;
                    }
                }
            }
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

                m_upr_duty_no = ds.Tables[0].Rows[0]["UPR_DUTY_NO"].ToString();
            }
        }

        private void AddData()
        {
            StringBuilder param = new StringBuilder();
            param.Append(duty_nm.Value);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(DUTY_DEPTH);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(sort_ord.Value);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(upr_duty_no.SelectedValue);

            string[] result = ExecuteQueryResult(3823, param.ToString());

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
                Response.Redirect("rcm_auth_list.aspx");
            }
        }

        private void ModData()
        {
            StringBuilder param = new StringBuilder();
            param.Append(duty_nm.Value);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(DUTY_DEPTH);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(sort_ord.Value);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(duty_no.Value);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(upr_duty_no.SelectedValue);

            string[] result = ExecuteQueryResult(3824, param.ToString());

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
                Response.Redirect("rcm_auth_list.aspx");
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

        /// <summary>
        /// 권한 할당 저장
        /// </summary>
        private void SaveAuth()
        {
            if (Request["rcm_auth"] != null && Request["rcm_auth_sub"] != null)
            {
                ExecuteQuery(3828, s_duty_no.Value);

                string reqNm = "rcm_auth";
                string authSubYn = "N";
                for (int k = 0; k < 2; k++)
                {
                    if (k == 1)
                    {
                        reqNm = "rcm_auth_sub";
                        authSubYn = "Y";
                    }

                    string auth = Request[reqNm].ToString();
                    string[] m_value = auth.Split(',');

                    StringBuilder param = new StringBuilder();

                    if (m_value[0].Length > 0)
                    {
                        for (int i = 0; i < m_value.Length; i++)
                        {
                            if (m_value[i].Equals(""))
                            {
                                break;
                            }

                            param.Append(s_duty_no.Value);
                            param.Append(CConst.DB_PARAM_DELIMITER).Append(m_value[i]);
                            param.Append(CConst.DB_PARAM_DELIMITER).Append(authSubYn);
                            ExecuteQuery(3827, param.ToString());

                            param.Length = 0;
                        }
                    }
                }
            }

            // 히든필드 초기화
            s_duty_no.Value = "";
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

        protected void btnAuthSave_Click(object sender, EventArgs e)
        {
            SaveAuth();

            SearchData();
        }

        #endregion
    }
}