using Business.Abstract;
using DTOs.Concrete.ApartmentDto.Commands;
using DTOs.Concrete.ApartmentDto.Queries;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class ApartmentsController : BaseController<IApartmentService,QueryApartmentDto,CommandApartmentDto>
    {
        public ApartmentsController(IApartmentService apartmentService)
        {
            _service = apartmentService;
        }
        [HttpGet]
        public IActionResult GetAllApartments()
        {
            return Response(_service.GetAllApartment());
        }
       
    }
}
