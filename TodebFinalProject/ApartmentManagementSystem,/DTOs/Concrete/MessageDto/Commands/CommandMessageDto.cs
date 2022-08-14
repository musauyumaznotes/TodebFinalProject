using Core.DTOs.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTOs.Concrete.MessageDto.Commands
{
    public class CommandMessageDto : ICommandDto
    {
        public int SenderId { get; set; }
        public int ReceiverId { get; set; }
        public string Content { get; set; }
        public bool IsItRead { get; set; }
    }
}
