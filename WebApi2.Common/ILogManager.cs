using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using log4net;
using log4net.Core;

namespace WebApi2.Common
{
    public interface ILogManager
    {
        ILog GetLog(Type typeAssociatedWithRequestLog);
    }
}
