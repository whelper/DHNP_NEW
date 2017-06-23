using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;

using CommonLib.DB;
using CommonLib.Utils;
using System.Diagnostics;

namespace HomePage
{
    public partial class Products_Sub1 : System.Web.UI.MasterPage
    {
        #region 변수 선언
        private string LANG_CD = "KOR";
        private string parentUri = ""; // content 웹페이지 부모 Uri(폴더) 
        private string pageName = ""; // 웹페이지 이름

        CWebSql webSql = null;
        DataSet mds = null;

        // 한 LNB영역에 리스트와 서브 페이지가 있는 것은 여기에 선언해서 사용한다.
        /* 제품 */
        private static string[] prod_1 = { "human_new_list.aspx", "human_new_view.aspx" };                 // 인체의약품 - 신제품
        private static string[] prod_2 = { "human_products_list.aspx", "human_products_view.aspx" };               // 인체의약품 - 제품소개
        private static string[] prod_3 = { "human_change_list.aspx", "human_change_view.aspx" };         // 인체의약품 - 제품변경정보
        private static string[] prod_4 = { "animal_new_list.aspx", "animal_new_view.aspx" };               // 동물의약품 - 신제품
        private static string[] prod_5 = { "animal_products_list.aspx", "animal_products_view.aspx" };     // 동물의약품 - 제품소개
        private static string[] prod_6 = { "animal_delivery_list.aspx", "animal_delivery_view.aspx" };     // 동물의약품 - 관납제품
        private static string[] prod_7 = { "bio_badge_list.aspx", "bio_badge_view.aspx" };                      // 바이오공정소재 - 배지
        private static string[] prod_8 = { "bio_resin_list.aspx", "bio_resin_view.aspx", "bio_rnd.aspx" };                      // 바이오공정소재 - 레진

		private static string[] prod_9 = { "bio_catalog_list.aspx", "bio_catalog_view.aspx" };                  // 바이오공정소재 - 카달로그 제품
        private static string[] prod_10 = { "global_human_list.aspx", "global_human_view.aspx" };           // 수출의약품 - 인체의약품
        private static string[] prod_11 = { "global_animal_list.aspx", "global_animal_view.aspx" };        // 수출의약품 - 동물의약품
        private static string[] prod_12 = { "health_products_list.aspx", "health_products_view.aspx" };                                 // 건강기능식품 - 제품소개
        private static string[] prod_13 = { "medical_list.aspx", "medical_view.aspx" };
        private static string[] prod_15 = { "global_etc_list.aspx", "global_etc_view.aspx" }; // 의료기기

        private static string[] prod_group_1 = { "human_new_list.aspx", "human_new_view.aspx", "human_products_list.aspx", "human_products_view.aspx" 
                                            , "human_change_list.aspx", "human_change_view.aspx"
                                        };
        private static string[] prod_group_2 = { "animal_new_list.aspx", "animal_new_view.aspx", "animal_products_list.aspx", "animal_products_view.aspx"
                                            , "animal_delivery_list.aspx", "animal_delivery_view.aspx"};
        private static string[] prod_group_3 = { "bio_badge_list.aspx", "bio_badge_view.aspx", "bio_resin_list.aspx", "bio_resin_view.aspx" 
                                            , "bio_catalog_list.aspx", "bio_catalog_view.aspx", "bio_rnd.aspx"
										};
        private static string[] prod_group_4 = { "global_human_list.aspx", "global_human_view.aspx", "global_animal_list.aspx", "global_animal_view.aspx", "global_etc_list.aspx", "global_etc_view.aspx" };
        private static string[] prod_group_5 = { "health_products_list.aspx", "health_products_view.aspx" };
        private static string[] prod_group_6 = { "medical_list.aspx", "medical_view.aspx" };

        /* 홍보 */
        private static string[] pr_1 = { "news_list.aspx", "news_view.aspx" };                             // 새소식
        private static string[] pr_2 = { "global_list.aspx", "global_view.aspx" };                       // 해외자원투자
        //private static string[] pr_4 = { "global_list.aspx", "global_view.aspx" };

        /* 투자 */
        //private static string[] invest_1 = { "business.aspx" };                                             // 사업전략
        private static string[] invest_2 = { "ir_info_list.aspx", "ir_info_view.aspx" };                    // IR자료
        //private static string[] invest_3 = { "money_mark.aspx" };                                           // 재무상태표
        //private static string[] invest_4 = { "money_bill.aspx" };                                           // 손익계산서
        //private static string[] invest_5 = { "stock_info.aspx" };                                           // 주식발행
        //private static string[] invest_6 = { "stockholder.aspx" };                                          // 주주구성
        //private static string[] invest_7 = { "treasury_stock.aspx" };                                       // 자기주식
        private static string[] invest_8 = { "notice_list.aspx", "notice_view.aspx" };                      // 공고사항

