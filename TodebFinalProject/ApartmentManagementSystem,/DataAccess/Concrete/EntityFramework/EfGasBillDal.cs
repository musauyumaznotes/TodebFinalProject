using Core.DataAccess.Concrete.EntityFramework;
using DataAccess.Abstract;
using DataAccess.Concrete.EntityFramework.Contexts;
using Entities.Concrete;
using Entities.Concrete.SqlViews;
using System.Collections.Generic;
using System.Linq;

namespace DataAccess.Concrete.EntityFramework
{
    public class EfGasBillDal : EfEntityRepositoryBase<GasBill, HousingEstateContext>,IGasBillDal
    {
        public EfGasBillDal(HousingEstateContext context) : base(context)
        {
            
        }
        public IList<HouseGasBillView> GetGasBillsByHomeId(int homeId)
        {
            return _context.HouseGasBillViews.Where(x => x.ApartmentId == homeId).ToList();
        }

        public IList<HouseGasBillView> GetPaidInGasBills()
        {
            return _context.HouseGasBillViews.Where(x => x.IsItPaid == true).ToList();
        }

        public IList<HouseGasBillView> GetUnpaidGasBills()
        {
            return _context.HouseGasBillViews.Where(x => x.IsItPaid == false).ToList();
        }
    }
}
