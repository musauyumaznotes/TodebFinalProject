using Core.DataAccess.Abstract;
using Entities.Concrete;
using Entities.Concrete.SqlViews;
using System.Collections.Generic;

namespace DataAccess.Abstract
{
    public interface ILesseeDal : IEntityRepository<Lessee>
    {
        IList<UserInformationView> GetLesseeInformation();
    }
}
