using Business.Abstract;
using DTOs.Concrete.ElectricBillDto.Commands;
using DTOs.Concrete.ElectricBillDto.Queries;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class ElectricBillsController : BaseController<IElectricBillService, QueryElectricBillDto, CommandElectricBillDto>
    {
        public ElectricBillsController(IElectricBillService service)
        {
            _service = service;
        }
        [HttpGet]
        public IActionResult GetElectricBillsByHomeId(int homeId)
        {
            return Response(_service.GetElectricBillsByHomeId(homeId));
        }
        [HttpGet]
        public IActionResult GetUnpaidElectricBills()
        {
            return Response(_service.GetUnpaidElectricBills());
        }
        [HttpGet]
        public IActionResult GetPaidInElectricBills()
        {
            return Response(_service.GetPaidInElectricBills());
        }
    }
}
