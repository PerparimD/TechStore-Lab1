using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebAPI.Models;

namespace TechStoreWebAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class PorosiaController : ControllerBase
    {
        private readonly TechStoreDbContext _context;

        public PorosiaController(TechStoreDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        [Route("Porosit")]
        public async Task<IActionResult> Get()
        {
            List<Porosit> porosit = await _context.Porosits.Include(p => p.TeDhenatEporosis).ToListAsync();

            return Ok(porosit);
        }

        [HttpGet]
        [Route("shfaqPorositeUserit")]
        public async Task<IActionResult> GetPorositUseritget(int idPerdoruesi)
        {
            List<Porosit> porosit = await _context.Porosits
                
                .Where(p=> p.IdKlienti == idPerdoruesi)
                .ToListAsync();

            return Ok(porosit);
        }

        [HttpGet]
        [Route("shfaqPorosineNgaID")]
        public async Task<IActionResult> GetPorosineNgaID(int nrFatures)
        {
            var porosit = await _context.Porosits
                .Include(p => p.TeDhenatEporosis)
                    .ThenInclude(t => t.IdProduktiNavigation)
                .Include(p => p.IdKlientiNavigation)
                    .ThenInclude(t => t.TeDhenatPerdoruesit)
                .Where(x => x.IdPorosia == nrFatures)
                .Select(p => new
                {
                    p.IdPorosia,
                    p.TotaliPorosis,
                    p.DataPorosis,
                    p.StatusiPorosis,
                    p.IdKlienti,
                    p.Zbritja,
                    p.TotaliProdukteve,
                    p.IdKlientiNavigation.Emri,
                    p.IdKlientiNavigation.Mbiemri,
                    p.IdKlientiNavigation.Email,
                    p.IdKlientiNavigation.TeDhenatPerdoruesit.NrKontaktit,
                    p.IdKlientiNavigation.TeDhenatPerdoruesit.Adresa,
                    p.IdKlientiNavigation.TeDhenatPerdoruesit.Qyteti,
                    p.IdKlientiNavigation.TeDhenatPerdoruesit.Shteti,
                    p.IdKlientiNavigation.TeDhenatPerdoruesit.ZipKodi,
                    TeDhenatEporosis = p.TeDhenatEporosis.Select(t => new
                    {
                        t.QmimiTotal,
                        t.QmimiProduktit,
                        t.SasiaPorositur,
                        t.IdProduktiNavigation.EmriProduktit,
                        t.IdProduktiNavigation.FotoProduktit,
                    }),
                })
                .FirstOrDefaultAsync();

            return Ok(porosit);
        }



        [HttpGet]
        [Route("teDhenatEProsis")]
        public async Task<IActionResult> Get(int nrPorosis)
        {
            List<TeDhenatEporosi> porsia = await _context.TeDhenatEporoses.Where(x => x.IdPorosia == nrPorosis).ToListAsync();
            return Ok(porsia);
        }

        [HttpPost]
        [Route("vendosPorosine")]
        public async Task<IActionResult> Post([FromBody] Porosit porosit)
        {
            await _context.Porosits.AddAsync(porosit);
            await _context.SaveChangesAsync();

            return CreatedAtAction("get", porosit.IdPorosia, porosit);
        }

        [HttpPost]
        [Route("vendosTeDhenatPorosise")]
        public async Task<IActionResult> Post([FromBody] TeDhenatEporosi teDhenatEporosi)
        {
            await _context.TeDhenatEporoses.AddAsync(teDhenatEporosi);
            await _context.SaveChangesAsync();

            var produkti = await _context.StokuQmimiProduktits.FindAsync(teDhenatEporosi.IdProdukti);
            if (produkti == null)
            {
                return NotFound();
            }

            produkti.SasiaNeStok -= teDhenatEporosi.SasiaPorositur;
            produkti.DataPerditsimit = DateTime.Now;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                throw;
            }

            return CreatedAtAction("get", teDhenatEporosi.IdDetajet, teDhenatEporosi);
        }
    }
}