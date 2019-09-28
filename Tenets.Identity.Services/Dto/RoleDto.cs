using System;
using Tenets.Common.Core;

namespace Tenets.Identity.Services.Dto
{
    public class RoleDto : IPrimaryKeyField<Guid?>
    {
        public Guid? Id { get; set; }
        public string Name { get; set; }
    }
}
