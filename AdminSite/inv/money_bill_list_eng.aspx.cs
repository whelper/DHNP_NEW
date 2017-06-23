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
    public partial class money_bill_list_eng : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SearchData();
            }
        }

        private void SearchData()
        {
            StringBuilder param = new StringBuilder();
            param.Append("ENG");

            SetDataTableList(3431, param.ToString());
        }

        /// <summary>
        /// 데이터를 저장한다.
        /// CA: 유동 자산
        /// </summary>
        /// <param name="inputType">저장유형</param>
        private void SaveData()
        {
            String subject1 = Request["subject1"];
            String subject1_1 = Request["subject1_1"];

            ExecuteQueryInvProalCalc(4, subject1, subject1_1);

            String subject2 = Request["subject2"];
            String subject2_1 = Request["subject2_1"];

            ExecuteQueryInvProalCalc(5, subject2, subject2_1);

            String subject3 = Request["subject3"];
            String subject3_1 = Request["subject3_1"];

            ExecuteQueryInvProalCalc(6, subject3, subject3_1);

            String[] ttls =  Request.Form.GetValues("ttl"); 
            String[] con1s = Request.Form.GetValues("con1");
            String[] con2s = Request.Form.GetValues("con2");
            String[] con3s = Request.Form.GetValues("con3");

            StringBuilder param = new StringBuilder();
            param.Append("ENG");
            ExecuteQuery(3434, param.ToString());

            if (ttls != null && ttls.Length > 0)
            {
                for (int i = 0; i < ttls.Length; i++)
                {
                    string param1 = ttls[i];
                    string param2 = con1s[i];
                    string param3 = con2s[i];
                    string param4 = con3s[i];

                    param.Length = 0;
                    param.Append("ENG");
                    param.Append(CConst.DB_PARAM_DELIMITER).Append(param1);
                    param.Append(CConst.DB_PARAM_DELIMITER).Append(param2);
                    param.Append(CConst.DB_PARAM_DELIMITER).Append(param3);
                    param.Append(CConst.DB_PARAM_DELIMITER).Append(param4);
                    param.Append(CConst.DB_PARAM_DELIMITER).Append(Session["admin_id"]);
                    ExecuteQuery(3433, param.ToString());
                }
            }

            SearchData();
        }

        private void ExecuteQueryInvProalCalc(int seq_no, string flagb, string reg_day)
        {
            StringBuilder param = new StringBuilder();
            param.Append(seq_no);
            param.Append(CConst.DB_PARAM_DELIMITER).Append("ENG");
            param.Append(CConst.DB_PARAM_DELIMITER).Append(flagb);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(reg_day);
            param.Append(CConst.DB_PARAM_DELIMITER).Append("admin");
            ExecuteQuery(3432, param.ToString());
        }

        #region 이벤트 메소드

        protected void btnSave_Click(object sender, EventArgs e)
        {
            SaveData();
        }
        #endregion
    }
}