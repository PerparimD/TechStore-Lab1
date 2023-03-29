using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TechStoreWebAPI.Models;

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
            List<Kompanium> kompanit = await _context.Kompania.ToListAsync();

            return Ok(kompanit);
        }
    }
}
