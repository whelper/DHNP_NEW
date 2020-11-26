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

				html = " <html>";
				html += " <head>";
				html += " <title>대한뉴팜</title>";
				html += " <meta http-equiv='Content-Type' content='text/html; charset=euc-kr'>";
				html += " </head>";
				html += " <body>";
				html += " <table width='800' border='0' cellspacing='0' cellpadding='0' >";
				html += " 	<tr>";
				html += " 		<td>";
				html += " 			<table width='100%' border='0' cellspacing='0' cellpadding='0'>";
				html += " 				<tr>";
				html += " 					<td valign='top'><a href=\"https://www.dhnp.co.kr\" target=\"_blank\"><img src=\"http://www.dhnp.co.kr/common/images/mail/top.jpg\"  border=\"0\"></a></td>					";
				html += " 				</tr>";
				html += " 			</table>";
				html += " 		</td>";
				html += " 	</tr>";
				html += " 	<tr>";
				html += " 		<td style=\"padding:30px 20px;\">";
				html += " 			<table width='100%' border='0' cellspacing='0' cellpadding='0'>";
				html += " 				<tr>";
				html += " 					<td>안녕하세요. <br>";
				html += " 						<b><font color=\"#ff731e\">" +writer_nm.Value+"</font></b>님";
				html += " 							문의사항이 접수되었습니다.";
				html += " 						</td>";
				html += " 					</tr>";
				html += " 					<tr>";
				html += " 						<td style=\"padding:20px 0;\">";
				html += " 							<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"ffffff\">";
				html += " 								<tr>";
				html += " 									<td align=\"center\" bgcolor=\"#ffffff\" >";
				html += " 										<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"border-top:2px solid #04b25a;\">";
				html += " 											<tr>";
				html += " 												<td width=\"25%\" height=\"29\" style=\"line-height:45px;border-bottom:1px solid #dbdbdb;border-right:1px solid #dbdbdb;background:#f9faf9;padding-left:20px;\"><b><font color=\"#000\">구분</font></b></td>";
				html += " 												<td width=\"75%\" style=\"line-height:45px;border-bottom:1px solid #dbdbdb;padding-left:20px;\">" + CConst.CODE_INQUIRY[gubun.SelectedValue] + "</td>";
				html += " 											</tr>	";
				html += " 											<tr>";
				html += " 												<td width=\"25%\" height=\"29\" style=\"line-height:45px;border-bottom:1px solid #dbdbdb;border-right:1px solid #dbdbdb;background:#f9faf9;padding-left:20px;\"><b><font color=\"#000\">제목</font></b></td>";
				html += " 												<td width=\"75%\" style=\"line-height:45px;border-bottom:1px solid #dbdbdb;padding-left:20px;\">" +ttl.Value+"</td>";
				html += " 											</tr>";
				html += " 											<tr>";
				html += " 												<td width=\"25%\" height=\"29\" style=\"line-height:45px;border-bottom:1px solid #dbdbdb;border-right:1px solid #dbdbdb;background:#f9faf9;padding-left:20px;\"><b><font color=\"#000\">이름</font></b></td>";
				html += " 												<td width=\"75%\" style=\"line-height:45px;border-bottom:1px solid #dbdbdb;padding-left:20px;\">" +writer_nm.Value+"</td>";
				html += " 											</tr>	";
				html += " 											<tr>";
				html += " 												<td width=\"25%\" height=\"29\" style=\"line-height:45px;border-bottom:1px solid #dbdbdb;border-right:1px solid #dbdbdb;background:#f9faf9;padding-left:20px;\"><b><font color=\"#000\">연락처</font></b></td>";
				html += " 												<td width=\"75%\" style=\"line-height:45px;border-bottom:1px solid #dbdbdb;padding-left:20px;\">" +tel.Value+"</td>";
				html += " 											</tr>	";
				html += " 											<tr>";
				html += " 												<td width=\"25%\" height=\"29\" style=\"line-height:45px;border-bottom:1px solid #dbdbdb;border-right:1px solid #dbdbdb;background:#f9faf9;padding-left:20px;\"><b><font color=\"#000\">이메일</font></b></td>";
				html += " 												<td width=\"75%\" style=\"line-height:45px;border-bottom:1px solid #dbdbdb;padding-left:20px;\">" +email.Value+"</td>";
				html += " 											</tr>";
				html += " 											<tr>";
				html += " 												<td width=\"25%\" height=\"29\" style=\"line-height:45px;border-bottom:1px solid #dbdbdb;border-right:1px solid #dbdbdb;background:#f9faf9;padding-left:20px;\"><b><font color=\"#000\">내용</font></b></td>";
				html += " 												<td width=\"75%\" style=\"line-height:30px;border-bottom:1px solid #dbdbdb;padding:20px;\">";
				html += " 												" + cont.Value ;
				html += " 												</td>";
				html += " 											</tr>	";
				html += " 										</table>";
				html += " 									</td>";
				html += " 								</tr>";
				html += " 							</table>";
				html += " 						</td>";
				html += " 					</tr>								";
				html += " 				</table>				";
				html += " 			</td>";
				html += " 		</tr>";
				html += " 		<tr>";
				html += " 			<td style=\"padding:30px 20px;\">";
				html += " 				";
				html += " 				<table width='100%' border='0' cellspacing='0' cellpadding='0' style=\"border-top:1px solid #e5e5e5;\">";
				html += " 					<tr>";
				html += " 						<td style=\"padding-top:20px;vertical-align:top;\"><img src=\"http://www.dhnp.co.kr/common/images/mail/b_logo.jpg\" ></a></td>";
				html += " 						<td style=\"padding-top:20px;font-size:13px;\">경기도 화성시 향남읍 제약공단1길 66  사업자번호 : 229-81-10729 <br/>";
				html += " 						대표자명 : 이완진  대표전화 : (02)581-2333  팩스 : (02)581-1644 <br/><br/>Copyright (c) Daehan New Pharm Co.,Ltd All right reserved.</td>";
				html += " 					</tr>";
				html += " 				</table>";
				html += " 			</td>";
				html += " 		</tr>";
				html += " </table>";
				html += " </body>";
				html += " </html>";

				
				MailMessage mail = new MailMessage();
				mail.From = new MailAddress("no-reply@dhnp.co.kr");
				mail.To.Add(to);
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