using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebAPI.Data;
using WebAPI.Models;

namespace TechStoreWebAPI.Controllers
{
    [Authorize(AuthenticationSchemes = "Bearer")]
    [ApiController]
    [Route("api/[controller]")]
    public class PorosiaController : ControllerBase
    {
        private readonly TechStoreDbContext _context;

        public PorosiaController(TechStoreDbContext context)
        {
            _context = context;
        }

        [Authorize(Roles = "Admin, Menaxher")]
        [HttpGet]
        [Route("Porosit")]
        public async Task<IActionResult> Get()
        {
            var porosit = await _context.Porosit
                .Include(p => p.Klienti)
                    .ThenInclude(t => t.TeDhenatPerdoruesit)
                .Select(p => new
                {
                    p.IdPorosia,
                    p.TotaliPorosis,
                    p.DataPorosis,
                    p.StatusiPorosis,
                    p.IdKlienti,
                    p.Zbritja,
                    p.TotaliProdukteve,
                    p.Klienti.Emri,
                    p.Klienti.Mbiemri,
                })
                .OrderByDescending(p => p.IdPorosia)
                .ToListAsync();

            return Ok(porosit);
        }

        [Authorize(Roles = "Admin, Menaxher, User")]
        [HttpGet]
        [Route("shfaqPorositeUserit")]
        public async Task<IActionResult> GetPorositUseritget(int idPerdoruesi)
        {
            List<Porosit> porosit = await _context.Porosit
                .Where(p => p.IdKlienti == idPerdoruesi)
                .OrderByDescending(p => p.IdPorosia)
                .ToListAsync();

            return Ok(porosit);
        }

        [Authorize(Roles = "Admin, Menaxher, User")]
        [HttpGet]
        [Route("shfaqPorosineNgaID")]
        public async Task<IActionResult> GetPorosineNgaID(int nrFatures)
        {
            var porosit = await _context.Porosit
                .Include(p => p.TeDhenatEPorosis)
                    .ThenInclude(t => t.Produkti)
                .Include(p => p.Klienti)
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
                    p.Klienti.Emri,
                    p.Klienti.Mbiemri,
                    p.Klienti.Email,
                    p.Klienti.TeDhenatPerdoruesit.NrKontaktit,
                    p.Klienti.TeDhenatPerdoruesit.Adresa,
                    p.Klienti.TeDhenatPerdoruesit.Qyteti,
                    p.Klienti.TeDhenatPerdoruesit.Shteti,
                    p.Klienti.TeDhenatPerdoruesit.ZipKodi,
                    TeDhenatEPorosis = p.TeDhenatEPorosis.Select(t => new
                    {
                        t.QmimiTotal,
                        t.QmimiProduktit,
                        t.SasiaPorositur,
                        t.Produkti.EmriProduktit,
                        t.Produkti.FotoProduktit,
                    }),
                })
                .FirstOrDefaultAsync();

            return Ok(porosit);
        }


        [Authorize(Roles = "Admin, Menaxher, User")]
        [HttpGet]
        [Route("teDhenatEProsis")]
        public async Task<IActionResult> Get(int nrPorosis)
        {
            List<TeDhenatEPorosis> porsia = await _context.TeDhenatEPorosis.Where(x => x.IdPorosia == nrPorosis).ToListAsync();
            return Ok(porsia);
        }

        [Authorize(Roles = "Admin, Menaxher, User")]
        [HttpPost]
        [Route("vendosPorosine")]
        public async Task<IActionResult> Post([FromBody] Porosit porosit)
        {
            await _context.Porosit.AddAsync(porosit);
            await _context.SaveChangesAsync();

            return CreatedAtAction("get", porosit.IdPorosia, porosit);
        }

        [Authorize(Roles = "Admin, Menaxher, User")]
        [HttpPost]
        [Route("vendosTeDhenatPorosise")]
        public async Task<IActionResult> Post([FromBody] TeDhenatEPorosis teDhenatEporosi)
        {
            await _context.TeDhenatEPorosis.AddAsync(teDhenatEporosi);
            await _context.SaveChangesAsync();

            var produkti = await _context.StokuQmimiProduktit.FindAsync(teDhenatEporosi.IdProdukti);
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

        [Authorize(Roles = "Admin, Menaxher")]
        [HttpPut]
        [Route("perditesoStatusinPorosis")]
        public async Task<IActionResult> Put(int idPorosia, string statusi)
        {
            var porosia = await _context.Porosit.FirstOrDefaultAsync(p => p.IdPorosia == idPorosia);

            if (porosia == null)
            {
                return NotFound();
            }

            porosia.StatusiPorosis = statusi;

            _context.Porosit.Update(porosia);
            await _context.SaveChangesAsync();

            return Ok(porosia);
        }
    }
}