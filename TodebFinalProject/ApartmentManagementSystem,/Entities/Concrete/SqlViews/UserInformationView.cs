using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.Concrete.SqlViews
{
    public class UserInformationView
    {
        public int Id { get; set; }
        public string FullName { get; set; }
        public string NationalIdentityNumber { get; set; }
        public string Email { get; set; }
        public bool HaveAVehicle { get; set; }
        public string LicensePlate { get; set; }
        public string PhoneNumber { get; set; }
    }
}
