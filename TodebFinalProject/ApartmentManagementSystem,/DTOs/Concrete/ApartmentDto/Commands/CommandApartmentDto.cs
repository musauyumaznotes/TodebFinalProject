using Core.DTOs.Abstract;
using Core.Entities.Abstract;
using Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTOs.Concrete.ApartmentDto.Commands
{
    public class CommandApartmentDto : ICommandDto
    {
        public int? LandlordId { get; set; }
        public int? HouseUserId { get; set; }
        public int HouseHoldTypeId { get; set; }
        public int BlockId { get; set; }
        public string Floor { get; set; }
        public string ApartmentNumber { get; set; }
        public bool Status { get; set; }
    }
}
