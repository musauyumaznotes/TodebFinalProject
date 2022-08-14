using DTOs.Concrete.ApartmentDto.Commands;
using FluentValidation;

namespace Business.ValidationRules.FluentValidation.ApartmentValidator
{
    public class CommandApartmentDtoValidator : AbstractValidator<CommandApartmentDto>
    {
        public CommandApartmentDtoValidator()
        {
            #region EmptyNull
            RuleFor(x => x.LandlordId).NotEmpty().NotNull().WithMessage("Bir dairenin sahibi boş geçilemez");
            RuleFor(x => x.HouseHoldTypeId).NotEmpty().NotNull().WithMessage("Bir dairenin tipi boş geçilemez");
            RuleFor(x => x.BlockId).NotEmpty().NotNull().WithMessage("Bir dairenin hangi blokta olduğu boş geçilemez");
            RuleFor(x => x.Floor).NotEmpty().NotNull().WithMessage("Bir dairenin hangi katta olduğu boş geçilemez");
            RuleFor(x => x.ApartmentNumber).NotEmpty().NotNull().WithMessage("Bir dairenin numarası olduğu boş geçilemez");
            RuleFor(x => x.Status).NotEmpty().NotNull().WithMessage("Bir dairenin durum bilgisi boş geçilemez");
            #endregion
            
        }

    }
}
