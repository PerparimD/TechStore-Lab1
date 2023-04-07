using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebAPI.Models;

namespace TechStoreWebAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class KompaniaController : Controller
    {
        private readonly TechStoreDbContext _context;

        public KompaniaController(TechStoreDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        [Route("shfaqKompanit")]
        public async Task<IActionResult> Get()
        {
            List<Kompanium> kompanit = await _context.Kompania.OrderByDescending(x=> x.KompaniaId).ToListAsync();

            return Ok(kompanit);
        }

        [HttpPost]
        [Route("shtoKompanin")]
        public async Task<IActionResult> Post(Kompanium kompanium)
        {
            await _context.Kompania.AddAsync(kompanium);
            await _context.SaveChangesAsync();

            return CreatedAtAction("Get", kompanium.KompaniaId, kompanium);

        }

        [HttpDelete]
        [Route("fshijKompanin")]
        public async Task<ActionResult> Delete(int id)
        {
            var kompania = await _context.Kompania.FirstOrDefaultAsync(x => x.KompaniaId == id);

            if (kompania == null)
                return BadRequest("Invalid id");

            _context.Kompania.Remove(kompania);
            await _context.SaveChangesAsync();

            return NoContent();
        }
    }
}
