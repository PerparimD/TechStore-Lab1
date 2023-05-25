using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Identity;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using WebAPI.Auth;
using WebAPI.Models;

namespace WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthenticateController : ControllerBase
    {
        private readonly UserManager<IdentityUser> _userManager;
        private readonly IConfiguration _configuration;
        private readonly TechStoreDbContext _context;
        private readonly RoleManager<IdentityRole> _roleManager;

        public AuthenticateController(
            UserManager<IdentityUser> userManager,
           RoleManager<IdentityRole> roleManager,
            IConfiguration configuration,
            TechStoreDbContext context)
        {
            _userManager = userManager; 
            _roleManager = roleManager;
            _configuration = configuration;
            _context = context;
        }

        [HttpPost]
        [Route("register")]
        public async Task<IActionResult> Register([FromBody] RegisterModel registerModel)
        {
            if (ModelState.IsValid)
            {
                var perdoruesiEkziston = await _userManager.FindByEmailAsync(registerModel.Email);

                if (perdoruesiEkziston != null)
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

                var perdoruesiIRI = new IdentityUser()
                {
                    Email = registerModel.Email,
                    UserName = registerModel.Username,
                    PhoneNumber = registerModel.NrTelefonit,
                };

                var shtuarMeSukses = await _userManager.CreateAsync(perdoruesiIRI, registerModel.Password);

                if (shtuarMeSukses.Succeeded)
                {
                    await _userManager.AddToRoleAsync(perdoruesiIRI, "User");

                    Perdoruesi perdoruesi = new Perdoruesi
                    {
                        AspNetUserId = perdoruesiIRI.Id,
                        Emri = registerModel.Name,
                        Username = perdoruesiIRI.UserName,
                        Email = perdoruesiIRI.Email,
                        Mbiemri = registerModel.LastName,
                    };
                    await _context.Perdoruesis.AddAsync(perdoruesi);
                    await _context.SaveChangesAsync();

                    TeDhenatPerdoruesit teDhenatPerdoruesit = new TeDhenatPerdoruesit
                    {
                        UserId = perdoruesi.UserId,
                        Adresa = !registerModel.Adresa.IsNullOrEmpty() ? registerModel.Adresa : null,
                        Qyteti = !registerModel.Qyteti.IsNullOrEmpty() ? registerModel.Qyteti : null,
                        Shteti = !registerModel.Shteti.IsNullOrEmpty() ? registerModel.Shteti : null,
                        ZipKodi = registerModel.ZipKodi > 0 ? registerModel.ZipKodi : 0,
                        NrKontaktit = !registerModel.NrTelefonit.IsNullOrEmpty() ? registerModel.NrTelefonit : null
                    };
                    await _context.TeDhenatPerdoruesits.AddAsync(teDhenatPerdoruesit);
                    await _context.SaveChangesAsync();

                    return Ok(new AuthResults()
                    {
                        Result = true
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

                var roles = await _userManager.GetRolesAsync(useri_ekziston);

                var jwtToken = GenerateJwtToken(useri_ekziston, roles);

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

        [HttpPost]
        [Route("shtoRolinPerdoruesit")]
        public async Task<IActionResult> PerditesoAksesin(string userID, string roli)
        {
            var user = await _userManager.FindByIdAsync(userID);

            if (user == null)
            {
                return BadRequest(new AuthResults
                {
                    Errors = new List<string> { "Perdoruesi nuk ekziston!" }
                });
            }

            var perditesoAksesin = await _userManager.AddToRoleAsync(user, roli);

            if (perditesoAksesin.Succeeded)
            {
                var roles = await _userManager.GetRolesAsync(user);
                var jwtToken = GenerateJwtToken(user, roles);

                return Ok(new AuthResults
                {
                    Token = jwtToken,
                    Result = true
                });
            }
            else if (await _userManager.IsInRoleAsync(user, roli))
            {
                return BadRequest(new AuthResults
                {
                    Errors = new List<string> { "Ky perdorues e ka kete role!" }
                });
            }
            else
            {
                return BadRequest(new AuthResults
                {
                    Errors = new List<string> { "Ndodhi nje gabim gjate perditesimit te Aksesit" }
                });
            }
        }

        [HttpDelete]
        [Route("FshijRolinUserit")]
        public async Task<IActionResult> FshijRolinUserit(string userID, string roli)
        {
            var perdoruesi = await _userManager.FindByIdAsync(userID);

            if(perdoruesi == null)
            {
                return BadRequest(new AuthResults
                {
                    Errors = new List<string> { "Ky perdorues nuk egziston" }
                });
            }
            else
            {
                var ekzistonRoli = await _roleManager.FindByNameAsync(roli);

                if(ekzistonRoli != null)
                {
                    var eKaRolin = await _userManager.IsInRoleAsync(perdoruesi, roli);

                    if (eKaRolin == false)
                    {
                        await _userManager.RemoveFromRoleAsync(perdoruesi, roli);

                        return Ok(new AuthResults
                        {
                            Result = true
                        });
                    }
                }
                else
                {
                    return BadRequest(new AuthResults
                    {
                        Errors = new List<string> { "Ky role nuk egziston" }
                    });
                }

                return BadRequest(new AuthResults
                {
                    Errors = new List<string> { "Ndodhi nje gabim!" }
                });
            }

            
        }

        [HttpPost]
        [Route("shtoRolin")]
        public async Task<IActionResult> ShtoRolin(string roli)
        {
            var ekziston = await _roleManager.FindByNameAsync(roli);

            if (ekziston != null)
            {
                return BadRequest(new AuthResults
                {
                    Errors = new List<string> { "Ky role tashme Egziston!" }
                });
            }
            else
            {
                var role = new IdentityRole(roli); 
                var result = await _roleManager.CreateAsync(role); 

                if (result.Succeeded)
                {
                    return Ok(new AuthResults
                    {
                        Result = true
                    });
                }
                else
                {
                    return BadRequest(new AuthResults
                    {
                        Errors = new List<string> { "Ndodhi nje gabim gjate shtimit te rolit" }
                    });
                }
            }
        }

        [HttpDelete]
        [Route("fshijRolin")]
        public async Task<IActionResult> FshijRolet(string emriRolit)
        {
            var roliEkziston = await _roleManager.FindByNameAsync(emriRolit);

            if (roliEkziston != null)
            {
                var roliUFshi = await _roleManager.DeleteAsync(roliEkziston);

                if(roliUFshi.Succeeded)
                {
                    return Ok(new AuthResults { Result = true });
                }
                else
                {
                    return BadRequest(new AuthResults
                    {
                        Errors = new List<string> { "Ndodhi nje gabim gjate fshirjes" }
                    });
                }
            }
            else
            {
                return BadRequest(new AuthResults
                {
                    Errors = new List<string> { "Ky Rol nuk egziston" }
                });
            }
        }


        private string GenerateJwtToken(IdentityUser user, IList<string> roles)
        {
            var jwtTokenHandler = new JwtSecurityTokenHandler();

            var key = Encoding.UTF8.GetBytes(_configuration.GetSection("JwtConfig:Secret").Value);

            // Token descriptor
            var TokenDescriptor = new SecurityTokenDescriptor()
            {
                
                Subject = new ClaimsIdentity(new[]
                {
                    new Claim("id", user.Id),
                    new Claim("id", user.Id),
                    new Claim(JwtRegisteredClaimNames.Sub, user.Email),
                    new Claim(JwtRegisteredClaimNames.Email, value:user.Email),
                    new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
                    new Claim(JwtRegisteredClaimNames.Iat, DateTime.Now.ToUniversalTime().ToString())
                }),

                Expires = DateTime.Now.AddDays(1).AddHours(12),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256)
            };

            foreach (var role in roles)
            {
                TokenDescriptor.Subject.AddClaim(new Claim(ClaimTypes.Role, role));
            }

            var token = jwtTokenHandler.CreateToken(TokenDescriptor);
            var jwtToken = jwtTokenHandler.WriteToken(token);

            return jwtToken;
        }

    }

}
