using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdminSite.m_master;
using System.Text;
using CommonLib.Utils;
using System.Data;

namespace AdminSite.rcm
{
    public partial class job_support_list : PageBase
    {
        private string regSeqNo = string.Empty;
        private string pagesize = "10";

        public string Pagesize
        {
            get { return pagesize; }
            set { pagesize = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SearchData();
                InitControls();
            }
        }

        /// <summary>
        /// 컨트롤 초기화
        /// </summary>
        private void InitControls()
        {
            // 검색창 Enter키 이벤트
            chi_nm.Attributes["onkeypress"] = "if (event.keyCode==13){" + ClientScript.GetPostBackEventReference(btn_Search, chi_nm.Value) + "; return false }";

            succ_yn.Checked = true;
            rcm_type_1.Checked = true;
            rcm_career_1.Checked = true;
        }

        /// <summary>
        /// 데이터 조회
        /// </summary>
        private void SearchData()
        {
            string rcmResult = string.Empty; // 전체

            string succ_yn_result = string.Empty;
            succ_yn_result = succ_yn.Checked ? "" : succ_yn_result;
            succ_yn_result = succ_yn_c.Checked ? "C" : succ_yn_result;
            succ_yn_result = succ_yn_y.Checked ? "Y" : succ_yn_result;
            succ_yn_result = succ_yn_n.Checked ? "N" : succ_yn_result;

            string rcm_type_cd = string.Empty;
            rcm_type_cd = rcm_type_1.Checked ? "" : rcm_type_cd;
            rcm_type_cd = rcm_type_2.Checked ? "RCM_TYPE_REGULAR" : rcm_type_cd;
            rcm_type_cd = rcm_type_3.Checked ? "RCM_TYPE_CONTRACT" : rcm_type_cd;
            rcm_type_cd = rcm_type_4.Checked ? "RCM_TYPE_INTERN" : rcm_type_cd;
            rcm_type_cd = rcm_type_5.Checked ? "RCM_TYPE_ETC" : rcm_type_cd;

            string rcm_carrer_cd = string.Empty;
            rcm_carrer_cd = rcm_career_1.Checked ? "" : rcm_carrer_cd;
            rcm_carrer_cd = rcm_career_2.Checked ? "RCM_CAREER_NEW" : rcm_carrer_cd;
            rcm_carrer_cd = rcm_career_3.Checked ? "RCM_CAREER_CAREER" : rcm_carrer_cd;

            Pagesize = select_Pagesize.SelectedValue;
            //string rcm_duty_cd = "";

            StringBuilder param = new StringBuilder();
            param.Append(nowPageNo.Value);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(RegSeqNo);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(chi_nm.Value);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(succ_yn_result);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(pdt_select.Value);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(rcm_type_cd);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(rcm_carrer_cd);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(int.Parse(Pagesize));

            // 데이터 카운트 조회
            SetDataCount(3529, param.ToString());

            if (DataTotalCount > 0)
            {
                // 실 데이터 조회
                SetDataTableList(3530, param.ToString());
            }
        }

        #region 이벤트 메소드

        /// <summary>
        /// 조회 버튼 클릭
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            // 페이지는 1로 초기화
            nowPageNo.Value = "1";

            SearchData();
        }


        protected void select_Page_Change(object sender, EventArgs e)
        {
            // 페이지는 1로 초기화
            nowPageNo.Value = "1";

            SearchData();
        }


        /// <summary>
        /// 페이지 번호 클릭
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void nowPageNo_ValueChanged(object sender, EventArgs e)
        {
            SearchData();
        }

        #endregion

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
        #endregion

        protected void btn_Excel_Click(object sender, EventArgs e)
        {
            StringBuilder param = new StringBuilder();
            param.Append(-1);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(RegSeqNo);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(chi_nm.Value);
            param.Append(CConst.DB_PARAM_DELIMITER).Append("");
            param.Append(CConst.DB_PARAM_DELIMITER).Append(pdt_select.Value);
            param.Append(CConst.DB_PARAM_DELIMITER).Append("");
            param.Append(CConst.DB_PARAM_DELIMITER).Append("");
            param.Append(CConst.DB_PARAM_DELIMITER).Append(int.Parse(Pagesize));

            // 데이터 카운트 조회
            SetDataCount(3529, param.ToString());

            if (DataTotalCount > 0)
            {
                // 실 데이터 조회
                SetDataTableList(3530, param.ToString());
            }

            StringBuilder sb = new StringBuilder();
            if (GetRowCount(0) > 0)
            {
                String[] arr_col_header = { "이름", "지원유형", "지원직군", "신입/경력", "연락처", "이메일", "결과", "등록일" };
                String[] arr_col = { "CHI_NM", "SUPPORT_TYPE_NM", "SUPPORT_POS_NM", "SUPPORT_CR_NM", "CELLTEL", "EMAIL", "SUCC_NM", "REG_DT" };

                for (int j = 0; j < arr_col_header.Length; j++)
                {
                    sb.Append(arr_col_header[j]).Append(",");
                }
                sb.Append("\n");

                for (int i = 0; i < GetRowCount(0); i++)
                {
                    for (int j = 0; j < arr_col.Length; j++)
                    {
                        if (j == 4)
                        {
                            sb.Append("\"'" + GetData(0, i, arr_col[j]) + "'\"").Append(",");
                        }
                        else
                        {
                            sb.Append("\"" + GetData(0, i, arr_col[j]) + "\"").Append(",");
                        }
                    }

                    sb.Append("\n");
                }
            }

            Response.Charset = "euc-kr";
            Response.ContentEncoding = System.Text.Encoding.GetEncoding("euc-kr");

            Response.ClearContent();
            Response.AddHeader("content-disposition", "attachment;filename=test.csv");
            Response.ContentType = "application/excel";
            Response.Write(sb);
            Response.End();
        }


    }
}