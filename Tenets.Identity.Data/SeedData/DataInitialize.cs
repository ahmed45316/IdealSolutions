using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.Hasher;
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
                Name = "SuperAdmin",
                IsDeleted = false
                },
                new Role{ Id = new Guid("c31c91c0-5c2f-45cc-ab6d-1d256538a6ee"),
                Name = "Admin",
                IsDeleted = false
                },
                new Role{ Id = new Guid("c41c91c0-5c2f-45cc-ab6d-1d256538a7ee"),
                Name = "User",
                IsDeleted = false
                }
            });
            return rolesList.ToArray();
        }

        public User[] AddSystemAdmin()
        {
            var usersList = new List<User>();
            usersList.AddRange(new[] {
                new User{ Id = new Guid("c21c91c0-5c2f-45cc-ab6d-1d256538a4ee"),
                  UserName = "admin",
                  Password =CreptoHasher.HashPassword("123456"),
                  Email = "admin@A3n.com",
                  PhoneNumber = "+9",
                  RoleId=new Guid("c21c91c0-5c2f-45cc-ab6d-1d256538a5ee"),
                  IsDeleted = false
                },
            }); ;
            return usersList.ToArray();
        }
        
    }
}
