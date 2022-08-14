using Core.Entities.Abstract;
using Core.Utilities.Results.Abstract;
using Entities.Concrete.SqlViews;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Abstract
{
    public interface IUserService 
    {
        IDataResult<IList<UserInformationView>> GetAllUserInformations();
        IDataResult<User> GetById(int id);
    }
}
