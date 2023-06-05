using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebAPI.Models;

namespace WebAPI.Controllers
{
    [Authorize(AuthenticationSchemes = "Bearer")]
    [ApiController]
    [Route("api/[controller]")]
    public class ZbritjaQmimitProduktitController : Controller
    {
        private readonly TechStoreDbContext _context;

        public ZbritjaQmimitProduktitController(TechStoreDbContext context)
        {
            _context = context;
        }

        [Authorize(Roles = "Admin, Menaxher")]
        [HttpGet]
        [Route("shfaqZbritjet")]
        public async Task<IActionResult> get()
        {
            var prodMeZbritje = await _context.Produktis
                .Where(x => x.ZbritjaQmimitProduktit.QmimiMeZbritjeProduktit != null)
                .Select(x => new
                {
                    x.EmriProduktit,
                    x.ZbritjaQmimitProduktit.ProduktiId,
                    x.ZbritjaQmimitProduktit.QmimiPaZbritjeProduktit,
                    x.ZbritjaQmimitProduktit.QmimiMeZbritjeProduktit,
                    x.ZbritjaQmimitProduktit.DataZbritjes,
                    x.ZbritjaQmimitProduktit.DataSkadimit
                }).ToListAsync();

            return Ok(prodMeZbritje);
        }

        [Authorize(Roles = "Admin, Menaxher")]
        [HttpPost]
        [Route("shtoZbritjenProduktit")]
        public async Task<IActionResult> post(ZbritjaQmimitProduktit zbritja)
        {
            await _context.ZbritjaQmimitProduktits.AddAsync(zbritja);
            await _context.SaveChangesAsync();

            return CreatedAtAction("get", zbritja.ProduktiId, zbritja);
        }

        [Authorize(Roles = "Admin, Menaxher")]
        [HttpDelete]
        [Route("fshijZbritjenProduktit")]
        public async Task<IActionResult> Delete(int id)
        {
            var produkti = await _context.ZbritjaQmimitProduktits.FirstOrDefaultAsync(x => x.ProduktiId == id);

            if(produkti == null)
            {
                return BadRequest("Ky produkt nuk ka zbritje!");
            }

            _context.ZbritjaQmimitProduktits.Remove(produkti);
            await _context.SaveChangesAsync();

            return NoContent();
        }
    }
}
