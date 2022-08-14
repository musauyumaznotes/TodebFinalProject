using Core.DTOs.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTOs.Concrete.UserDto.Commands
{
    public abstract class CommandUserDto : ICommandDto
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string NationalIdentityNumber { get; set; }
        public string Email { get; set; }
        public bool HaveAVehicle { get; set; }
        public string LicensePlate { get; set; }
    }
}
