using Core.Entities.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.Concrete
{
    public class Block : BaseEntity
    {
        public string Name { get; set; }
        public string NumberOfFloors { get; set; }
        public bool HaveAElevator { get; set; }


        #region Relationships
        public virtual ICollection<Apartment> Apartments { get; set; }
        #endregion
    }
}
