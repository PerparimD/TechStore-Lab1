using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebAPI.Data;
using WebAPI.Models;

namespace WebAPI.Controllers
{
    [Authorize(AuthenticationSchemes = "Bearer")]
    [ApiController]
    [Route("api/[controller]")]
    public class Personi57449Controller : Controller
    {
        private readonly TechStoreDbContext _context;

        public Personi57449Controller(TechStoreDbContext context)
        {
            _context = context;
        }

        [AllowAnonymous]
        [HttpGet]
        [Route("ShfaqKlientet")]
        public async Task<IActionResult> Get()
        {
            var personat = await _context.Personi57449.Include(x => x.Banka57449).ToListAsync();

            return Ok(personat);
        }

        [AllowAnonymous]
        [HttpGet]
        [Route("ShfaqKlientinNgaID")]
        public async Task<IActionResult> GetById(int idPersoni)
        {
            var personi = await _context.Personi57449.Include(x => x.Banka57449).FirstOrDefaultAsync(x => x.Id57449 == idPersoni);

            return Ok(personi);
        }

        [AllowAnonymous]
        [HttpPost]
        [Route("ShtoKlientin")]
        public async Task<IActionResult> Post([FromBody] Personi57449 personi)
        {
            await _context.Personi57449.AddAsync(personi);

            await _context.SaveChangesAsync();

            return CreatedAtAction("get", personi.Id57449, personi);
        }

        [AllowAnonymous]
        [HttpPut]
        [Route("PerditesoKlientin")]
        public async Task<IActionResult> Put(int idPersoni, [FromBody] Personi57449 b)
        {
            var personi = await _context.Personi57449.FirstOrDefaultAsync(x => x.Id57449 == idPersoni);

            if (personi == null)
            {
                return BadRequest("Personi nuk egziston");
            }

            personi.Emri57449 = b.Emri57449;
            personi.Mbiemri57449 = b.Mbiemri57449;
            personi.Banka57449ID = b.Banka57449ID;

            _context.Personi57449.Update(personi);
            await _context.SaveChangesAsync();

            return Ok(personi);
        }

        [AllowAnonymous]
        [HttpDelete]
        [Route("FshijKlientin")]
        public async Task<IActionResult> Delete(int idPersoni)
        {
            var personi = await _context.Personi57449.FirstOrDefaultAsync(x => x.Id57449 == idPersoni);

            if (personi == null)
            {
                return BadRequest("Personi nuk egziston");
            }

            _context.Personi57449.Remove(personi);
            await _context.SaveChangesAsync();

            return Ok();
        }
    }
}
