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
    public class Planet212257449Controller : Controller
    {
        private readonly TechStoreDbContext _context;

        public Planet212257449Controller(TechStoreDbContext context)
        {
            _context = context;
        }

        [AllowAnonymous]
        [HttpGet]
        [Route("ShfaqPlanetet")]
        public async Task<IActionResult> ShfaqPlanete()
        {
            var planetet = await _context.Planet212257449.Where(x => x.isDeleted == "false").ToListAsync();

            return Ok(planetet);
        }

        [AllowAnonymous]
        [HttpGet]
        [Route("ShfaqPlanetinNgaID")]
        public async Task<IActionResult> ShfaqPlanetinNgaID(int PlanetiId)
        {
            var planeti = await _context.Planet212257449.FirstOrDefaultAsync(x => x.PlanetId == PlanetiId);

            if (planeti == null || planeti.isDeleted == "true")
            {
                return NotFound();
            }

            return Ok(planeti);
        }

        [AllowAnonymous]
        [HttpPost]
        [Route("ShtoPlanetin")]
        public async Task<IActionResult> Post([FromBody] Planet212257449 planeti)
        {
            await _context.Planet212257449.AddAsync(planeti);

            await _context.SaveChangesAsync();

            return CreatedAtAction("ShfaqPlanete", planeti.PlanetId, planeti);
        }

        [AllowAnonymous]
        [HttpPut]
        [Route("PerditesoPlanetin")]
        public async Task<IActionResult> PerditesoPlanetin(int PlanetiId, [FromBody] Planet212257449 p)
        {
            var planeti = await _context.Planet212257449.FirstOrDefaultAsync(x => x.PlanetId == PlanetiId);

            if (planeti == null || planeti.isDeleted == "true")
            {
                return NotFound();
            }

            planeti.Name = p.Name;
            planeti.Type = p.Type;

            _context.Planet212257449.Update(planeti);
            await _context.SaveChangesAsync();

            return Ok(planeti);
        }

        [AllowAnonymous]
        [HttpDelete]
        [Route("FshijPlanetin")]
        public async Task<IActionResult> FshijPlanetin(int PlanetiId)
        {
            var planeti = await _context.Planet212257449.FirstOrDefaultAsync(x => x.PlanetId == PlanetiId);

            if (planeti == null || planeti.isDeleted == "true")
            {
                return NotFound();
            }

            planeti.isDeleted = "true";

            _context.Planet212257449.Update(planeti);
            await _context.SaveChangesAsync();

            var satelitet = await _context.Satellite212257449.Where(x => x.PlanetId == planeti.PlanetId).ToListAsync();

            foreach (var sateliti in satelitet)
            {
                if (sateliti.isDeleted == "false")
                {
                    sateliti.isDeleted = "true";

                    _context.Satellite212257449.Update(sateliti);
                    await _context.SaveChangesAsync();
                }
            }

            return Ok();
        }
    }
}
