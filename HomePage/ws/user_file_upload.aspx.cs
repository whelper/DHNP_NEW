using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using CommonLib.Utils;
using HomePage.m_master;

namespace HomePage.ws
{
    public partial class user_file_upload : PageBase
    {
        private CDirUtil dirUtil = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpFileCollection uploadedFiles = Request.Files;

                // 다수의 파일을 다운로드 하여 파일을 저장함
                for (int j = 0; j < uploadedFiles.Count; j++)
                {
                    HttpPostedFile userPostedFile = uploadedFiles[j];

                    // 파일 내용이 있을경우
                    if (userPostedFile.ContentLength > 0)
                    {
                        string sourceDir = DirUtil.GetUploadDir("DIR_RECRUITMENT_USER");
                        string newFile = CStringUtil.GetNewFileName(userPostedFile.FileName);
                        if (newFile.Contains(@"\"))
                        {

                            string[] arr_newfile = newFile.Split(new char[] { '\\' });
                            newFile = arr_newfile[arr_newfile.Length - 1];
                        }
                        string saveFileName = sourceDir + newFile;

                        // 물리파일 전체 경로
                        string physicalPath = CConst.DIR_ROOT_IMAGE_PATH + saveFileName;

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

                        //CXmlMaker xmlMaker = new CXmlMaker();
                        //xmlMaker.StartXml();
                        //xmlMaker.Tag("file_path", saveFileName);

                        Response.Write(saveFileName);
                        Response.Flush();
                        Response.End();
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