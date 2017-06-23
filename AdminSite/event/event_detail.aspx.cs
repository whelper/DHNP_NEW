using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

using CommonLib.Utils;
using AdminSite.m_master;
using System.Data;

namespace AdminSite.evt
{
    public partial class event_detail : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SearchData();

                SetControls();
            }

            //WRITER_ID.Value = (string)Session["admin_id"];
        }

        /// <summary>
        /// 데이터 조회
        /// </summary>
        private void SearchData()
        {
            if (CStringUtil.IsNullOrEmpty(Seq) == false)
            {
                StringBuilder param = new StringBuilder();
                param.Append(" ").Append(Seq);

                // 데이터 카운트 조회
                String proc_nm = "USP_ADMIN_4000_EVT_EVENT_DETAIL_S";

                System.Diagnostics.Debug.WriteLine("1 proc_nm:" + proc_nm + param.ToString());

                DataSet ds = GetDataSet(proc_nm + param.ToString());
                this.SetDataRow(ds); // by renamaster
            }
        }

        /// <summary>
        /// 컨트롤 셋팅
        /// </summary>
        private void SetControls()
        {
            IMG_TITLE_TEXT.Attributes.Add("onchange", "document.getElementById('" + IMG_TITLE_VALUE.ClientID + "').value=document.getElementById('" + IMG_TITLE_TEXT.ClientID + "').value;");
            IS_SHOW_N.Checked = true;

            if (GetDataCount() > 0)
            {
                /*
                    SEQ_NO
                    EVT_TTL
                    START_DATE
                    END_DATE
                    IMG_TITLE
                    CONT_T
                    CONT_B
                    IS_SHOW
                    ITEMS
                    REG_DT
                    MOD_DT
                    WRITER_ID                
                 */
                WRITER_ID.Value = GetData(0, "WRITER_ID");
                EVT_TTL.Value = GetData(0, "EVT_TTL");

                IMG_TITLE_VALUE.Value = GetData(0, "IMG_TITLE");

                //txtBoxBody.Text = GetData(0, "START_DATE");
                //mv_path_story.Value = GetData(0, "END_DATE");

                CONT_T.Value = GetData(0, "CONT_T");
                CONT_B.Value = GetData(0, "CONT_B");



                System.Diagnostics.Debug.WriteLine(GetData(0, "IS_SHOW"));

                Boolean IS_SHOW = GetData(0, "IS_SHOW").Equals("Y") ? true : false;

                IS_SHOW_Y.Checked = false;
                IS_SHOW_N.Checked = false;

                if (IS_SHOW == true)
                {
                    System.Diagnostics.Debug.WriteLine("IS_SHOW:" + "Y");
                    IS_SHOW_Y.Checked = true;
                }
                else
                {
                    System.Diagnostics.Debug.WriteLine("IS_SHOW:" + "N");
                    IS_SHOW_N.Checked = true;
                }

                ITEMS.Value = GetData(0, "ITEMS");
            }
        }

        /// <summary>
        /// 데이터를 저장한다. (추가 or 수정)   param.Append(CConst.DB_PARAM_DELIMITER).Append(hdnContent.Value.Replace("|", "&#124;"));
        /// </summary>
        private void SaveData()
        {
            string IMG_TITLE = CStringUtil.IsNullOrEmpty(IMG_TITLE_VALUE.Value) == false ? UploadFile(IMG_TITLE_TEXT, "DIR_EVENT") : "";
            IMG_TITLE = CStringUtil.IsNullOrEmpty(IMG_TITLE) == true ? IMG_TITLE_VALUE.Value : IMG_TITLE;

            string IS_SHOW = IS_SHOW_Y.Checked ? "Y" : "N";

            StringBuilder param = new StringBuilder();
           // WRITER_ID.Value = (string)Session["admin_id"];

            param.Append(" ").Append("'").Append(WRITER_ID.Value).Append("'");
            param.Append(",'").Append(EVT_TTL.Value).Append("'");
            param.Append(",'").Append(START_DATE).Append("'");
            param.Append(",'").Append(END_DATE).Append("'");
            param.Append(",'").Append(IMG_TITLE).Append("'");
            param.Append(",'").Append(CONT_T.Value).Append("'");
            param.Append(",'").Append(CONT_B.Value).Append("'");
            param.Append(",'").Append(IS_SHOW).Append("'");
            param.Append(",'").Append(ITEMS.Value).Append("'");

            string[] result = null;

            if (CStringUtil.IsNullOrEmpty(Seq) == false)
            {
                // 수정모드 - SEQ 파라미터로 판단
                param.Append(",").Append(Seq);
                System.Diagnostics.Debug.WriteLine("1 proc_nm:" + "USP_ADMIN_4000_EVT_EVENT_DETAIL_U" + param.ToString());

                result = ExecuteQueryResult("USP_ADMIN_4000_EVT_EVENT_DETAIL_U" + param.ToString());
            }
            else
            {
                // 입력 모드
                System.Diagnostics.Debug.WriteLine("1 proc_nm:" + "USP_ADMIN_4000_EVT_EVENT_DETAIL_I" + param.ToString());

                result = ExecuteQueryResult("USP_ADMIN_4000_EVT_EVENT_DETAIL_I" + param.ToString());
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

        /// <summary>
        /// 데이터 삭제
        /// </summary>
        private void RemoveData()
        {
            if (CStringUtil.IsNullOrEmpty(Seq) == false)
            {
                StringBuilder param = new StringBuilder();
                param.Append(Seq);

                string[] result = ExecuteQueryResult(3306, param.ToString());

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
        }

        /// <summary>
        /// 파일 삭제
        /// </summary>
        /// <param name="col"></param>
        /// <param name="path"></param>
        private void DelFile(string col, string path)
        {
            StringBuilder param = new StringBuilder();
            param.Append("TB_EVT_EVENT");
            param.Append(CConst.DB_PARAM_DELIMITER).Append(col);
            param.Append(CConst.DB_PARAM_DELIMITER).Append("SEQ_NO");
            param.Append(CConst.DB_PARAM_DELIMITER).Append(Seq);

            DeleteFile(3002, param.ToString(), path);

            SearchData();
        }

        #region GET-SET

        protected string Seq
        {
            get
            {
                return Request["seq_no"];
            }
        }

        protected string START_DATE
        {
            get
            {
                if (CStringUtil.IsNullOrEmpty(Request["START_DATE"]))
                {
                    if (GetDataCount() > 0)
                    {

                        return GetData(0, "START_DATE");
                    }
                    else
                    {
                        return CDateUtil.getDate("{0:yyyy-MM-dd}");
                    }
                }
                else
                {
                    return Request["START_DATE"];
                }
            }
        }

        protected string END_DATE
        {
            get
            {
                if (CStringUtil.IsNullOrEmpty(Request["END_DATE"]))
                {
                    if (GetDataCount() > 0)
                    {
                        return GetData(0, "END_DATE");
                    }
                    else
                    {
                        return CDateUtil.getDate("{0:yyyy-MM-dd}");
                    }
                }
                else
                {
                    return Request["END_DATE"];
                }
            }
        }

        #endregion

        #region 이벤트 메소드

        protected void btnSave_Click(object sender, EventArgs e)
        {
            SaveData();

            Response.Redirect("./event_list.aspx?seq_no=" + Seq);
        }

        #endregion

        protected void btnDel_Click1(object sender, EventArgs e)
        {
            StringBuilder param = new StringBuilder();
            param.Append(" ").Append(Seq);

            //WRITER_ID.Value = (string)Session["admin_id"];
            if (CStringUtil.IsNullOrEmpty(Seq) == false)
            {
                System.Diagnostics.Debug.WriteLine("1 proc_nm:" + "USP_ADMIN_4000_EVT_EVENT_DETAIL_U" + param.ToString());

                ExecuteQueryResult("USP_ADMIN_4000_EVT_EVENT_DETAIL_D" + param.ToString());

                Response.Redirect("./event_list.aspx");
            }
        }
    }
}