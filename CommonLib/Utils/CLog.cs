using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using log4net;

namespace CommonLib.Utils
{
    /// <summary>
    /// Log4.net 로깅 Wrapper Class
    /// </summary>
    public static class CLog
    {
        #region static member
        private static bool isStart = false;
        //private static readonly ILog logger = LogManager.GetLogger(typeof(CLog));

        #endregion

        #region
        /// <summary>
        /// 설정환경 파일 read
        /// </summary>
        private static void initConfigure()
        {
            if (!isStart)
            {
                isStart = true;
                log4net.Config.XmlConfigurator.Configure();
            }
        }

        #endregion

        #region Write Log - debug
        /// <summary>
        /// 디버그모드가 true인지 리턴
        /// </summary>
        /// <param name="logger"></param>
        /// <returns></returns>
        public static bool isDebugEnable(ILog logger)
        {
            initConfigure();

            return logger.IsDebugEnabled;
        }
        #endregion

        #region Write Log - debug
        /// <summary>
        /// 로그를 기록
        /// </summary>
        /// <param name="logger"></param>
        /// <param name="log"></param>
        public static void debug(ILog logger, String log)
        {
            try
            {
                initConfigure();

                logger.Debug(log);
            }
            catch (Exception)
            {
                //System.Diagnostics.Debug.WriteLine(e.Message);
            }
        }
        #endregion
    }
}