        private static string[] invest_group_1 = { "business.aspx", "ir_info_list.aspx", "ir_info_view.aspx" };
        private static string[] invest_group_2 = { "money_mark.aspx", "money_bill.aspx" };
        private static string[] invest_group_3 = { "stock_info.aspx", "stockholder.aspx", "treasury_stock.aspx" };

        /* 채용 */
        //private string[] recruit_1 = { "new_culture.aspx" };                                         // 문화
        //private string[] recruit_2 = { "new_person.aspx" };                                         // 인재상
        //private string[] recruit_3 = { "new_evaluation.aspx" };                                     // 평가보상
        //private string[] recruit_4 = { "new_interest.aspx" };                                       // 복리후생
        //private string[] recruit_5 = { "new_edu.aspx" };                                            // 교육제도

        private static string[] recruit_6 = { "job_notify_list.aspx", "job_notify_view.aspx" };                                            // 채용공고
        private static string[] recruit_7 = { "job_guide.aspx" };                                            // 채용절차
        private static string[] recruit_8 = { "result_list.aspx" };                                               // 전형결과확인
        private static string[] recruit_9 = { "job_guide_list.aspx", "job_guide_join.aspx", "job_guide_join_sub.aspx" };       // 입사지원
        private static string[] recruit_10 = { "faq_list.aspx", "faq_view.aspx" };                             // FAQ

        private static string[] recruit_group_1 = { "new_culture.aspx", "new_person.aspx", "new_evaluation.aspx" 
                                               , "new_interest.aspx", "new_edu.aspx"
                                           };
        private static string[] recruit_group_2 = { "job_notify_list.aspx", "job_notify_view.aspx", "job_guide.aspx", "result_list.aspx" };
        private static string[] recruit_group_3 = { "job_guide_list.aspx", "job_guide_join.aspx", "job_guide_join_sub.aspx" };
        private static string[] recruit_group_4 = { "faq_list.aspx", "faq_view.aspx" };

        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            ParserURL();
        }

        private void ParserURL()
        {
            parentUri = CWebUtil.GetWebpageParentURI(Request.Url.LocalPath, '/');
            pageName = CWebUtil.GetLastURI(Request.Url.LocalPath, '/');
        }

        /// <summary>
        /// 현재 웹페이지의 GNB 메뉴 인덱스를 리턴한다. 
        /// </summary>
        /// <returns>index</returns>
        protected int GetGnbIndex()
        {
            int result = 0;
            string[] uri = { "intro", "products", "pr", "invest", "recruit" };

            for (int i = 0; i < uri.Length; i++)
            {
                if (parentUri.Equals(uri[i]))
                {
                    result = i;
                    break;
                }
            }

            return result;
        }

