using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using log4net;
using System.Configuration;
using System.IO;
using System.Diagnostics;

namespace CommonLib.Utils
{
    public class CDirUtil
    {
        private static readonly ILog logger = LogManager.GetLogger(typeof(CDirUtil));

        /// <summary>
        /// type: LOCAL - Backoffice 임시 로컬 패스, REMOTE - 실제 사용자가 이용할 (물리적인)디렉토리 패스 (운영은 NAS)
        /// 해당 디렉토리가 없는 경우 생성하고 리턴
        /// </summary>
        /// <param name="type"></param>
        /// <returns></returns>
        public string GetUploadDir(string type)
        {
            string dir = ConfigurationManager.AppSettings[type].ToString();
            
            if (Directory.Exists(dir.ToString()) == false)
            {
                Directory.CreateDirectory(dir.ToString());
            }

            return dir.ToString();
        }

        /// <summary>
        /// Root 디렉토리를 리턴
        /// </summary>
        /// <param name="type"></param>
        /// <returns></returns>
        public string GetRootDir(string type)
        {
            string root = "";

            if (type.Equals("MAIN"))
            {
                root = ConfigurationManager.AppSettings["FILE_LOCAL_DIR"].ToString();
            }
            else if (type.Equals("REMOTE"))
            {
                root = ConfigurationManager.AppSettings["FILE_REMOTE_DIR"].ToString();
            }

            return root;
        }

        /// <summary>
        /// 원격서버에 파일 저장
        /// </summary>
        /// <param name="dir">디렉토리 Path(파일명 제외한 Path)</param>
        /// <param name="fileName">파일명(순수 파일명)</param>
        /// <returns>이미지 접근 URL</returns>
        public string CopyRemoteServer(string dir, string fileName)
        {
            string result = "";

            string sourceFile = "";
            string destFile = "";

            try
            {
                if (ConfigurationManager.AppSettings["SERVER_ENV"].ToString().Equals("REAL"))
                {
                    sourceFile = dir + fileName;
                    string dateDir = GetNowDir("\\");
                    string dateDir2 = GetNowDir("/");
                    // 마지막에 \를 뺀 Dir (\를 붙이니 인식이 안됨)
                    string authDir = ConfigurationManager.AppSettings["IMAGE_REMOTE_ROOT_DIR"].ToString();
                    // 마지막에 \까지 포함한 DIR 뒤에 날짜와 연결해서 사용하기 위한 용도
                    string destDir = ConfigurationManager.AppSettings["IMAGE_REMOTE_DIR"].ToString() + dateDir;
                    destFile = destDir + fileName;

                    // NAS 인증 및 파일 복사
                    Process p = Process.Start("net.exe", @"use \\upimage.gmarket.nas\cornerimg\donicash cornerimg!!22 /USER:GMARKETNH\cornerimg");
                    p.WaitForExit();

                    if (Directory.Exists(@"" + destDir) == false)
                    {
                        Directory.CreateDirectory(@"" + destDir);
                    }

                    File.Copy(@"" + sourceFile, @"" + destFile, true);

                    // NAS 인증 및 파일 복사 END

                    result = ConfigurationManager.AppSettings["IMAGE_URL_ROOT"].ToString() + dateDir2 + fileName;
                }
                else
                {
                    sourceFile = dir + fileName;
                    string destDir = ConfigurationManager.AppSettings["IMAGE_REMOTE_DIR"].ToString();
                    destFile = destDir + fileName;

                    if (Directory.Exists(destDir) == false)
                    {
                        Directory.CreateDirectory(destDir);
                    }

                    File.Copy(sourceFile, destFile, true);

                    result = ConfigurationManager.AppSettings["IMAGE_URL_ROOT"].ToString() + fileName;
                }
            }
            catch (Exception e)
            {
                CLog.debug(logger, "CDirectoryUtil.CopyRemoteServer : sourceFile = " + sourceFile + ", destFile = " + destFile + ", detail : " + e.Message + ", trace: " + e.StackTrace);
            }

            return result;
        }

        private string GetNowDir(string delimter)
        {
            StringBuilder dir = new StringBuilder();
            dir.Append(DateTime.Now.Year.ToString()).Append(delimter);
            dir.Append(DateTime.Now.Month.ToString().PadLeft(2, '0')).Append(delimter);
            dir.Append(DateTime.Now.Day.ToString().PadLeft(2, '0')).Append(delimter);

            return dir.ToString();
        }

        /// <summary>
        /// 디렉토리가 없으면 만든다.
        /// </summary>
        /// <param name="path"></param>
        /// <returns></returns>
        public bool MakeDir(string path)
        {
            bool result = false;

            try
            {
                DirectoryInfo dir = new DirectoryInfo(path);
  
                if (!dir.Exists)
                {
                    dir.Create();
                }

                result = true;
            }
            catch (Exception e)
            {
                CLog.debug(logger, "CDirectoryUtil.MakeDir : path = " + path + ", message : " + e.Message + ", trace: " + e.StackTrace);
            }

            return result;
        }

        /// <summary>
        /// 파일 삭제
        /// </summary>
        /// <param name="path">물리적인 전체 파일 경로</param>
        /// <returns></returns>
        public bool DeleteFile(string path)
        {
            bool result = false;

            try
            {
                File.Delete(path);

                result = true;
            }
            catch (Exception e)
            {
                CLog.debug(logger, "CDirectoryUtil.MakeDir : path = " + path + ", message : " + e.Message + ", trace: " + e.StackTrace);
            }

            return result;
        }
    }
}
