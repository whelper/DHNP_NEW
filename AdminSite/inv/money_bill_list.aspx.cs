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
    public partial class money_bill_list : PageBase
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
            param.Append("KOR");

            SetDataTableList(3431, param.ToString());
        }

         /// <summary>
        /// 데이터를 저장한다.
        /// CA: 유동 자산
        /// </summary>
        /// <param name="inputType">저장유형</param>
        private void SaveData()
        {
            int loop = 1;
            if (eng_override.Checked == true)
            {
                // 영문 덮어쓰기를 한 경우에는 loop를 두번돈다.
                loop = 2;
            }

            string[] LANG_CD = { "KOR", "ENG" };
            // Hearder의 일련번호 - 국문 1~3, 영문 4~6 고정일련번호를 할당함
            int seq_no = 0;

            for (int k = 0; k < loop; k++)
            {
                String subject1 = Request["subject1"];
                String subject1_1 = Request["subject1_1"];

                seq_no = "KOR".Equals(LANG_CD[k]) ? 1 : 4;
                ExecuteQueryInvProalCalc(seq_no, subject1, subject1_1, LANG_CD[k]);

                String subject2 = Request["subject2"];
                String subject2_1 = Request["subject2_1"];

                seq_no = "KOR".Equals(LANG_CD[k]) ? 2 : 5;
                ExecuteQueryInvProalCalc(seq_no, subject2, subject2_1, LANG_CD[k]);

                String subject3 = Request["subject3"];
                String subject3_1 = Request["subject3_1"];

                seq_no = "KOR".Equals(LANG_CD[k]) ? 3 : 6;
                ExecuteQueryInvProalCalc(seq_no, subject3, subject3_1, LANG_CD[k]);

                String[] ttls = Request.Form.GetValues("ttl");
                String[] con1s = Request.Form.GetValues("con1");
                String[] con2s = Request.Form.GetValues("con2");
                String[] con3s = Request.Form.GetValues("con3");

                StringBuilder param = new StringBuilder();
                param.Append(LANG_CD[k]);

                ExecuteQuery(3434, param.ToString());

                for (int i = 0; i < ttls.Length; i++)
                {
                    string param1 = ttls[i];
                    string param2 = con1s[i];
                    string param3 = con2s[i];
                    string param4 = con3s[i];

                    param.Length = 0;
                    param.Append(LANG_CD[k]);
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

        private void ExecuteQueryInvProalCalc(int seq_no, string flagb, string reg_day, string LANG_CD)
        {
            StringBuilder param = new StringBuilder();
            param.Append(seq_no);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(LANG_CD);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(flagb);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(reg_day);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(Session["admin_id"]);
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