using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebAPI.Data;
using WebAPI.Models.MbrojtjaEProjektit;

namespace WebAPI.Controllers.MbrojtjaProjektit
{
    [Authorize(AuthenticationSchemes = "Bearer")]
    [ApiController]
    [Route("api/[controller]")]
    public class Satellite212257449Controller : Controller
    {
        private readonly TechStoreDbContext _context;

        public Satellite212257449Controller(TechStoreDbContext context)
        {
            _context = context;
        }

        [AllowAnonymous]
        [HttpGet]
        [Route("ShfaqSatelitet")]
        public async Task<IActionResult> ShfaqSatelitet()
        {
            var satelitet = await _context.Satellite212257449.Include(x => x.Planet).Where(x => x.isDeleted == "false").ToListAsync();

            return Ok(satelitet);
        }

        [AllowAnonymous]
        [HttpGet]
        [Route("ShfaqSatelitinNgaID")]
        public async Task<IActionResult> ShfaqSatelitinNgaID(int SatelitiId)
        {
            var sateliti = await _context.Satellite212257449.Include(x => x.Planet).FirstOrDefaultAsync(x => x.SatelliteId == SatelitiId);

            if (sateliti == null || sateliti.isDeleted == "true")
            {
                return NotFound();
            }

            return Ok(sateliti);
        }

        [AllowAnonymous]
        [HttpPost]
        [Route("ShtoSatelitin")]
        public async Task<IActionResult> ShtoSatelitin([FromBody] Satellite212257449 sateliti)
        {
            await _context.Satellite212257449.AddAsync(sateliti);
            await _context.SaveChangesAsync();

            return CreatedAtAction("ShfaqSatelitet", sateliti.SatelliteId, sateliti);
        }

        [AllowAnonymous]
        [HttpPut]
        [Route("PerditesoSatelitin")]
        public async Task<IActionResult> PerditesoSatelitin(int SatelitiId, [FromBody] Satellite212257449 s)
        {
            var sateliti = await _context.Satellite212257449.FirstOrDefaultAsync(x => x.SatelliteId == SatelitiId);

            if (sateliti == null || sateliti.isDeleted == "true")
            {
                return NotFound();
            }

            sateliti.Name = s.Name;
            sateliti.PlanetId = s.PlanetId;

            _context.Satellite212257449.Update(sateliti);
            await _context.SaveChangesAsync();

            return Ok(sateliti);
        }

        [AllowAnonymous]
        [HttpDelete]
        [Route("FshijSatelitin")]
        public async Task<IActionResult> FshijSatelitin(int SatelitiId)
        {
            var sateliti = await _context.Satellite212257449.FirstOrDefaultAsync(x => x.SatelliteId == SatelitiId);

            if (sateliti == null || sateliti.isDeleted == "true")
            {
                return NotFound();
            }

            sateliti.isDeleted = "true";

            _context.Satellite212257449.Update(sateliti);
            await _context.SaveChangesAsync();

            return Ok();
        }
    }
}
