using Core.DTOs.Abstract;
using Core.Entities.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTOs.Concrete.PhoneDto.Commands
{
    public class CommandPhoneDto : ICommandDto
    {
        public int UserId { get; set; }
        public string PhoneNumber { get; set; }
    }}
