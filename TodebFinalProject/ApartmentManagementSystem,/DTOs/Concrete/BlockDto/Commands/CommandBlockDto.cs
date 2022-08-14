using Core.DTOs.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTOs.Concrete.BlockDto.Commands
{
    public class CommandBlockDto : ICommandDto
    {
        public string Name { get; set; }
        public string NumberOfFloors { get; set; }
        public bool HaveAElevator { get; set; }
    }
}
