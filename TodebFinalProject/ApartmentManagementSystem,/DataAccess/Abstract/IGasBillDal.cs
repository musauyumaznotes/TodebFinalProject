using Core.DataAccess.Abstract;
using Entities.Concrete;
using Entities.Concrete.SqlViews;
using System.Collections.Generic;

namespace DataAccess.Abstract
{
    public interface IGasBillDal : IEntityRepository<GasBill>
    {
        IList<HouseGasBillView> GetGasBillsByHomeId(int homeId);
        IList<HouseGasBillView> GetUnpaidGasBills();
        IList<HouseGasBillView> GetPaidInGasBills();
    }
}
