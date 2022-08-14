using Core.DataAccess.Concrete.EntityFramework;
using DataAccess.Abstract;
using DataAccess.Concrete.EntityFramework.Contexts;
using Entities.Concrete;
using Entities.Concrete.SqlViews;
using System.Collections.Generic;
using System.Linq;

namespace DataAccess.Concrete.EntityFramework
{
    public class EfElectricBillDal : EfEntityRepositoryBase<ElectricBill, HousingEstateContext>, IElectricBillDal
    {
        public EfElectricBillDal(HousingEstateContext context) : base(context)
        {
        }

        public IList<HouseElectricBillView> GetElectricBillsByHomeId(int homeId)
        {
            return _context.HouseElectricBillViews.Where(x => x.ApartmentId == homeId).ToList();
        }
        public IList<HouseElectricBillView> GetUnpaidElectricBills()
        {
            return _context.HouseElectricBillViews.Where(x => x.IsItPaid == false).ToList();
        }
        public IList<HouseElectricBillView> GetPaidInElectricBills()
        {
            return _context.HouseElectricBillViews.Where(x => x.IsItPaid == true).ToList();
        }
    }
}
