using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebAPI.Models;

namespace WebAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class KategoriaController : Controller
    {
        private readonly TechStoreDbContext _context;

        public KategoriaController(TechStoreDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        [Route("shfaqKategorinSipasIDs")]
        public async Task<IActionResult> Get(int id)
        {
            try
            {
                var kategoria = await _context.KategoriaProduktits.FirstOrDefaultAsync(x => x.KategoriaId == id);

                return Ok(kategoria);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        [HttpGet]
        [Route("shfaqKategorit")]
        public async Task<IActionResult> Get()
        {
            try
            {
                var kategorit = await _context.KategoriaProduktits.ToListAsync();

                return Ok(kategorit);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
