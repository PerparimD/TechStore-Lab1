using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebAPI.Models;

namespace WebAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class RegjistrimiStokutController : Controller
    {
        private readonly TechStoreDbContext _context;

        public RegjistrimiStokutController(TechStoreDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        [Route("shfaqRegjistrimet")]
        public async Task<IActionResult> Get()
        {
            var regjistrimet = await _context.RegjistrimiStokuts
                .Select(x => new
                {
                    x.IdRegjistrimit,
                    x.ShumaTotaleRegjistrimit,
                    x.TotaliProdukteveRegjistruara,
                    x.DataRegjistrimit,
                    x.StafiId,
                    x.Stafi.Username
                }).ToListAsync();

            return Ok(regjistrimet);
        }

        [HttpPost]
        [Route("ruajKalkulimin")]
        public async Task<IActionResult> Post(RegjistrimiStokut regjistrimet)
        {
            await _context.RegjistrimiStokuts.AddAsync(regjistrimet);
            await _context.SaveChangesAsync(); 

            return CreatedAtAction("Get", regjistrimet.IdRegjistrimit, regjistrimet);
        }

        [HttpPost]
        [Route("ruajKalkulimin/teDhenat")]
        public async Task<IActionResult> Post(TeDhenatRegjistrimit teDhenat)
        {
            await _context.TeDhenatRegjistrimits.AddAsync(teDhenat);
            await _context.SaveChangesAsync();

            return Ok();
        }
        [HttpPut]
        [Route("ruajKalkulimin/perditesoStokunQmimin")]
        public async Task<IActionResult> Put(int id, [FromBody] StokuQmimiProduktit stoku)
        {
            var produkti = await _context.StokuQmimiProduktits.FindAsync(id);
            if (produkti == null)
            {
                return NotFound();
            }

            produkti.SasiaNeStok += stoku.SasiaNeStok;
            produkti.DataPerditsimit = DateTime.Now;
            produkti.QmimiProduktit = stoku.QmimiProduktit;
            if(stoku.DataKrijimit == null) {
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
