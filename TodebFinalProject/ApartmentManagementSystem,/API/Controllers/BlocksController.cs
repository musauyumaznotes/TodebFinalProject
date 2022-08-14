using Business.Abstract;
using DTOs.Concrete.BlockDto.Commands;
using DTOs.Concrete.BlockDto.Queries;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class BlocksController : BaseController<IBlockService,QueryBlockDto,CommandBlockDto>
    {
        public BlocksController(IBlockService blockService)
        {
            _service = blockService;
        }
    }
}
