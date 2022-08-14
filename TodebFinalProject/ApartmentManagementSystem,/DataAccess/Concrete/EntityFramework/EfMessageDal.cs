using Core.DataAccess.Concrete.EntityFramework;
using DataAccess.Abstract;
using DataAccess.Concrete.EntityFramework.Contexts;
using Entities.Concrete;
using Entities.Concrete.SqlViews;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Concrete.EntityFramework
{
    public class EfMessageDal : EfEntityRepositoryBase<Message, HousingEstateContext>,IMessageDal
    {
        public EfMessageDal(HousingEstateContext context) : base(context)
        {
        }

        public IList<MessageInformationView> GetAllMessageInformations()
        {
            return _context.MessageInformationViews.ToList();
        }
    }
}
