using Core.DataAccess.Abstract;
using Entities.Concrete;
using Entities.Concrete.SqlViews;
using System.Collections.Generic;

namespace DataAccess.Abstract
{
    public interface ILandlordDal : IEntityRepository<Landlord>
    {
        IList<UserInformationView> GetLanlordInformation();
    }
}
