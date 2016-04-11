using System;
using System.Reflection;
using log4net;


namespace WebApi2.Common
{
    public class LogManagerAdapter : ILogManager
    {
        public ILog GetLog(Type typeAssociatedWithRequestLog)
        {
            return LogManager.GetLogger(Assembly.GetAssembly(GetType()), typeAssociatedWithRequestLog);
        }
    }
}
