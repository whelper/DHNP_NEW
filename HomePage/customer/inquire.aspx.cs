using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Net;
using System.Net.Mail;
//using System.Web.Mail;
using CommonLib.Utils;
using HomePage.m_master;
using System.Data;

namespace HomePage.customer
{
    public partial class inquire : PageBase
    {
		protected void Page_Load(object sender, EventArgs e)
        {

			List<ListItem> items = new List<ListItem>();
			items.Add(new ListItem("선택하세요", ""));

			foreach (var h in CConst.CODE_INQUIRY) {
				items.Add(new ListItem(h.Value,h.Key));
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
			param.Append(CConst.DB_PARAM_DELIMITER).Append(gubun.SelectedValue);
		
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


				#region Send Mail
				string html = null; //메일 내용
				string to = null; //수신자

				switch (gubun.SelectedValue)
				{
					case ("1"): //동물의약품(국내)
						to = "kyky318@dhnp.co.kr";
						break;
					case ("2"): //동물의약품(해외)
						to = "export@dhnp.co.kr";
						break;
					case ("3"): //인체의약품(국내)
						to = "jmpark@dhnp.co.kr";
						break;
					case ("4"): //인체의약품(해외)
						to = "export@dhnp.co.lr";
						break;
					case ("5"): //바이오의약품
						to = "bio@dhnp.co.kr";
						break;
					case ("6"): //기타문의
						to = "windscreen@dhnp.co.kr";
						break;
				}

				to = "no-reply@dhnp.co.kr";
				html = "내용";

				MailMessage mail = new MailMessage();
				mail.From = new MailAddress("no-reply@dhnp.co.kr");
				mail.To.Add("cinebuddy@gmail.com");
				mail.Subject = ttl.Value;
				mail.Body = html;
				mail.IsBodyHtml = true;
				
				SmtpClient client = new SmtpClient("mail-002.webterhosting.co.kr");
				client.UseDefaultCredentials = true;
				client.Credentials = new NetworkCredential("webter_dhnp@dhnp.webterhosting.co.kr", "leadsun1");
				
				try
				{
					client.Send(mail);
				}
				catch (SmtpException ex)
				{
					throw new Exception(ex.Message, ex);
				}
				#endregion

				//ClientScript.RegisterClientScriptBlock(this.GetType(), "test", CWebUtil.MsgBox("접수 되었습니다."));	
				CWebUtil.jsAlertAndRedirect(this, "접수 되었습니다.", Request.ServerVariables["SCRIPT_NAME"]);
			 
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