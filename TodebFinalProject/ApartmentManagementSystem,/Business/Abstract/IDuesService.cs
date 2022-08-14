using DTOs.Concrete.DuesDto.Commands;
using DTOs.Concrete.DuesDto.Queries;

namespace Business.Abstract
{
    public interface IDuesService : IBaseService<CommandDuesDto, QueryDuesDto>
    {
    }
}
