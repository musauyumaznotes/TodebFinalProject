using Core.Utilities.Results.Abstract;
using DTOs.Concrete.LandlordDto.Commands;
using DTOs.Concrete.LandlordDto.Queries;
using Entities.Concrete.SqlViews;
using System.Collections.Generic;

namespace Business.Abstract
{
    public interface ILandlordService : IBaseService<CommandLandlordDto, QueryLandlordDto>
    {
        IDataResult<IList<UserInformationView>> GetLanlordInformation();
    }
}
