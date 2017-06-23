using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using CommonLib.Utils;
using System.Web.Security;
using System.Data;
using System.Text;
using CommonLib.DB;

namespace AdminSite
{
    public partial class SiteSub : System.Web.UI.MasterPage
    {
        private string parentUri = ""; // content 웹페이지 부모 Uri(폴더) 
        private string pageName = ""; // 웹페이지 이름

        // 한 LNB영역에 리스트와 서브 페이지가 있는 것은 여기에 선언해서 사용한다.
        private static string[] main = { "main_list.aspx", "main_list_eng.aspx" };
        private static string[] pdt1_1 = { "pdt_human_list.aspx", "pdt_human_detail.aspx", "pdt_cha_info_list.aspx", "pdt_cha_info_detail.aspx", "pdt_catalog_list.aspx" };
        private static string[] pdt1_2 = { "pdt_ani_list.aspx", "pdt_ani_detail.aspx", "pdt_catalog_list.aspx" };
        private static string[] pdt1_3 = { "pdt_bio_list.aspx", "pdt_bio_detail.aspx", "pdt_bioC_list.aspx", "pdt_bioC_detail.aspx", "pdt_catalog_list.aspx" };
        private static string[] pdt1_4 = { "pdt_ex_human_list.aspx", "pdt_ex_human_detail.aspx", "pdt_catalog_list.aspx" };
        private static string[] pdt1_5 = { "pdt_ex_ani_list.aspx", "pdt_ex_ani_detail.aspx", "pdt_catalog_list.aspx" };
        private static string[] pdt1_6 = { "pdt_health_list.aspx", "pdt_health_detail.aspx", "pdt_catalog_list.aspx" };
        private static string[] pdt1_7 = { "pdt_device_list.aspx", "pdt_device_detail.aspx", "pdt_catalog_list.aspx" };
        private static string[] pdt1_8 = { "pdt_ex_etc_list.aspx", "pdt_ex_etc_detail.aspx", "pdt_catalog_list.aspx" };

        private static string[] pr1_1 = { "new_list.aspx", "new_detail.aspx", "new_head.aspx" };
        private static string[] pr1_2 = { "global_list.aspx", "global_detail.aspx", "global_head.aspx" };

        private static string[] inv1_1 = { "ir_info_list.aspx", "ir_info_detail.aspx", "ir_info_list_eng.aspx" };
        private static string[] inv1_2 = { "money_mark_list.aspx", "money_mark_list_eng.aspx" };
        private static string[] inv1_3 = { "money_bill_list.aspx", "money_bill_list_eng.aspx" };
        private static string[] inv1_4 = { "ju_info_list.aspx", "ju_info_list_eng.aspx" };
        private static string[] inv1_5 = { "ju_juju_list.aspx", "ju_juju_list_eng.aspx" };
        private static string[] inv1_6 = { "ju_my_list.aspx", "ju_my_list_eng.aspx" };
        private static string[] inv1_7 = { "notice_list.aspx", "notice_detail.aspx", "notice_head.aspx" };

        private static string[] rcm1_1 = { "job_notify_list.aspx", "job_notify_head", "job_notify_detail.aspx", "job_notify_head.aspx" };
        private static string[] rcm1_2 = { "job_guide_list.aspx", "job_guide_detail.aspx", "job_support_list.aspx", "job_support_detail.aspx" };
        private static string[] rcm1_3 = { "job_faq_list.aspx", "job_faq_detail.aspx" };

        private static string[] cust1_1 = { "inquire_list.aspx", "inquire_detail.aspx" };
        private static string[] cust1_2 = { "with_list.aspx", "with_detail.aspx" };

        private string[] pr_global = { "global_list.aspx", "global_view.aspx" };

        private string[] account_2 = { "duty_list.aspx", "rcm_auth_list.aspx" };

        protected void Page_Load(object sender, EventArgs e)
        {
            ParserURL();
        }

        private void ParserURL()
        {
            parentUri = CWebUtil.GetWebpageParentURI(Request.Url.LocalPath, '/');
            pageName = CWebUtil.GetLastURI(Request.Url.LocalPath, '/');
        }

        protected string GetGnbIndicatorSelected(string parentUri)
        {
            string css = "";

            if (parentUri.Equals(this.parentUri))
            {
                css = " class='select'";
            }

            return css;
        }

        /// <summary>
        /// 선택된 GNB영역 CSS
        /// </summary>
        /// <param name="parentUri"></param>
        /// <returns></returns>
        protected string GetGnbIndicator(string parentUri)
        {
            string css = "";

            if (parentUri.Equals(this.parentUri) && parentUri.Equals("code"))
            {
                css = " class='sub on code'";
            }
            else if (parentUri.Equals(this.parentUri))
            {
                css = " class='sub on'";
            }
            else
            {
                css = " style='display:none;'";
            }

            return css;
        }

