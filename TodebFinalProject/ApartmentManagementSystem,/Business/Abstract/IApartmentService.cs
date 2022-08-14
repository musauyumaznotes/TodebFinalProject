using Core.Utilities.Results.Abstract;
using DTOs.Concrete.ApartmentDto.Commands;
using DTOs.Concrete.ApartmentDto.Queries;
using DTOs.Concrete.ElectricBillDto.Queries;
using Entities.Concrete;
using Entities.Concrete.SqlViews;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Abstract
{
    public interface IApartmentService : IBaseService<CommandApartmentDto, QueryApartmentDto>
    {
        IDataResult<IList<ApartmentView>> GetAllApartment();
    }
}
