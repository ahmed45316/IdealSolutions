using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Text;

namespace Tenets.Common.Extensions
{
    public static class CommonExtensionMethods
    {
        private static readonly MethodInfo trimMethod = typeof(string).GetMethod("Trim", new Type[0]);
        private static readonly MethodInfo toLowerMethod = typeof(string).GetMethod("ToLower", new Type[0]);
        private static MethodInfo startsWithMethod = typeof(string).GetMethod("StartsWith", new[] { typeof(string) });
        private static MethodInfo stringContainsMethod = typeof(string).GetMethod("Contains", new[] { typeof(string) });

        public static Expression TrimToLower(this MemberExpression member)
        {
            var trimMemberCall = Expression.Call(member, trimMethod);
            return Expression.Call(trimMemberCall, toLowerMethod);
        }

        public static Expression TrimToLower(this ConstantExpression constant)
        {
            var trimMemberCall = Expression.Call(constant, trimMethod);
            return Expression.Call(trimMemberCall, toLowerMethod);
        }
        public static Expression TrimToLower(this UnaryExpression constant)
        {
            var trimMemberCall = Expression.Call(constant, trimMethod);
            return Expression.Call(trimMemberCall, toLowerMethod);
        }
        public static Expression AddNullCheck(this Expression expression, MemberExpression member)
        {
            Expression memberIsNotNull = Expression.NotEqual(member, Expression.Constant(null));
            return Expression.AndAlso(memberIsNotNull, expression);
        }

        public static Expression StartWith(this MemberExpression member, ConstantExpression constant1)
        {
            Expression constant = constant1.TrimToLower();

            return Expression.Call(member.TrimToLower(), startsWithMethod, constant)
                   .AddNullCheck(member);
        }
        public static Expression StartWith(this MemberExpression member, UnaryExpression constant1)
        {
            Expression constant = constant1.TrimToLower();

            return Expression.Call(member.TrimToLower(), startsWithMethod, constant)
                   .AddNullCheck(member);
        }
        public static Expression Contain(this MemberExpression member, ConstantExpression constant1)
        {
            Expression constant = constant1.TrimToLower();

            return Expression.Call(member.TrimToLower(), stringContainsMethod, constant)
                   .AddNullCheck(member);
        }
        public static Expression NotContain(this MemberExpression member, ConstantExpression constant1)
        {
            Expression constant = constant1.TrimToLower();

            return Expression.Not(Expression.Call(member.TrimToLower(), stringContainsMethod, constant))
                   .AddNullCheck(member);
        }
        public static Expression Between(this MemberExpression member, ConstantExpression constant1, ConstantExpression constant2)
        {
            var left = Expression.GreaterThanOrEqual(member, constant1);
            var right = Expression.LessThanOrEqual(member, constant2);

            return Expression.AndAlso(left, right);
        }
        public static Expression<Func<T, bool>> Any<T, T2>(this MemberExpression memberExpression, object fieldValue, ParameterExpression parameterExpression)
        {
            var lambda = (Expression<Func<T2, bool>>)fieldValue;
            MethodInfo anyMethod = typeof(Enumerable).GetMethods(BindingFlags.Static | BindingFlags.Public)
            .First(m => m.Name == "Any" && m.GetParameters().Count() == 2).MakeGenericMethod(typeof(T2));

            var body = Expression.Call(anyMethod, memberExpression, lambda);

            return Expression.Lambda<Func<T, bool>>(body, parameterExpression);
        }
    }
}
