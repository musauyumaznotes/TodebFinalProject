using Core.Utilities.Results.Abstract;
using DTOs.Concrete.ElectricBillDto.Queries;
using DTOs.Concrete.WaterBillDto.Commands;
using DTOs.Concrete.WaterBillDto.Queries;
using Entities.Concrete.SqlViews;
using System.Collections.Generic;

namespace Business.Abstract
{
    public interface IWaterBillService : IBaseService<CommandWaterBillDto, QueryWaterBillDto>
    {
        IDataResult<IList<HouseWaterBillView>> GetWaterBillsByHomeId(int homeId);
        IDataResult<IList<HouseWaterBillView>> GetUnpaidWaterBills();
        IDataResult<IList<HouseWaterBillView>> GetPaidInWaterBills();
    }
}
