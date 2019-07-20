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
                new Role{ Id = "c21c91c0-5c2f-45cc-ab6d-1d256538a5ee",
                Name = "Administrator",
                IsBlock = false,
                IsDeleted = false
                },
            });
            return rolesList.ToArray();
        }

        public Menu[] addMenus()
        {
            var menuList = new List<Menu>();
            menuList.AddRange(new[] {
                new Menu{Id = "menu-1",
                ScreenNameAr = "الشاشة الرئيسية",
                ScreenNameEn="Main Screen",
                Controller= "Home",
                Action= "index",
                ItsOrder=1,
                Icon= "icon-home"
                },
                new Menu{ Id = "menu-2",
                ScreenNameAr = "الصلاحيات",
                ScreenNameEn = "Authentication",
                ItsOrder = 2,
                Icon = "fas fa-address-card"
                },
                new Menu{ Id = "menu-7",
                ScreenNameAr = "الدور الوظيفي",
                ScreenNameEn = "Roles",
                Controller = "Security",
                Action = "ManageRoles",
                ItsOrder = 7,
                ParentId= "menu-2",
                Icon = "icon-user"
                },
                new Menu{Id = "menu-8",
                ScreenNameAr = "المستخدمين",
                ScreenNameEn = "Users",
                Controller = "Security",
                Action = "Users",
                ItsOrder = 8,
                ParentId = "menu-2",
                Icon = "icon-user"}
            });
            return menuList.ToArray();
        }

        public User[] AddSystemAdmin()
        {
            var usersList = new List<User>();
            usersList.AddRange(new[] {
                new User{ Id = "c21c91c0-5c2f-45cc-ab6d-1d256538a4ee",
                  SecurityStamp = Guid.NewGuid().ToString(),
                  UserName = "admin",
                  PasswordHash = "ALQ9yNzGkKdXRP8gdol1whMNSIZAlmjXpF6SNHELSKf0N6+aZs24+5h8B4OzpBWrIw==",
                  Email = "admin@A3n.com",
                  PhoneNumber = "+9",
                  IsDeleted = false,
                  UserStatus=1
                },
            });
            return usersList.ToArray();
        }

        public UsersRole[] AddUserRole()
        {
            var userRoleList = new List<UsersRole>();
            userRoleList.AddRange(new[] {
                new UsersRole{ Id = "c21c91c0-5c2f-45cc-ab6d-1d256538a6ee",
                RoleId = "c21c91c0-5c2f-45cc-ab6d-1d256538a5ee",
                UserId = "c21c91c0-5c2f-45cc-ab6d-1d256538a4ee",
                IsBlock = false,
                IsDeleted = false
                },
            });
            return userRoleList.ToArray();
        }
    }
}
