using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CommonLib.DB
{
    public class CDataAccessHelperException : System.Exception
    {
        public CDataAccessHelperException(string message) : base(message) { }
    }
}
