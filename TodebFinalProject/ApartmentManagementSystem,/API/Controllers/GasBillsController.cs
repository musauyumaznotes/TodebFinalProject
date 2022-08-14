using Business.Abstract;
using DTOs.Concrete.GasBillDto.Commands;
using DTOs.Concrete.GasBillDto.Queries;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class GasBillsController : BaseController<IGasBillService, QueryGasBillDto,CommandGasBillDto>
    {
        public GasBillsController(IGasBillService gasBillService)
        {
            _service = gasBillService;
        }
        [HttpGet]
        public IActionResult GetWaterBillsByHomeId(int homeId)
        {
            return Response(_service.GetGasBillsByHomeId(homeId));
        }
        [HttpGet]
        public IActionResult GetUnpaidGasBills()
        {
            return Response(_service.GetUnpaidGasBills());
        }
        [HttpGet]
        public IActionResult GetPaidInGasBills()
        {
            return Response(_service.GetPaidInGasBills());
        }
    }
}
