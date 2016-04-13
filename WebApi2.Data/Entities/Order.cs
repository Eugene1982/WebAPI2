using System;

namespace WebApi2.Data.Entities
{
    public class Order : IVersionedEntity
    {
        public virtual int OrderId { get; set; }
        public virtual Item[] Items { get; set; }
        public virtual DateTime Date { get; set; }
        public virtual byte[] Version { get; set; }
    }
}