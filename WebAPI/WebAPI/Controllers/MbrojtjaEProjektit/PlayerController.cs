using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebAPI.Data;
using WebAPI.Models;
using WebAPI.Models.MbrojtjaEProjektit;

namespace WebAPI.Controllers
{
    [Authorize(AuthenticationSchemes = "Bearer")]
    [ApiController]
    [Route("api/[controller]")]
    public class PlayerController : Controller
    {
        private readonly TechStoreDbContext _context;

        public PlayerController(TechStoreDbContext context)
        {
            _context = context;
        }

        [AllowAnonymous]
        [HttpGet]
        [Route("ShfaqLojtaret")]
        public async Task<IActionResult> ShfaqLojtaret()
        {
            var lojtaret = await _context.Player.Include(x => x.Team).ToListAsync();

            return Ok(lojtaret);
        }

        [AllowAnonymous]
        [HttpGet]
        [Route("ShfaqLojtarinNgaID")]
        public async Task<IActionResult> ShfaqLojtarinNgaID(int PlayerId)
        {
            var lojtari = await _context.Player.Include(x => x.Team).FirstOrDefaultAsync(x => x.PlayerId == PlayerId);

            if(lojtari == null)
            {
                return NotFound();
            }

            return Ok(lojtari);
        }

        [AllowAnonymous]
        [HttpPost]
        [Route("ShtoLojtarin")]
        public async Task<IActionResult> ShtoLojtarin([FromBody] Player player)
        {
            await _context.Player.AddAsync(player);

            await _context.SaveChangesAsync();

            return CreatedAtAction("ShfaqLojtaret", player.PlayerId, player);
        }

        [AllowAnonymous]
        [HttpPut]
        [Route("PerditesoLojtarin")]
        public async Task<IActionResult> Put(int PlayerId, [FromBody] Player p)
        {
            var lojtari = await _context.Player.FirstOrDefaultAsync(x => x.PlayerId == PlayerId);

            if (lojtari == null)
            {
                return NotFound();
            }

            lojtari.Name = p.Name;
            lojtari.BirthYear = p.BirthYear;
            lojtari.Number = p.Number;
            lojtari.TeamId = p.TeamId;

            _context.Player.Update(lojtari);
            await _context.SaveChangesAsync();

            return Ok(lojtari);
        }

        [AllowAnonymous]
        [HttpDelete]
        [Route("FshijLojtarin")]
        public async Task<IActionResult> FshijLojtarin(int PlayerId)
        {
            var lojtari = await _context.Player.FirstOrDefaultAsync(x => x.PlayerId == PlayerId);

            if (lojtari == null)
            {
                return NotFound();
            }

            _context.Player.Remove(lojtari);
            await _context.SaveChangesAsync();

            return Ok();
        }
    }
}
