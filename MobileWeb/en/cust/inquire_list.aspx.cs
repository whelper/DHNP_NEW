using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

using CommonLib.Utils;
using MobileWeb.m_master;
using System.Data;

namespace MobileWeb.en.cust
{
    public partial class inquire_list : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// 데이터를 저장한다. (추가 or 수정)
        /// </summary>
        private void SaveData()
        {
            StringBuilder param = new StringBuilder();
            param.Append(ttl.Value);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(writer_nm.Value);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(tel.Value);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(email.Value);
            param.Append(CConst.DB_PARAM_DELIMITER).Append(cont.Value);

            string[] result = null;

            // 입력 모드
            result = ExecuteQueryResult(2300, param.ToString());

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
                ClientScript.RegisterClientScriptBlock(this.GetType(), "test", CWebUtil.MsgBox("접수 되었습니다."));

                ttl.Value = "";
                writer_nm.Value = "";
                tel.Value = "";
                email.Value = "";
                cont.Value = "";
            }


        }

        #region 이벤트 메소드

        protected void btnSave_Click(object sender, EventArgs e)
        {
            SaveData();

        }

        #endregion

    }
    
}