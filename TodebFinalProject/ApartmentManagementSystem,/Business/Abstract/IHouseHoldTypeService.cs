using DTOs.Concrete.HouseHoldTypeDto.Commands;
using DTOs.Concrete.HouseHoldTypeDto.Queries;

namespace Business.Abstract
{
    public interface IHouseHoldTypeService : IBaseService<CommandHouseHoldTypeDto, QueryHouseHoldTypeDto>
    {
    }
}
