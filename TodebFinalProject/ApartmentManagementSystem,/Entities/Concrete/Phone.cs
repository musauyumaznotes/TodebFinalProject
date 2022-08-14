using Core.Entities.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.Concrete
{
    public class Phone : BaseEntity
    {
        public int UserId { get; set; }
        public string PhoneNumber { get; set; }

        #region Relationships
        public virtual User User { get; set; }
        #endregion
    }
}
