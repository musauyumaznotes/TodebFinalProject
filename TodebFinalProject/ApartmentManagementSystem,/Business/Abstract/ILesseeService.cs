using Core.Utilities.Results.Abstract;
using DTOs.Concrete.LesseeDto.Commands;
using DTOs.Concrete.LesseeDto.Queries;
using Entities.Concrete.SqlViews;
using System.Collections;
using System.Collections.Generic;

namespace Business.Abstract
{
    public interface ILesseeService : IBaseService<CommandLesseeDto, QueryLesseeDto>
    {
        IDataResult<IList<UserInformationView>> GetLesseeInformation();
    }
}
