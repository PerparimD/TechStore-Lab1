﻿using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebAPI.Data;
using WebAPI.Models;

namespace WebAPI.Controllers
{
    [Authorize(AuthenticationSchemes = "Bearer")]
    [ApiController]
    [Route("api/[controller]")]
    public class KodiZbritjeController : Controller
    {
        private readonly TechStoreDbContext _context;

        public KodiZbritjeController(TechStoreDbContext context)
        {
            _context = context;
        }

        [Authorize(Roles = "Admin, Menaxher")]
        [HttpGet]
        [Route("shfaqKodet")]
        public async Task<IActionResult> Get()
        {
            var kodet = await _context.KodiZbritjes
                .OrderByDescending(x => x.DataKrijimit)
                .Select(x => new
                {
                    x.Kodi,
                    x.QmimiZbritjes,
                    x.DataKrijimit,
                    x.IdProdukti,
                    x.Produkti.EmriProduktit
                })
                .ToListAsync();
            return Ok(kodet);
        }

        [Authorize(Roles = "Admin, Menaxher, User")]
        [HttpGet]
        [Route("gjejKodin")]
        public async Task<IActionResult> Get(string kodi)
        {
            var kodiZbritjes = await _context.KodiZbritjes
                .Where(x => x.Kodi.Equals(kodi))
                .Select(x => new
                {
                    x.Kodi,
                    x.QmimiZbritjes,
                    x.DataKrijimit,
                    x.IdProdukti,
                    x.Produkti.EmriProduktit
                })
                .FirstOrDefaultAsync();

            if (kodiZbritjes == null)
            {
                return NotFound();
            }

            return Ok(kodiZbritjes);
        }

        [Authorize(Roles = "Admin, Menaxher")]
        [HttpPost]
        [Route("shtoKodin")]
        public async Task<IActionResult> Post(KodiZbritjes kodiZbritjes)
        {
            await _context.KodiZbritjes.AddAsync(kodiZbritjes);
            await _context.SaveChangesAsync();

            return CreatedAtAction("Get", kodiZbritjes.Kodi, kodiZbritjes);
        }

        [Authorize(Roles = "Admin, Menaxher")]
        [HttpPut]
        [Route("perditesoTeDhenatEKodit")]
        public async Task<IActionResult> Put(String kodi, [FromBody] KodiZbritjes k)
        {
            var teDhenatKodit = await _context.KodiZbritjes.FirstOrDefaultAsync(x => x.Kodi.Equals(kodi));

            if (teDhenatKodit == null)
            {
                return BadRequest("Nuk u gjet asnje kode!");
            }

            if (k.QmimiZbritjes > 0)
            {
                teDhenatKodit.QmimiZbritjes = k.QmimiZbritjes;
            }

            if (k.IdProdukti == 0)
            {
                teDhenatKodit.IdProdukti = null;
            }
            else
            {
                teDhenatKodit.IdProdukti = k.IdProdukti;
            }



            _context.KodiZbritjes.Update(teDhenatKodit);
            await _context.SaveChangesAsync();

            return Ok(teDhenatKodit);
        }

        [Authorize(Roles = "Admin, Menaxher")]
        [HttpDelete]
        [Route("fshijKodin")]
        public async Task<IActionResult> Delete(String kodi)
        {
            var teDhenatKodit = await _context.KodiZbritjes.FirstOrDefaultAsync(x => x.Kodi.Equals(kodi));

            _context.KodiZbritjes.Remove(teDhenatKodit);
            await _context.SaveChangesAsync();

            return NoContent();
        }
    }
}
