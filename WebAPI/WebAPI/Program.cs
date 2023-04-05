using Microsoft.AspNetCore.Cors.Infrastructure;
using Microsoft.EntityFrameworkCore;
using WebAPI.Models;
using Newtonsoft.Json.Serialization;
using System.Text.Json;
using System.Text.Json.Serialization;
using Microsoft.Extensions.Configuration;

var builder = WebApplication.CreateBuilder(args);

// Load the configuration
var configBuilder = new ConfigurationBuilder()
    .AddJsonFile("connectionstring.json")
    .Build();

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();


builder.Services.AddControllers().AddJsonOptions(options =>
{
    options.JsonSerializerOptions.PropertyNamingPolicy = JsonNamingPolicy.CamelCase;
    options.JsonSerializerOptions.WriteIndented = true;
});

builder.Services.AddControllers().AddJsonOptions(x =>
x.JsonSerializerOptions.ReferenceHandler = ReferenceHandler.IgnoreCycles);

// Setup DbContext using the configuration
builder.Services.AddDbContext<TechStoreDbContext>(options =>
    options.UseSqlServer(configBuilder.GetConnectionString("Conn")));

builder.Services.AddCors(opt =>
{
    opt.AddPolicy(name: "CorsPolicy", builder =>
    {
        builder.AllowAnyOrigin()
            .AllowAnyHeader()
            .AllowAnyMethod();
    });
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseCors("CorsPolicy");

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
