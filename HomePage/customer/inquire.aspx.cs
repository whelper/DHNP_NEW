using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Net.Mail;

using CommonLib.Utils;
using HomePage.m_master;
using System.Data;

namespace HomePage.customer
{
    public partial class inquire : PageBase
    {
		private string[,] InqueryCode = null;
		protected void Page_Load(object sender, EventArgs e)
        {
			InqueryCode = new string[6, 2]  { { "동물의약품(국내)", "1" }
									  , { "동물의약품(해외)", "2" }
									  , { "인체의약품(국내)", "3" }
									  , { "인체의약품(해외)", "4" }
									  , { "바이오의약품", "5" }
									  , { "기타문의", "6" }
								  };

			List<ListItem> items = new List<ListItem>();
			items.Add(new ListItem("선택하세요", ""));
			for (int i = 0; i < InqueryCode.GetLength(0); i++)
			{
				items.Add(new ListItem(InqueryCode[i, 0], InqueryCode[i, 1]));
			}
			gubun.Items.AddRange(items.ToArray());
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
            result = ExecuteQueryResult(1501, param.ToString());

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

			MailMessage mail = new MailMessage();
			mail.From = new MailAddress("cinebuddy@daum.net");
			mail.To.Add("cinebuddy@gmail.com");
			mail.Subject = "제목";
			mail.Body = "내용";
			mail.IsBodyHtml = true;
			SmtpClient client = new SmtpClient("127.0.0.1");
			try
			{
				client.Send(mail);
			}
			catch (SmtpException ex)
			{
				throw new Exception(ex.Message, ex);
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