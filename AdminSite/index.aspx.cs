using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

using AdminSite.m_master;
using CommonLib.Utils;
using System.Web.Security;
using System.Configuration;
using System.Data;

namespace AdminSite
{
    public partial class index : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
				//임시 서버 적용시 주석처리
				admin_id.Value = "admin";
				admin_pw.Value = "dhnp2009newpharm";
				GetLogin();
			}
        }


        /// <summary>
        /// 로그인
        /// </summary>
        private void GetLogin()
        {
            string password = string.Empty;

            if (CStringUtil.IsNullOrEmpty(admin_pw.Value) == false)
            {   
                string password_enc = CSecureUtil.Encrypt(admin_pw.Value);

                //System.Diagnostics.Trace.WriteLine(password_enc);

                StringBuilder param = new StringBuilder();
                param.Append(admin_id.Value);
                param.Append(CConst.DB_PARAM_DELIMITER).Append(admin_pw.Value);
                param.Append(CConst.DB_PARAM_DELIMITER).Append(password_enc);

                SetDataList(3000, param.ToString());

                if (CStringUtil.IsNullOrEmpty(GetData(0, 0)) == false)
                {
                    // 로그인 설정 및 시작 메뉴 URL을 가져온다.
                    string startupUrl = SetLoginInfo();

                    if (CStringUtil.IsNullOrEmpty(startupUrl))
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "test", CWebUtil.MsgBox("접근 권한이 없습니다."));
                    }
                    else
                    {
                        Response.Redirect(startupUrl);
                    }
                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "test", CWebUtil.MsgBox("아이디 또는 비밀번호가 다릅니다."));
                }
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "test", CWebUtil.MsgBox("비밀번호가 입력되지 않았습니다."));
            }
        }

        /// <summary>
        /// 로그인 세션 정보 설정
        /// </summary>
        private string SetLoginInfo()
        {
            FormsAuthentication.SetAuthCookie(admin_id.Value, false);
            Session["admin_nm"] = GetData(0, "ADMIN_NM");
            Session["admin_id"] = GetData(0, "ADMIN_ID");

            List<string> menuList = GetMenuAuth(GetData(0, "ADMIN_ID"));
            Session["admin_menu"] = menuList;

            string startupUrl = GetStartUpMenuUrl(menuList.ElementAt(0));

            // 로그인 세션 타임 아웃 설정
            Session.Timeout = Convert.ToInt32(ConfigurationManager.AppSettings["LOGIN_SESSION_TIMEOUT"]);

            return startupUrl;
        }

        /// <summary>
        /// 로그인 버튼 클릭
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            GetLogin();
        }

        /// <summary>
        /// ID에 해당하는 매뉴 권한을 가져온다.
        /// </summary>
        /// <param name="adminId"></param>
        /// <returns></returns>
        private List<string> GetMenuAuth(string adminId)
        {
            List<string> list = null;

            if (CStringUtil.IsNullOrEmpty(adminId) == false)
            {
                StringBuilder param = new StringBuilder();
                param.Append(adminId);

                DataSet ds = GetDataSet(3001, param.ToString());

                if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    list = new List<string>();

                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        list.Add(ds.Tables[0].Rows[i]["MENU_NO"].ToString());
                    }
                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "test", CWebUtil.MsgBox("접근 권한이 없습니다."));
                    Response.Redirect("index.aspx");
                }
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "test", CWebUtil.MsgBox("접근 권한이 없습니다."));
                Response.Redirect("index.aspx");
            }

            return list;
        }

        /// <summary>
        /// 첫번째 매뉴번호에 해당하는 최초 시작 메뉴 URL 리턴
        /// </summary>
        /// <param name="menuNo">매뉴번호</param>
        /// <returns></returns>
        private string GetStartUpMenuUrl(string menuNo)
        {
            string startupUrl = string.Empty;

            switch (menuNo)
            {
                case "1":
                    startupUrl = "/main/main_list.aspx";
                    break;
                case "2":
                    startupUrl = "/pdt/pdt_human_list.aspx";
                    break;
                case "3":
                    startupUrl = "/pr/new_list.aspx";
                    break;
                case "4":
                    startupUrl = "/inv/ir_info_list.aspx";
                    break;
                case "5":
                    startupUrl = "/rcm/job_notify_list.aspx";
                    break;
                case "6":
                    startupUrl = "/cust/inquire_list.aspx";
                    break;
                case "7":
                    startupUrl = "/code/code_human_list.aspx";
                    break;
                case "8":
                    startupUrl = "/account/order_list.aspx";
                    break;
                default :
                    startupUrl = "/main/main_list.aspx";
                    break;
            }

            return GetRoot() + startupUrl;
        }
    }
 
}