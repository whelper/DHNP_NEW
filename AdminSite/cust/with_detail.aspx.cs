using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdminSite.m_master;
using CommonLib.Utils;
using System.Text;

namespace AdminSite.cust
{
    public partial class with_detail : PageBase
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
            if (CStringUtil.IsNullOrEmpty(Seq) == false)
            {
                StringBuilder param = new StringBuilder();
                param.Append(Seq);

                SetDataList(3623, param.ToString());

                lang_cd.Value = GetData(0, "LANG_CD");

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

                string[] result = ExecuteQueryResult(3624, param.ToString());

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


        protected void btnDel_Click(object sender, EventArgs e)
        {
            string lang_co = lang_cd.Value;

            RemoveData();

            if (lang_co.Equals("ENG"))
            {
                Response.Redirect("./with_list_eng.aspx");
            }
            else
            {
                Response.Redirect("./with_list.aspx");
            }

        }

        #endregion
    }
}