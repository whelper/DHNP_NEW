using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdminSite.m_master;
using System.IO;
using CommonLib.Utils;

namespace AdminSite.common.se.popup.quick_photo
{
    public partial class FileUploader : PageBase
    {
        private CDirUtil dirUtil = null;
        private static readonly log4net.ILog logger = log4net.LogManager.GetLogger(typeof(PageBase));

        // 이미지 파일을 서버에 저장하고 저장한 정보를 클라이언트에 보내줌.
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpFileCollection uploadedFiles = Request.Files;

                string callback_func = Request.Form["callback_func"];

                // 다수의 파일을 다운로드 하여 파일을 저장함
                for (int j = 0; j < uploadedFiles.Count; j++)
                {
                    HttpPostedFile userPostedFile = uploadedFiles[j];

                    // 파일 내용이 있을경우
                    if (userPostedFile.ContentLength > 0)
                    {
                        string sourceDir = DirUtil.GetUploadDir("DIR_SMARTEDITOR");
                        string newFile = CStringUtil.GetNewFileName(new FileInfo(userPostedFile.FileName).Name);
                        string saveFileName = sourceDir + newFile;

                        // 물리파일 전체 경로
                        string physicalPath = CConst.DIR_ROOT_IMAGE_PATH + saveFileName;

                        //logger.Debug("physicalPath:" + physicalPath);

                        // 디렉토리 존재 유무 검사 후 디렉토리 생성
                        DirUtil.MakeDir(CConst.DIR_ROOT_IMAGE_PATH + sourceDir);

                        // 파일 저장
                        userPostedFile.SaveAs(physicalPath);

                        string fileUrl = saveFileName;

                        if (CStringUtil.IsNullOrEmpty(fileUrl))
                        {
                            // 실패한 경우에 파일 명 공백
                            saveFileName = "";
                        }
                        else
                        {
                            saveFileName = fileUrl;
                        }

                        // 클라이언트에 저장한 파일 정보를 보내 줌
                        string returnUrl = string.Format("callback.html?callback_func={0}&bNewLine=true&sFileName={1}&sFileURL={2}",
                            callback_func, newFile, fileUrl);

                        Response.Redirect(returnUrl);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('첨부파일 등록중 에러발생');", true);
                    }
                }
            }
        }

        private CDirUtil DirUtil
        {
            get
            {
                if (dirUtil == null)
                {
                    dirUtil = new CDirUtil();
                }

                return dirUtil;
            }
        }
    }
}