        /// <summary>
        /// 선택된 GNB영역 CSS
        /// </summary>
        /// <param name="parentUri"></param>
        /// <returns></returns>
        protected string GetGnbIndicator(string parentUri)
        {
            string css = "";

            if (parentUri.Equals(this.parentUri))
            {
                css = " onhover";
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
                #region 제품 매뉴
                case "prod_1":
                    for (int i = 0; i < prod_1.Length; i++)
                    {
                        if (prod_1[i].Equals(pageName))
                        {
                            css = " class='onhover current'";
                            break;
                        }
                    }
                    break;

                case "prod_2":
                    for (int i = 0; i < prod_2.Length; i++)
                    {
                        if (prod_2[i].Equals(pageName))
                        {
                            css = " class='onhover current'";
                            break;
                        }
                    }
                    break;

                case "prod_3":
                    for (int i = 0; i < prod_3.Length; i++)
                    {
                        if (prod_3[i].Equals(pageName))
                        {
                            css = " class='onhover current'";
                            break;
                        }
                    }
                    break;

                case "prod_4":
                    for (int i = 0; i < prod_4.Length; i++)
                    {
                        if (prod_4[i].Equals(pageName))
                        {
                            css = " class='onhover current'";
                            break;
                        }
                    }
                    break;

                case "prod_5":
                    for (int i = 0; i < prod_5.Length; i++)
                    {
                        if (prod_5[i].Equals(pageName))
                        {
                            css = " class='onhover current'";
                            break;
                        }
                    }
                    break;

                case "prod_6":
                    for (int i = 0; i < prod_6.Length; i++)
                    {
                        if (prod_6[i].Equals(pageName))
                        {
                            css = " class='onhover current'";
                            break;
                        }
                    }
                    break;

                case "prod_7":
                    for (int i = 0; i < prod_7.Length; i++)
                    {
                        if (prod_7[i].Equals(pageName))
                        {
                            css = " class='onhover current'";
                            break;
                        }
                    }
                    break;

                case "prod_8":
                    for (int i = 0; i < prod_8.Length; i++)
                    {
                        if (prod_8[i].Equals(pageName))
                        {
                            css = " class='onhover current'";
                            break;
                        }
                    }
                    break;

                case "prod_9":
                    for (int i = 0; i < prod_9.Length; i++)
                    {
                        if (prod_9[i].Equals(pageName))
                        {
                            css = " class='onhover current'";
                            break;
                        }
                    }
                    break;

                case "prod_10":
                    for (int i = 0; i < prod_10.Length; i++)
                    {
                        if (prod_10[i].Equals(pageName))
                        {
                            css = " class='onhover current'";
                            break;
                        }
                    }
                    break;

                case "prod_11":
                    for (int i = 0; i < prod_11.Length; i++)
                    {
                        if (prod_11[i].Equals(pageName))
                        {
                            css = " class='onhover current'";
                            break;
                        }
                    }
                    break;

                case "prod_12":
                    for (int i = 0; i < prod_12.Length; i++)
                    {
                        if (prod_12[i].Equals(pageName))
                        {
                            css = " class='onhover current'";
                            break;
                        }
                    }
                    break;

                case "prod_13":
                    for (int i = 0; i < prod_13.Length; i++)
                    {
                        if (prod_13[i].Equals(pageName))
                        {
                            css = " class='onhover current'";
                            break;
                        }
                    }
                    break;
                case "prod_15":
                    for (int i = 0; i < prod_15.Length; i++)
                    {
                        if (prod_15[i].Equals(pageName))
                        {
                            css = " class='onhover current'";
                            break;
                        }
                    }
                    break;
                #endregion

                #region 홍보 매뉴
                case "pr_1":
                    for (int i = 0; i < pr_1.Length; i++)
                    {
                        if (pr_1[i].Equals(pageName))
                        {
                            css = " class='onhover current'";
                            break;
                        }
                    }
                    break;
                case "pr_2":
                    for (int i = 0; i < pr_2.Length; i++)
                    {
                        if (pr_2[i].Equals(pageName))
                        {
                            css = " class='onhover current'";
                            break;
                        }
                    }
                    break;

                #endregion

                #region 투자 메뉴

                case "invest_2":
                    for (int i = 0; i < invest_2.Length; i++)
                    {
                        if (invest_2[i].Equals(pageName))
                        {
                            css = " class='onhover current'";
                            break;
                        }
                    }
                    break;

                case "invest_8":
                    for (int i = 0; i < invest_8.Length; i++)
                    {
                        if (invest_8[i].Equals(pageName))
                        {
                            css = " class='onhover current'";
                            break;
                        }
                    }
                    break;
                #endregion

                #region 채용 메뉴
                case "recruit_6":
                    for (int i = 0; i < recruit_6.Length; i++)
                    {
                        if (recruit_6[i].Equals(pageName))
                        {
                            css = " class='onhover current'";
                            break;
                        }
                    }
                    break;

                case "recruit_7":
                    for (int i = 0; i < recruit_7.Length; i++)
                    {
                        if (recruit_7[i].Equals(pageName))
                        {
                            css = " class='onhover current'";
                            break;
                        }
                    }
                    break;

                case "recruit_8":
                    for (int i = 0; i < recruit_8.Length; i++)
                    {
                        if (recruit_8[i].Equals(pageName))
                        {
                            css = " class='onhover current'";
                            break;
                        }
                    }
                    break;

                case "recruit_9":
                    for (int i = 0; i < recruit_9.Length; i++)
                    {
                        if (recruit_9[i].Equals(pageName))
                        {
                            css = " class='onhover current'";
                            break;
                        }
                    }
                    break;

                case "recruit_10":
                    for (int i = 0; i < recruit_10.Length; i++)
                    {
                        if (recruit_10[i].Equals(pageName))
                        {
                            css = " class='onhover current'";
                            break;
                        }
                    }
                    break;

                #endregion

            }

            // switch문을 타지 않은 것은 여기서 검색
            if (token.Equals(pageName))
            {
                css = " class='onhover current'";
            }

            return css;
        }

