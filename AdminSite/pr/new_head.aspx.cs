using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using AdminSite.m_master;
using CommonLib.Utils;

namespace AdminSite.pr
{
    public partial class new_head : PageBase
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

            StringBuilder param = new StringBuilder();
            param.Append(1);
            SetDataList(3308, param.ToString());

        }

        private void SetControls()
        {
            if (GetDataCount() > 0)
            {
                txtTitle.Value = GetData(0, "TTL");
                txtBoxBody.Text = GetData(0, "CONT");
            }
        }

        /// <summary>
        /// 데이터를 저장한다. (추가 or 수정)
        /// </summary>
        private void SaveData()
        {
            StringBuilder param = new StringBuilder();
            param.Append(CConst.DB_PARAM_DELIMITER).Append(txtTitle.Value);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(hdnContent.Value);
            param.Append(CConst.DB_PARAM_DELIMITER).Append("admin");

            string[] result = null;

            result = ExecuteQueryResult(3307, param.ToString());

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

        #region 이벤트 메소드

        protected void btnSave_Click(object sender, EventArgs e)
        {
            SaveData();

            Response.Redirect("./new_list.aspx");
        }

        #endregion
    }   
}