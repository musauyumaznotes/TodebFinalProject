using Core.DataAccess.Concrete.EntityFramework;
using DataAccess.Abstract;
using DataAccess.Concrete.EntityFramework.Contexts;
using DTOs.Concrete.ElectricBillDto.Queries;
using Entities.Concrete;
using Entities.Concrete.SqlViews;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;

namespace DataAccess.Concrete.EntityFramework
{
    public class EfApartmentDal : EfEntityRepositoryBase<Apartment,HousingEstateContext>,IApartmentDal
    {
        public EfApartmentDal(HousingEstateContext context) : base(context)
        {
        }

        public ICollection<ApartmentView> GetAllApartments()
        {
            return _context.ApartmentViews.ToList();
        }
    }
}
