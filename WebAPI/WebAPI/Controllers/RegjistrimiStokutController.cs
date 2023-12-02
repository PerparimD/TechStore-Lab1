using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebAPI.Data;
using WebAPI.Models;

namespace WebAPI.Controllers
{
    [Authorize(AuthenticationSchemes = "Bearer")]
    [ApiController]
    [Route("api/[controller]")]
    public class RegjistrimiStokutController : Controller
    {
        private readonly TechStoreDbContext _context;

        public RegjistrimiStokutController(TechStoreDbContext context)
        {
            _context = context;
        }

        [Authorize(Roles = "Admin, Menaxher")]
        [HttpGet]
        [Route("shfaqRegjistrimet")]
        public async Task<IActionResult> Get()
        {
            var regjistrimet = await _context.RegjistrimiStokut
                .OrderByDescending(x => x.IdRegjistrimit)
                .Select(x => new
                {
                    x.IdRegjistrimit,
                    x.ShumaTotaleRegjistrimit,
                    x.ShumaTotaleBlerese,
                    x.TotaliProdukteveRegjistruara,
                    x.DataRegjistrimit,
                    x.StafiId,
                    x.Stafi.Username
                }).ToListAsync();

            return Ok(regjistrimet);
        }

        [Authorize(Roles = "Admin, Menaxher")]
        [HttpGet]
        [Route("shfaqRegjistrimetNgaID")]
        public async Task<IActionResult> GetRegjistrimin(int id)
        {
            var regjistrimet = await _context.RegjistrimiStokut
                .Select(x => new
                {
                    x.IdRegjistrimit,
                    x.ShumaTotaleRegjistrimit,
                    x.ShumaTotaleBlerese,
                    x.TotaliProdukteveRegjistruara,
                    x.DataRegjistrimit,
                    x.StafiId,
                    x.Stafi.Username
                }).FirstOrDefaultAsync(x => x.IdRegjistrimit == id);

            return Ok(regjistrimet);
        }

        [Authorize(Roles = "Admin, Menaxher")]
        [HttpGet]
        [Route("shfaqTeDhenatKalkulimit")]
        public async Task<IActionResult> Get(int idRegjistrimit)
        {
            var teDhenat = await _context.TeDhenatRegjistrimit
                .Where(x => x.IdRegjistrimit == idRegjistrimit)
                .Select(x => new
                {
                    x.IdRegjistrimit,
                    x.IdProduktit,
                    x.Produkti.EmriProduktit,
                    x.SasiaStokut,
                    x.QmimiBleres,
                    x.QmimiShites
                })
               .ToListAsync();

            return Ok(teDhenat);
        }

        [Authorize(Roles = "Admin, Menaxher")]
        [HttpPost]
        [Route("ruajKalkulimin")]
        public async Task<IActionResult> Post(RegjistrimiStokut regjistrimet)
        {
            await _context.RegjistrimiStokut.AddAsync(regjistrimet);
            await _context.SaveChangesAsync();

            return CreatedAtAction("Get", regjistrimet.IdRegjistrimit, regjistrimet);
        }

        [Authorize(Roles = "Admin, Menaxher")]
        [HttpPost]
        [Route("ruajKalkulimin/teDhenat")]
        public async Task<IActionResult> Post(TeDhenatRegjistrimit teDhenat)
        {
            await _context.TeDhenatRegjistrimit.AddAsync(teDhenat);
            await _context.SaveChangesAsync();

            return Ok();
        }

        [Authorize(Roles = "Admin, Menaxher")]
        [HttpPut]
        [Route("ruajKalkulimin/perditesoStokunQmimin")]
        public async Task<IActionResult> Put(int id, [FromBody] StokuQmimiProduktit stoku)
        {
            var produkti = await _context.StokuQmimiProduktit.FindAsync(id);
            if (produkti == null)
            {
                return NotFound();
            }

            produkti.SasiaNeStok += stoku.SasiaNeStok;
            produkti.DataPerditsimit = DateTime.Now;
            produkti.QmimiProduktit = stoku.QmimiProduktit;
            produkti.QmimiBleres = stoku.QmimiBleres;
            if (stoku.DataKrijimit == null)
            {
                produkti.DataKrijimit = produkti.DataKrijimit;
            }

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                throw;
            }

            return NoContent();
        }
    }
}
