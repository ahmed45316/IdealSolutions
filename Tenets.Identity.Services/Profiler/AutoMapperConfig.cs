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
            CreateMap<UserDto,User>().ReverseMap()
                 .ForMember(dest => dest.RolName, opt => opt.MapFrom(src => src.Role.Name))
                 .ForMember(dest => dest.Password, opt => opt.Ignore());
        }
        private void MappRole()
        {
            CreateMap<RoleDto, Role>().ReverseMap();
        }
    }
}
