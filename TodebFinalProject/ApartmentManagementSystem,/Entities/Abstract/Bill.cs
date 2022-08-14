using Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.Entities.Abstract
{
    public abstract class Bill : BaseEntity
    {
        public int ApartmentId { get; set; }
        public DateTime DueDate { get; set; }
        public decimal AmountOfUsage { get; set; }
        public decimal UnitPrice { get; set; }
        public decimal TotalBill { get; set; }
        public bool IsItPaid { get; set; }
        public DateTime? PaymentDate { get; set; }


        #region Relationships
        public virtual Apartment Apartment { get; set; }
        #endregion
    }
}
