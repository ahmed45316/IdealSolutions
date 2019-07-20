using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Identity.Entities;

namespace Tenets.Identity.Data.SeedData
{
   public interface IDataInitialize
    {
        User[] AddSystemAdmin();
        Role[] AddDefaultRole();
        UsersRole[] AddUserRole();
        Menu[] addMenus();
    }
}
