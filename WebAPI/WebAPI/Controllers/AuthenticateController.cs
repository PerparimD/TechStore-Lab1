using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Identity;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using WebAPI.Auth;
using WebAPI.Configurations;
using WebAPI.Models;
using System.Net.Sockets;

namespace WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthenticateController : ControllerBase
    {
        private readonly UserManager<IdentityUser>  _userManager;
        /*private readonly JwtConfig _jwtConfig;*//**/
        private readonly IConfiguration _configuration;
        private readonly TechStoreDbContext _context;


        public AuthenticateController(
            UserManager<IdentityUser> userManager,
            IConfiguration configuration
            /*JwtConfig jwtConfig*/)
        {
            _userManager = userManager; 
            /*_jwtConfig = jwtConfig;*/
            _configuration = configuration;
        }

      

        [HttpPost]
        [Route("register")]
        public async Task<IActionResult> Register([FromBody] RegisterModel registerModel)
        {
            if (ModelState.IsValid)
            {
                var user_exit = await _userManager.FindByEmailAsync(registerModel.Email);

                if (user_exit != null)
                {
                    return BadRequest(new AuthResults()
                    {
                        Result = false,
                        Errors = new List<string>()
                        {
                            "Email already exists"
                        }
                    });
                }

                var new_user = new IdentityUser()
                {
                    Email = registerModel.Email,
                    UserName = registerModel.Email
                };

                var is_created = await _userManager.CreateAsync(new_user, registerModel.Password);

                if (is_created.Succeeded)
                {
                    var token = GenerateJwtToken(new_user);

                    return Ok(new AuthResults()
                    {
                        Result = true,
                        Token = token
                    });
                }
                return BadRequest(new AuthResults()
                {
                    Errors = new List<string>
                    {
                        "Server Errors"
                    },
                    Result = false
                });

            }
            return BadRequest();
        }

        [HttpPost]
        [Route("login")]
        public async Task<IActionResult> Login([FromBody] LogInModel login)
        {
            if (ModelState.IsValid)
            {
                var useri_ekziston = await _userManager.FindByEmailAsync(login.Email);

                if(useri_ekziston == null)
                {
                    return BadRequest(new AuthResults()
                    {
                        Errors = new List<string>()
                        {
                            "Inavlid Payload"
                        },
                        Result = false
                    });
                }

                var neRregull = await _userManager.CheckPasswordAsync(useri_ekziston, login.Password);

                if (!neRregull)
                {
                    return BadRequest(new AuthResults()
                    {
                        Errors = new List<string>()
                        {
                            "Invalid Credintials"
                        },
                        Result = false
                    });
                }

                var jwtToken = GenerateJwtToken(useri_ekziston);

                return Ok(new AuthResults()
                {
                    Token = jwtToken,
                    Result = true
                });
            }

            return BadRequest(new AuthResults()
            {
                Errors = new List<String>()
                {
                    "Inavlid Payload"
                }
            });
        }

        private string GenerateJwtToken(IdentityUser user)
        {
            var jwtTokenHandler = new JwtSecurityTokenHandler();

            var key = Encoding.UTF8.GetBytes(_configuration.GetSection("JwtConfig:Secret").Value);

            // Token descriptor
            var TokenDescriptor = new SecurityTokenDescriptor()
            {
                Subject = new ClaimsIdentity(new[]
                {
                    new Claim("id", user.Id),
                    new Claim(JwtRegisteredClaimNames.Sub, user.Email),
                    new Claim(JwtRegisteredClaimNames.Email, value:user.Email),
                    new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
                    new Claim(JwtRegisteredClaimNames.Iat, DateTime.Now.ToUniversalTime().ToString())
                }),

                Expires = DateTime.Now.AddHours(1),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256)
            };

            var token = jwtTokenHandler.CreateToken(TokenDescriptor);
            var jwtToken = jwtTokenHandler.WriteToken(token);

            return jwtToken;
        }

    }

}
