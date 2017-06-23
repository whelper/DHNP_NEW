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
    public partial class money_mark_list_eng : PageBase
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

            SetDataTableList(3421, param.ToString());
        }

        /// <summary>
        /// 데이터를 저장한다.
        /// CA: 유동 자산
        /// </summary>
        /// <param name="inputType">저장유형</param>
        private void SaveData()
        {
            //재무상태 및 재무 상태 데이터 삭제
            StringBuilder param = new StringBuilder();
            param.Append("ENG");
            ExecuteQueryResult(3422, param.ToString());

            //과목 데이터 
            String subject1 = Request["subject1"];
            String subject1_1 = Request["subject1_1"];
            String subject2 = Request["subject2"];
            String subject2_1 = Request["subject2_1"];
            String subject3 = Request["subject3"];
            String subject3_1 = Request["subject3_1"];

            ExecuteQueryInvFinDtl(1, subject1, subject2, subject3);
            ExecuteQueryInvFinDtl(2, subject1_1, subject2_1, subject3_1);

            //유동 자산 데이터 
            String ca_data1 = Request["ca_data1"];
            String ca_data2 = Request["ca_data2"];
            String ca_data3 = Request["ca_data3"];

            ExecuteQueryInvFinDtl(3, ca_data1, ca_data2, ca_data3);

            String ca_data4 = Request["ca_data4"];
            String ca_data5 = Request["ca_data5"];
            String ca_data6 = Request["ca_data6"];

            ExecuteQueryInvFinDtl(4, ca_data4, ca_data5, ca_data6);

            //비유동 자산 데이터
            String nca_data1 = Request["nca_data1"];
            String nca_data2 = Request["nca_data2"];
            String nca_data3 = Request["nca_data3"];

            ExecuteQueryInvFinDtl(5, nca_data1, nca_data2, nca_data3);

            String nca_data4 = Request["nca_data4"];
            String nca_data5 = Request["nca_data5"];
            String nca_data6 = Request["nca_data6"];

            ExecuteQueryInvFinDtl(6, nca_data4, nca_data5, nca_data6);

            //자산 계 데이터
            String ca_t_data1 = Request["ca_t_data1"];
            String ca_t_data2 = Request["ca_t_data2"];
            String ca_t_data3 = Request["ca_t_data3"];

            ExecuteQueryInvFinDtl(7, ca_t_data1, ca_t_data2, ca_t_data3);

            //유동 부채 데이터 
            String cd_data1 = Request["cd_data1"];
            String cd_data2 = Request["cd_data2"];
            String cd_data3 = Request["cd_data3"];

            ExecuteQueryInvFinDtl(8, cd_data1, cd_data2, cd_data3);

            String cd_data4 = Request["cd_data4"];
            String cd_data5 = Request["cd_data5"];
            String cd_data6 = Request["cd_data6"];

            ExecuteQueryInvFinDtl(9, cd_data4, cd_data5, cd_data6);

            //비유동 부채 데이터 
            String ncd_data1 = Request["ncd_data1"];
            String ncd_data2 = Request["ncd_data2"];
            String ncd_data3 = Request["ncd_data3"];

            ExecuteQueryInvFinDtl(10, ncd_data1, ncd_data2, ncd_data3);

            String ncd_data4 = Request["ncd_data4"];
            String ncd_data5 = Request["ncd_data5"];
            String ncd_data6 = Request["ncd_data6"];

            ExecuteQueryInvFinDtl(11, ncd_data4, ncd_data5, ncd_data6);

            //부채 계 데이터
            String cd_t_data1 = Request["cd_t_data1"];
            String cd_t_data2 = Request["cd_t_data2"];
            String cd_t_data3 = Request["cd_t_data3"];

            ExecuteQueryInvFinDtl(12, cd_t_data1, cd_t_data2, cd_t_data3);

            //자본 데이터
            String cp_data1 = Request["cp_data1"];
            String cp_data2 = Request["cp_data2"];
            String cp_data3 = Request["cp_data3"];
            String cp_data4 = Request["cp_data4"];
            String cp_data5 = Request["cp_data5"];
            String cp_data6 = Request["cp_data6"];

            ExecuteQueryInvFinDtl(13, cp_data1, cp_data2, cp_data3);
            ExecuteQueryInvFinDtl(14, cp_data4, cp_data5, cp_data6);

            //부채 & 자본 계 데이터
            String cad_t_data1 = Request["cad_t_data1"];
            String cad_t_data2 = Request["cad_t_data2"];
            String cad_t_data3 = Request["cad_t_data3"];

            ExecuteQueryInvFinDtl(15, cad_t_data1, cad_t_data2, cad_t_data3);

            String[] ca_ttls = Request.Form.GetValues("ca_ttl");
            String[] ca_con1s = Request.Form.GetValues("ca_con1");
            String[] ca_con2s = Request.Form.GetValues("ca_con2");
            String[] ca_con3s = Request.Form.GetValues("ca_con3");

            if (ca_ttls != null && ca_ttls.Length > 0)
            {
                for (int i = 0; i < ca_ttls.Length; i++)
                {
                    string param1 = ca_ttls[i];
                    string param2 = ca_con1s[i];
                    string param3 = ca_con2s[i];
                    string param4 = ca_con3s[i];

                    ExecuteQueryInvFinDtlData("CA", param1, param2, param3, param4);
                }
            }

            String[] nca_ttls = Request.Form.GetValues("nca_ttl");
            String[] nca_con1s = Request.Form.GetValues("nca_con1");
            String[] nca_con2s = Request.Form.GetValues("nca_con2");
            String[] nca_con3s = Request.Form.GetValues("nca_con3");

            if (nca_ttls != null && nca_ttls.Length > 0)
            {
                for (int i = 0; i < nca_ttls.Length; i++)
                {
                    string param1 = nca_ttls[i];
                    string param2 = nca_con1s[i];
                    string param3 = nca_con2s[i];
                    string param4 = nca_con3s[i];

                    ExecuteQueryInvFinDtlData("NCA", param1, param2, param3, param4);
                }
            }

            String[] cd_ttls = Request.Form.GetValues("cd_ttl");
            String[] cd_con1s = Request.Form.GetValues("cd_con1");
            String[] cd_con2s = Request.Form.GetValues("cd_con2");
            String[] cd_con3s = Request.Form.GetValues("cd_con3");

            if (cd_ttls != null && cd_ttls.Length > 0)
            {
                for (int i = 0; i < cd_ttls.Length; i++)
                {
                    string param1 = cd_ttls[i];
                    string param2 = cd_con1s[i];
                    string param3 = cd_con2s[i];
                    string param4 = cd_con3s[i];

                    ExecuteQueryInvFinDtlData("CD", param1, param2, param3, param4);
                }
            }

            String[] ncd_ttls = Request.Form.GetValues("ncd_ttl");
            String[] ncd_con1s = Request.Form.GetValues("ncd_con1");
            String[] ncd_con2s = Request.Form.GetValues("ncd_con2");
            String[] ncd_con3s = Request.Form.GetValues("ncd_con3");

            if (ncd_ttls != null && ncd_ttls.Length > 0)
            {
                for (int i = 0; i < ncd_ttls.Length; i++)
                {
                    string param1 = ncd_ttls[i];
                    string param2 = ncd_con1s[i];
                    string param3 = ncd_con2s[i];
                    string param4 = ncd_con3s[i];

                    ExecuteQueryInvFinDtlData("NCD", param1, param2, param3, param4);
                }
            }

            String[] cp_ttls = Request.Form.GetValues("cp_ttl");
            String[] cp_con1s = Request.Form.GetValues("cp_con1");
            String[] cp_con2s = Request.Form.GetValues("cp_con2");
            String[] cp_con3s = Request.Form.GetValues("cp_con3");

            if (cp_ttls != null && cp_ttls.Length > 0)
            {
                for (int i = 0; i < cp_ttls.Length; i++)
                {
                    string param1 = cp_ttls[i];
                    string param2 = cp_con1s[i];
                    string param3 = cp_con2s[i];
                    string param4 = cp_con3s[i];

                    ExecuteQueryInvFinDtlData("CP", param1, param2, param3, param4);
                }
            }

            SearchData();
        }

        private void ExecuteQueryInvFinDtl(int seq, string data1, string data2, string data3)
        {
            StringBuilder param = new StringBuilder();
            param.Append(seq);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(data1);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(data2);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(data3);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(Session["admin_id"]);
            param.Append(CConst.DB_PARAM_DELIMITER).Append("ENG");
            ExecuteQuery(3423, param.ToString());
        }

        private void ExecuteQueryInvFinDtlData(string subject, string atc_nm, string data1, string data2, string data3)
        {
            StringBuilder param = new StringBuilder();
            param.Append(subject);
            param.Append(CConst.DB_PARAM_DELIMITER).Append("ENG");
            param.Append(CConst.DB_PARAM_DELIMITER).Append(atc_nm);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(data1);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(data2);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(data3);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(Session["admin_id"]);
            ExecuteQuery(3425, param.ToString());
        }

        #region 이벤트 메소드

        protected void btnSave_Click(object sender, EventArgs e)
        {
            SaveData();
        }
        #endregion
    }
}