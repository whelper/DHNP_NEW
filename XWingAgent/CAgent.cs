using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using XA_SESSIONLib;
using XA_DATASETLib;
using CommonLib.Etrade.XAQuery;
using CommonLib.Utils;
using CommonLib.DB;
using log4net;
using System.Data;

namespace XWingAgent
{
    public class CAgent
    {
        private static readonly ILog logger = LogManager.GetLogger(typeof(CAgent));

        XASessionClass xASession;
        CWebSql webSql;
        Form1 form;

        public CAgent()
        {
        }

        public CAgent(Form1 form)
        {
            this.form = form;
        }

        public string[] Start()
        {
            string[] result = new string[2];

            if (ConnectServer())
            {
                if (XASession.Login(CConst.XING_USER_ID, CConst.XING_USER_PWD, "", 0, false))
                {
                    result[0] = "00";
                    result[1] = "서버접속 & 로그인 성공";
                }
                else
                {
                    result[0] = "90";
                    result[1] = "로그인 실패";

                    CLog.debug(logger, "CAgent.Start() : (90) = " + XASession.GetErrorMessage(XASession.GetLastError()));
                }
            }
            else
            {
                result[0] = "91";
                result[1] = "서버 접속 실패";

                CLog.debug(logger, "CAgent.Start() : (91) = " + XASession.GetErrorMessage(XASession.GetLastError()));
            }

            return result;
        }

        /// <summary>
        /// 서버 접속
        /// </summary>
        /// <returns></returns>
        private bool ConnectServer()
        {
            bool result = false;

            if (XASession.IsConnected() == false)
            {
                if (XASession.ConnectServer(CConst.XING_SERVER_URL, CConst.XING_SERVER_PORT))
                {
                    result = true;
                }
                else
                {
                    result = false;

                    CLog.debug(logger, "CAgent.ConnectServer() : " + XASession.GetErrorMessage(XASession.GetLastError()));
                }
            }
            else
            {
                // 이미 연결되어 있음
                result = true;

                CLog.debug(logger, "CAgent.ConnectServer() : 이미 연결되어 있음");
            }

            return result;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public bool RequestData()
        {
            bool result = false;

            try
            {
                if (XASession.IsConnected())
                {
                    Dictionary<string, string> InputDataTable = new Dictionary<string, string>();
                    InputDataTable.Add("shcode", CConst.SH_CODE);

                    Query query = new Query();
                    query.CallBackMethod = ReceiveData;
                    query.CallBackMsg = ReceiveMsg;
                    query.QueryExcute(InputDataTable);

                    result = true;
                }
                else
                {
                    CLog.debug(logger, "CAgent.RequestData: E-Trade 서버와 접속이 끊어졌습니다.");
                }
            }
            catch (Exception e)
            {
                CLog.debug(logger, "CAgent.RequestData: " + e.Message + ", XASession: " + XASession.GetErrorMessage(XASession.GetLastError()));
            }

            return result;
        }

        /// <summary>
        /// CallBack
        /// </summary>
        /// <param name="myXAQueryClass"></param>
        private void ReceiveData(XAQueryClass myXAQueryClass)
        {
            string result = "";

            try
            {
                string hname = myXAQueryClass.GetFieldData("t1102OutBlock", "hname", 0);
                string price = myXAQueryClass.GetFieldData("t1102OutBlock", "price", 0);
                string sign = myXAQueryClass.GetFieldData("t1102OutBlock", "sign", 0);
                string change = myXAQueryClass.GetFieldData("t1102OutBlock", "change", 0);
                string diff = myXAQueryClass.GetFieldData("t1102OutBlock", "diff", 0);

                if (CStringUtil.IsNullOrEmpty(hname) == false)
                {
                    StringBuilder param = new StringBuilder();
                    param.Append(hname);
                    param.Append(CConst.DB_PARAM_DELIMITER).Append(price);
                    param.Append(CConst.DB_PARAM_DELIMITER).Append(sign);
                    param.Append(CConst.DB_PARAM_DELIMITER).Append(change);
                    param.Append(CConst.DB_PARAM_DELIMITER).Append(diff);

                    WebSql.SelectSql(3102, param.ToString());

                    result = param.ToString();
                }
            }
            catch (Exception e)
            {
                result = "데이터 가져오기 실패";
                CLog.debug(logger, "CAgent.ReceiveData: " + e.Message + ", XASession: " + XASession.GetErrorMessage(XASession.GetLastError()));
            }

            if (form != null)
            {
                form.DisplayReturnMessage(result);
            }
        }

        private void ReceiveMsg(bool bIsSystemError, string Msg)
        {
            CLog.debug(logger, Msg);
        }

        /// <summary>
        /// 서버와 연결을 끊는다.
        /// </summary>
        public void DisConnect()
        {
            if (XASession.IsConnected())
            {
                XASession.DisconnectServer();
                XASession = null;
            }
        }

        #region GET-SET

        private XASessionClass XASession
        {
            get
            {
                if (xASession == null)
                {
                    xASession = new XASessionClass();
                }

                return xASession;
            }
            set
            {
                xASession = value;
            }
        }

        private CWebSql WebSql
        {
            get
            {
                if (webSql == null)
                {
                    webSql = new CWebSql();
                }

                return webSql;
            }
        }

        #endregion
    }
}
