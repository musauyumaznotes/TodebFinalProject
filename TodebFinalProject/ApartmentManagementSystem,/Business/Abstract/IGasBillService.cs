using Core.Utilities.Results.Abstract;
using DTOs.Concrete.GasBillDto.Commands;
using DTOs.Concrete.GasBillDto.Queries;
using Entities.Concrete.SqlViews;
using System.Collections.Generic;

namespace Business.Abstract
{
    public interface IGasBillService : IBaseService<CommandGasBillDto, QueryGasBillDto>
    {
        IDataResult<IList<HouseGasBillView>> GetGasBillsByHomeId(int homeId);
        IDataResult<IList<HouseGasBillView>> GetUnpaidGasBills();
        IDataResult<IList<HouseGasBillView>> GetPaidInGasBills();
    }
}