        /// <summary>
        /// 선택된 LNB영역 CSS
        /// 한 LNB영역에 리스트와 서브 상세 페이지가 있는 것은 배열로 선언해두고, LNB하나에 페이지 하나만 있는 것은 페이지명만 준다.
        /// </summary>
        /// <param name="token">페이지명 또는 특정 LNB의 그룹명</param>
        /// <returns></returns>
        protected string GetLnbIndicatorGroup(string token)
        {
            string css = "";

            switch (token)
            {
                #region 제품 매뉴
                case "prod_group_1":
                    for (int i = 0; i < prod_group_1.Length; i++)
                    {
                        if (prod_group_1[i].Equals(pageName))
                        {
                            css = " class='onhover current'";
                            break;
                        }
                    }
                    break;

                case "prod_group_2":
                    for (int i = 0; i < prod_group_2.Length; i++)
                    {
                        if (prod_group_2[i].Equals(pageName))
                        {
                            css = " class='onhover current'";
                            break;
                        }
                    }
                    break;

                case "prod_group_3":
                    for (int i = 0; i < prod_group_3.Length; i++)
                    {
                        if (prod_group_3[i].Equals(pageName))
                        {
                            css = " class='onhover current'";
                            break;
                        }
                    }
                    break;

                case "prod_group_4":
                    for (int i = 0; i < prod_group_4.Length; i++)
                    {
                        if (prod_group_4[i].Equals(pageName))
                        {
                            css = " class='onhover current'";
                            break;
                        }
                    }
                    break;

                case "prod_group_5":
                    for (int i = 0; i < prod_group_5.Length; i++)
                    {
                        if (prod_group_5[i].Equals(pageName))
                        {
                            css = " class='onhover current'";
                            break;
                        }
                    }
                    break;

                case "prod_group_6":
                    for (int i = 0; i < prod_group_6.Length; i++)
                    {
                        if (prod_group_6[i].Equals(pageName))
                        {
                            css = " class='onhover current'";
                            break;
                        }
                    }
                    break;
                #endregion

                #region 홍보 매뉴
                case "pr_1":
                    for (int i = 0; i < pr_1.Length; i++)
                    {
                        if (pr_1[i].Equals(pageName))
                        {
                            css = " class='onhover current'";
                            break;
                        }
                    }
                    break;
                case "pr_2":
                    for (int i = 0; i < pr_2.Length; i++)
                    {
                        if (pr_2[i].Equals(pageName))
                        {
                            css = " class='onhover current'";
                            break;
                        }
                    }
                    break;

                #endregion

                #region 투자 메뉴

                case "invest_group_1":
                    for (int i = 0; i < invest_group_1.Length; i++)
                    {
                        if (invest_group_1[i].Equals(pageName))
                        {
                            css = " class='onhover current'";
                            break;
                        }
                    }
                    break;

                case "invest_group_2":
                    for (int i = 0; i < invest_group_2.Length; i++)
                    {
                        if (invest_group_2[i].Equals(pageName))
                        {
                            css = " class='onhover current'";
                            break;
                        }
                    }
                    break;

                case "invest_group_3":
                    for (int i = 0; i < invest_group_3.Length; i++)
                    {
                        if (invest_group_3[i].Equals(pageName))
                        {
                            css = " class='onhover current'";
                            break;
                        }
                    }
                    break;
                #endregion

                #region 채용 메뉴
                case "recruit_group_1":
                    for (int i = 0; i < recruit_group_1.Length; i++)
                    {
                        if (recruit_group_1[i].Equals(pageName))
                        {
                            css = " class='onhover current'";
                            break;
                        }
                    }
                    break;

                case "recruit_group_2":
                    for (int i = 0; i < recruit_group_2.Length; i++)
                    {
                        if (recruit_group_2[i].Equals(pageName))
                        {
                            css = " class='onhover current'";
                            break;
                        }
                    }
                    break;

                case "recruit_group_3":
                    for (int i = 0; i < recruit_group_3.Length; i++)
                    {
                        if (recruit_group_3[i].Equals(pageName))
                        {
                            css = " class='onhover current'";
                            break;
                        }
                    }
                    break;

                case "recruit_group_4":
                    for (int i = 0; i < recruit_group_4.Length; i++)
                    {
                        if (recruit_group_4[i].Equals(pageName))
                        {
                            css = " class='onhover current'";
                            break;
                        }
                    }
                    break;

                #endregion

            }

            // switch문을 타지 않은 것은 여기서 검색
            if (token.Equals(pageName))
            {
                css = " class='onhover current'";
            }

            return css;
        }

