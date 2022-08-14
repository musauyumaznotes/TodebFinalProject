using Business.Abstract;
using DTOs.Concrete.DuesDto.Commands;
using DTOs.Concrete.DuesDto.Queries;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class DuesController : BaseController<IDuesService, QueryDuesDto, CommandDuesDto>
    {
        public DuesController(IDuesService duesService)
        {
            _service = duesService;
        }
    }

}
