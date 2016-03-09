using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebApi2.Web.Common;

namespace WebApi2.Web.Api.Controllers
{
    [RoutePrefix("api/specialOrders")]
    [UnitOfWorkActionFilter]
    public class OrdersController : ApiController
    {
        public string Get(string orderNum)
        {
            return "In the Get(string orderNum) method, orderNum = " + orderNum;
        }
        
        [Route("{id:int:max(100)}")]
        [HttpGet]
        public string GetOrderWithIdMore100(int id)
        {
            return "In the GetOrderWithIdMore100(int id) method, orderNum = " + id;
        }
    }
}
