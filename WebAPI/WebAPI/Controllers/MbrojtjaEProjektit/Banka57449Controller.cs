using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebAPI.Data;
using WebAPI.Models.MbrojtjaEProjektit;

namespace WebAPI.Controllers.MbrojtjaProjektit
{

    [Authorize(AuthenticationSchemes = "Bearer")]
    [ApiController]
    [Route("api/[controller]")]
    public class Banka57449Controller : Controller
    {
        private readonly TechStoreDbContext _context;

        public Banka57449Controller(TechStoreDbContext context)
        {
            _context = context;
        }

        [AllowAnonymous]
        [HttpGet]
        [Route("ShfaqBankat")]
        public async Task<IActionResult> Get()
        {
            var bankat = await _context.Banka57449.ToListAsync();

            return Ok(bankat);
        }

        [AllowAnonymous]
        [HttpGet]
        [Route("ShfaqBankenNgaID")]
        public async Task<IActionResult> GetById(int idBanka)
        {
            var banka = await _context.Banka57449.FirstOrDefaultAsync(x => x.Id57449 == idBanka);

            return Ok(banka);
        }

        [AllowAnonymous]
        [HttpPost]
        [Route("ShtoBanken")]
        public async Task<IActionResult> Post([FromBody] Banka57449 banka)
        {
            await _context.Banka57449.AddAsync(banka);

            await _context.SaveChangesAsync();

            return CreatedAtAction("get", banka.Id57449, banka);
        }

        [AllowAnonymous]
        [HttpPut]
        [Route("PerditesoBanken")]
        public async Task<IActionResult> Put(int idBanka, [FromBody] Banka57449 b)
        {
            var banka = await _context.Banka57449.FirstOrDefaultAsync(x => x.Id57449 == idBanka);

            if (banka == null)
            {
                return BadRequest("Banka nuk egziston");
            }

            banka.Emri57449 = b.Emri57449;

            _context.Banka57449.Update(banka);
            await _context.SaveChangesAsync();

            return Ok(banka);
        }

        [AllowAnonymous]
        [HttpDelete]
        [Route("FshijBanken")]
        public async Task<IActionResult> Delete(int idBanka)
        {
            var banka = await _context.Banka57449.FirstOrDefaultAsync(x => x.Id57449 == idBanka);

            if (banka == null)
            {
                return BadRequest("Banka nuk egziston");
            }

            _context.Banka57449.Remove(banka);
            await _context.SaveChangesAsync();

            return Ok();
        }
    }
}
