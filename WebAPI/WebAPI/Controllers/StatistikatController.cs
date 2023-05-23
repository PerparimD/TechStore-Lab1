using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebAPI.Models;

namespace WebAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class StatistikatController : Controller
    {
        private readonly TechStoreDbContext _context;

        public StatistikatController(TechStoreDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        [Route("totaleTeNdryshme")]
        public async Task<IActionResult> GetTotaleTeNdryshme()
        {
            /* PERGJITHSHME */
            var totShitjeve = await _context.Porosits.SumAsync(p => p.TotaliPorosis);
            var totUser = await _context.Perdoruesis.CountAsync();
            var totProdukteve = await _context.Produktis.CountAsync();
            var totPorosive = await _context.Porosits.CountAsync();
            /* PERGJITHSHME */

            /* DITA E SOTME */
            var totPorosiveSotme = await _context.Porosits.Where(p => p.DataPorosis == DateTime.Today).CountAsync();
            var totShitjeveSotme = await _context.Porosits.Where(p => p.DataPorosis == DateTime.Today).SumAsync(p => p.TotaliPorosis);
            /* DITA E SOTME */

            var result = new
            {
                TotaliShitjeve = totShitjeve,
                TotaliUsers = totUser,
                TotaliProdukteve = totProdukteve,
                TotaliPorosive = totPorosive,
                TotaliPorosiveSotme = totPorosiveSotme,
                TotaliShitjeveSotme = totShitjeveSotme,
            };

            return Ok(result);
        }

        [HttpGet]
        [Route("15PerdoruesitMeSeShumtiBlerje")]
        public async Task<IActionResult> GetTop15()
        {
            var bleresit = await _context.Perdoruesis
                .Select(e => new
                {
                    User = new
                    {
                        id = e.UserId,
                        emri = e.Emri,
                        mbiemri = e.Mbiemri,
                    },
                    TotaliPorosive = e.Porosits.Count(),
                    TotaliBlerjeve = e.Porosits.Sum(q => q.TotaliPorosis),
                })
                .OrderByDescending(g => g.TotaliPorosive)
                .Take(15)
                .ToListAsync();

            return Ok(bleresit);
        }

        [HttpGet]
        [Route("15ProduktetMeTeShitura")]
        public async Task<IActionResult> GetTop15Prod()
        {
            var produktet = await _context.Produktis
                .Select(e => new
                {
                    Produkti = new
                    {
                        id = e.ProduktiId,
                        emri = e.EmriProduktit,
                        qmimiShites = e.StokuQmimiProduktit.QmimiProduktit,
                    },
                    TotaliPorosive = e.TeDhenatEporosis.Sum(q => q.SasiaPorositur),
                    TotaliBlerjeve = e.TeDhenatEporosis.Sum(q => q.QmimiTotal),
                })
                .OrderByDescending(g => g.TotaliPorosive)
                .Take(15)
                .ToListAsync();

            return Ok(produktet);
        }

    }
}
