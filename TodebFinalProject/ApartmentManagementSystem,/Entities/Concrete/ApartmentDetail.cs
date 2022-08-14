using Core.Entities.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.Concrete
{
    public class ApartmentDetail : Apartment
    {
        public int Id { get; set; }
        public string ApartmentDetails { get; set; }
        public bool HaveEnSuiteBathroom { get; set; }
        public string NumberOfRooms { get; set; }
        public string SquareMeterOfTheHouse { get; set; }
        public bool HaveABalcony { get; set; }



    }
}
