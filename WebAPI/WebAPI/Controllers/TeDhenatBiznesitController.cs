﻿using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using System.Data.Entity;
using WebAPI.Models;

namespace WebAPI.Controllers
{
    [ApiController]
    [Route("/api/[controller]")]
    public class TeDhenatBiznesitController : Controller
    {
        private readonly TechStoreDbContext _context;

        public TeDhenatBiznesitController(TechStoreDbContext context)
        {
            _context = context;
        } 

        [HttpGet]
        [Route("ShfaqTeDhenat")]
        public IActionResult Get()
        {
            var teDhenat = _context.TeDhenatBiznesits.First();

            return Ok(teDhenat);
        }

        [HttpPut]
        [Route("perditesoTeDhenat")]
        public IActionResult Put([FromBody] TeDhenatBiznesit k)
        {
            var teDhenat = _context.TeDhenatBiznesits.FirstOrDefault(x => x.IdteDhenatBiznesit == 1);
            if (teDhenat == null)
            {
                return BadRequest("Kategoria nuk egziston");
            }

            teDhenat.NrKontaktit = k.NrKontaktit;
            teDhenat.Nf = k.Nf;
            teDhenat.Nui = k.Nui;
            teDhenat.Email = k.Email;
            teDhenat.EmriIbiznesit  = k.EmriIbiznesit;
            teDhenat.ShkurtesaEmritBiznesit = k.ShkurtesaEmritBiznesit;
            teDhenat.Nrtvsh = k.Nrtvsh;
            teDhenat.Adresa = k.Adresa;

            _context.SaveChanges();

            return Ok(teDhenat);
        }
    }
}
