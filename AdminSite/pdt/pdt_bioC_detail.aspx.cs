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

namespace AdminSite.pdt
{
    public partial class pdt_bioC_detail : PageBase
    {
        //private const string LANG_CD = "KOR";
        private const string UPR_CATG_NO = "3";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SearchData();

                SetControls();

                InitControls();
            }
        }

        /// <summary>
        /// 데이터 조회
        /// </summary>
        private void SearchData()
        {
            if (CStringUtil.IsNullOrEmpty(ProdCd) == false)
            {
                StringBuilder param = new StringBuilder();
                param.Append(ProdCd);
                param.Append(CConst.DB_PARAM_DELIMITER).Append(LANG_CD);

                // DataSet타입으로 Set
                SetDataTableList(3213, param.ToString());
            }
        }

        /// <summary>
        /// 컨트롤 데이터 셋팅
        /// 제품 상세 조회 데이터와 무관한 컨트롤 셋팅(코드 컨트롤, 카테고리 컨트롤 등)
        /// </summary>
        private void SetControls()
        {
            // 나중에 사용할 수도 있어서 원형은 남겨둔다.
        }

        /// <summary>
        /// 제품 상세 조회 데이터를 기반으로 셋팅해야할 컨트롤들
        /// </summary>
        private void InitControls()
        {
            // 각 이미지 업로드 컨트롤에 javascript 이벤트를 등록한다. (페이지단 서버 컨트롤에 삽입 불가하여 CS단에서 삽입)
            upload_01.Attributes.Add("onchange", "document.getElementById('" + upload_path_01.ClientID + "').value=document.getElementById('" + upload_01.ClientID + "').value;");
            upload_02.Attributes.Add("onchange", "document.getElementById('" + upload_path_02.ClientID + "').value=document.getElementById('" + upload_02.ClientID + "').value;");

            if (GetDataTableCount(0) > 0)
            {
                ttl.Value = GetData(0, 0, "TTL");
                cont.Text = GetData(0, 0, "CONT");
                intro.Value = GetData(0, 0, "INTRO");

                h_thumbnail_path.Value = GetData(0, 0, "THUMBNAIL");
                h_catalog_path.Value = GetData(0, 0, "CATALOG");

                seqNo.Value = GetData(0, 0, "SEQ_NO");

                int tb2Count = GetDataTableCount(1);

                if (tb2Count > 0) tag01.Value = GetData(1, 0, "TAG_NM");
                if (tb2Count > 1) tag02.Value = GetData(1, 1, "TAG_NM");
                if (tb2Count > 2) tag03.Value = GetData(1, 2, "TAG_NM");
                if (tb2Count > 3) tag04.Value = GetData(1, 3, "TAG_NM");
                if (tb2Count > 4) tag05.Value = GetData(1, 4, "TAG_NM");
                if (tb2Count > 5) tag06.Value = GetData(1, 5, "TAG_NM");
            }
        }

        /// <summary>
        /// 데이터를 저장한다. (추가 or 수정)
        /// </summary>
        private void SaveData()
        {
            string img1 = CStringUtil.IsNullOrEmpty(upload_path_01.Value) == false ? UploadFile(upload_01, "DIR_PROMOTION") : "";
            string catalog = CStringUtil.IsNullOrEmpty(upload_path_02.Value) == false ? UploadFile(upload_02, "DIR_PROMOTION") : "";
            
            //string menual = CStringUtil.IsNullOrEmpty(upload_path_file.Value) == false ? UploadFile(upload_file, "DIR_PROMOTION") : "";

            StringBuilder param = new StringBuilder();
            param.Append(LANG_CD); // 언어코드
            param.Append(CConst.DB_PARAM_DELIMITER).Append(ttl.Value);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(intro.Value);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(hdnContent.Value);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(Session["admin_id"]);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(img1);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(catalog);

            string[] result = null;

            string prodCd = string.Empty;
            if (CStringUtil.IsNullOrEmpty(ProdCd) == false)
            {
                // 수정 모드 - prodcd 추가
                param.Append(CConst.DB_PARAM_DELIMITER).Append(ProdCd);
                
                result = ExecuteQueryResult(3215, param.ToString());

                prodCd = ProdCd;
            }
            else
            {
                // 입력 모드
                result = ExecuteQueryResult(3214, param.ToString());

                if (result != null && result.Length == 3)
                {
                    prodCd = result[2];
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
            else
            {
                // 이어서 태그 입력
                AddTag(prodCd);
            }
        }

        /// <summary>
        /// 태그를 입력한다.
        /// </summary>
        private void AddTag(string vProdCd)
        {
            #region 태그 입력

            string prodCd = CStringUtil.IsNullOrEmpty(ProdCd) ? vProdCd : ProdCd;

            StringBuilder param = new StringBuilder();

            // 제품 태그 clear
            param.Append(LANG_CD);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(prodCd);
            ExecuteQueryResult(3208, param.ToString());

            if (CStringUtil.IsNullOrEmpty(tag01.Value) == false)
            {
                param.Length = 0;

                param.Append(LANG_CD);
                param.Append(CConst.DB_PARAM_DELIMITER).Append(prodCd);
                param.Append(CConst.DB_PARAM_DELIMITER).Append(tag01.Value);

                ExecuteQuery(3207, param.ToString());
            }

            if (CStringUtil.IsNullOrEmpty(tag02.Value) == false)
            {
                param.Length = 0;

                param.Append(LANG_CD);
                param.Append(CConst.DB_PARAM_DELIMITER).Append(prodCd);
                param.Append(CConst.DB_PARAM_DELIMITER).Append(tag02.Value);

                ExecuteQuery(3207, param.ToString());
            }

            if (CStringUtil.IsNullOrEmpty(tag03.Value) == false)
            {
                param.Length = 0;

                param.Append(LANG_CD);
                param.Append(CConst.DB_PARAM_DELIMITER).Append(prodCd);
                param.Append(CConst.DB_PARAM_DELIMITER).Append(tag03.Value);

                ExecuteQuery(3207, param.ToString());
            }

            if (CStringUtil.IsNullOrEmpty(tag04.Value) == false)
            {
                param.Length = 0;

                param.Append(LANG_CD);
                param.Append(CConst.DB_PARAM_DELIMITER).Append(prodCd);
                param.Append(CConst.DB_PARAM_DELIMITER).Append(tag04.Value);

                ExecuteQuery(3207, param.ToString());
            }

            if (CStringUtil.IsNullOrEmpty(tag05.Value) == false)
            {
                param.Length = 0;

                param.Append(LANG_CD);
                param.Append(CConst.DB_PARAM_DELIMITER).Append(prodCd);
                param.Append(CConst.DB_PARAM_DELIMITER).Append(tag05.Value);

                ExecuteQuery(3207, param.ToString());
            }

            if (CStringUtil.IsNullOrEmpty(tag06.Value) == false)
            {
                param.Length = 0;

                param.Append(LANG_CD);
                param.Append(CConst.DB_PARAM_DELIMITER).Append(prodCd);
                param.Append(CConst.DB_PARAM_DELIMITER).Append(tag06.Value);

                ExecuteQuery(3207, param.ToString());
            }
            #endregion
        }

        /// <summary>
        /// 데이터 삭제
        /// </summary>
        private void RemoveData()
        {
            if (CStringUtil.IsNullOrEmpty(ProdCd) == false)
            {
                StringBuilder param = new StringBuilder();
                param.Append(ProdCd);

                string[] result = ExecuteQueryResult(3216, param.ToString());

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
            param.Append(seqNo.Value);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(col);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(Session["admin_id"]);

            DeleteFile(3217, param.ToString(), path);

            SearchData();
        }
        
        #region GET-SET

        protected string ProdCd
        {
            get
            {
                return Request["prod_cd"];
            }
        }

        protected string LANG_CD
        {
            get
            {
                if (Request["LANG_CD"] == null)
                {
                    // 기본은 국문
                    return "KOR";
                }
                else
                {
                    return Request["LANG_CD"];
                }
            }
        }

        #endregion

        #region 이벤트 메소드

        protected void btnSave_Click(object sender, EventArgs e)
        {
            SaveData();

            Response.Redirect("./pdt_bioC_list.aspx");
        }

        protected void btnDel_Click(object sender, EventArgs e)
        {
            RemoveData();

            Response.Redirect("./pdt_bioC_list.aspx");
        }

        protected void btnThumbnail_Click(object sender, EventArgs e)
        {
            DelFile("THUMBNAIL", h_thumbnail_path.Value);
        }

        protected void btnCatalog_Click(object sender, EventArgs e)
        {
            DelFile("CATALOG", h_catalog_path.Value);
        }

        #endregion
    }
}