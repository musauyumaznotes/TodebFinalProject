using Core.DataAccess.Concrete.EntityFramework;
using DataAccess.Abstract;
using DataAccess.Concrete.EntityFramework.Contexts;
using Entities.Concrete;
using Entities.Concrete.SqlViews;
using System.Collections.Generic;
using System.Linq;

namespace DataAccess.Concrete.EntityFramework
{
    public class EfLesseeDal : EfEntityRepositoryBase<Lessee, HousingEstateContext>,ILesseeDal
    {
        public EfLesseeDal(HousingEstateContext context) : base(context)
        {
        }

        public IList<UserInformationView> GetLesseeInformation()
        {
            var lessees = _context.Lessees.Select(x => x.Id).ToList();
            var data = _context.UserInformationViews.Where(x => lessees.Contains(x.Id)).ToList();
            return data;
        }
    }
}
