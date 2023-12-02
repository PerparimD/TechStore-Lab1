using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using WebAPI.Data;
using WebAPI.Models;

namespace WebAPI.Controllers
{
    [Authorize(AuthenticationSchemes = "Bearer")]
    [ApiController]
    [Route("api/[controller]")]
    public class KategoriaController : Controller
    {
        private readonly TechStoreDbContext _context;

        public KategoriaController(TechStoreDbContext context)
        {
            _context = context;
        }

        [AllowAnonymous]
        [HttpGet]
        [Route("shfaqKategorinSipasIDs")]
        public async Task<IActionResult> Get(int id)
        {
            try
            {
                var kategoria = await _context.KategoriaProduktit.FirstOrDefaultAsync(x => x.KategoriaId == id);

                return Ok(kategoria);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        [AllowAnonymous]
        [HttpGet]
        [Route("shfaqKategorit")]
        public async Task<IActionResult> Get()
        {
            try
            {
                var kategorit = _context.KategoriaProduktit
                    .Where(k => k.LlojiKategoris != null)
                    .AsEnumerable()
                    .OrderBy(k => k.LlojiKategoris.ToString())
                    .ToList();

                return Ok(kategorit);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        [Authorize(Roles = "Admin, Menaxher")]
        [HttpPut]
        [Route("perditesoKategorin")]
        public async Task<IActionResult> Put(int id, [FromBody] KategoriaProduktit k)
        {
            var kategoria = await _context.KategoriaProduktit.FirstOrDefaultAsync(x => x.KategoriaId == id);
            if (id < 0)
            {
                return BadRequest("Kategoria nuk egziston");
            }

            if (!k.LlojiKategoris.IsNullOrEmpty())
            {
                kategoria.LlojiKategoris = k.LlojiKategoris;
            }
            if (!k.PershkrimiKategoris.IsNullOrEmpty())
            {
                kategoria.PershkrimiKategoris = k.PershkrimiKategoris;
            }

            _context.KategoriaProduktit.Update(kategoria);
            await _context.SaveChangesAsync();

            return Ok(kategoria);
        }

        [Authorize(Roles = "Admin, Menaxher")]
        [HttpPost]
        [Route("shtoKategorin")]
        public async Task<IActionResult> Post(KategoriaProduktit kategoriaProduktit)
        {
            await _context.KategoriaProduktit.AddAsync(kategoriaProduktit);
            await _context.SaveChangesAsync();

            return CreatedAtAction("Get", kategoriaProduktit.KategoriaId, kategoriaProduktit);
        }

        [Authorize(Roles = "Admin")]
        [HttpDelete]
        [Route("fshijKategorin")]
        public async Task<IActionResult> Delete(int id)
        {
            var kategoria = await _context.KategoriaProduktit.FirstOrDefaultAsync(x => x.KategoriaId == id);

            _context.KategoriaProduktit.Remove(kategoria);
            await _context.SaveChangesAsync();

            return Ok("Kategoria u fshie me sukses!");
        }
    }
}
