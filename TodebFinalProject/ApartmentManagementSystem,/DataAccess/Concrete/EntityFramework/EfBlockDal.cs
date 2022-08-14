using Core.DataAccess.Concrete.EntityFramework;
using DataAccess.Abstract;
using DataAccess.Concrete.EntityFramework.Contexts;
using Entities.Concrete;

namespace DataAccess.Concrete.EntityFramework
{
    public class EfBlockDal : EfEntityRepositoryBase<Block, HousingEstateContext>,IBlockDal
    {
        public EfBlockDal(HousingEstateContext context) : base(context)
        {
        }
    }
}
