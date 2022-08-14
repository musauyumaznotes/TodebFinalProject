using Business.Abstract;
using DTOs.Concrete.MessageDto.Commands;
using DTOs.Concrete.MessageDto.Queries;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class MessagesController : BaseController<IMessageService, QueryMessageDto, CommandMessageDto>
    {
        public MessagesController(IMessageService messageService)
        {
            _service = messageService;
        }
        [HttpGet]
        public IActionResult GetAllMessageInformations()
        {
            return Response(_service.GetAllMessageInformations());
        }
    }
}
