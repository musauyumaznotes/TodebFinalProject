using Business.Abstract;
using DTOs.Concrete.WaterBillDto.Commands;
using DTOs.Concrete.WaterBillDto.Queries;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class WaterBillsController : BaseController<IWaterBillService, QueryWaterBillDto, CommandWaterBillDto>
    {
        public WaterBillsController(IWaterBillService waterBillService)
        {
            _service = waterBillService;
        }
        [HttpGet]
        public IActionResult GetWaterBillsByHomeId(int homeId)
        {
            return Response(_service.GetWaterBillsByHomeId(homeId));
        }
        [HttpGet]
        public IActionResult GetUnpaidWaterBills()
        {
            return Response(_service.GetUnpaidWaterBills());
        }
        [HttpGet]
        public IActionResult GetPaidInWaterBills()
        {
            return Response(_service.GetPaidInWaterBills());
        }

    }
}
