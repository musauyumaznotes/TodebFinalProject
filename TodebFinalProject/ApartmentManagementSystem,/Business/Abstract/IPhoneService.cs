using DTOs.Concrete.PhoneDto.Commands;
using DTOs.Concrete.PhoneDto.Queries;

namespace Business.Abstract
{
    public interface IPhoneService : IBaseService<CommandPhoneDto, QueryPhoneDto>
    {
    }
}
