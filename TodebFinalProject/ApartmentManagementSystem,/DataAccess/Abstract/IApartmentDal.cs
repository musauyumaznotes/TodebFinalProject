using Core.DataAccess.Abstract;
using DTOs.Concrete.ElectricBillDto.Queries;
using Entities.Concrete;
using Entities.Concrete.SqlViews;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Abstract
{
    public interface IApartmentDal : IEntityRepository<Apartment>
    {
        ICollection<ApartmentView> GetAllApartments();
    }
}
