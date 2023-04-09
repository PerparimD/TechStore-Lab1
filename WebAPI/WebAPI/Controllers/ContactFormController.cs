using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using WebAPI.Models;

namespace TechStoreWebAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ContactFormController : Controller
    {
        private readonly TechStoreDbContext _context;

        public ContactFormController(TechStoreDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        [Route("shfaqMesazhet")]
        public async Task<IActionResult> Get()
        {
            List<ContactForm> contactforms = await _context.ContactForms.Include(x => x.User).ToListAsync();

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

        [HttpGet]
        [Route("shfaqMesazhinSipasIDs")]
        public async Task<IActionResult> Get(int id)
        {
            var msg = await _context.ContactForms.FirstOrDefaultAsync(x => x.MesazhiId == id);

            return Ok(msg);
        }

        [HttpPost]
        [Route("shtoMesazhin")]
        public async Task<IActionResult> Post(ContactForm contactform)
        {
            await _context.ContactForms.AddAsync(contactform);
            await _context.SaveChangesAsync();

            return CreatedAtAction("Get", contactform.MesazhiId, contactform);

        }
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
