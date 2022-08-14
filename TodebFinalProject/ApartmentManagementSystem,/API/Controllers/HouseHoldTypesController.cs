using Business.Abstract;
using DTOs.Concrete.HouseHoldTypeDto.Commands;
using DTOs.Concrete.HouseHoldTypeDto.Queries;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class HouseHoldTypesController : BaseController<IHouseHoldTypeService, QueryHouseHoldTypeDto, CommandHouseHoldTypeDto>
    {
        public HouseHoldTypesController(IHouseHoldTypeService houseHoldTypeService)
        {
            _service = houseHoldTypeService;
        }
    }
}
