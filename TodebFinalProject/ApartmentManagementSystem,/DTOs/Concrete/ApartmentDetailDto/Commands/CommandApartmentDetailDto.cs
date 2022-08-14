using Core.DTOs.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTOs.Concrete.ApartmentDetailDto.Commands
{
    public class CommandApartmentDetailDto : ICommandDto
    {
        public int LandlordId { get; set; }
        public int HouseUserId { get; set; }
        public int HouseHoldTypeId { get; set; }
        public int BlockId { get; set; }
        public string AparmentNumber { get; set; }
        public bool Status { get; set; }
        public string Floor { get; set; }
        public string ApartmentDetails { get; set; }
        public bool HaveEnSuiteBathroom { get; set; }
        public string NumberOfRooms { get; set; }
        public string SquareMeterOfTheHouse { get; set; }
        public bool HaveABalcony { get; set; }
    }


}
