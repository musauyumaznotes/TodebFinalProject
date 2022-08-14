using Business.Abstract;
using Core.DTOs.Abstract;
using Core.Utilities.Results.Abstract;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class BaseController<TService, TQueryDto, TCommandDto> : ControllerBase
        where TService : IBaseService<TCommandDto, TQueryDto>
        where TQueryDto : class, IQueryDto, new()
        where TCommandDto : class, ICommandDto, new()
    {  
        public TService _service;
        protected IActionResult Response(IResult result)
        {
            if (!result.Success)
            {
                return BadRequest(result);
            }
            return Ok(result);
        }

        [HttpGet]
        public virtual IActionResult GetAll()
        {
            return Response(_service.GetAll());
        }
        [HttpGet]
        public virtual IActionResult GetById(int entityId)
        {
            return Response(_service.GetById(entityId));
        }
        [HttpPost]
        public virtual IActionResult Add(TCommandDto entity)
        {
            return Response(_service.Add(entity));
        }
        [HttpDelete]
        public virtual IActionResult Delete(TQueryDto entity)
        {
            return Response(_service.Delete(entity));
        }
        [HttpPut]
        public virtual IActionResult Update(TQueryDto entity)
        {
            return Response(_service.Update(entity));

        }
    }
}