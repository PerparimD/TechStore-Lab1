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

            /* MUJORE */
            var dataESotme = DateTime.Today;
            var ditaEPareMuajit = new DateTime(dataESotme.Year, dataESotme.Month, 1);
            var ditaEFunditMuajit = ditaEPareMuajit.AddMonths(1).AddDays(-1);

            var totPorosiveMujore = await _context.Porosits
                .Where(p => p.DataPorosis >= ditaEPareMuajit && p.DataPorosis <= ditaEFunditMuajit)
                .CountAsync();

            var totShitjeveMujore = await _context.Porosits
                .Where(p => p.DataPorosis >= ditaEPareMuajit && p.DataPorosis <= ditaEFunditMuajit)
                .SumAsync(p => p.TotaliPorosis);
            /* MUJORE */

            var totalet = new
            {
                TotaliShitjeve = totShitjeve,
                TotaliUsers = totUser,
                TotaliProdukteve = totProdukteve,
                TotaliPorosive = totPorosive,
                TotaliPorosiveSotme = totPorosiveSotme,
                TotaliShitjeveSotme = totShitjeveSotme,
                TotaliPorosiveKeteMuaj = totPorosiveMujore,
                TotaliShitjeveKeteMuaj = totShitjeveMujore,
            };

            return Ok(totalet);
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

        [HttpGet]
        [Route("TotaletJavore")]
        public async Task<IActionResult> GetShitjetJavore()
        {
            var dataESotme = DateTime.Today;
            var dataFillimit = dataESotme; 
            var dataMbarimit = dataESotme.AddDays(-6); ; 

            int totaliPorosiveJavore = 0;
            decimal totaliShitjeveJavore = 0;

            var totaletDitore = new List<Object>();

            for (var date = dataFillimit; date >= dataMbarimit; date = date.AddDays(-1))
            {
                var totalPorosive = await _context.Porosits
                    .Where(p => p.DataPorosis == date)
                    .CountAsync();

                totaliPorosiveJavore += totalPorosive;

                var totalShitjeve = await _context.Porosits
                    .Where(p => p.DataPorosis == date)
                    .SumAsync(p => p.TotaliPorosis);

                totaliShitjeveJavore += (decimal)totalShitjeve;

                var totaliDitor = new
                {
                    Data = date,
                    totaliPorosiveDitore = totalPorosive,
                    totaliShitjeveDitore = totalShitjeve
                };

                totaletDitore.Add(totaliDitor);
            }

            var totalet = new
            {
                totaletDitore,
                TotaletJavore = new
                {
                    TotaliShitjeveJavore = totaliShitjeveJavore,
                    TotaliPorosiveJavore = totaliPorosiveJavore,
                }
            };

            return Ok(totalet);
        }

    }
}