        /// <summary>
        /// 선택된 LNB영역 CSS
        /// 한 LNB영역에 리스트와 서브 상세 페이지가 있는 것은 배열로 선언해두고, LNB하나에 페이지 하나만 있는 것은 페이지명만 준다.
        /// </summary>
        /// <param name="token">페이지명 또는 특정 LNB의 그룹명</param>
        /// <returns></returns>
        protected string GetLnbIndicatorDisplay(string token)
        {
            string css = " style='display:none'";

            switch (token)
            {
                #region 제품 매뉴
                case "prod_group_1":
                    for (int i = 0; i < prod_group_1.Length; i++)
                    {
                        if (prod_group_1[i].Equals(pageName))
                        {
                            css = "";
                            break;
                        }
                    }
                    break;

                case "prod_group_2":
                    for (int i = 0; i < prod_group_2.Length; i++)
                    {
                        if (prod_group_2[i].Equals(pageName))
                        {
                            css = "";
                            break;
                        }
                    }
                    break;

                case "prod_group_3":
                    for (int i = 0; i < prod_group_3.Length; i++)
                    {
                        if (prod_group_3[i].Equals(pageName))
                        {
                            css = "";
                            break;
                        }
                    }
                    break;

                case "prod_group_4":
                    for (int i = 0; i < prod_group_4.Length; i++)
                    {
                        if (prod_group_4[i].Equals(pageName))
                        {
                            css = "";
                            break;
                        }
                    }
                    break;

                case "prod_group_5":
                    for (int i = 0; i < prod_group_5.Length; i++)
                    {
                        if (prod_group_5[i].Equals(pageName))
                        {
                            css = "";
                            break;
                        }
                    }
                    break;

                case "prod_group_6":
                    for (int i = 0; i < prod_group_6.Length; i++)
                    {
                        if (prod_group_6[i].Equals(pageName))
                        {
                            css = "";
                            break;
                        }
                    }
                    break;
                #endregion

                #region 홍보 매뉴
                case "pr_1":
                    for (int i = 0; i < pr_1.Length; i++)
                    {
                        if (pr_1[i].Equals(pageName))
                        {
                            css = "";
                            break;
                        }
                    }
                    break;
                case "pr_2":
                    for (int i = 0; i < pr_2.Length; i++)
                    {
                        if (pr_2[i].Equals(pageName))
                        {
                            css = "";
                            break;
                        }
                    }
                    break;

                #endregion

                #region 투자 메뉴

                case "invest_group_1":
                    for (int i = 0; i < invest_group_1.Length; i++)
                    {
                        if (invest_group_1[i].Equals(pageName))
                        {
                            css = "";
                            break;
                        }
                    }
                    break;

                case "invest_group_2":
                    for (int i = 0; i < invest_group_2.Length; i++)
                    {
                        if (invest_group_2[i].Equals(pageName))
                        {
                            css = "";
                            break;
                        }
                    }
                    break;

                case "invest_group_3":
                    for (int i = 0; i < invest_group_3.Length; i++)
                    {
                        if (invest_group_3[i].Equals(pageName))
                        {
                            css = "";
                            break;
                        }
                    }
                    break;
                #endregion

                #region 채용 메뉴
                case "recruit_group_1":
                    for (int i = 0; i < recruit_group_1.Length; i++)
                    {
                        if (recruit_group_1[i].Equals(pageName))
                        {
                            css = "";
                            break;
                        }
                    }
                    break;

                case "recruit_group_2":
                    for (int i = 0; i < recruit_group_2.Length; i++)
                    {
                        if (recruit_group_2[i].Equals(pageName))
                        {
                            css = "";
                            break;
                        }
                    }
                    break;

                case "recruit_group_3":
                    for (int i = 0; i < recruit_group_3.Length; i++)
                    {
                        if (recruit_group_3[i].Equals(pageName))
                        {
                            css = "";
                            break;
                        }
                    }
                    break;

                case "recruit_group_4":
                    for (int i = 0; i < recruit_group_4.Length; i++)
                    {
                        if (recruit_group_4[i].Equals(pageName))
                        {
                            css = "";
                            break;
                        }
                    }
                    break;

                #endregion

            }

            // switch문을 타지 않은 것은 여기서 검색
            if (token.Equals(pageName))
            {
                css = "";
            }

            return css;
        }

        /// <summary>
        /// 데이터 조회
        /// </summary>
        private void SearchData()
        {
            StringBuilder param = new StringBuilder();
            param.Append(LANG_CD);

            mds = WebSql.SelectSql(1001, param.ToString());
        }

        #region GET-SET

        private CWebSql WebSql
        {
            get
            {
                if (webSql == null)
                {
                    webSql = new CWebSql();
                }

                return webSql;
            }
        }

        protected DataSet MDS
        {
            get
            {
                if (mds == null)
                {
                    SearchData();
                }

                return mds;
            }
        }

        #endregion
    }
}