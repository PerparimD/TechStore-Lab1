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

            return Ok(perdouresi);
        }
    }
    public class RoletEPerdoruesit
    {
        public Perdoruesi Perdoruesi { get; set; }
        public List<string> Rolet { get; set; }
    }
}
