using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using WebAPI.Models;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory.Database;

namespace TechStoreWebAPI.Controllers
{
    [Authorize(AuthenticationSchemes = "Bearer")]
    [ApiController]
    [Route("api/[controller]")]
    public class ProduktiController : Controller
    {
        private readonly TechStoreDbContext _context;

        public ProduktiController(TechStoreDbContext context)
        {
            _context = context;
        }

        [AllowAnonymous]
        [HttpGet]
        [Route("Products")]
        public async Task<ActionResult> Get()
        {

            var Produkti = await _context.Produktis
               .OrderByDescending(x => x.ProduktiId)
               .Select(x => new {
                   x.ProduktiId,
                   x.EmriProduktit,
                   x.Pershkrimi,
                   x.FotoProduktit,
                   x.KategoriaId,
                   x.Kategoria.LlojiKategoris,
                   x.KompaniaId,
                   x.Kompania.EmriKompanis,
                   x.StokuQmimiProduktit.SasiaNeStok,
                   x.StokuQmimiProduktit.QmimiProduktit,
                   x.StokuQmimiProduktit.QmimiBleres,
                   x.ZbritjaQmimitProduktit.QmimiMeZbritjeProduktit
               })
               .ToListAsync();

            //var produktet = await _context.Produktis.ToListAsync();
            return Ok(Produkti);
        }

        [AllowAnonymous]
        [HttpGet("{id}")]
        public async Task<ActionResult> GetById(int id)
        {
            var produkti = await _context.Produktis
                .Include(p => p.Kompania)
                .Include(p => p.Kategoria)
                .Include(p => p.StokuQmimiProduktit)
                .Where(p => p.ProduktiId == id)
                .Select(p => new {
                    p.ProduktiId,
                    p.EmriProduktit,
                    p.Pershkrimi,
                    p.FotoProduktit,
                    p.KompaniaId,
                    p.Kompania.EmriKompanis,
                    p.KategoriaId,
                    p.Kategoria.LlojiKategoris,
                    p.StokuQmimiProduktit.SasiaNeStok,
                    p.StokuQmimiProduktit.QmimiBleres,
                    p.StokuQmimiProduktit.QmimiProduktit,
                    p.ZbritjaQmimitProduktit.QmimiMeZbritjeProduktit
                })
                .FirstOrDefaultAsync();

            if (produkti == null)
            {
                return NotFound();
            }

            return Ok(produkti);
        }

        [AllowAnonymous]
        [HttpGet]
        [Route("15ProduktetMeTeFundit")]
        public async Task<IActionResult> Get15Produkte()
        {
            var Kthe15TeFundit = await _context.Produktis
                .OrderByDescending(x => x.ProduktiId)
                .Take(15)
                .Select(x => new {
                    x.ProduktiId,
                    x.EmriProduktit,
                    x.FotoProduktit,
                    x.StokuQmimiProduktit.SasiaNeStok,
                    x.StokuQmimiProduktit.QmimiBleres,
                    x.StokuQmimiProduktit.QmimiProduktit,
                    x.ZbritjaQmimitProduktit.QmimiMeZbritjeProduktit
                })
                .ToListAsync();

            return Ok(Kthe15TeFundit);
        }

        [Authorize(Roles = "Admin, Menaxher")]
        [HttpPost]
        [Route("shtoProdukt")]
        public async Task<IActionResult> Post(Produkti produkti)
        {
            await _context.Produktis.AddAsync(produkti);
            await _context.SaveChangesAsync();

            StokuQmimiProduktit s = new StokuQmimiProduktit
            {
                ProduktiId = produkti.ProduktiId
            };

            await _context.StokuQmimiProduktits.AddAsync(s);
            await _context.SaveChangesAsync();

            return CreatedAtAction("Get", produkti.ProduktiId, produkti);
        }

        [Authorize(Roles = "Admin, Menaxher")]
        [HttpPut("{id}")]
        public async Task<IActionResult> Put(int id, [FromBody] Produkti p)
        {
            var produkti = await _context.Produktis.FirstOrDefaultAsync(x => x.ProduktiId == id);
            var stokuQmimi = await _context.StokuQmimiProduktits.FirstOrDefaultAsync(x => x.ProduktiId == id);

            if (produkti == null || stokuQmimi == null)
            {
                return BadRequest("Produkti me këtë ID nuk ekziston");
            }

            if (!p.EmriProduktit.IsNullOrEmpty())
            {
                produkti.EmriProduktit = p.EmriProduktit;
            }

            if (!p.FotoProduktit.IsNullOrEmpty())
            {
                produkti.FotoProduktit = p.FotoProduktit;
            }

            if (p.KategoriaId != null)
            {
                produkti.KategoriaId = p.KategoriaId;
            }

            if (p.KompaniaId != null)
            {
                produkti.KompaniaId = p.KompaniaId;
            }

            if (p.Pershkrimi != null)
            {
                produkti.Pershkrimi = p.Pershkrimi;
            }

            if (p.StokuQmimiProduktit != null)
            {
                if (p.StokuQmimiProduktit.QmimiProduktit != null)
                {
                    stokuQmimi.QmimiProduktit = p.StokuQmimiProduktit.QmimiProduktit;
                }

                if (p.StokuQmimiProduktit.QmimiBleres != null)
                {
                    stokuQmimi.QmimiBleres = p.StokuQmimiProduktit.QmimiBleres;
                }

                if (p.StokuQmimiProduktit.SasiaNeStok != null)
                {
                    stokuQmimi.SasiaNeStok = p.StokuQmimiProduktit.SasiaNeStok;
                }
            }

            _context.Produktis.Update(produkti);
            _context.StokuQmimiProduktits.Update(stokuQmimi);
            await _context.SaveChangesAsync();

            return Ok(produkti);
        }

        [Authorize(Roles = "Admin")]
        [HttpDelete("{id}")]
        public async Task<ActionResult> Delete(int id)
        {
            var produkti = await _context.Produktis.FirstOrDefaultAsync(x => x.ProduktiId == id);

            if (produkti == null)
                return BadRequest("Invalid id");

            _context.Produktis.Remove(produkti);
            await _context.SaveChangesAsync();

            return NoContent();
        }
    }
}
