using Core.DataAccess.Abstract;
using Entities.Concrete;
using Entities.Concrete.SqlViews;
using System.Collections.Generic;

namespace DataAccess.Abstract
{
    public interface IElectricBillDal : IEntityRepository<ElectricBill>
    {
        IList<HouseElectricBillView> GetElectricBillsByHomeId(int homeId);
        IList<HouseElectricBillView> GetUnpaidElectricBills();
        IList<HouseElectricBillView> GetPaidInElectricBills();
    }
}
