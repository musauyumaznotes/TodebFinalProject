using Core.DataAccess.Concrete.EntityFramework;
using DataAccess.Abstract;
using DataAccess.Concrete.EntityFramework.Contexts;
using Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Concrete.EntityFramework
{
    public class EfHouseHoldTypeDal : EfEntityRepositoryBase<HouseHoldType, HousingEstateContext>, IHouseHoldTypeDal
    {
        public EfHouseHoldTypeDal(HousingEstateContext context) : base(context)
        {
        }
    }
}
