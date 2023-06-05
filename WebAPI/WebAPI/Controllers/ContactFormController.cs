using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using WebAPI.Models;

namespace TechStoreWebAPI.Controllers
{
    [Authorize(AuthenticationSchemes = "Bearer")]
    [ApiController]
    [Route("api/[controller]")]
    public class ContactFormController : Controller
    {
        private readonly TechStoreDbContext _context;

        public ContactFormController(TechStoreDbContext context)
        {
            _context = context;
        }

        [Authorize(Roles = "Admin, Menaxher")]
        [HttpGet]
        [Route("shfaqMesazhet")]
        public async Task<IActionResult> Get()
        {
            List<ContactForm> contactforms = await _context.ContactForms
                .Include(x => x.User)
                .OrderByDescending(x => x.MesazhiId)
                .ToListAsync();

            var mesazhet = contactforms.Select(x => new
            {
                x.Emri,
                x.Email,
                x.UserId,
                x.Statusi,
                x.Mesazhi,
                x.DataDergeses,
                x.MesazhiId,
                User = x.User != null ? new
                {
                    x.User.UserId,
                    x.User.Username
                } : null
            });

            return Ok(mesazhet);
        }

        [Authorize(Roles = "Admin, Menaxher, User")]
        [HttpGet]
        [Route("shfaqMesazhetNgaUseri")]
        public async Task<IActionResult> GetMesazhetUserit(int idUserit)
        {
            List<ContactForm> contactforms = await _context.ContactForms
                .Include(x => x.User)
                .OrderByDescending(x => x.MesazhiId)
                .Where(x=> x.UserId == idUserit)
                .ToListAsync();

            var mesazhet = contactforms.Select(x => new
            {
                x.Emri,
                x.Email,
                x.UserId,
                x.Statusi,
                x.Mesazhi,
                x.DataDergeses,
                x.MesazhiId,
                User = x.User != null ? new
                {
                    x.User.UserId,
                    x.User.Username
                } : null
            });

            return Ok(mesazhet);
        }

        [Authorize(Roles = "Admin, Menaxher")]
        [HttpGet]
        [Route("shfaqMesazhinSipasIDs")]
        public async Task<IActionResult> Get(int id)
        {
            var msg = await _context.ContactForms.FirstOrDefaultAsync(x => x.MesazhiId == id);

            return Ok(msg);
        }

        [AllowAnonymous]
        [HttpPost]
        [Route("shtoMesazhin")]
        public async Task<IActionResult> Post(ContactForm contactform)
        {
            await _context.ContactForms.AddAsync(contactform);
            await _context.SaveChangesAsync();

            return CreatedAtAction("Get", contactform.MesazhiId, contactform);

        }

        [Authorize(Roles = "Admin, Menaxher")]
        [HttpPut]
        [Route("konfirmoMesazhin")]
        public async Task<IActionResult> Put(int id, [FromBody] ContactForm m)
        {
            var mesazhi = await _context.ContactForms.FirstOrDefaultAsync(x => x.MesazhiId == id);
            if (mesazhi == null)
            {
                return BadRequest("Nuk ka asnje mesazhe me kete ID");
            }
            mesazhi.Statusi = "Mesazhi eshte Pranuar dhe eshte Pergjigjur ne email";
            _context.ContactForms.Update(mesazhi);
            await _context.SaveChangesAsync();


            return Ok(mesazhi);
        }

        [Authorize(Roles = "Admin, Menaxher")]
        [HttpDelete]
        [Route("fshiMesazhin")]
        public async Task<ActionResult> Delete(int id)
        {
            var mesazhi = await _context.ContactForms.FirstOrDefaultAsync(x => x.MesazhiId == id);

            if (mesazhi == null)
                return BadRequest("Invalid id");

            _context.ContactForms.Remove(mesazhi);
            await _context.SaveChangesAsync();

            return NoContent();
        }
    }
}
