using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.Concrete.SqlViews
{
    public class ApartmentDetailView : BaseApartmentView
    {
        public string ApartmentDetails { get; set; }
        public string NumberOfRooms { get; set; }
        public string SquareMeterOfTheHouse { get; set; }
        public bool HaveABalcony { get; set; }
        public bool HaveEnSuiteBathroom { get; set; }
    }
}
