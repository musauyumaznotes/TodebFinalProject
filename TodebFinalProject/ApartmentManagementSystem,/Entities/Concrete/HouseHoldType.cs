using Core.Entities.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.Concrete
{
    public class HouseHoldType : BaseEntity
    {
        public string HoldType { get; set; }

        #region Relationships
        public virtual ICollection<Apartment> Apartments { get; set; }
        #endregion

    }
}
