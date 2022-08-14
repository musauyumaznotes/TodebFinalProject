using Core.DTOs.Abstract;

namespace DTOs.Concrete.BlockDto.Queries
{
    public class QueryBlockDto : IQueryDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string NumberOfFloors { get; set; }
        public bool HaveAElevator { get; set; }
    }
}
