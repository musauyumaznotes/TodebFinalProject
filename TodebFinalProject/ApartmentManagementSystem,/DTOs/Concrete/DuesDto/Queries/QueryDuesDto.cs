using Core.DTOs.Abstract;
using System;
using Entities.Concrete;

namespace DTOs.Concrete.DuesDto.Queries
{
    public class QueryDuesDto : IQueryDto
    {
        public int Id { get; set; }
        public Apartment Apartment { get; set; }
        public decimal Price { get; set; }
        public DateTime DueDate { get; set; }
        public bool IsItPaid { get; set; }
        public DateTime PaymentDate { get; set; }

    }
}
