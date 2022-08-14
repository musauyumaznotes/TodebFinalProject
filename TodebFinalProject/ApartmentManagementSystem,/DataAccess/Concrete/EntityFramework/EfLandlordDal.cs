using Core.DataAccess.Concrete.EntityFramework;
using DataAccess.Abstract;
using DataAccess.Concrete.EntityFramework.Contexts;
using Entities.Concrete;
using Entities.Concrete.SqlViews;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Concrete.EntityFramework
{
    public class EfLandlordDal : EfEntityRepositoryBase<Landlord, HousingEstateContext> ,ILandlordDal
    {
        public EfLandlordDal(HousingEstateContext context) : base(context)
        {
        }

        public IList<UserInformationView> GetLanlordInformation()
        {
            var landlords = _context.LandLords.Select(x=>x.Id).ToList();
            var data = _context.UserInformationViews.Where(x=> landlords.Contains(x.Id)).ToList();
            return data;
        }
    }
}
