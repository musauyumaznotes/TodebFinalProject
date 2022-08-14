using Core.DataAccess.Abstract;
using Entities.Concrete;
using Entities.Concrete.SqlViews;
using System.Collections.Generic;

namespace DataAccess.Abstract
{
    public interface IWaterBillDal : IEntityRepository<WaterBill>
    {
        IList<HouseWaterBillView> GetWaterBillsByHomeId(int homeId);
        IList<HouseWaterBillView> GetUnpaidWaterBills();
        IList<HouseWaterBillView> GetPaidInWaterBills();
    }
}
