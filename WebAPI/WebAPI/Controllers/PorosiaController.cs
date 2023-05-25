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
        [Route("shfaqPorosineNgaID")]
        public async Task<IActionResult> GetPorosineNgaID(int nrFatures)
        {
            var porosit = await _context.Porosits.Include(p => p.TeDhenatEporosis).Where(x => x.IdPorosia == nrFatures).FirstOrDefaultAsync();

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

            return CreatedAtAction("get", teDhenatEporosi.IdDetajet, teDhenatEporosi);
        }
    }
}