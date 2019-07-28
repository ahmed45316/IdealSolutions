using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using Tenets.Common.ServicesCommon.Identity.Interface;

namespace Tenets.Identity.Services.Core
{
    public class TokenBusiness : ITokenBusiness
    {
        private readonly IConfiguration _config;
        private readonly IUserLoginReturn _userLoginReturn;
        private readonly IDecodingValidToken _decodingValidToken;

        public TokenBusiness(IConfiguration config, IUserLoginReturn userLoginReturn, IDecodingValidToken decodingValidToken)
        {
            _config = config;
            _userLoginReturn = userLoginReturn;
            _decodingValidToken = decodingValidToken;
        }

        public IUserLoginReturn GenerateJsonWebToken(IUserDto userInfo, string roles, string refreshToken = "")
        {
            var claims = new[] {
                new Claim( JwtRegisteredClaimNames.Jti,Guid.NewGuid().ToString()),
                new Claim(JwtRegisteredClaimNames.Sub, userInfo.UserName),
                new Claim("UserId", userInfo.Id.ToString()),
                new Claim("Roles", roles)
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

            _userLoginReturn.UserId = userInfo.Id??new Guid("710BDFD1-D75B-4C2F-B9E1-FEAE2B27491A");
            _userLoginReturn.RefreshToken = refreshToken;
            _userLoginReturn.TokenValidTo = token.ValidTo;

            _userLoginReturn.Token = new JwtSecurityTokenHandler().WriteToken(token);
            return _userLoginReturn;
        }


        public IDecodingValidToken GetUserDataFromToken(ControllerBase controller)
        {
            var hasValue = controller.Request.Headers.TryGetValue("Authorization", out var bearerToken);
            if (!hasValue) return null;
            var split = bearerToken.ToString().Split(' ');
            var token = split[1];
            var result = ValidateAndDecodeToken(token);
            return result;
        }
        private TokenValidationParameters TokenValidationParameters()
        {
            string secret = _config["Jwt:SecretKey"];
            var key = Encoding.ASCII.GetBytes(secret);
            return new TokenValidationParameters
            {
                // Clock skew compensates for server time drift.
                ClockSkew = TimeSpan.FromMinutes(5),
                // Specify the key used to sign the token:
                IssuerSigningKey = new SymmetricSecurityKey(key),
                ValidateIssuerSigningKey = true,
                RequireSignedTokens = true,
                // Ensure the token was issued by a trusted authorization server (default true):
                ValidIssuer = _config["Jwt:Issuer"],
                ValidateIssuer = true,
                // Ensure the token audience matches our audience value (default true):
                ValidAudience = _config["Jwt:Audience"],
                ValidateAudience = true,
                // Ensure the token hasn't expired:
                RequireExpirationTime = true,
                ValidateLifetime = true,
            };
        }

        private IDecodingValidToken ValidateAndDecodeToken(string jwtToken)
        {
            var validationParameters = TokenValidationParameters();
            var handler = new JwtSecurityTokenHandler();
            try
            {
                _decodingValidToken.ClaimsPrincipal = handler.ValidateToken(jwtToken, validationParameters, out var rawValidatedToken);

                //_decodingValidToken.JwtSecurityToken = (JwtSecurityToken)rawValidatedToken;

                return _decodingValidToken;
            }
            catch (SecurityTokenValidationException stvex)
            {
                // The token failed validation!
                // TODO: Log it or display an error.
                throw new Exception($"Token failed validation: {stvex.Message}");
            }
            catch (ArgumentException argex)
            {
                // The token was not well-formed or was invalid for some other reason.
                // TODO: Log it or display an error.
                throw new Exception($"Token was invalid: {argex.Message}");
            }
        }
    }
}
