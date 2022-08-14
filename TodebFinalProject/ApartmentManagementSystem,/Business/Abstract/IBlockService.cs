using DTOs.Concrete.BlockDto.Commands;
using DTOs.Concrete.BlockDto.Queries;

namespace Business.Abstract
{
    public interface IBlockService : IBaseService<CommandBlockDto, QueryBlockDto>
    {
    }
}