        /// <summary>
        /// 선택된 LNB영역 CSS
        /// 한 LNB영역에 리스트와 서브 상세 페이지가 있는 것은 배열로 선언해두고, LNB하나에 페이지 하나만 있는 것은 페이지명만 준다.
        /// </summary>
        /// <param name="token">페이지명 또는 특정 LNB의 그룹명</param>
        /// <returns></returns>
        protected string GetLnbIndicator(string token)
        {
            string css = "";

            switch (token)
            {
                #region Token에 따라 분리
                case "main":
                    for (int i = 0; i < main.Length; i++)
                    {
                        if (main[i].Equals(pageName))
                        {
                            css = " class='active'";
                            break;
                        }
                    }
                    break;
                case "pdt1_1":
                    for (int i = 0; i < pdt1_1.Length; i++)
                    {
                        if (pageName.Equals("pdt_catalog_list.aspx"))
                        {
                            if ("1".Equals(Request["upr_catg_no"]))
                            {
                                css = " class='active'";
                                break;
                            }
                        }
                        else if (pdt1_1[i].Equals(pageName))
                        {   
                            css = " class='active'";
                            break;
                        }
                    }
                    break;
                case "pdt1_2":
                    for (int i = 0; i < pdt1_2.Length; i++)
                    {
                        if (pageName.Equals("pdt_catalog_list.aspx"))
                        {
                            if ("2".Equals(Request["upr_catg_no"]))
                            {
                                css = " class='active'";
                                break;
                            }
                        }
                        else if (pdt1_2[i].Equals(pageName))
                        {
                            css = " class='active'";
                            break;
                        }
                    }
                    break;
                case "pdt1_3":
                    for (int i = 0; i < pdt1_3.Length; i++)
                    {
                        if (pageName.Equals("pdt_catalog_list.aspx"))
                        {
                            if ("3".Equals(Request["upr_catg_no"]))
                            {
                                css = " class='active'";
                                break;
                            }
                        }
                        else if (pdt1_3[i].Equals(pageName))
                        {
                            css = " class='active'";
                            break;
                        }
                    }
                    break;
                case "pdt1_4":
                    for (int i = 0; i < pdt1_4.Length; i++)
                    {
                        if (pageName.Equals("pdt_catalog_list.aspx"))
                        {
                            if ("4".Equals(Request["upr_catg_no"]))
                            {
                                css = " class='active'";
                                break;
                            }
                        }
                        else if (pdt1_4[i].Equals(pageName))
                        {
                            css = " class='active'";
                            break;
                        }
                    }
                    break;
                case "pdt1_5":
                    for (int i = 0; i < pdt1_5.Length; i++)
                    {
                        if (pageName.Equals("pdt_catalog_list.aspx"))
                        {
                            if ("5".Equals(Request["upr_catg_no"]))
                            {
                                css = " class='active'";
                                break;
                            }
                        }
                        else if (pdt1_5[i].Equals(pageName))
                        {
                            css = " class='active'";
                            break;
                        }
                    }
                    break;
                case "pdt1_6":
                    for (int i = 0; i < pdt1_6.Length; i++)
                    {
                        if (pageName.Equals("pdt_catalog_list.aspx"))
                        {
                            if ("6".Equals(Request["upr_catg_no"]))
                            {
                                css = " class='active'";
                                break;
                            }
                        }
                        else if (pdt1_6[i].Equals(pageName))
                        {
                            css = " class='active'";
                            break;
                        }
                    }
                    break;
                case "pdt1_7":
                    for (int i = 0; i < pdt1_7.Length; i++)
                    {
                        if (pageName.Equals("pdt_catalog_list.aspx"))
                        {
                            if ("7".Equals(Request["upr_catg_no"]))
                            {
                                css = " class='active'";
                                break;
                            }
                        }
                        else if (pdt1_7[i].Equals(pageName))
                        {
                            css = " class='active'";
                            break;
                        }
                    }
                    break;
                case "pdt1_8":
                    for (int i = 0; i < pdt1_8.Length; i++)
                    {
                        if (pageName.Equals("pdt_catalog_list.aspx"))
                        {
                            if ("10".Equals(Request["upr_catg_no"]))
                            {
                                css = " class='active'";
                                break;
                            }
                        }
                        else if (pdt1_8[i].Equals(pageName))
                        {
                            css = " class='active'";
                            break;
                        }
                    }
                    break;
                case "pr1_1":
                    for (int i = 0; i < pr1_1.Length; i++)
                    {
                        if (pr1_1[i].Equals(pageName))
                        {
                            css = " class='active'";
                            break;
                        }
                    }
                    break;

                case "pr1_2":
                    for (int i = 0; i < pr1_2.Length; i++)
                    {
                        if (pr1_2[i].Equals(pageName))
                        {
                            css = " class='active'";
                            break;
                        }
                    }
                    break;

                case "inv1_1":
                    for (int i = 0; i < inv1_1.Length; i++)
                    {
                        if (inv1_1[i].Equals(pageName))
                        {
                            css = " class='active'";
                            break;
                        }
                    }
                    break;

                case "inv1_2":
                    for (int i = 0; i < inv1_2.Length; i++)
                    {
                        if (inv1_2[i].Equals(pageName))
                        {
                            css = " class='active'";
                            break;
                        }
                    }
                    break;

                case "inv1_3":
                    for (int i = 0; i < inv1_3.Length; i++)
                    {
                        if (inv1_3[i].Equals(pageName))
                        {
                            css = " class='active'";
                            break;
                        }
                    }
                    break;

                case "inv1_4":
                    for (int i = 0; i < inv1_4.Length; i++)
                    {
                        if (inv1_4[i].Equals(pageName))
                        {
                            css = " class='active'";
                            break;
                        }
                    }
                    break;

                case "inv1_5":
                    for (int i = 0; i < inv1_5.Length; i++)
                    {
                        if (inv1_5[i].Equals(pageName))
                        {
                            css = " class='active'";
                            break;
                        }
                    }
                    break;

                case "inv1_6":
                    for (int i = 0; i < inv1_6.Length; i++)
                    {
                        if (inv1_6[i].Equals(pageName))
                        {
                            css = " class='active'";
                            break;
                        }
                    }
                    break;

                case "inv1_7":
                    for (int i = 0; i < inv1_7.Length; i++)
                    {
                        if (inv1_7[i].Equals(pageName))
                        {
                            css = " class='active'";
                            break;
                        }
                    }
                    break;

                case "rcm1_1":
                    for (int i = 0; i < rcm1_1.Length; i++)
                    {
                        if (rcm1_1[i].Equals(pageName))
                        {
                            css = " class='active'";
                            break;
                        }
                    }
                    break;

                case "rcm1_2":
                    for (int i = 0; i < rcm1_2.Length; i++)
                    {
                        if (rcm1_2[i].Equals(pageName))
                        {
                            css = " class='active'";
                            break;
                        }
                    }
                    break;

                case "rcm1_3":
                    for (int i = 0; i < rcm1_3.Length; i++)
                    {
                        if (rcm1_3[i].Equals(pageName))
                        {
                            css = " class='active'";
                            break;
                        }
                    }
                    break;

                case "cust1_1":
                    for (int i = 0; i < cust1_1.Length; i++)
                    {
                        if (cust1_1[i].Equals(pageName))
                        {
                            css = " class='active'";
                            break;
                        }
                    }
                    break;

                case "cust1_2":
                    for (int i = 0; i < cust1_2.Length; i++)
                    {
                        if (cust1_2[i].Equals(pageName))
                        {
                            css = " class='active'";
                            break;
                        }
                    }
                    break;

                case "account_2":
                    for (int i = 0; i < account_2.Length; i++)
                    {
                        if (account_2[i].Equals(pageName))
                        {
                            css = " class='active'";
                            break;
                        }
                    }
                    break;

                #endregion
            }

            // switch문을 타지 않은 것은 여기서 검색
            if (token.Equals(pageName))
            {
                css = " class='active'";
            }

            return css;
        }

