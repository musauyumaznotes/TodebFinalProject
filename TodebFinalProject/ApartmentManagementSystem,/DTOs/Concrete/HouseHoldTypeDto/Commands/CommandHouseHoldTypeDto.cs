using Core.DTOs.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTOs.Concrete.HouseHoldTypeDto.Commands
{
    public class CommandHouseHoldTypeDto : ICommandDto
    {
        public string HoldType { get; set; }
    }
}
