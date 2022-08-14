using Business.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.ValidationRules.BusinessRules
{
    public class ApartmentBusinessRules
    {
        private readonly IApartmentService _apartmentService;
        private readonly IUserService _userService;
        public ApartmentBusinessRules(IApartmentService apartmentService)
        {
            _apartmentService = apartmentService;
        }
    }
}
