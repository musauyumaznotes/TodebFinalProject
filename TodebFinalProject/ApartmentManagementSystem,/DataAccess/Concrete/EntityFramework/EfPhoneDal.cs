using Core.DataAccess.Concrete.EntityFramework;
using DataAccess.Abstract;
using DataAccess.Concrete.EntityFramework.Contexts;
using Entities.Concrete;

namespace DataAccess.Concrete.EntityFramework
{
    public class EfPhoneDal : EfEntityRepositoryBase<Phone, HousingEstateContext>,IPhoneDal
    {
        public EfPhoneDal(HousingEstateContext context) : base(context)
        {
        }
    }
}
