﻿using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebAPI.Models;

namespace WebAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")] 
    public class PerdoruesiController : Controller
    {
        private readonly TechStoreDbContext _context;

        public PerdoruesiController(TechStoreDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        [Route("shfaqPerdoruesit")]
        public async Task<IActionResult> Get()
        {
            var perdoruesit = await _context.Perdoruesis.ToListAsync();

            return Ok(perdoruesit);
        }

        [HttpGet]
        [Route("shfaqSipasID")]
        public async Task<IActionResult> GetbyId(int idUser)
        {
            var perdoruesi = await _context.Perdoruesis.FirstOrDefaultAsync(x => x.UserId == idUser);

            return Ok(perdoruesi);
        }

        [HttpPost]
        [Route("shtoUser")]
        public async Task<IActionResult> Post(Perdoruesi perdoruesi)
        {
            await _context.Perdoruesis.AddAsync(perdoruesi);
            await _context.SaveChangesAsync();

            return CreatedAtAction("Get", perdoruesi.UserId, perdoruesi);
        }

        [HttpDelete]
        [Route("fshijPerdorues")]
        public async Task<IActionResult> Delete(int id)
        {
            var perdoruesi = await _context.Perdoruesis.FirstOrDefaultAsync(x => x.UserId == id);

            if(perdoruesi == null)
            {
                return BadRequest("Perdoruesi nuk egziston");
            }

            _context.Perdoruesis.Remove(perdoruesi);
            await _context.SaveChangesAsync();

            return NoContent();
        }
    }
}
