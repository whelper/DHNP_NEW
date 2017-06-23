using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using AdminSite.m_master;
using CommonLib.Utils;

namespace AdminSite.inv
{
    public partial class ju_info_list : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SearchData();
            }
        }

        /// <summary>
        /// 데이터 조회
        /// </summary>
        private void SearchData()
        {
            StringBuilder param = new StringBuilder();
            param.Append("KOR");

            SetDataList(3441, param.ToString());
        }

        #region 이벤트 메소드

        /// <summary>
        /// 선택 삭제 버튼 클릭
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSave_Click(object sender, EventArgs e)
        {
            int loop = 1;
            if (eng_override.Checked == true)
            {
                // 영문 덮어쓰기를 한 경우에는 loop를 두번돈다.
                loop = 2;
            }

            string[] LANG_CD = { "KOR", "ENG" };

            for (int k = 0; k < loop; k++)
            {
                StringBuilder dparam = new StringBuilder();
                dparam.Append(LANG_CD[k]);
                ExecuteQueryResult(3443, dparam.ToString());

                String[] ju_info_stcs = Request.Form.GetValues("ju_info_stc");
                String[] ju_info_pstcs = Request.Form.GetValues("ju_info_pstc");
                String[] ju_info_ftas = Request.Form.GetValues("ju_info_fta");
                String[] ju_info_remarks = Request.Form.GetValues("ju_info_remark");

                if (ju_info_stcs != null && ju_info_stcs.Length > 0)
                {
                    for (int i = 0; i < ju_info_stcs.Length; i++)
                    {
                        string param1 = ju_info_stcs[i];
                        string param2 = ju_info_pstcs[i];
                        string param3 = ju_info_ftas[i];
                        string param4 = ju_info_remarks[i];

                        StringBuilder param = new StringBuilder();
                        param.Append(param1);
                        param.Append(CConst.DB_PARAM_DELIMITER).Append(param2);
                        param.Append(CConst.DB_PARAM_DELIMITER).Append(param3);
                        param.Append(CConst.DB_PARAM_DELIMITER).Append(param4);
                        param.Append(CConst.DB_PARAM_DELIMITER).Append(Session["admin_id"]);
                        param.Append(CConst.DB_PARAM_DELIMITER).Append(LANG_CD[k]);

                        ExecuteQueryResult(3442, param.ToString());
                    }
                }
            }

            SearchData();
        }

        #endregion
    }
}