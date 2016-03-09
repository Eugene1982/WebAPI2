using System.Collections.Generic;

namespace WebApi2.Web.Api.Models
{
    public class Item
    {
        private List<Link> _links; 
        public string Name { get; set; }
        public double Price { get; set; }
        public int Quantity { get; set; }

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
