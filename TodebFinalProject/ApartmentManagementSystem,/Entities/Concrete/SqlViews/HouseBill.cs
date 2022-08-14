using Core.DTOs.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.Concrete.SqlViews
{
    public class HouseBill
    {
        public int Id { get; set; }
        public int ApartmentId { get; set; }
        public string Name { get; set; }
        public string ApartmentNumber { get; set; }
        public string FullName { get; set; }
        public string PhoneNumber { get; set; }
        public string Email { get; set; }
        public decimal TotalBill { get; set; }
        public decimal AmountOfUsage { get; set; }
        public DateTime DueDate { get; set; }
        public bool? IsItPaid { get; set; }
        public DateTime? PaymentDate { get; set; }
    }
}
