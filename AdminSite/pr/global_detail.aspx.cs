using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdminSite.m_master;
using CommonLib.Utils;
using System.Text;

namespace AdminSite.pr
{
    public partial class global_detail : PageBase
    {
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
            if (CStringUtil.IsNullOrEmpty(Seq) == false)
            {
                StringBuilder param = new StringBuilder();
                param.Append(Seq);

                SetDataList(3313, param.ToString());
            }
        }

        /// <summary>
        /// 컨트롤 셋팅
        /// </summary>
        private void SetControls()
        {
            // 각 이미지 업로드 컨트롤에 javascript 이벤트를 등록한다. (페이지단 서버 컨트롤에 삽입 불가하여 CS단에서 삽입)
            upload_01.Attributes.Add("onchange", "document.getElementById('" + upload_path_01.ClientID + "').value=document.getElementById('" + upload_01.ClientID + "').value;");
            upload_02.Attributes.Add("onchange", "document.getElementById('" + upload_path_02.ClientID + "').value=document.getElementById('" + upload_02.ClientID + "').value;");
            upload_03.Attributes.Add("onchange", "document.getElementById('" + upload_path_03.ClientID + "').value=document.getElementById('" + upload_03.ClientID + "').value;");
            upload_04.Attributes.Add("onchange", "document.getElementById('" + upload_path_04.ClientID + "').value=document.getElementById('" + upload_04.ClientID + "').value;");
            upload_05.Attributes.Add("onchange", "document.getElementById('" + upload_path_05.ClientID + "').value=document.getElementById('" + upload_05.ClientID + "').value;");

            if (GetDataCount() > 0)
            {
                writerNm.Value = GetData(0, "WRITER_NM");
                txtTitle.Value = GetData(0, "TTL");
                txtBoxBody.Text = GetData(0, "CONT");
                mv_path_story.Value = GetData(0, "VIDEO_URL");

                h_prod_img1_path.Value = GetData(0, "IMG1");
                h_prod_img2_path.Value = GetData(0, "IMG2");
                h_prod_img3_path.Value = GetData(0, "IMG3");
                h_prod_img4_path.Value = GetData(0, "IMG4");
                h_prod_img5_path.Value = GetData(0, "IMG5");
            }
        }

        /// <summary>
        /// 데이터를 저장한다. (추가 or 수정)
        /// </summary>
        private void SaveData()
        {
            string img1 = CStringUtil.IsNullOrEmpty(upload_path_01.Value) == false ? UploadFile(upload_01, "DIR_PROMOTION") : "";
            string img2 = CStringUtil.IsNullOrEmpty(upload_path_02.Value) == false ? UploadFile(upload_02, "DIR_PROMOTION") : "";
            string img3 = CStringUtil.IsNullOrEmpty(upload_path_03.Value) == false ? UploadFile(upload_03, "DIR_PROMOTION") : "";
            string img4 = CStringUtil.IsNullOrEmpty(upload_path_04.Value) == false ? UploadFile(upload_04, "DIR_PROMOTION") : "";
            string img5 = CStringUtil.IsNullOrEmpty(upload_path_05.Value) == false ? UploadFile(upload_05, "DIR_PROMOTION") : "";

            StringBuilder param = new StringBuilder();
            param.Append(writerNm.Value);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(txtTitle.Value);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(hdnContent.Value.Replace("|", "&#124;"));
            param.Append(CConst.DB_PARAM_DELIMITER).Append("admin");
            param.Append(CConst.DB_PARAM_DELIMITER).Append(img1);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(img2);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(img3);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(img4);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(img5);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(mv_path_story.Value);

            string[] result = null;

            if (CStringUtil.IsNullOrEmpty(Seq) == false)
            {
                // 수정모드 - SEQ 파라미터로 판단
                param.Append(CConst.DB_PARAM_DELIMITER).Append(Seq);

                result = ExecuteQueryResult(3315, param.ToString());
            }
            else
            {
                // 입력 모드
                result = ExecuteQueryResult(3314, param.ToString());
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

                string[] result = ExecuteQueryResult(3316, param.ToString());

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
            param.Append("TB_PROMT_FEG_INV");
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

        #endregion

        #region 이벤트 메소드

        protected void btnSave_Click(object sender, EventArgs e)
        {
            SaveData();

            Response.Redirect("./global_list.aspx?seq_no=" + Seq);
        }

        protected void btnDel_Click(object sender, EventArgs e)
        {
            RemoveData();

            Response.Redirect("./global_list.aspx");
        }

        protected void btnImg1_Click(object sender, EventArgs e)
        {
            DelFile("IMG1", h_prod_img1_path.Value);
        }

        protected void btnImg2_Click(object sender, EventArgs e)
        {
            DelFile("IMG2", h_prod_img2_path.Value);
        }

        protected void btnImg3_Click(object sender, EventArgs e)
        {
            DelFile("IMG3", h_prod_img3_path.Value);
        }

        protected void btnImg4_Click(object sender, EventArgs e)
        {
            DelFile("IMG4", h_prod_img4_path.Value);
        }

        protected void btnImg5_Click(object sender, EventArgs e)
        {
            DelFile("IMG5", h_prod_img5_path.Value);
        }

        #endregion
    }
}