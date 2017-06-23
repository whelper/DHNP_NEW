using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using log4net;
using HomePage.m_master;
using System.Text;
using CommonLib.Utils;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace HomePage.recruit
{
    public partial class job_guide_join_sub_edit : PageBase
    {
        private string regSeqNo = string.Empty;
        private string loadType = string.Empty;
        private string rcm_duty_no = string.Empty;

        private const int MAX_LOOP = 100;

        DataSet dsCode = new DataSet();
        DataSet dsSp = null;


        // sql 인자값 변수
        private string[] m_value = new string[10];
        private int variableLength = 32;
     
        private static readonly ILog logger = LogManager.GetLogger(typeof(job_guide_join_sub));

        public readonly string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // check validation
                if (CStringUtil.IsNullOrEmpty(SupportNo))
                {
                    CWebUtil.jsAlertAndRedirect(this, "잘못된 경로로 진입하였습니다.", "/recruit/result_list.aspx");
                }

                SearchData();

                if (CStringUtil.IsNullOrEmpty(GetData(0, 0, "IS_PROCESSING")) || GetData(0, 0, "IS_PROCESSING").Equals("N"))
                {
                    CWebUtil.jsAlertAndRedirect(this, "채용완료된 공고이거나 없는 채용공고 입니다.", "/recruit/result_list.aspx");
                }

                SetControls();

                InitControls();
            }
        }

        /// <summary>
        /// 채용 상세 내용 ([0] 채용상세내용)
        /// 채용 중인 각종 코드 조회([1]채용유형, [2]채용직군, [3]채용경력, [4]채용직무)
        /// [n]는 RecordSet Index
        /// </summary>
        protected void SearchData()
        {
            StringBuilder param = new StringBuilder();
            param.Append(RegSeqNo);
            param.Append(CConst.DB_PARAM_DELIMITER).Append("Y");

            SetDataTableList(1533, param.ToString());

            dsSp = GetDataSet(1534, SupportNo);


            System.Diagnostics.Debug.WriteLine("SupportNo=" + SupportNo);

            System.Diagnostics.Debug.WriteLine("RcmDutyNo=" + RcmDutyNo);
        }

        /// <summary>
        /// 컨트롤 데이터 셋팅
        /// </summary>
        private void SetControls()
        {
            if (dsSp != null && dsSp.Tables.Count > 0)
            {
                img.Value = dsSp.Tables[0].Rows[0]["IMG"].ToString();
            }
        }

        /// <summary>
        /// 컨트롤 초기화
        /// </summary>
        private void InitControls()
        {
        }

        /// <summary>
        /// 데이터를 저장한다. (추가 or 수정)
        /// </summary>
        private void SaveData()
        {
            bool result = false;

            using (SqlConnection myConnection = new SqlConnection(connString))
            {
                myConnection.Open();

                SqlTransaction trans = myConnection.BeginTransaction();

                try
                {
                    #region 지원일반정보
                    SqlDataAdapter myAdapter = new SqlDataAdapter("USP_HOMEPAGE_1439_RCM_JOINCOMP_STATUS_U", myConnection);
                    myAdapter.SelectCommand.Transaction = trans;
                    myAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

                    //string img1 = ""; CStringUtil.IsNullOrEmpty(img.PostedFile.FileName) == false ? UploadFile(img, "DIR_RECRUITMENT_USER") : "";
                    string img1 = img.Value;

                    System.Diagnostics.Debug.WriteLine("RcmDutyNo=" + RcmDutyNo);

                    StringBuilder param = new StringBuilder();

                    param.Append(Request["rcm_type"]); // 지원유형코드

         
                    param.Append(CConst.DB_PARAM_DELIMITER).Append(Request["rcm_jobgroup"]); // 지원직군코드
                    param.Append(CConst.DB_PARAM_DELIMITER).Append(Request["rcm_career"]); // 지원경력코드
                    param.Append(CConst.DB_PARAM_DELIMITER).Append(RcmDutyNo);    // 직무번호
                    param.Append(CConst.DB_PARAM_DELIMITER).Append(Request["hope_position_cd"]); // 희망직급코드
                    param.Append(CConst.DB_PARAM_DELIMITER).Append(Request["support_motive"]); // 지원동기
                    param.Append(CConst.DB_PARAM_DELIMITER).Append(Request["support_motive_r"]); // 지원동기 이유 (기타인 경우만 입력)
                    param.Append(CConst.DB_PARAM_DELIMITER).Append(Request["hope_work_place"]); // 희망근무지
                    param.Append(CConst.DB_PARAM_DELIMITER).Append(Request["joincomp_pb_date"]); // 입사가능일

                    string qual_exam_yn = Request["qual_exam_yn"];

                    if ("Y".Equals(qual_exam_yn))
                    {
                        // 검정고시 체크되어 있는 경우: 고등학교, 고등학교 소재지 clear
                        param.Append(CConst.DB_PARAM_DELIMITER).Append(""); // 고등학교명
                        param.Append(CConst.DB_PARAM_DELIMITER).Append(""); // 고등학교 소재지
                        param.Append(CConst.DB_PARAM_DELIMITER).Append("Y"); // 검정고시
                    }
                    else
                    {
                        param.Append(CConst.DB_PARAM_DELIMITER).Append(Request["hs_nm"]); // 고등학교명
                        param.Append(CConst.DB_PARAM_DELIMITER).Append(Request["rcm_stead_catg"]); // 고등학교 소재지
                        param.Append(CConst.DB_PARAM_DELIMITER).Append("N"); // 검정고시
                    }

                    param.Append(CConst.DB_PARAM_DELIMITER).Append(Request["hs_grad_date"]); // 졸업연도
                    param.Append(CConst.DB_PARAM_DELIMITER).Append(Request["hs_grad_select_catg"]); // 졸업선택
                    param.Append(CConst.DB_PARAM_DELIMITER).Append(Request["rcm_major_catg"]); // 전공

                    // 기본정보
                    param.Append(CConst.DB_PARAM_DELIMITER).Append(img1); // 이미지
                    param.Append(CConst.DB_PARAM_DELIMITER).Append(Request["chi_nm"]); // 성명(한자)
                    param.Append(CConst.DB_PARAM_DELIMITER).Append(Request["birthday"]); // 생년월일
                    param.Append(CConst.DB_PARAM_DELIMITER).Append(Request["tel"]); // 연락처
                    param.Append(CConst.DB_PARAM_DELIMITER).Append(Request["celltel"]); // 핸드폰
                    param.Append(CConst.DB_PARAM_DELIMITER).Append(Request["email"]); // 이메일
                    param.Append(CConst.DB_PARAM_DELIMITER).Append(Request["zipcode_str"]); // 우편번호 앞자리
                    param.Append(CConst.DB_PARAM_DELIMITER).Append(Request["zipcode_end"]); // 우편번호 뒷자리
                    param.Append(CConst.DB_PARAM_DELIMITER).Append(Request["addr"]); // 주소
                    param.Append(CConst.DB_PARAM_DELIMITER).Append(Request["addr_dtl"]); // 주소상세

                    // 자기소개
                    param.Append(CConst.DB_PARAM_DELIMITER).Append(Request["intro_grow_process"]); // 자기소개서 성장과정
                    param.Append(CConst.DB_PARAM_DELIMITER).Append(Request["intro_char__adv_fault"]); // 자기소개서 성격상의 장단점
                    param.Append(CConst.DB_PARAM_DELIMITER).Append(Request["intro_support_motive"]); // 자기소개서 지원동기
                    param.Append(CConst.DB_PARAM_DELIMITER).Append(Request["intro_joincomp_aspira"]); // 자기소개서 입사후포부

                    param.Append(CConst.DB_PARAM_DELIMITER).Append(RegSeqNo); // 채용번호
                    param.Append(CConst.DB_PARAM_DELIMITER).Append(SupportNo); // 지원번호;;;
                    param.Append(CConst.DB_PARAM_DELIMITER).Append(Request["salary_req"]); // 희망연봉

                    ParsingArg(param.ToString());

                    string[] variable = new string[variableLength]; // sql 의 파라미터 변수 이름 
                    SqlDbType[] sqldbtype = new SqlDbType[variableLength];  // sql 의 파라미터 변수 타입

                    variable[0] = "@SUPPORT_TYPE_CD";
                    variable[1] = "@SUPPORT_POS_CD";
                    variable[2] = "@SUPPORT_CR_CD";
                    variable[3] = "@SUPPORT_DUTY_NO";
                    variable[4] = "@HOPE_POSITION";
                    variable[5] = "@SUPPORT_MOTIVE";
                    variable[6] = "@SUPPORT_MOTIVE_R";
                    variable[7] = "@HOPE_WORK_PLACE";
                    variable[8] = "@JOINCOMP_PB_DATE";
                    variable[9] = "@HS_NM";
                    variable[10] = "@HS_LOC_CD";
                    variable[11] = "@HS_QUAL_EXAM_YN";
                    variable[12] = "@HS_GRAD_DATE";
                    variable[13] = "@HS_GRAD_SELECT_CD";
                    variable[14] = "@HS_MAJOR_CD";
                    variable[15] = "@IMG";
                    variable[16] = "@CHI_NM";
                    variable[17] = "@BIRTHDAY";
                    variable[18] = "@TEL";
                    variable[19] = "@CELLTEL";
                    variable[20] = "@EMAIL";
                    variable[21] = "@ZIPCODE_STR";
                    variable[22] = "@ZIPCODE_END";
                    variable[23] = "@ADDR";
                    variable[24] = "@ADDR_DTL";
                    variable[25] = "@INTRO_GROW_PROCESS";
                    variable[26] = "@INTRO_CHAR__ADV_FAULT";
                    variable[27] = "@INTRO_SUPPORT_MOTIVE";
                    variable[28] = "@INTRO_JOINCOMP_ASPIRA";
                    variable[29] = "@REG_SEQ_NO";
                    variable[30] = "@SUPPORT_NO";
                    variable[31] = "@SALARY_REQ";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.Int;
                    sqldbtype[4] = SqlDbType.VarChar;
                    sqldbtype[5] = SqlDbType.VarChar;
                    sqldbtype[6] = SqlDbType.VarChar;
                    sqldbtype[7] = SqlDbType.VarChar;
                    sqldbtype[8] = SqlDbType.VarChar;
                    sqldbtype[9] = SqlDbType.VarChar;
                    sqldbtype[10] = SqlDbType.VarChar;
                    sqldbtype[11] = SqlDbType.VarChar;
                    sqldbtype[12] = SqlDbType.VarChar;
                    sqldbtype[13] = SqlDbType.VarChar;
                    sqldbtype[14] = SqlDbType.VarChar;
                    sqldbtype[15] = SqlDbType.VarChar;
                    sqldbtype[16] = SqlDbType.VarChar;
                    sqldbtype[17] = SqlDbType.VarChar;
                    sqldbtype[18] = SqlDbType.VarChar;
                    sqldbtype[19] = SqlDbType.VarChar;
                    sqldbtype[20] = SqlDbType.VarChar;
                    sqldbtype[21] = SqlDbType.VarChar;
                    sqldbtype[22] = SqlDbType.VarChar;
                    sqldbtype[23] = SqlDbType.VarChar;
                    sqldbtype[24] = SqlDbType.VarChar;
                    sqldbtype[25] = SqlDbType.VarChar;
                    sqldbtype[26] = SqlDbType.VarChar;
                    sqldbtype[27] = SqlDbType.VarChar;
                    sqldbtype[28] = SqlDbType.VarChar;
                    sqldbtype[29] = SqlDbType.Int;
                    sqldbtype[30] = SqlDbType.Int;
                    sqldbtype[31] = SqlDbType.VarChar;

                    for (int i = 0; i < variableLength; i++)
                    {
                        myAdapter.SelectCommand.Parameters.Add(variable[i], sqldbtype[i]);
                        myAdapter.SelectCommand.Parameters[variable[i]].Value = m_value[i];
                    }

                    DataSet ds = new DataSet();
                    myAdapter.Fill(ds, "Table");

                    variable = null;
                    sqldbtype = null;

                    #endregion

                    if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                    {
                        string support_no = SupportNo;
                        // resource 해제
                        ds = null;

                        #region 이력서 데이터 삭제

                        // 어떤 데이터가 어떻게 수정/제거/입력됐는지 알 수 없으므로 
                        // 기존에 입력했던 학력,경력,자격증,가족관계 등을 모두 삭제하고
                        // 이어서, 학력,경력,자격증,가족관계 등을 다시 입력하는 구조
                        myAdapter.SelectCommand.Parameters.Clear();
                        myAdapter.SelectCommand.CommandText = "USP_HOMEPAGE_1440_RCM_JOINCOMP_STATUS_D";
                        myAdapter.SelectCommand.Parameters.Add("@SUPPORT_NO", SqlDbType.Int);

                        myAdapter.SelectCommand.Parameters["@SUPPORT_NO"].Value = support_no;
                        myAdapter.SelectCommand.ExecuteNonQuery();

                        #endregion

                        #region 학력사항 - 대학/대학교 /대학원
                        // 학력사항
                        string[] sch_nm = Request.Form.GetValues("sch_nm");
                        if (sch_nm.Length > 0 && CStringUtil.IsNullOrEmpty(sch_nm[0]) == false)
                        {
                            // 첫번째 대학교 입력란에 학교명이 있는 경우에 입력 시작
                            myAdapter.SelectCommand.CommandText = "USP_HOMEPAGE_1434_RCM_JOINCOMP_STATUS_AA_I";

                            string[] arr_var = {"@SCH_NM", "@MATER_CD", "@BSL_TSL_CD"
                                                     , "@ADMIS_YEAR", "@ADMIS_CD", "@GRADUT_YEAR", "@GRADUT_CD", "@ABILITY_CD"
                                                     , "@ABILITY_DEPT_NM", "@SCORE", "@GRADUT_DISSERT_NM" };
                            SqlDbType[] arr_col_tp = {SqlDbType.VarChar, SqlDbType.VarChar, SqlDbType.VarChar
                                                , SqlDbType.VarChar, SqlDbType.VarChar, SqlDbType.VarChar, SqlDbType.VarChar, SqlDbType.VarChar
                                                , SqlDbType.VarChar, SqlDbType.VarChar, SqlDbType.VarChar};

                            int col_catg_num = Convert.ToInt32(Request["col_catg_num"]); // 대학교 이상 학력 사항 개수

                            string[] arr_params = {"sch_nm","mater_cd","bsl_tsl_cd","admis_year"
                                        ,"admis_cd","gradut_year","gradut_cd","ability_cd", "ability_dept_nm", "score", "gradut_dissert_nm"};

                            int end_cnt = 0;
                            for (int i = 1; i <= MAX_LOOP; i++)
                            {
                                string col_catg_numVal = i.ToString();

                                string type_cd = Request["type_cd" + col_catg_numVal];

                                if (end_cnt >= col_catg_num || CStringUtil.IsNullOrEmpty(type_cd))
                                {
                                    break;
                                }
                                else
                                {
                                    // 파라미터 초기화
                                    myAdapter.SelectCommand.Parameters.Clear();

                                    // 공통
                                    myAdapter.SelectCommand.Parameters.Add("@SUPPORT_NO", SqlDbType.Int);
                                    myAdapter.SelectCommand.Parameters["@SUPPORT_NO"].Value = support_no;

                                    myAdapter.SelectCommand.Parameters.Add("@TYPE_CD", SqlDbType.VarChar);
                                    myAdapter.SelectCommand.Parameters["@TYPE_CD"].Value = type_cd;

                                    for (int idx_param = 0; idx_param < arr_params.Length; idx_param++)
                                    {
                                        string[] arr_param_value = Request.Form.GetValues(arr_params[idx_param]);

                                        string var_nm = arr_var[idx_param];
                                        myAdapter.SelectCommand.Parameters.Add(var_nm, arr_col_tp[idx_param]);
                                        myAdapter.SelectCommand.Parameters[var_nm].Value = arr_param_value[end_cnt];
                                    }

                                    myAdapter.SelectCommand.ExecuteNonQuery();

                                    myAdapter.SelectCommand.Parameters.Clear();

                                    end_cnt++;
                                }
                            }
                        }
                        #endregion

                        #region 경력사항
                        // 학력사항
                        string[] company_nms = Request.Form.GetValues("company_nm");
                        if (company_nms != null && company_nms.Length > 0 && CStringUtil.IsNullOrEmpty(company_nms[0]) == false)
                        {
                            // 첫번째 회사명 입력란에 회사명이 있는 경우에 입력 시작
                            myAdapter.SelectCommand.CommandText = "USP_HOMEPAGE_1435_RCM_JOINCOMP_STATUS_CR_I";

                            string[] arr_var = {
                                                   "@COMPANY_NM", "@JOINCOMP_YEAR", "@RSN_YEAR", "@CAREER_TERM_CD", "@DEPT_NM"
                                                   , "@POSIT_CD", "@DUTY_CD", "@SAL", "@JOB_CONT", "@PROJECT"
                                                   , "@DTL_BUSIN", "@MAJOR_JOB_OUTC", "@CHANGE_JOB_REASON"  };
                            SqlDbType[] arr_col_tp = {SqlDbType.VarChar, SqlDbType.VarChar, SqlDbType.VarChar, SqlDbType.VarChar, SqlDbType.VarChar
                                                         , SqlDbType.VarChar, SqlDbType.VarChar, SqlDbType.VarChar, SqlDbType.VarChar, SqlDbType.VarChar
                                                         , SqlDbType.VarChar, SqlDbType.VarChar, SqlDbType.VarChar};

                            int career_num = Convert.ToInt32(Request["career_num"]); // 대학교 이상 학력 사항 개수

                            string[] arr_params = {
                                                      "company_nm","start_date","end_date","career_term_cd","dept_nm"
                                                      ,"posit_cd","duty_cd","sal", "job_cont", "project"
                                                      , "dtl_busin", "major_job_outc", "change_job_reason"};

                            int end_cnt = 0;
                            for (int i = 1; i <= MAX_LOOP; i++)
                            {
                                if (end_cnt >= career_num)
                                {
                                    break;
                                }
                                else
                                {
                                    // 파라미터 초기화
                                    myAdapter.SelectCommand.Parameters.Clear();

                                    // 공통
                                    myAdapter.SelectCommand.Parameters.Add("@SUPPORT_NO", SqlDbType.Int);
                                    myAdapter.SelectCommand.Parameters["@SUPPORT_NO"].Value = support_no;

                                    for (int idx_param = 0; idx_param < arr_params.Length; idx_param++)
                                    {
                                        string[] arr_param_value = Request.Form.GetValues(arr_params[idx_param]);

                                        string var_nm = arr_var[idx_param];
                                        myAdapter.SelectCommand.Parameters.Add(var_nm, arr_col_tp[idx_param]);
                                        myAdapter.SelectCommand.Parameters[var_nm].Value = arr_param_value[end_cnt];
                                    }

                                    myAdapter.SelectCommand.ExecuteNonQuery();

                                    myAdapter.SelectCommand.Parameters.Clear();

                                    end_cnt++;
                                }
                            }
                        }
                        #endregion

                        #region 자격사항
                        // 자격사항
                        string[] cdt_kinds = Request.Form.GetValues("cdt_kind");
                        if (cdt_kinds != null && cdt_kinds.Length > 0 && CStringUtil.IsNullOrEmpty(cdt_kinds[0]) == false)
                        {
                            // 첫번째 자격증명 입력란에 자격증명이 있는 경우에 입력 시작
                            myAdapter.SelectCommand.CommandText = "USP_HOMEPAGE_1436_RCM_JOINCOMP_STATUS_CDT_I";

                            string[] arr_var = { "@CDT_KIND", "@ACQ_DT", "@PUB_PLACE" };
                            SqlDbType[] arr_col_tp = { SqlDbType.VarChar, SqlDbType.VarChar, SqlDbType.VarChar };
                            int cdt_num = Convert.ToInt32(Request["cdt_num"]); // 개수

                            string[] arr_params = { "cdt_kind", "acq_dt", "pub_place" };

                            int end_cnt = 0;
                            for (int i = 1; i <= MAX_LOOP; i++)
                            {
                                if (end_cnt >= cdt_num)
                                {
                                    break;
                                }
                                else
                                {
                                    // 파라미터 초기화
                                    myAdapter.SelectCommand.Parameters.Clear();

                                    // 공통
                                    myAdapter.SelectCommand.Parameters.Add("@SUPPORT_NO", SqlDbType.Int);
                                    myAdapter.SelectCommand.Parameters["@SUPPORT_NO"].Value = support_no;

                                    for (int idx_param = 0; idx_param < arr_params.Length; idx_param++)
                                    {
                                        string[] arr_param_value = Request.Form.GetValues(arr_params[idx_param]);

                                        string var_nm = arr_var[idx_param];
                                        myAdapter.SelectCommand.Parameters.Add(var_nm, arr_col_tp[idx_param]);
                                        myAdapter.SelectCommand.Parameters[var_nm].Value = arr_param_value[end_cnt];
                                    }

                                    myAdapter.SelectCommand.ExecuteNonQuery();

                                    myAdapter.SelectCommand.Parameters.Clear();

                                    end_cnt++;
                                }
                            }
                        }
                        #endregion

                        #region 가족사항
                        // 가족사항
                        string[] rels = Request.Form.GetValues("rel");
                        if (rels != null && rels.Length > 0 && CStringUtil.IsNullOrEmpty(rels[0]) == false)
                        {
                            // 첫번째 값이 있는 경우에 시작
                            myAdapter.SelectCommand.CommandText = "USP_HOMEPAGE_1437_RCM_JOINCOMP_FAMILY_I";

                            string[] arr_var = { 
                                                   "@REL", "@NM", "@AGE", "@ABILITY", "@JOB"
                                                   , "@JOB_NM", "@POSIT"
                                               };
                            SqlDbType[] arr_col_tp = { 
                                                         SqlDbType.VarChar, SqlDbType.VarChar, SqlDbType.VarChar, SqlDbType.VarChar, SqlDbType.VarChar
                                                         , SqlDbType.VarChar, SqlDbType.VarChar
                                                     };
                            int family_num = Convert.ToInt32(Request["family_num"]); // 개수

                            string[] arr_params = { 
                                                      "rel", "nm", "age", "ability", "job"
                                                       , "job_nm", "posit" };

                            int end_cnt = 0;
                            for (int i = 1; i <= MAX_LOOP; i++)
                            {
                                if (end_cnt >= rels.Length)
                                {
                                    break;
                                }
                                else
                                {
                                    // 파라미터 초기화
                                    myAdapter.SelectCommand.Parameters.Clear();

                                    // 공통
                                    myAdapter.SelectCommand.Parameters.Add("@SUPPORT_NO", SqlDbType.Int);
                                    myAdapter.SelectCommand.Parameters["@SUPPORT_NO"].Value = support_no;

                                    for (int idx_param = 0; idx_param < arr_params.Length; idx_param++)
                                    {
                                        string[] arr_param_value = Request.Form.GetValues(arr_params[idx_param]);

                                        string var_nm = arr_var[idx_param];
                                        myAdapter.SelectCommand.Parameters.Add(var_nm, arr_col_tp[idx_param]);
                                        myAdapter.SelectCommand.Parameters[var_nm].Value = arr_param_value[end_cnt];
                                    }

                                    myAdapter.SelectCommand.ExecuteNonQuery();

                                    myAdapter.SelectCommand.Parameters.Clear();

                                    end_cnt++;
                                }
                            }
                        }

                        #endregion

                        #region 첨부파일

                        string attach_file_1_path = "";
                        string attach_file_2_path = "";
                        string attach_file_3_path = "";

                        if (CStringUtil.IsNullOrEmpty(attach_file_1.PostedFile.FileName) == false)
                        {
                            attach_file_1_path = UploadFile(attach_file_1, "DIR_RECRUITMENT_USER");
                        }
                        else if (Request["attach_file_path_1"] != null)
                        {
                            attach_file_1_path = Request["attach_file_path_1"].ToString();
                        }

                        if (CStringUtil.IsNullOrEmpty(attach_file_2.PostedFile.FileName) == false)
                        {
                            attach_file_2_path = UploadFile(attach_file_2, "DIR_RECRUITMENT_USER");
                        }
                        else if (Request["attach_file_path_2"] != null)
                        {
                            attach_file_2_path = Request["attach_file_path_2"].ToString();
                        }

                        if (CStringUtil.IsNullOrEmpty(attach_file_3.PostedFile.FileName) == false)
                        {
                            attach_file_3_path = UploadFile(attach_file_3, "DIR_RECRUITMENT_USER");
                        }
                        else if (Request["attach_file_path_3"] != null)
                        {
                            attach_file_3_path = Request["attach_file_path_3"].ToString();
                        }

                        string[] file_arr = { attach_file_1_path, attach_file_2_path, attach_file_3_path };

                        for (int i = 0; i < file_arr.Length; i++)
                        {
                            if (CStringUtil.IsNullOrEmpty(file_arr[i]) == false)
                            {
                                myAdapter.SelectCommand.Parameters.Clear();

                                myAdapter.SelectCommand.CommandText = "USP_HOMEPAGE_1438_RCM_JOINCOMP_FILE_I";
                                myAdapter.SelectCommand.Parameters.Add("@SUPPORT_NO", SqlDbType.Int);
                                myAdapter.SelectCommand.Parameters.Add("@FILE_PATH", SqlDbType.VarChar);

                                myAdapter.SelectCommand.Parameters["@SUPPORT_NO"].Value = support_no;
                                myAdapter.SelectCommand.Parameters["@FILE_PATH"].Value = file_arr[i];

                                myAdapter.SelectCommand.ExecuteNonQuery();
                                myAdapter.SelectCommand.Parameters.Clear();
                            }
                        }

                        #endregion

                        trans.Commit();

                        result = true;
                    }
                    else
                    {
                        trans.Rollback();

                        result = false;
                    }
                }
                catch (Exception ex)
                {
                    trans.Rollback();
                    result = false;
                    CLog.debug(logger, "job_guide_join_sub.SaveData()|" + ex.Message);
                }
                finally
                {
                    try
                    {
                        myConnection.Close();
                    }
                    catch { }
                }
            }

            if (result)
            {
               // Response.Redirect("job_guide_join_sub_edit.aspx?reg_seq_no=" + RegSeqNo + "&support_no=" + SupportNo + "&load_type=success");
                Response.Redirect("result_list.aspx"); 
            } 
            else
            {
                CWebUtil.jsWrite(this, "입사 지원하지 못했습니다. 처음부터 다시 작성해 주세요.");
            }
        }

        /// <summary>
        /// 데이터 가져옴
        /// </summary>
        /// <param name="tbindex"></param>
        /// <param name="row"></param>
        /// <param name="col"></param>
        /// <returns></returns>
        protected string GetDsData(int tbindex, int row, string col)
        {
            string data = "";

            try
            {
                if (DsSp != null && DsSp.Tables.Count > 0)
                {
                    data = dsSp.Tables[tbindex].Rows[row][col].ToString();
                }
            }
            catch
            {
            }

            return data;
        }

        protected int GetDsDataCount(int tbindex)
        {
            int data = 0;

            try
            {
                if (DsSp != null && DsSp.Tables.Count > 0)
                {
                    data = dsSp.Tables[tbindex].Rows.Count;
                }
            }
            catch
            {
            }

            return data;
        }

        #region Get-SET

        protected string RegSeqNo
        {
            get
            {
                if (Request["reg_seq_no"] != null)
                {
                    regSeqNo = Request["reg_seq_no"].ToString();
                }

                return regSeqNo;
            }
        }

        protected string SupportNo
        {
            get
            {
                if (Request["support_no"] != null)
                {
                    regSeqNo = Request["support_no"].ToString();
                }

                return regSeqNo;
            }
        }

        protected string RcmDutyNo
        {
            get
            {
                if (Request["rcm_duty_no"] != null)
                {
                    rcm_duty_no = Request["rcm_duty_no"].ToString();
                }

                return rcm_duty_no;
            }
        }

        

        protected string LoadType
        {
            get
            {
                if (Request["load_type"] != null)
                {
                    loadType = Request["load_type"].ToString();
                }
                else
                {
                    // default 페이지 읽기
                    loadType = "";
                }

                return loadType;
            }
        }

        protected DataSet DsCode
        {
            get
            {
                return dsCode;
            }
        }

        protected int NowYear
        {
            get
            {
                return Convert.ToInt32(CDateUtil.getDate("{0:yyyy}"));
            }
        }

        protected DataSet DsSp
        {
            get
            {
                return dsSp;
            }
        }

        #endregion

        #region 이벤트 메소드

        /// <summary>
        /// 조회 버튼 클릭
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSave_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("SaveData");
            SaveData();
        }

        #endregion

        /// <summary>
        /// 프로시져 인자값 셋팅
        /// </summary>
        /// <param name="data">string화된  프로시져 인자</param>
        private void ParsingArg(string data)
        {
            ClearArg();
            m_value = data.Split(CConst.DB_PARAM_CHAR_DELIMITER);
            variableLength = data.Split(CConst.DB_PARAM_CHAR_DELIMITER).Length;
        }

        /// <summary>
        /// 변수(프로시져 인자값) 초기화
        /// </summary>
        private void ClearArg()
        {
            for (int i = 0; i < m_value.GetLength(0); i++)
            {
                m_value[i] = "";
            }
        }
    }
}