using AutoMapper;
using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Identity.Entities;
using Tenets.Identity.Services.Dto;

namespace Tenets.Identity.Services.Profiler
{
    public class AutoMapperConfiguration : Profile
    {
        public AutoMapperConfiguration()
        {
            MappRole();
            MappUsers();
        }

        private void MappUsers()
        {
            CreateMap<User, UserDto>().ReverseMap();
        }
        private void MappRole()
        {
            CreateMap<Role, RoleDto>().ReverseMap();
        }
    }
}
