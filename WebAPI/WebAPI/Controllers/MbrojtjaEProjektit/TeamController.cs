using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebAPI.Data;
using WebAPI.Models;
using WebAPI.Models.MbrojtjaEProjektit;

namespace WebAPI.Controllers.MbrojtjaProjektit
{

    [Authorize(AuthenticationSchemes = "Bearer")]
    [ApiController]
    [Route("api/[controller]")]
    public class TeamController : Controller
    {
        private readonly TechStoreDbContext _context;

        public TeamController(TechStoreDbContext context)
        {
            _context = context;
        }

        [AllowAnonymous]
        [HttpGet]
        [Route("ShfaqEkipet")]
        public async Task<IActionResult> ShfaqEkipet()
        {
            var ekipet = await _context.Team.ToListAsync();

            return Ok(ekipet);
        }

        [AllowAnonymous]
        [HttpGet]
        [Route("ShfaqEkipinNgaID")]
        public async Task<IActionResult> ShfaqEkipinNgaID(int TeamId)
        {
            var ekipi = await _context.Team.FirstOrDefaultAsync(x => x.TeamId == TeamId);

            if (ekipi == null)
            {
                return NotFound();
            }

            return Ok(ekipi);
        }

        [AllowAnonymous]
        [HttpPost]
        [Route("ShtoEkipin")]
        public async Task<IActionResult> ShtoEkipin([FromBody] Team ekipa)
        {
            await _context.Team.AddAsync(ekipa);
            await _context.SaveChangesAsync();

            return CreatedAtAction("ShfaqEkipet", ekipa.TeamId, ekipa);
        }

        [AllowAnonymous]
        [HttpPut]
        [Route("PerditesoEkipen")]
        public async Task<IActionResult> PerditesoEkipen(int TeamId, [FromBody] Team t)
        {
            var ekipa = await _context.Team.FirstOrDefaultAsync(x => x.TeamId == TeamId);

            if (ekipa == null)
            {
                return NotFound();
            }

            ekipa.Name = t.Name;

            _context.Team.Update(ekipa);
            await _context.SaveChangesAsync();

            return Ok(ekipa);
        }

        [AllowAnonymous]
        [HttpDelete]
        [Route("FshijEkipen")]
        public async Task<IActionResult> FshijEkipen(int TeamId)
        {
            var ekipa = await _context.Team.FirstOrDefaultAsync(x => x.TeamId == TeamId);

            if (ekipa == null)
            {
                return NotFound();
            }

            _context.Team.Remove(ekipa);
            await _context.SaveChangesAsync();

            return Ok();
        }
    }
}
