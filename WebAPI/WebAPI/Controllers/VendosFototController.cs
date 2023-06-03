using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion.Internal;
using WebAPI.Models;

namespace WebAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class VendosFototController : Controller
    {
        private readonly TechStoreDbContext _context;

        public VendosFototController(TechStoreDbContext context)
        {
            _context = context;
        }

        [HttpPost]
        [Route("ShtoProduktin")]
        public async Task<IActionResult> ShtoProduktin(IFormFile foto)
        {
            if(foto == null || foto.Length == 0) 
            {
                return BadRequest("Ju lutem vendosni foton");
            }

            var emriUnikFotos = GjeneroEmrinUnikFotos(foto.FileName);

            var follderi = Path.Combine("..", "..", "techstore", "public", "img", "products", emriUnikFotos);

            using(var stream = new FileStream(follderi, FileMode.Create))
            {
                await foto.CopyToAsync(stream);
            }

            return Ok(emriUnikFotos);
        }

        [HttpPost]
        [Route("EditoProduktin")]
        public async Task<IActionResult> EditoProduktin(IFormFile foto, string fotoVjeterProduktit)
        {
            if (foto == null || foto.Length == 0)
            {
                return BadRequest("Ju lutem vendosni foton");
            }

            var follderi = Path.Combine("..", "..", "techstore", "public", "img", "products");

            if (!fotoVjeterProduktit.Equals("ProduktPaFoto.png"))
            {
                var fotoVjeter = Path.Combine(follderi, fotoVjeterProduktit);

                if (System.IO.File.Exists(fotoVjeter))
                {
                    System.IO.File.Delete(fotoVjeter);
                }
            }

            var emriUnikFotos = GjeneroEmrinUnikFotos(foto.FileName);

            var fotoERe = Path.Combine(follderi, emriUnikFotos);

            using (var stream = new FileStream(fotoERe, FileMode.Create))
            {
                await foto.CopyToAsync(stream);
            }

            return Ok(emriUnikFotos);
        }

        [HttpPost]
        [Route("ShtoKompanin")]
        public async Task<IActionResult> ShtoKompanin(IFormFile foto)
        {
            if (foto == null || foto.Length == 0)
            {
                return BadRequest("Ju lutem vendosni foton");
            }

            var emriUnikFotos = GjeneroEmrinUnikFotos(foto.FileName);

            var follderi = Path.Combine("..", "..", "techstore", "public", "img", "slider", "sliderIcons", emriUnikFotos);

            using (var stream = new FileStream(follderi, FileMode.Create))
            {
                await foto.CopyToAsync(stream);
            }

            return Ok(emriUnikFotos);
        }

        [HttpPost]
        [Route("EditoKompanin")]
        public async Task<IActionResult> EditoKompanin(IFormFile foto, string fotoVjeterKompanis)
        {
            if (foto == null || foto.Length == 0)
            {
                return BadRequest("Ju lutem vendosni foton");
            }

            var follderi = Path.Combine("..", "..", "techstore", "public", "img", "slider", "sliderIcons");

            if (!fotoVjeterKompanis.Equals("KompaniPaFoto.png"))
            {
                var fotoVjeter = Path.Combine(follderi, fotoVjeterKompanis);

                if (System.IO.File.Exists(fotoVjeter))
                {
                    System.IO.File.Delete(fotoVjeter);
                }
            }

            var emriUnikFotos = GjeneroEmrinUnikFotos(foto.FileName);

            var fotoERe = Path.Combine(follderi, emriUnikFotos);

            using (var stream = new FileStream(fotoERe, FileMode.Create))
            {
                await foto.CopyToAsync(stream);
            }

            return Ok(emriUnikFotos);
        }



        private string GjeneroEmrinUnikFotos(string emriFotos)
        {
            string emriUnikIFotos = Guid.NewGuid().ToString("N") + Path.GetExtension(emriFotos);

            return emriUnikIFotos;
        }
    }
}
