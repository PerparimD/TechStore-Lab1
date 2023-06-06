using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion.Internal;
using WebAPI.Models;

namespace WebAPI.Controllers
{
    [Authorize(AuthenticationSchemes = "Bearer")]
    [ApiController]
    [Route("api/[controller]")]
    public class VendosFototController : Controller
    {
        private readonly TechStoreDbContext _context;

        public VendosFototController(TechStoreDbContext context)
        {
            _context = context;
        }

        [Authorize(Roles = "Admin, Menaxher")]
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

        [Authorize(Roles = "Admin, Menaxher")]
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

        [Authorize(Roles = "Admin, Menaxher")]
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

        [Authorize(Roles = "Admin, Menaxher")]
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

        [Authorize(Roles = "Admin, Menaxher")]
        [HttpPost]
        [Route("PerditesoTeDhenatBiznesit")]
        public async Task<IActionResult> PerditesoTeDhenatBiznesit(IFormFile foto, string logoVjeter)
        {
            if (foto == null || foto.Length == 0)
            {
                return BadRequest("Ju lutem vendosni foton");
            }

            var follderi = Path.Combine("..", "..", "techstore", "public", "img", "web");

            if (!logoVjeter.Equals("PaLogo.png"))
            {
                var fotoVjeter = Path.Combine(follderi, logoVjeter);

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
