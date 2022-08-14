using Core.Entities.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.Concrete
{
    public class Dues:BaseEntity
    {
        public int ApartmentId { get; set; }
        public decimal Price { get; set; }
        public DateTime DueDate { get; set; }
        public bool IsItPaid { get; set; }
        public DateTime PaymentDate { get; set; }


        #region Relationships
        public virtual Apartment Apartment { get; set; }
        #endregion
    }
}
