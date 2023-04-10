using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using WebAPI.Models;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory.Database;

namespace TechStoreWebAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ProduktiController : Controller
    {
        private readonly TechStoreDbContext _context;

        public ProduktiController(TechStoreDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        [Route("Products")]
        public async Task<ActionResult> Get()
        {
            List<Produkti> produktis = await _context.Produktis.Include(x => x.Kompania).ToListAsync();
            var produktet = await _context.Produktis.ToListAsync();
            return Ok(produktet);
        }

        [HttpGet]
        [Route("{id}")]
        public async Task<ActionResult> GetById(int id)
        {
            var produkti = await _context.Produktis.FirstOrDefaultAsync(x => x.ProduktiId == id);
            return Ok(produkti);
        }

        [HttpGet]
        [Route("15ProduktetMeTeFundit")]
        public async Task<IActionResult> Get15Produkte()
        {
            var Kthe15TeFundit = await _context.Produktis
                .OrderByDescending(x => x.ProduktiId)
                .Take(15)
                .Select(x => new {
                    x.ProduktiId,
                    x.EmriProduktit,
                    x.FotoProduktit,
                    x.QmimiProduktit,
                })
                .ToListAsync();

            return Ok(Kthe15TeFundit);
        }

        [HttpPost]
        [Route("shtoProdukt")]
        public async Task<IActionResult> Post([FromBody] Produkti produkti)
        {
            var newProduct = new Produkti
            {
                EmriProduktit = produkti.EmriProduktit,
                FotoProduktit = produkti.FotoProduktit,
                QmimiProduktit = produkti.QmimiProduktit,
                Kompania = new Kompanium
                {
                    EmriKompanis = produkti.Kompania.EmriKompanis
                }
            };
            await _context.Produktis.AddAsync(newProduct);
            await _context.SaveChangesAsync();


            return CreatedAtAction("Get", produkti.ProduktiId, produkti);

        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Put(int id, [FromBody] Produkti p)
        {
            var produkti = await _context.Produktis.FirstOrDefaultAsync(x => x.ProduktiId == id);

            if (produkti == null)
            {
                return BadRequest("Id gabim");
            }

            if (!p.EmriProduktit.IsNullOrEmpty())
            {
                produkti.EmriProduktit = p.EmriProduktit;
            }
            if (!p.FotoProduktit.IsNullOrEmpty())
            {
                produkti.FotoProduktit = p.FotoProduktit;
            }
            produkti.QmimiProduktit = p.QmimiProduktit;

            //Update message properties
            produkti.EmriProduktit = p.EmriProduktit;
            produkti.Pershkrimi = p.Pershkrimi;
            produkti.FotoProduktit = p.FotoProduktit;
            produkti.QmimiProduktit = p.QmimiProduktit;
            produkti.Kategoria = p.Kategoria;
            produkti.Kompania = p.Kompania;


            _context.Produktis.Update(produkti);
            await _context.SaveChangesAsync();

            return Ok(produkti);
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult> Delete(int id)
        {
            var produkti = await _context.Produktis.FirstOrDefaultAsync(x => x.ProduktiId == id);

            if (produkti == null)
                return BadRequest("Invalid id");

            _context.Produktis.Remove(produkti);
            await _context.SaveChangesAsync();

            return NoContent();
        }
    }
}
