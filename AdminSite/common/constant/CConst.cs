using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;

namespace AdminSite.common.constant
{
    public static class CConst
    {
        public static string SECURITY_KEY = ConfigurationManager.AppSettings["AESKEY"].ToString();
    }
}