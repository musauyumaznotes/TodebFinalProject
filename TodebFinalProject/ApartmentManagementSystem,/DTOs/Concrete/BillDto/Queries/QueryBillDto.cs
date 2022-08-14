using Core.DTOs.Abstract;
using System;

namespace DTOs.Concrete.BillDto.Queries
{
    public abstract class QueryBillDto : IQueryDto
    {
        public int Id { get; set; }
        public int ApartmentId { get; set; }
        public DateTime DueDate { get; set; }
        public decimal AmountOfUsage { get; set; }
        public decimal UnitPrice { get; set; }
        public decimal TotalBill { get; set; }
        public bool IsItPaid { get; set; }
        public DateTime? PaymentDate { get; set; }
    }
}
