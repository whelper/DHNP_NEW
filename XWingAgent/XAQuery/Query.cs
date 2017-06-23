using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using XA_DATASETLib;
using XWingAgent;

namespace CommonLib.Etrade.XAQuery
{
    class Query
    {
        protected XAQueryClass myXAQueryClass;
        public delegate void callbackdelegate(XAQueryClass myXAQueryClass);
        public callbackdelegate CallBackMethod;
        public delegate void callbackMsgdelegate(bool bIsSystemError, string Msg);
        public callbackMsgdelegate CallBackMsg;
        protected Dictionary<string, string> InputDataTable;
        protected string InBlockName = "";

        public Query()
        {
            myXAQueryClass = new XAQueryClass();
            myXAQueryClass.ReceiveData += new _IXAQueryEvents_ReceiveDataEventHandler(myXAQueryClass_ReceiveData);
            myXAQueryClass.ReceiveMessage += new _IXAQueryEvents_ReceiveMessageEventHandler(myXAQueryClass_ReceiveMessage);
        }

        private void myXAQueryClass_ReceiveMessage(bool bIsSystemError, string nMessageCode, string szMessage)
        {
            if (CallBackMsg != null)
            {
                CallBackMsg(bIsSystemError, nMessageCode + "   " + szMessage);
            }
        }

        protected virtual void myXAQueryClass_ReceiveData(string szTrCode)
        {
            if (CallBackMethod != null)
            {
                CallBackMethod(myXAQueryClass);
            }
        }

        public virtual void QueryExcute(Dictionary<string, string> InputDataTable)
        {
            myXAQueryClass.ResFileName = @"C:\eBEST\xingAPI\Res\t1102.res";
            myXAQueryClass.SetFieldData("t1102InBlock", "shcode", 0, CConst.SH_CODE);
            myXAQueryClass.Request(false);
        }
    }
}
