using Core.Entities.Abstract;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.Concrete
{
    public class Apartment : BaseEntity
    {
        public int? LandlordId { get; set; }
        public int? HouseUserId { get; set; }
        public int HouseHoldTypeId { get; set; }
        public int BlockId { get; set; }
        public string Floor { get; set; }
        public string ApartmentNumber { get; set; }
        public bool Status { get; set; }


        #region RelationShips
        public virtual Landlord Landlord { get; set; }
        [ForeignKey("HouseUserId")]
        public virtual User User { get; set; }
        public virtual HouseHoldType HouseHoldType { get; set; }
        public virtual Block Block { get; set; }
        public virtual ICollection<Dues> Dues { get; set; }
        public virtual ICollection<Bill> Bills { get; set; }
       
        #endregion



    }
}
