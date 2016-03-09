using System;
using System.Collections.Generic;

namespace WebApi2.Web.Api.Models
{
    public class Order
    {
        private List<Link> _links; 

        public List<Item> Items { get; set; }
        public DateTime Date { get; set; }

        public List<Link> Links
        {
            get { return _links ?? new List<Link>(); }
            set { _links = value; }
        }

        public void AddLink(Link link)
        {
            _links.Add(link);
        }
    }
}
