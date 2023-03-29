using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TechStoreWebAPI.Models;

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
            List<ContactForm> contactforms = await _context.ContactForms.ToListAsync();

            return Ok(contactforms);
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
    }
}
