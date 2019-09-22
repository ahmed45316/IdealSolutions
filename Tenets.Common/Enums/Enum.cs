using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Text;

namespace Tenets.Common.Enums
{
    public enum DebitCredit
    {
        Debit=1,
        Credit=2
    }
    public enum OpeningBalanceType
    {
        Customer = 1,
        Rent = 2
    }
    public enum PaymentType
    {
        [Description("نقدي")]
        Cach = 1,
        [Description("شيك")]
        Check = 2,
        [Description("تحويل")]
        Transfer = 3,
        [Description("فيزا")]
        Visa = 4
    }
    public enum CollectReceiptType
    {
        Collect = 1,
        Receipt = 2
    }
    public static class EnumExtensions
    {

        // This extension method is broken out so you can use a similar pattern with 
        // other MetaData elements in the future. This is your base method for each.
        public static T GetAttribute<T>(this Enum value) where T : Attribute
        {
            var type = value.GetType();
            var memberInfo = type.GetMember(value.ToString());
            var attributes = memberInfo[0].GetCustomAttributes(typeof(T), false);
            return attributes.Length > 0
              ? (T)attributes[0]
              : null;
        }

        // This method creates a specific call to the above method, requesting the
        // Description MetaData attribute.
        public static string ToName(this Enum value)
        {
            var attribute = value.GetAttribute<DescriptionAttribute>();
            return attribute == null ? value.ToString() : attribute.Description;
        }

    }
}
