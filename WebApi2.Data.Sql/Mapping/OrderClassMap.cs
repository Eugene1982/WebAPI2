using FluentNHibernate.Mapping;
using WebApi2.Data.Entities;

namespace WebApi2.Data.Sql.Mapping
{
    public class OrderClassMap : VersionedClassMap<Order>
    {
        public OrderClassMap()
        {
            Id(x => x.OrderId);
            Map(x => x.Date).Not.Nullable();

            HasManyToMany(x => x.Items).Access.ReadOnlyPropertyThroughCamelCaseField(Prefix.Underscore)
                .Table("OrderItem")
                .ParentKeyColumn("OrderId")
                .ChildKeyColumn("ItemId");
        }
    }
}