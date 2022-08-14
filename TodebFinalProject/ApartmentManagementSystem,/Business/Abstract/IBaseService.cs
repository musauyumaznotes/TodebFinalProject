using Core.DTOs.Abstract;
using Core.Utilities.Results.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Abstract
{
    public interface IBaseService<TCommandDto,TQueryDto>
        where TCommandDto : class, ICommandDto, new()
        where TQueryDto : class, IQueryDto, new()
    {
        IResult Add(TCommandDto commandDto); 
        IResult Update(TQueryDto queryDto); 
        IResult Delete(TQueryDto queryDto); 
        IDataResult<IList<TCommandDto>> GetAll(); 
        IDataResult<TQueryDto> GetById(int id); 
    }
}
