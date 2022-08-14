using Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.Entities.Abstract
{
    public abstract class User : BaseEntity
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string NationalIdentityNumber { get; set; }
        public string Email { get; set; }
        public bool HaveAVehicle { get; set; }
        public string? LicensePlate { get; set; }


        #region Relationships
        public virtual ICollection<Apartment> Apartments { get; set; }
        public virtual ICollection<Phone> Phones { get; set; }
        #endregion
    }
}
