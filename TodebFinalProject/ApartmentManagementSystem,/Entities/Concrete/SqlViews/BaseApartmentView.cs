using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.Concrete.SqlViews
{
    public abstract class BaseApartmentView
    {
        public int Id { get; set; }
        public string Block { get; set; }
        public string ApartmentNumber { get; set; }
        public string Floor { get; set; }
        public bool Status { get; set; }
        public string HoldType { get; set; }
        public string UserName { get; set; }
    }
}
