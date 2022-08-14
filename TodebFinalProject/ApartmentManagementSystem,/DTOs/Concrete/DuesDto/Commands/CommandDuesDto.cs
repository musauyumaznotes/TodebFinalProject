using Core.DTOs.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities.Concrete;

namespace DTOs.Concrete.DuesDto.Commands
{
    public class CommandDuesDto : ICommandDto
    {
        public Apartment Apartment { get; set; }
        public decimal Price { get; set; }
        public DateTime DueDate { get; set; }
        public bool IsItPaid { get; set; }
        public DateTime PaymentDate { get; set; }

    } }
