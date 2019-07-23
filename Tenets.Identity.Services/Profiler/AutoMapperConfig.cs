using AutoMapper;
using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.ServicesCommon.Identity.Interface;
using Tenets.Identity.Entities;

namespace Tenets.Identity.Services.Profiler
{
    public class AutoMapperConfiguration : Profile
    {
        public AutoMapperConfiguration()
        {
            MappUsers();
            MappMenu();
            MappRole();
        }

        #region identity
        private void MappUsers()
        {
            CreateMap<User, IUserDto>().ReverseMap();
        }
        private void MappMenu()
        {
            CreateMap<Menu, IMenuDto>().ReverseMap();
        }
        private void MappRole()
        {
            CreateMap<Role, IRoleDto>().ReverseMap();
        }
        #endregion
    }
}
