using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebAPI.Models;

namespace WebAPI.Controllers
{
    [Authorize(AuthenticationSchemes = "Bearer")]
    [ApiController]
    [Route("api/[controller]")]
    public class StatistikatController : Controller
    {
        private readonly TechStoreDbContext _context;

        public StatistikatController(TechStoreDbContext context)
        {
            _context = context;
        }

        [Authorize(Roles = "Admin, Menaxher")]
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

            /* TE MEPARSHME */

            /* DITA E DJESHME */
            var ditaDjeshme = DateTime.Today.AddDays(-1);
            var totPorosiveDjeshme = await _context.Porosits.Where(p => p.DataPorosis == ditaDjeshme).CountAsync();
            var totShitjeveDjeshme = await _context.Porosits.Where(p => p.DataPorosis == ditaDjeshme).SumAsync(p => p.TotaliPorosis);
            /* DITA E DJESHME */

            /* MUAJI I KALUAR */
            var dataMuajinKaluar = dataESotme.AddMonths(-1);
            var ditaEPareMuajitKaluar = new DateTime(dataMuajinKaluar.Year, dataMuajinKaluar.Month, 1);
            var ditaEFunditMuajitKaluar = ditaEPareMuajitKaluar.AddMonths(1).AddDays(-1);

            var totPorosiveMujoreKaluar = await _context.Porosits
                .Where(p => p.DataPorosis >= ditaEPareMuajitKaluar && p.DataPorosis <= ditaEFunditMuajitKaluar)
                .CountAsync();

            var totShitjeveMujoreKaluar = await _context.Porosits
                .Where(p => p.DataPorosis >= ditaEPareMuajitKaluar && p.DataPorosis <= ditaEFunditMuajitKaluar)
                .SumAsync(p => p.TotaliPorosis);
            /* MUAJI I KALUAR */

            /* TE MEPARSHME */

            var totalet = new
            {
                /* PERGJITHSHME */
                    TotaliShitjeve = totShitjeve,
                    TotaliUsers = totUser,
                    TotaliProdukteve = totProdukteve,
                    TotaliPorosive = totPorosive,
                /* PERGJITHSHME */

                /* DITA E SOTME */
                    TotaliPorosiveSotme = totPorosiveSotme,
                    TotaliShitjeveSotme = totShitjeveSotme,
                /* DITA E SOTME */

                /* MUJORE */
                    TotaliPorosiveKeteMuaj = totPorosiveMujore,
                    TotaliShitjeveKeteMuaj = totShitjeveMujore,
                /* MUJORE */

                /* TE MEPARSHME */

                    /* DITA E DJESHME */
                        TotaliPorosiveDjeshme = totPorosiveDjeshme,
                        TotaliShitjeveDjeshme = totShitjeveDjeshme,
                    /* DITA E DJESHME */

                    /* MUAJI I KALUAR */
                        TotaliPorosiveMuajinKaluar = totPorosiveMujoreKaluar,
                        TotaliShitjeveMuajinKaluar = totShitjeveMujoreKaluar,
                    /* MUAJI I KALUAR */

                /* TE MEPARSHME */

            };

            return Ok(totalet);
        }

        [Authorize(Roles = "Admin, Menaxher")]
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
                .ThenByDescending(g => g.TotaliBlerjeve)
                .Take(15)
                .ToListAsync();

            return Ok(bleresit);
        }

        [Authorize(Roles = "Admin, Menaxher")]
        [HttpGet]
        [Route("15ProduktetMeTeShitura")]
        public async Task<IActionResult> GetTop15Prod()
        {
            var produktet = await _context.Produktis
                .Select(e => new
                {
                    Produkti = new
                    {
                        e.ProduktiId,
                        e.EmriProduktit,
                        e.FotoProduktit,
                        e.StokuQmimiProduktit.SasiaNeStok,
                        e.StokuQmimiProduktit.QmimiBleres,
                        e.StokuQmimiProduktit.QmimiProduktit,
                        e.ZbritjaQmimitProduktit.QmimiMeZbritjeProduktit,
                    },
                    TotaliPorosive = e.TeDhenatEporosis.Sum(q => q.SasiaPorositur),
                    TotaliBlerjeve = e.TeDhenatEporosis.Sum(q => q.QmimiTotal),
                })
                .OrderByDescending(g => g.TotaliPorosive)
                .ThenByDescending(g => g.TotaliBlerjeve)
                .Take(15)
                .ToListAsync();

            return Ok(produktet);
        }

        [Authorize(Roles = "Admin, Menaxher")]
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
