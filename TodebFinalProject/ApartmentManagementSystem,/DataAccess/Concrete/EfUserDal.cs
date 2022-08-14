using DataAccess.Abstract;
using DataAccess.Concrete.EntityFramework.Contexts;
using Entities.Concrete.SqlViews;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Concrete
{
    public class EfUserDal : IUserDal
    {
        public IList<UserInformationView> GetAllUserInformations()
        {
            using (HousingEstateContext context = new HousingEstateContext())
            {
                return context.UserInformationViews.ToList();
            }
        }
    }
}
