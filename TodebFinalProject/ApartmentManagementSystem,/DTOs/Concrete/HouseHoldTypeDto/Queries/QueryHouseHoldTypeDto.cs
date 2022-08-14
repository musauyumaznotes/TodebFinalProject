using Core.DTOs.Abstract;

namespace DTOs.Concrete.HouseHoldTypeDto.Queries
{
    public class QueryHouseHoldTypeDto : IQueryDto
    {
        public string HoldType { get; set; }
    }
}
