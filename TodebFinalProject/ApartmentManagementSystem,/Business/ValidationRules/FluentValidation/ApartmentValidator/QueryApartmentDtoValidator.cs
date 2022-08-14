using DTOs.Concrete.ApartmentDto.Queries;
using Entities.Concrete;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.ValidationRules.FluentValidation.ApartmentValidator
{
    public class QueryApartmentDtoValidator : AbstractValidator<QueryApartmentDto>
    {
        public QueryApartmentDtoValidator()
        {
            #region EmptyNull
            RuleFor(x => x.Id).NotEmpty().NotNull().WithMessage("Bir dairenin Id Değeri boş geçilemez");
            RuleFor(x => x.LandlordId).NotEmpty().NotNull().WithMessage("Bir dairenin sahibi boş geçilemez");
            RuleFor(x => x.HouseHoldTypeId).NotEmpty().NotNull().WithMessage("Bir dairenin tipi boş geçilemez");
            RuleFor(x => x.BlockId).NotEmpty().NotNull().WithMessage("Bir dairenin hangi blokta olduğu boş geçilemez");
            RuleFor(x => x.Floor).NotEmpty().NotNull().WithMessage("Bir dairenin hangi katta olduğu boş geçilemez");
            RuleFor(x => x.ApartmentNumber).NotEmpty().NotNull().WithMessage("Bir dairenin numarası olduğu boş geçilemez");
            RuleFor(x => x.Status).NotEmpty().NotNull().WithMessage("Bir dairenin durum bilgisi boş geçilemez");

            #endregion
            #region GreaterLessThan
            RuleFor(x => x.Id).GreaterThan(0).WithMessage("Bir dairenin Id Değeri 0'dan büyük olmalıdır");
            #endregion
        }

    }
}
