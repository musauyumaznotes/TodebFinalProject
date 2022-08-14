using Core.DataAccess.Concrete.EntityFramework;
using DataAccess.Abstract;
using DataAccess.Concrete.EntityFramework.Contexts;
using Entities.Concrete;
using Entities.Concrete.SqlViews;
using System.Collections.Generic;
using System.Linq;

namespace DataAccess.Concrete.EntityFramework
{
    public class EfWaterBillDal : EfEntityRepositoryBase<WaterBill, HousingEstateContext>,IWaterBillDal
    {
        public EfWaterBillDal(HousingEstateContext context) : base(context)
        {
        }

        public IList<HouseWaterBillView> GetPaidInWaterBills()
        {
            return _context.HouseWaterBillViews.Where(x => x.IsItPaid == true).ToList();
        }

        public IList<HouseWaterBillView> GetUnpaidWaterBills()
        {
            return _context.HouseWaterBillViews.Where(x => x.IsItPaid == false).ToList();
        }

        public IList<HouseWaterBillView> GetWaterBillsByHomeId(int homeId)
        {
            return _context.HouseWaterBillViews.Where(x => x.ApartmentId == homeId).ToList();
        }
    }
}
