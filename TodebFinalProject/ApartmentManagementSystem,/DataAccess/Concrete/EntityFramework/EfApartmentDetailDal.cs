using Core.DataAccess.Concrete.EntityFramework;
using DataAccess.Abstract;
using DataAccess.Concrete.EntityFramework.Contexts;
using Entities.Concrete;
using Entities.Concrete.SqlViews;
using System.Collections.Generic;
using System.Linq;

namespace DataAccess.Concrete.EntityFramework
{
    public class EfApartmentDetailDal : EfEntityRepositoryBase<ApartmentDetail, HousingEstateContext>,IApartmentDetailDal
    {
        public EfApartmentDetailDal(HousingEstateContext context) : base(context)
        {
        }

        public ICollection<ApartmentDetailView> GetAllApartmentsWithDetails()
        {
            return _context.ApartmentDetailViews.ToList();
        }
    }
}
