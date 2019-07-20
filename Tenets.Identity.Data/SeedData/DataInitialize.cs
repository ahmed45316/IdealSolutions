using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Identity.Entities;

namespace Tenets.Identity.Data.SeedData
{
    public class DataInitialize : IDataInitialize
    {
        public Role[] AddDefaultRole()
        {
            var rolesList = new List<Role>();
            rolesList.AddRange(new[] {
                new Role{ Id = new Guid("c21c91c0-5c2f-45cc-ab6d-1d256538a5ee"),
                Name = "Administrator",
                IsDeleted = false
                },
            });
            return rolesList.ToArray();
        }

        public Menu[] addMenus()
        {
            var menuList = new List<Menu>();
            menuList.AddRange(new[] {
                new Menu{Id = new Guid("c11c91c0-5c2f-45cc-ab6d-1d256538a5ee"),
                ScreenNameAr = "الشاشة الرئيسية",
                ScreenNameEn="Main Screen",
                Controller= "Home",
                Action= "index",
                ItsOrder=1,
                Icon= "icon-home"
                },
                new Menu{ Id = new Guid("c12c91c0-5c2f-45cc-ab6d-1d256538a5ee"),
                ScreenNameAr = "الصلاحيات",
                ScreenNameEn = "Authentication",
                ItsOrder = 2,
                Icon = "fas fa-address-card"
                },
                new Menu{ Id = new Guid("c13c91c0-5c2f-45cc-ab6d-1d256538a5ee"),
                ScreenNameAr = "الدور الوظيفي",
                ScreenNameEn = "Roles",
                Controller = "Security",
                Action = "ManageRoles",
                ItsOrder = 7,
                ParentId= new Guid("c12c91c0-5c2f-45cc-ab6d-1d256538a5ee"),
                Icon = "icon-user"
                },
                new Menu{Id = new Guid("c14c91c0-5c2f-45cc-ab6d-1d256538a5ee"),
                ScreenNameAr = "المستخدمين",
                ScreenNameEn = "Users",
                Controller = "Security",
                Action = "Users",
                ItsOrder = 8,
                ParentId = new Guid("c12c91c0-5c2f-45cc-ab6d-1d256538a5ee"),
                Icon = "icon-user"}
            });
            return menuList.ToArray();
        }

        public User[] AddSystemAdmin()
        {
            var usersList = new List<User>();
            usersList.AddRange(new[] {
                new User{ Id = new Guid("c21c91c0-5c2f-45cc-ab6d-1d256538a4ee"),
                  SecurityStamp = Guid.NewGuid().ToString(),
                  UserName = "admin",
                  PasswordHash = "ALQ9yNzGkKdXRP8gdol1whMNSIZAlmjXpF6SNHELSKf0N6+aZs24+5h8B4OzpBWrIw==",
                  Email = "admin@A3n.com",
                  PhoneNumber = "+9",
                  IsDeleted = false
                },
            });
            return usersList.ToArray();
        }

        public UsersRole[] AddUserRole()
        {
            var userRoleList = new List<UsersRole>();
            userRoleList.AddRange(new[] {
                new UsersRole{ Id = new Guid("c21c91c0-5c2f-45cc-ab6d-1d256538a6ee"),
                RoleId = new Guid("c21c91c0-5c2f-45cc-ab6d-1d256538a5ee"),
                UserId = new Guid("c21c91c0-5c2f-45cc-ab6d-1d256538a4ee"),
                IsDeleted = false
                },
            });
            return userRoleList.ToArray();
        }
    }
}
