using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebAPI.Models;

namespace WebAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class KodiZbritjeController : Controller
    {
        private readonly TechStoreDbContext _context;

        public KodiZbritjeController(TechStoreDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        [Route("shfaqKodet")]
        public async Task<IActionResult> Get()
        {
            var kodet = await _context.KodiZbritjes
                .OrderByDescending(x => x.DataKrijimit)
                .Select(x => new
                {
                    x.Kodi,
                    x.QmimiZbritjes,
                    x.DataKrijimit,
                    x.IdProdukti,
                    x.IdProduktiNavigation.EmriProduktit
                })
                .ToListAsync();
            return Ok(kodet);
        }
        [HttpGet]
        [Route("gjejKodin")]
        public async Task<IActionResult> Get(string kodi)
        {
            var kodiZbritjes = await _context.KodiZbritjes
                .Where(x => x.Kodi.Equals(kodi))
                .Select(x => new {
                    x.Kodi,
                    x.QmimiZbritjes,
                    x.DataKrijimit,
                    x.IdProdukti,
                    x.IdProduktiNavigation.EmriProduktit
                })
                .FirstOrDefaultAsync();

            if (kodiZbritjes == null)
            {
                return NotFound();
            }

            return Ok(kodiZbritjes);
        }


        [HttpPost]
        [Route("shtoKodin")]
        public async Task<IActionResult> Post(KodiZbritje kodiZbritjes)
        {
            await _context.KodiZbritjes.AddAsync(kodiZbritjes);
            await _context.SaveChangesAsync();

            return CreatedAtAction("Get", kodiZbritjes.Kodi, kodiZbritjes);
        }

        [HttpPut]
        [Route("perditesoTeDhenatEKodit")]
        public async Task<IActionResult> Put(String kodi, [FromBody] KodiZbritje k)
        {
            var teDhenatKodit = await _context.KodiZbritjes.FirstOrDefaultAsync(x => x.Kodi.Equals(kodi));

            if(teDhenatKodit == null)
            {
                return BadRequest("Nuk u gjet asnje kode!");
            }

            if(k.QmimiZbritjes > 0)
            {
                teDhenatKodit.QmimiZbritjes = k.QmimiZbritjes;
            }

            if (k.IdProdukti == 0)
            {
                teDhenatKodit.IdProdukti = null;
            }
            else
            {
                teDhenatKodit.IdProdukti = k.IdProdukti;
            }

            

            _context.KodiZbritjes.Update(teDhenatKodit);
            await _context.SaveChangesAsync();

            return Ok(teDhenatKodit);
        }

        [HttpDelete]
        [Route("fshijKodin")]
        public async Task<IActionResult> Delete(String kodi)
        {
            var teDhenatKodit = await _context.KodiZbritjes.FirstOrDefaultAsync(x => x.Kodi.Equals(kodi));

            _context.KodiZbritjes.Remove(teDhenatKodit);
            await _context.SaveChangesAsync();

            return NoContent();
        }
    }
}
