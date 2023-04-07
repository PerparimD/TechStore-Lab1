using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
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

        [HttpGet]
        [Route("shfaqKompanin")]
        public async Task<IActionResult> Get(int id)
        {
            var kompania = await _context.Kompania.FirstOrDefaultAsync(x => x.KompaniaId == id);

            return Ok(kompania);
        }

        [HttpPost]
        [Route("shtoKompanin")]
        public async Task<IActionResult> Post(Kompanium kompanium)
        {
            await _context.Kompania.AddAsync(kompanium);
            await _context.SaveChangesAsync();

            return CreatedAtAction("Get", kompanium.KompaniaId, kompanium);

        }

        [HttpPut]
        [Route("perditesoKompanin")]
        public async Task<IActionResult> Put(int id, [FromBody] Kompanium k)
        {
            var kompania = await _context.Kompania.FirstOrDefaultAsync(x => x.KompaniaId == id);
            if(kompania == null)
            {
                return BadRequest("Id gabim");
            }

            if(!k.EmriKompanis.IsNullOrEmpty()){
                kompania.EmriKompanis = k.EmriKompanis;
            }
            if (!k.Logo.IsNullOrEmpty())
            {
                kompania.Logo = k.Logo;
            }
            kompania.Adresa = k.Adresa;

            _context.Kompania.Update(kompania);
            await _context.SaveChangesAsync();


            return Ok(kompania);
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
