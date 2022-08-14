using Business.Abstract;
using DTOs.Concrete.LandlordDto.Commands;
using DTOs.Concrete.LandlordDto.Queries;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class LandlordsController : BaseController<ILandlordService,QueryLandlordDto,CommandLandlordDto>
    {
        public LandlordsController(ILandlordService landlordService)
        {
            _service = landlordService;
        }
        [HttpGet]
        public IActionResult GetLanlordInformation()
        {
            return Response(_service.GetLanlordInformation());
        }
    }
}
