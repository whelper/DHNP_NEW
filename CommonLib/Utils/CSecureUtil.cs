using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Security.Cryptography;
using System.Runtime.InteropServices;
using log4net;
using System.Configuration;

namespace CommonLib.Utils
{
    public static class CSecureUtil
    {
        private static readonly ILog logger = LogManager.GetLogger(typeof(CSecureUtil));

        private static string AesKey = ConfigurationManager.AppSettings["AESKEY"].ToString();

        public static string CheckString(string src)
        {
            string result = src;
            string[] badToken  = {"‘","“","//", "\\","--",";","%","Union","waitfor","order by","#", "xp_", "char(", "delete from", "drop table", "null", "sysobjects", "@@VERSION" };
            if (src == null)
            {
                result = "";
            }
            else
            {
                result = src.Replace("'", "''");
                for (int i = 0; i < badToken.Length; i++)
                {
                    result = result.Replace(badToken[i], "");
                }
            }
            
            return result;
        }

        /// <summary>
        /// SHA512 Hash를 사용한 암호화
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        public static string SHA512Hash(string data)
        {
            SHA512 sha = new SHA512Managed();
            byte[] hash = sha.ComputeHash(Encoding.ASCII.GetBytes(data));
            StringBuilder stringBuilder = new StringBuilder();
            foreach (byte b in hash)
            {
                stringBuilder.AppendFormat("{0:x2}", b);
            }

            return stringBuilder.ToString();
        }

        /// <summary>
        /// AES256 암호화
        /// 원래 키도 파라미터로 있었으나 내부에 선언된 키를 무조건 사용하도록 강제하기 위해 파라미터에서 제외
        /// </summary>
        /// <param name="Input">암호화할 string</param>
        /// <returns>암호화된 값</returns>
        public static String Encrypt(string Input)
        {
            string result = string.Empty;

            try
            {
                RijndaelManaged aes = new RijndaelManaged();
                aes.KeySize = 256;
                aes.BlockSize = 128;
                aes.Mode = CipherMode.CBC;
                aes.Padding = PaddingMode.PKCS7;
                aes.Key = Encoding.UTF8.GetBytes(AesKey);
                aes.IV = new byte[] { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };

                var encrypt = aes.CreateEncryptor(aes.Key, aes.IV);
                byte[] xBuff = null;
                using (var ms = new MemoryStream())
                {
                    using (var cs = new CryptoStream(ms, encrypt, CryptoStreamMode.Write))
                    {
                        byte[] xXml = Encoding.UTF8.GetBytes(Input);
                        cs.Write(xXml, 0, xXml.Length);
                    }

                    xBuff = ms.ToArray();
                }

                result = Convert.ToBase64String(xBuff);
            }
            catch (Exception e)
            {
                string error = string.Format("CSecureUtil.Encrypt: input={0}|key={1}|exception={2}", Input, e.Message);
                CLog.debug(logger, error);
            }

            return result;
        }

        /// <summary>
        /// AES256 복호화
        /// </summary>
        /// <param name="Input"></param>
        /// <param name="key"></param>
        /// <returns></returns>
        public static String Decrypt(string Input, string key)
        {
            string result = string.Empty;

            try
            {
                RijndaelManaged aes = new RijndaelManaged();
                aes.KeySize = 256;
                aes.BlockSize = 128;
                aes.Mode = CipherMode.CBC;
                aes.Padding = PaddingMode.PKCS7;
                aes.Key = Encoding.UTF8.GetBytes(key);
                aes.IV = new byte[] { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };

                var decrypt = aes.CreateDecryptor();
                byte[] xBuff = null;
                using (var ms = new MemoryStream())
                {
                    using (var cs = new CryptoStream(ms, decrypt, CryptoStreamMode.Write))
                    {   
                        //byte[] xXml = Convert.FromBase64String( Input);
                        byte[] xXml = Convert.FromBase64String(Input);
                        cs.Write(xXml, 0, xXml.Length);
                    }

                    xBuff = ms.ToArray();
                }

                result = Encoding.UTF8.GetString(xBuff);
            }
            catch (Exception e)
            {
                string error = string.Format("CSecureUtil.Decrypt: input={0}|key={1}|exception={2}", Input, key, e.Message);
                CLog.debug(logger, error);
            }

            return result;
        }
    }
}
