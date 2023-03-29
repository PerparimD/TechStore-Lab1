using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TechStoreWebAPI.Models;

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
            List<Porosit> porosit = await _context.Porosits.ToListAsync();

            return Ok(porosit);
        }

        [HttpGet]
        [Route("teDhenatEProsis")]
        public async Task<IActionResult> Get(int nrPorosis)
        {
            List<TeDhenatEporosi> porsia = await _context.TeDhenatEporoses.Where(x => x.IdPorosia == nrPorosis).ToListAsync();
            return Ok(porsia);
        }
    }
}