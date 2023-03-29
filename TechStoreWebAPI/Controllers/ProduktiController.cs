using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TechStoreWebAPI.Models;

namespace TechStoreWebAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ProduktiController : Controller
    {
        private readonly TechStoreDbContext _context;

        public ProduktiController(TechStoreDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        [Route("15ProduktetMeTeFundit")]
        public async Task<IActionResult> Get()
        {
            var top10 = await _context.Produktis
                .OrderByDescending(x => x.ProduktiId)
                .Take(15)
                .Select(x => new {
                x.ProduktiId,
                x.EmriProduktit,
                x.FotoProduktit,
                x.QmimiProduktit,
                })
                .ToListAsync();

            return Ok(top10);
        }

        [HttpPost]
        [Route("shtoProdukt")]
        public async Task<IActionResult> Post(Produkti produkti)
        {
            await _context.Produktis.AddAsync(produkti);
            await _context.SaveChangesAsync();

            return CreatedAtAction("Get", produkti.ProduktiId, produkti);

        }
    }
}
