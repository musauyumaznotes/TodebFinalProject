using Core.Utilities.Results.Abstract;
using DTOs.Concrete.MessageDto.Commands;
using DTOs.Concrete.MessageDto.Queries;
using Entities.Concrete.SqlViews;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Abstract
{
    public interface IMessageService : IBaseService<CommandMessageDto,QueryMessageDto>
    {
        IDataResult<IList<MessageInformationView>> GetAllMessageInformations();
    }
}
