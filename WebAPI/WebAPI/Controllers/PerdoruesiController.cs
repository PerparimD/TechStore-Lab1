using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using WebAPI.Models;

namespace WebAPI.Controllers
{
    [Authorize(AuthenticationSchemes = "Bearer")]
    [ApiController]
    [Route("api/[controller]")]
    public class PerdoruesiController : Controller
    {
        private readonly TechStoreDbContext _context;
        private readonly UserManager<IdentityUser> _userManager;

        public PerdoruesiController(
            TechStoreDbContext context, 
            UserManager<IdentityUser> userManager)
        {
            _context = context;
            _userManager = userManager;
        }

        [Authorize(Roles = "Admin, Menaxher")]
        [HttpGet]
        [Route("shfaqPerdoruesit")]
        public async Task<IActionResult> Get()
        {
            var perdoruesit = await _context.Perdoruesis
                .Include(p => p.TeDhenatPerdoruesit)
                .ToListAsync();

            var perdoruesiList = new List<RoletEPerdoruesit>();

            foreach (var perdoruesi in perdoruesit)
            {
                var user = await _userManager.FindByIdAsync(perdoruesi.AspNetUserId);
                var roles = await _userManager.GetRolesAsync(user);

                var roletEPerdoruesit = new RoletEPerdoruesit
                {
                    Perdoruesi = perdoruesi,
                    Rolet = roles.ToList()
                };

                perdoruesiList.Add(roletEPerdoruesit);
            }

            return Ok(perdoruesiList);
        }

        [AllowAnonymous]
        [HttpGet]
        [Route("shfaqSipasID")]
        public async Task<IActionResult> GetbyId(string idUserAspNet)
        {
            var user = await _userManager.FindByIdAsync(idUserAspNet);

            var perdoruesi = await _context.Perdoruesis
                .Include(p => p.TeDhenatPerdoruesit)
                .FirstOrDefaultAsync(x => x.AspNetUserId.Equals(idUserAspNet));

            var rolet = await _userManager.GetRolesAsync(user);

            var result = new
            {
                perdoruesi,
                rolet
            };

            return Ok(result);
        }

        [Authorize(Roles = "Admin, Menaxher, User")]
        [HttpPut]
        [Route("perditesoPerdorues/{id}")]
        public async Task<IActionResult> Put(int id, [FromBody] Perdoruesi p)
        {
            var perdouresi = await _context.Perdoruesis.FirstOrDefaultAsync(x => x.UserId == id);

            if (perdouresi == null)
            {
                return BadRequest("Perdoruesi nuk ekziston");
            }

            if (!p.Email.IsNullOrEmpty())
            {
                perdouresi.Email = p.Email;
            }
            if (!p.Emri.IsNullOrEmpty())
            {
                perdouresi.Emri = p.Emri;
            }
            if (!p.Mbiemri.IsNullOrEmpty())
            {
                perdouresi.Mbiemri = p.Mbiemri;
            }

            _context.Perdoruesis.Update(perdouresi);
            await _context.SaveChangesAsync();

            var teDhenatUser = await _context.TeDhenatPerdoruesits.FirstOrDefaultAsync(x => x.UserId == id);

            if (!p.TeDhenatPerdoruesit.Qyteti.IsNullOrEmpty())
            {
                teDhenatUser.Qyteti = p.TeDhenatPerdoruesit.Qyteti;
            }
            if (!p.TeDhenatPerdoruesit.Shteti.IsNullOrEmpty())
            {
                teDhenatUser.Shteti = p.TeDhenatPerdoruesit.Shteti;
            }
            if (!p.TeDhenatPerdoruesit.Adresa.IsNullOrEmpty())
            {
                teDhenatUser.Adresa = p.TeDhenatPerdoruesit.Adresa;
            }
            if (p.TeDhenatPerdoruesit.ZipKodi > 0)
            {
                teDhenatUser.ZipKodi = p.TeDhenatPerdoruesit.ZipKodi;
            }
            if (!p.TeDhenatPerdoruesit.NrKontaktit.IsNullOrEmpty())
            {
                teDhenatUser.NrKontaktit = p.TeDhenatPerdoruesit.NrKontaktit;
            }

            _context.TeDhenatPerdoruesits.Update(teDhenatUser);
            await _context.SaveChangesAsync();

            return Ok(perdouresi);
        }

        [Authorize(Roles = "Admin, Menaxher, User")]
        [HttpGet]
        [Route("KontrolloEmail")]
        public async Task<IActionResult> KontrolloEmail(string email)
        {
            var perdoruesi = await _userManager.FindByEmailAsync(email);

            var emailIPerdorur = false;

            if(perdoruesi != null)
            {
                emailIPerdorur = true;
            }


            return Ok(emailIPerdorur);
        }

        [Authorize(Roles = "Admin, Menaxher, User")]
        [HttpPost]
        [Route("NdryshoEmail")]
        public async Task<IActionResult> NdryshoEmail(string emailIVjeter, string emailIRI)
        {
            var perdoruesi = await _userManager.FindByEmailAsync(emailIVjeter);

            if (perdoruesi == null)
            {
                return BadRequest("Perdoreusi nuk egziston");
            }

            var tokeniPerNderrimEmail = await _userManager.GenerateChangeEmailTokenAsync(perdoruesi, emailIRI);

            var emailINdryshuar = await _userManager.ChangeEmailAsync(perdoruesi, emailIRI, tokeniPerNderrimEmail);

            if (!emailINdryshuar.Succeeded)
            {
                return BadRequest("Ndodhi nje gabim gjate perditesimit te email");
            }


            return Ok(emailINdryshuar);
        }

        [Authorize(Roles = "Admin, Menaxher, User")]
        [HttpGet]
        [Route("KontrolloFjalekalimin")]
        public async Task<IActionResult> KontrolloFjalekalimin(string AspNetID, string fjalekalimi)
        {
            var perdoruesi = await _userManager.FindByIdAsync(AspNetID);

            var kontrolloFjalekalimin = await _userManager.CheckPasswordAsync(perdoruesi, fjalekalimi);

            return Ok(kontrolloFjalekalimin);
        }

        [Authorize(Roles = "Admin, Menaxher, User")]
        [HttpPost]
        [Route("NdryshoFjalekalimin")]
        public async Task<IActionResult> NdryshoFjalekalimin(string AspNetID, string fjalekalimiAktual, string fjalekalimiIRi)
        {
            var perdoruesi = await _userManager.FindByIdAsync(AspNetID);


            if (perdoruesi == null)
            {
                return BadRequest("Perdoreusi nuk egziston");
            }

            var passwodiINdryshuar = await _userManager.ChangePasswordAsync(perdoruesi, fjalekalimiAktual, fjalekalimiIRi);

            if (!passwodiINdryshuar.Succeeded)
            {
                return BadRequest("Ndodhi nje gabim gjate perditesimit te fjalekalimit");
            }


            return Ok(passwodiINdryshuar);
        }
    }
    public class RoletEPerdoruesit
    {
        public Perdoruesi Perdoruesi { get; set; }
        public List<string> Rolet { get; set; }
    }
}
