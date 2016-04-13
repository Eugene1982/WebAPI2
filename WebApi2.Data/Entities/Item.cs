using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WebApi2.Data.Entities
{
    public class Item : IVersionedEntity
    {
        public virtual int ItemId { get; set; }
        public virtual string Name { get; set; }
        public virtual double Price { get; set; }
        public virtual int Quantity { get; set; }
        public virtual byte[] Version { get; set; }
    }
}
