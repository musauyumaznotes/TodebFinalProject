using Core.DataAccess.Abstract;
using Entities.Concrete;
using Entities.Concrete.SqlViews;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Abstract
{
    public interface IMessageDal : IEntityRepository<Message>
    {
        IList<MessageInformationView> GetAllMessageInformations();
    }
}
