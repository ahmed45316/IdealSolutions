using LinqKit;
using System;
using System.ComponentModel;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;


namespace Tenets.Common.Extensions
{
    public static class ExpressionBuilder
    {
        public static Expression<Func<T, bool>> GetPredicate<T, TDto>(TDto dto)
        {
            var predicate = PredicateBuilder.New<T>(true);
            var param = Expression.Parameter(typeof(T), "x");
            var properities = typeof(TDto).GetProperties().Select(x => new { type = x.PropertyType, property = x.Name, value = x.GetValue(dto) }).Where(x => x.value != null).ToList();
            foreach (var filter in properities)
            {
                try
                {
                    var member = Expression.Property(param, filter.property);
                    var constant = GetValueExpression(filter.property, filter.value, param);

                    if (filter.type == typeof(string))
                    {
                        if (string.IsNullOrWhiteSpace((string)filter.value)) continue;
                        var expression = member.StartWith(constant);
                        var lambda = Expression.Lambda<Func<T, bool>>(expression, param);
                        predicate.And(lambda);
                    }
                    else
                    {
                        var expression = Expression.Equal(member, constant);
                        var lambda = Expression.Lambda<Func<T, bool>>(expression, param);
                        predicate.And(lambda);
                    }
                }
                catch (Exception) { }
              
            }
            //var compiledLambda = predicate.Compile(); if you want return with func only not Expression
            return predicate;
        }
        private static UnaryExpression GetValueExpression(string propertyName, object val, ParameterExpression param)
        {
            var member = Expression.Property(param, propertyName);
            var propertyType = ((PropertyInfo)member.Member).PropertyType;
            var converter = TypeDescriptor.GetConverter(propertyType);

            if (!converter.CanConvertFrom(typeof(string)))
                throw new NotSupportedException();

            var constant = Expression.Constant(val);
            return Expression.Convert(constant, propertyType);
        }
    }
}
