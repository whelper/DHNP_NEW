using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdminSite.m_master;
using System.Text;
using CommonLib.Utils;

namespace AdminSite.inv
{
    public partial class ju_info_list_eng : PageBase
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
            param.Append("ENG");

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
            StringBuilder dparam = new StringBuilder();
            dparam.Append("ENG");
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
                    param.Append(CConst.DB_PARAM_DELIMITER).Append("ENG");

                    ExecuteQueryResult(3442, param.ToString());
                }
            }

            SearchData();
        }

        #endregion
    }
}