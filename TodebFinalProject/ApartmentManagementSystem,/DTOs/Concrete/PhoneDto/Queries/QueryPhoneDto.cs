using Core.DTOs.Abstract;

namespace DTOs.Concrete.PhoneDto.Queries
{
    public class QueryPhoneDto : IQueryDto
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public string PhoneNumber { get; set; }
    }
}
