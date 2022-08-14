using Business.Abstract;
using DTOs.Concrete.ApartmentDetailDto.Commands;
using DTOs.Concrete.ApartmentDetailDto.Queries;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class ApartmentDetailsController : BaseController<IApartmentDetailService, QueryApartmentDetailDto, CommandApartmentDetailDto>
    {
        public ApartmentDetailsController(IApartmentDetailService apartmentDetailService)
        {
            _service = apartmentDetailService;
        }
        [HttpGet]
        public IActionResult GetAllApartmentWithDetail()
        {
            return Response(_service.GetAllApartmentWithDetail());
        }
    }

}