        /// <summary>
        /// 매뉴 접근 권한이 있는지 리턴
        /// </summary>
        /// <param name="menuNo"></param>
        /// <returns></returns>
        protected bool IsGetMenuAccess(string menuNo)
        {
            bool result = false;

            try
            {
                List<string> menuList = (List<string>)Session["admin_menu"];

                foreach (string menu in menuList)
                {
                    if (menuNo.Equals(menu))
                    {
                        result = true;
                        break;
                    }
                }
            }
            catch
            {
                result = false;
            }

            return result;
        }

        /// <summary>
        /// Top 네비 상단 사용자 이름
        /// </summary>
        /// <returns></returns>
        protected string GetUserName()
        {
            string result = (string)Session["admin_nm"];

            if (CStringUtil.IsNullOrEmpty(result))
            {
                // session null이면 session이 만료되었거나 서버 재시작이 있었기 때문에 logout시킴
                Logout();
            }

            return result;
        }

        /// <summary>
        /// logout method
        /// </summary>
        protected void Logout()
        {
            FormsAuthentication.SignOut();
            Session["admin_nm"] = null;
            Session["admin_id"] = null;
            Session["admin_menu"] = null;

            Response.Redirect("~/index.aspx");
            Response.End();
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Logout();
        }

        protected string GetRoot()
        {
            return CConst.ADMIN_ROOT;
        }
    }
}