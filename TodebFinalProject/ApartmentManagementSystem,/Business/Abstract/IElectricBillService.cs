using Core.Utilities.Results.Abstract;
using DTOs.Concrete.ElectricBillDto.Commands;
using DTOs.Concrete.ElectricBillDto.Queries;
using Entities.Concrete.SqlViews;
using System.Collections;
using System.Collections.Generic;

namespace Business.Abstract
{
    public interface IElectricBillService : IBaseService<CommandElectricBillDto, QueryElectricBillDto>
    {
        IDataResult<IList<HouseElectricBillView>> GetElectricBillsByHomeId(int homeId);
        IDataResult<IList<HouseElectricBillView>> GetUnpaidElectricBills();
        IDataResult<IList<HouseElectricBillView>> GetPaidInElectricBills();
    }
}
