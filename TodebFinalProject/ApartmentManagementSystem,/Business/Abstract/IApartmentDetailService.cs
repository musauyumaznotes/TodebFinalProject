using Core.Utilities.Results.Abstract;
using DTOs.Concrete.ApartmentDetailDto.Commands;
using DTOs.Concrete.ApartmentDetailDto.Queries;
using Entities.Concrete.SqlViews;
using System.Collections.Generic;

namespace Business.Abstract
{
    public interface IApartmentDetailService : IBaseService<CommandApartmentDetailDto, QueryApartmentDetailDto>
    {
        IResult Add(CommandApartmentDetailDto commandDto);
        IDataResult<IList<ApartmentDetailView>> GetAllApartmentWithDetail();
    }
}
