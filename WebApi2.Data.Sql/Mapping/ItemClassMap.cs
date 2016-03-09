using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebApi2.Data.Entities;

namespace WebApi2.Data.Sql.Mapping
{
    public class ItemClassMap : VersionedClassMap<Item>
    {
        public ItemClassMap()
        {
            Id(x => x.ItemId);
            Map(x => x.Name).Not.Nullable();
            Map(x => x.Price).Not.Nullable();
            Map(x => x.Quantity).Not.Nullable();
        }
    }
}
