using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using Tenets.Identity.Services.Dto;

namespace Tenets.Identity.Services.Core
{
    public class TokenBusiness : ITokenBusiness
    {
        private readonly IConfiguration _config;
        private readonly UserLoginReturn _userLoginReturn;
        public TokenBusiness(IConfiguration config)
        {
            _config = config;
            _userLoginReturn = new UserLoginReturn();
        }

        public UserLoginReturn GenerateJsonWebToken(UserDto userInfo, string role)
        {
            var claims = new[] {
                new Claim( JwtRegisteredClaimNames.Jti,Guid.NewGuid().ToString()),
                new Claim(JwtRegisteredClaimNames.Sub, userInfo.UserName),
                new Claim("UserId", userInfo.Id.ToString()),
                new Claim("BranchId", userInfo.BranchId.ToString()),
                new Claim("RepresentativeId", userInfo.RepresentativeId==null?"":userInfo.RepresentativeId.ToString()),
                new Claim("Role", role)
            };
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["Jwt:SecretKey"]));
            var expiryInHours = DateTime.Now.AddHours(Convert.ToDouble(_config["Jwt:ExpiryInHours"]));
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

            var token = new JwtSecurityToken(
                issuer: _config["Jwt:Issuer"],
                audience: _config["Jwt:Audience"],
                expires: expiryInHours,
                signingCredentials: credentials,
                claims: claims);

            _userLoginReturn.NameAr = _userLoginReturn.NameEn = userInfo.UserName;
            _userLoginReturn.UserId = userInfo.Id ?? new Guid("710BDFD1-D75B-4C2F-B9E1-FEAE2B27491A");
            _userLoginReturn.TokenValidTo = token.ValidTo;
            _userLoginReturn.RoleName = role;
            _userLoginReturn.Token = new JwtSecurityTokenHandler().WriteToken(token);
            return _userLoginReturn;
        }
    }
}
