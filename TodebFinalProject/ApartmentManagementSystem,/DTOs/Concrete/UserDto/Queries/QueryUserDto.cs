using Core.DTOs.Abstract;

namespace DTOs.Concrete.UserDto.Queries
{
    public abstract class QueryUserDto : IQueryDto
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string NationalIdentityNumber { get; set; }
        public string Email { get; set; }
        public bool HaveAVehicle { get; set; }
        public string LicensePlate { get; set; }
    }
}
