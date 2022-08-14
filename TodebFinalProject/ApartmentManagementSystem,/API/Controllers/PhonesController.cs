using Business.Abstract;
using DTOs.Concrete.PhoneDto.Commands;
using DTOs.Concrete.PhoneDto.Queries;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class PhonesController : BaseController<IPhoneService,QueryPhoneDto,CommandPhoneDto>
    {
        public PhonesController(IPhoneService phoneService)
        {
            _service = phoneService;
        }
    }
}
