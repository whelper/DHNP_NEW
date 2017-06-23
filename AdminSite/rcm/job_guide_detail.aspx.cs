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

namespace AdminSite.rcm
{
    public partial class job_guide_detail : PageBase
    {
        private DataSet dutyDs = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SearchData();

                SetControls();
            }
        }

        /// <summary>
        /// 데이터 조회
        /// </summary>
        private void SearchData()
        {
            //if (CStringUtil.IsNullOrEmpty(Seq) == false)
            //{
                StringBuilder param = new StringBuilder();
                param.Append(Seq);
                param.Append(CConst.DB_PARAM_DELIMITER).Append(Session["admin_id"].ToString());

                SetDataTableList(3528, param.ToString());
            //}
        }

        /// <summary>
        /// 컨트롤 셋팅
        /// </summary>
        private void SetControls()
        {   
            // 각 이미지 업로드 컨트롤에 javascript 이벤트를 등록한다. (페이지단 서버 컨트롤에 삽입 불가하여 CS단에서 삽입)
            if (GetDataTableCount(0) > 0)
            {
                rcm_ttl.Value = GetData(0, 0, "RCM_TTL");
                rcm_cd_reg.Value = GetData(0, 0, "RCM_CD_REG");

                int index = 1;
                for (int i = 0; i < GetDataTableCount(index); i++)
                {
                    rcm_type_regular.Checked = "RCM_TYPE_REGULAR".Equals(GetData(index, i, "RCM_TYPE_CD")) ? true : rcm_type_regular.Checked;
                    rcm_type_contract.Checked = "RCM_TYPE_CONTRACT".Equals(GetData(index, i, "RCM_TYPE_CD")) ? true : rcm_type_contract.Checked;
                    rcm_type_intern.Checked = "RCM_TYPE_INTERN".Equals(GetData(index, i, "RCM_TYPE_CD")) ? true : rcm_type_intern.Checked;
                    rcm_type_etc.Checked = "RCM_TYPE_ETC".Equals(GetData(index, i, "RCM_TYPE_CD")) ? true : rcm_type_etc.Checked;
                }

                index = 2;
                for (int i = 0; i < GetDataTableCount(index); i++)
                {
                    rcm_jobgroup_admin.Checked = "RCM_JOBGROUP_ADMIN".Equals(GetData(index, i, "RCM_JOB_GROUP_CD")) ? true : rcm_jobgroup_admin.Checked;
                    rcm_jobgroup_sales.Checked = "RCM_JOBGROUP_SALES".Equals(GetData(index, i, "RCM_JOB_GROUP_CD")) ? true : rcm_jobgroup_sales.Checked;
                    rcm_jobgroup_prod.Checked = "RCM_JOBGROUP_PROD".Equals(GetData(index, i, "RCM_JOB_GROUP_CD")) ? true : rcm_jobgroup_prod.Checked;
                    rcm_jobgroup_resch.Checked = "RCM_JOBGROUP_RESCH".Equals(GetData(index, i, "RCM_JOB_GROUP_CD")) ? true : rcm_jobgroup_resch.Checked;
                    rcm_jobgroup_prof.Checked = "RCM_JOBGROUP_PROF".Equals(GetData(index, i, "RCM_JOB_GROUP_CD")) ? true : rcm_jobgroup_prof.Checked;
                    rcm_jobgroup_tech.Checked = "RCM_JOBGROUP_TECH".Equals(GetData(index, i, "RCM_JOB_GROUP_CD")) ? true : rcm_jobgroup_tech.Checked;
                }

                index = 3;
                for (int i = 0; i < GetDataTableCount(index); i++)
                {
                    rcm_career_new.Checked = "RCM_CAREER_NEW".Equals(GetData(index, i, "RCM_CAREER_CD")) ? true : rcm_career_new.Checked;
                    rcm_career_career.Checked = "RCM_CAREER_CAREER".Equals(GetData(index, i, "RCM_CAREER_CD")) ? true : rcm_career_career.Checked;
                }
            }

            // 등록-수정 모드에서 모두 사용 => 직무
            StringBuilder param = new StringBuilder();
            param.Append("0"); // 모든 직무 조회
            dutyDs = GetDataSet(20, param.ToString());
        }

        /// <summary>
        /// 데이터를 저장한다. (추가 or 수정)
        /// </summary>
        private void SaveData()
        {
            StringBuilder param = new StringBuilder();
            param.Append(rcm_ttl.Value);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(StartDate);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(EndDate);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(rcm_cd_reg.Value);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(Request["duty_no"]);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(Session["admin_id"].ToString());

            string[] result = null;

            if (CStringUtil.IsNullOrEmpty(Seq) == false && Seq.Equals("0") == false)
            {
                // 수정모드 - SEQ 파라미터로 판단
                param.Append(CConst.DB_PARAM_DELIMITER).Append(Seq);

                result = ExecuteQueryResult(3525, param.ToString());

                if (result != null && result.Length == 3)
                {
                    param.Length = 0;
                    param.Append(Seq);

                    ExecuteQueryResult(3527, param.ToString());

                    SaveRcmCode(Seq);
                }
            }
            else
            {
                // 입력 모드
                result = ExecuteQueryResult(3523, param.ToString());

                if (result != null && result.Length == 3)
                {
                    string reg_seq_no = result[2];

                    SaveRcmCode(reg_seq_no);
                }
            }

            if (result == null)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "test", CWebUtil.MsgBox("시스템 오류가 발생 했습니다."));
            }
            else if (result[0].Equals("00") == false)
            {
                // 입력 or 수정 실패
                ClientScript.RegisterClientScriptBlock(this.GetType(), "test", CWebUtil.MsgBox(result[1]));
            }
        }

        private void SaveRcmCode(string seq)
        {
            StringBuilder param = new StringBuilder();

            #region 채용유형 입력

            if (rcm_type_regular.Checked)
            {
                param.Length = 0;
                param.Append(seq);
                param.Append(CConst.DB_PARAM_DELIMITER).Append(rcm_type_regular.Value);
                param.Append(CConst.DB_PARAM_DELIMITER).Append("RCM_TYPE");
                ExecuteQuery(3524, param.ToString()); // 입력(INSERT)
            }

            if (rcm_type_contract.Checked)
            {
                param.Length = 0;
                param.Append(seq);
                param.Append(CConst.DB_PARAM_DELIMITER).Append(rcm_type_contract.Value);
                param.Append(CConst.DB_PARAM_DELIMITER).Append("RCM_TYPE");
                ExecuteQuery(3524, param.ToString());
            }

            if (rcm_type_intern.Checked)
            {
                param.Length = 0;
                param.Append(seq);
                param.Append(CConst.DB_PARAM_DELIMITER).Append(rcm_type_intern.Value);
                param.Append(CConst.DB_PARAM_DELIMITER).Append("RCM_TYPE");
                ExecuteQuery(3524, param.ToString());
            }

            if (rcm_type_etc.Checked)
            {
                param.Length = 0;
                param.Append(seq);
                param.Append(CConst.DB_PARAM_DELIMITER).Append(rcm_type_etc.Value);
                param.Append(CConst.DB_PARAM_DELIMITER).Append("RCM_TYPE");
                ExecuteQuery(3524, param.ToString());
            }
            #endregion

            #region 채용직군 입력

            if (rcm_jobgroup_admin.Checked)
            {
                param.Length = 0;
                param.Append(seq);
                param.Append(CConst.DB_PARAM_DELIMITER).Append(rcm_jobgroup_admin.Value);
                param.Append(CConst.DB_PARAM_DELIMITER).Append("RCM_JOB_GROUP");
                ExecuteQuery(3524, param.ToString()); // 입력(INSERT)
            }

            if (rcm_jobgroup_sales.Checked)
            {
                param.Length = 0;
                param.Append(seq);
                param.Append(CConst.DB_PARAM_DELIMITER).Append(rcm_jobgroup_sales.Value);
                param.Append(CConst.DB_PARAM_DELIMITER).Append("RCM_JOB_GROUP");
                ExecuteQuery(3524, param.ToString());
            }

            if (rcm_jobgroup_prod.Checked)
            {
                param.Length = 0;
                param.Append(seq);
                param.Append(CConst.DB_PARAM_DELIMITER).Append(rcm_jobgroup_prod.Value);
                param.Append(CConst.DB_PARAM_DELIMITER).Append("RCM_JOB_GROUP");
                ExecuteQuery(3524, param.ToString());
            }

            if (rcm_jobgroup_resch.Checked)
            {
                param.Length = 0;
                param.Append(seq);
                param.Append(CConst.DB_PARAM_DELIMITER).Append(rcm_jobgroup_resch.Value);
                param.Append(CConst.DB_PARAM_DELIMITER).Append("RCM_JOB_GROUP");
                ExecuteQuery(3524, param.ToString());
            }

            if (rcm_jobgroup_prof.Checked)
            {
                param.Length = 0;
                param.Append(seq);
                param.Append(CConst.DB_PARAM_DELIMITER).Append(rcm_jobgroup_prof.Value);
                param.Append(CConst.DB_PARAM_DELIMITER).Append("RCM_JOB_GROUP");
                ExecuteQuery(3524, param.ToString());
            }

            if (rcm_jobgroup_tech.Checked)
            {
                param.Length = 0;
                param.Append(seq);
                param.Append(CConst.DB_PARAM_DELIMITER).Append(rcm_jobgroup_tech.Value);
                param.Append(CConst.DB_PARAM_DELIMITER).Append("RCM_JOB_GROUP");
                ExecuteQuery(3524, param.ToString());
            }

            #endregion

            #region 채용경력 입력

            if (rcm_career_new.Checked)
            {
                param.Length = 0;
                param.Append(seq);
                param.Append(CConst.DB_PARAM_DELIMITER).Append(rcm_career_new.Value);
                param.Append(CConst.DB_PARAM_DELIMITER).Append("RCM_CAREER");
                ExecuteQuery(3524, param.ToString()); // 입력(INSERT)
            }

            if (rcm_career_career.Checked)
            {
                param.Length = 0;
                param.Append(seq);
                param.Append(CConst.DB_PARAM_DELIMITER).Append(rcm_career_career.Value);
                param.Append(CConst.DB_PARAM_DELIMITER).Append("RCM_CAREER");
                ExecuteQuery(3524, param.ToString());
            }

            #endregion

        }

        /// <summary>
        /// 데이터 삭제
        /// </summary>
        private void RemoveData()
        {
            string[] result = null;

            if (CStringUtil.IsNullOrEmpty(Seq) == false && Seq.Equals("0") == false)
            {
                StringBuilder param = new StringBuilder();
                param.Append(Seq);

                result = ExecuteQueryResult(3526, param.ToString());

                if (result == null)
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "test", CWebUtil.MsgBox("시스템 오류가 발생 했습니다."));
                }
                else if (result[0].Equals("00") == false)
                {
                    // 삭제 실패
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "test", CWebUtil.MsgBox(result[1]));
                }
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "test", CWebUtil.MsgBox("입력모드에서는 지원하지 않습니다."));
            }

            // 코드 삭제
            if (result != null && result.Length == 3)
            {
                string reg_seq_no = result[2];

                StringBuilder param = new StringBuilder();
                param.Length = 0;
                param.Append(Seq);

                ExecuteQueryResult(3527, param.ToString());
            }

        }

        #region GET-SET

        protected string Seq
        {
            get
            {
                if (Request["reg_seq_no"] == null)
                {
                    return "0";
                }
                else
                {
                    return Request["reg_seq_no"];
                }
            }
        }

        protected string StartDate
        {
            get
            {
                if (CStringUtil.IsNullOrEmpty(Request["datepicker"]))
                {
                    if (GetDataTableCount(0) > 0)
                    {
                        return GetData(0, 0, "START_DATE");
                    }
                    else
                    {
                        return CDateUtil.getDate("{0:yyyy-MM-dd}");
                    }
                }
                else
                {
                    return Request["datepicker"];
                }
            }
        }

        protected string EndDate
        {
            get
            {
                if (CStringUtil.IsNullOrEmpty(Request["datepicker2"]))
                {
                    if (GetDataTableCount(0) > 0)
                    {
                        return GetData(0, 0, "END_DATE");
                    }
                    else
                    {
                        return CDateUtil.getDate("{0:yyyy-MM-dd}");
                    }
                }
                else
                {
                    return Request["datepicker2"];
                }
            }
        }

        protected DataSet DutyDs
        {
            get
            {
                return dutyDs;
            }
        }

        #endregion

        #region 이벤트 메소드

        protected void btnSave_Click(object sender, EventArgs e)
        {
            SaveData();

            Response.Redirect("./job_guide_list.aspx");
        }

        protected void btnDel_Click(object sender, EventArgs e)
        {
            RemoveData();

            Response.Redirect("./job_guide_list.aspx");
        }

        #endregion
    }
}