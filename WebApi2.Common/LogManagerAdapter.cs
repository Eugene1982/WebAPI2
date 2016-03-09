using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using log4net;
using log4net.Core;

namespace WebApi2.Common
{
    public class LogManagerAdapter : ILogManager
    {
        public ILog GetLog(Type typeAssociatedWithRequestLog)
        {
            var log = LoggerManager.GetLogger(Assembly.GetAssembly(GetType()), typeAssociatedWithRequestLog);
            return log;
        }
    }
}
