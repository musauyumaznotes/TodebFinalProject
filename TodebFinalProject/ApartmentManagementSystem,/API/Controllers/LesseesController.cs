using Business.Abstract;
using DTOs.Concrete.LesseeDto.Commands;
using DTOs.Concrete.LesseeDto.Queries;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class LesseesController : BaseController<ILesseeService,QueryLesseeDto,CommandLesseeDto>
    {
        public LesseesController(ILesseeService lesseeService)
        {
            _service = lesseeService;
        }
        [HttpGet]
        public IActionResult GetLesseeInformation()
        {
            return Response(_service.GetLesseeInformation());
        }
    }
}
