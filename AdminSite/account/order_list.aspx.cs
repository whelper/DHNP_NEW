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

namespace AdminSite.order
{
    public partial class order_list : PageBase
    {
        private DataSet ds = null;

        private string adminId = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (CStringUtil.IsNullOrEmpty(AdminId) == false && "S".Equals(CRUD))
                {
                    // 관리자 수정 모드일때, 동적으로 readonly 속성 추가
                    sys_insert_member_id.Attributes.Add("readonly", "readonly");

                    SetDetailAdmin();
                }
                else if (CStringUtil.IsNullOrEmpty(AdminId) == false && "D".Equals(CRUD))
                {
                    RemoveAdminData(AdminId);
                }

                SearchData();
            }
        }

        /// <summary>
        /// 관리자 리스트 조회
        /// </summary>
        private void SearchData()
        {
            SetDataList(3800, null);
        }

        /// <summary>
        /// 관리자 상세 조회
        /// </summary>
        private void SetDetailAdmin()
        {
            StringBuilder param = new StringBuilder();
            param.Append(Request["admin_id"]);

            ds = GetDataSet(3801, param.ToString());

            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                sys_insert_member_id.Value = ds.Tables[0].Rows[0]["ADMIN_ID"].ToString();
                sys_insert_member_nm.Value = ds.Tables[0].Rows[0]["ADMIN_NM"].ToString();

                // Password 필드가 안채워져 고민중
                sys_insert_member_pwd.Attributes.Add("value", CSecureUtil.Decrypt(ds.Tables[0].Rows[0]["ADMIN_PW"].ToString(), CConst.SECURIT_KEY));
            }
        }

        /// <summary>
        /// 관리자 정보 추가
        /// </summary>
        private void AddAdminData()
        {
            string adminPwd = CSecureUtil.Encrypt(sys_insert_member_pwd.Value);

            StringBuilder param = new StringBuilder();
            param.Append(sys_insert_member_id.Value);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(sys_insert_member_nm.Value);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(adminPwd);

            string[] result = ExecuteQueryResult(3802, param.ToString());

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
        /// 관리자 정보 수정
        /// </summary>
        private void ModifyAdminData()
        {
            string adminPwd = CSecureUtil.Encrypt(sys_insert_member_pwd.Value);

            StringBuilder param = new StringBuilder();
            param.Append(sys_insert_member_id.Value);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(sys_insert_member_nm.Value);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(adminPwd);

            string[] result = ExecuteQueryResult(3803, param.ToString());

            if (result == null)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "test", CWebUtil.MsgBox("시스템 오류가 발생 했습니다."));
            }
            else if (result[0].Equals("00") == false)
            {
                // 수정 실패
                ClientScript.RegisterClientScriptBlock(this.GetType(), "test", CWebUtil.MsgBox(result[1]));
            }
        }

        /// <summary>
        /// 관리자 정보 삭제
        /// </summary>
        private void RemoveAdminData(string adminId)
        {
            StringBuilder param = new StringBuilder();
            param.Append(AdminId);

            string[] result = ExecuteQueryResult(3804, param.ToString());

            if (result == null)
            {
                // 삭제 실패 - 코드 자체가 안오는 경우
                ClientScript.RegisterClientScriptBlock(this.GetType(), "test", CWebUtil.MsgBox("시스템 오류가 발생하였습니다."));
            }
            else if (result != null && CStringUtil.IsNullOrEmpty(result[0]).Equals("00") == false)
            {
                // 삭제 실패
                ClientScript.RegisterClientScriptBlock(this.GetType(), "test", CWebUtil.MsgBox(result[1]));
            }

            Response.Redirect("./order_list.aspx");
        }

        /// <summary>
        /// 권한 할당 저장
        /// </summary>
        private void SaveMenuAuth()
        {
            if (Request["chk"] != null)
            {
                ExecuteQuery(3807, s_admin_menu.Value);

                string chk = Request["chk"].ToString();
                string[] m_value = chk.Split(',');

                StringBuilder param = new StringBuilder();

                if (m_value[0].Length > 0)
                {
                    for (int i = 0; i < m_value.Length; i++)
                    {
                        if (m_value[i].Equals(""))
                        {
                            break;
                        }

                        param.Append(s_admin_menu.Value);
                        param.Append(CConst.DB_PARAM_DELIMITER).Append(m_value[i]);
                        param.Append(CConst.DB_PARAM_DELIMITER).Append(""); // 수정자 일단 비워둠
                        ExecuteQuery(3806, param.ToString());

                        param.Length = 0;
                    }
                }
            }

            // 히든필드 초기화
            s_admin_menu.Value = "";

            SearchData();
        }

        protected string AdminId
        {
            get
            {
                return Request["admin_id"];
            }
        }

        protected string CRUD
        {
            get
            {
                return Request["crud"];
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            AddAdminData();

            SearchData();
        }

        protected void btnMod_Click(object sender, EventArgs e)
        {
            ModifyAdminData();

            SearchData();
        }

        protected void btnMenuSave_Click(object sender, EventArgs e)
        {
            SaveMenuAuth();

            SearchData();
        }
    }
}