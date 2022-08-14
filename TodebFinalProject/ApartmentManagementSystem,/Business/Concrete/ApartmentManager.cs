using AutoMapper;
using Business.Abstract;
using Business.Configuration.Extensions;
using Business.Constants;
using Business.ValidationRules.FluentValidation.ApartmentValidator;
using Core.CrossCuttingConcerns.Validation;
using Core.DTOs.Abstract;
using Core.Utilities.Business;
using Core.Utilities.Results.Abstract;
using Core.Utilities.Results.Concrete;
using DataAccess.Abstract;
using DTOs.Concrete.ApartmentDto.Commands;
using DTOs.Concrete.ApartmentDto.Queries;
using DTOs.Concrete.ElectricBillDto.Queries;
using Entities.Concrete;
using Entities.Concrete.SqlViews;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Concrete
{
    public class ApartmentManager : IApartmentService
    {
        private readonly IApartmentDal _apartmentDal;
        private readonly IMapper _mapper;
        public ApartmentManager(IApartmentDal apartmentDal, IMapper mapper)
        {
            _apartmentDal = apartmentDal;
            _mapper = mapper;
        }

        public IResult Add(CommandApartmentDto commandDto)
        {
            
            try
            {
                ValidationTool.Validate(new CommandApartmentDtoValidator(), commandDto);
                var addedApartment = _mapper.Map<Apartment>(commandDto);
                _apartmentDal.Insert(addedApartment);
                IResult result = BusinessRules.Run();
                if (result != null)
                {
                    return new ErrorResult(result.Message);
                }
                return new SuccessResult(Messages.Added);
            }
            catch (Exception exc)
            {
                return new ErrorResult(exc.Message);
            }

        }

        public IResult Delete(QueryApartmentDto queryDto)
        {
            var deletedApartment = _mapper.Map<Apartment>(queryDto);
            _apartmentDal.Delete(deletedApartment);
            return new SuccessResult(Messages.Deleted);
        }

        public IDataResult<IList<CommandApartmentDto>> GetAll()
        {
            var data = _apartmentDal.GetAll();
            var mappedData = data.Select(x => _mapper.Map<CommandApartmentDto>(x)).ToList();
            return new SuccessDataResult<IList<CommandApartmentDto>>(mappedData, Messages.Listed);
        }

        public IDataResult<IList<ApartmentView>> GetAllApartment()
        {
            var data = _apartmentDal.GetAllApartments().ToList();
            return new SuccessDataResult<IList<ApartmentView>>(data, Messages.Listed);
        }

        public IDataResult<QueryApartmentDto> GetById(int id)
        {
            var data = _apartmentDal.Get(x => x.Id == id);
            var mappedData = _mapper.Map<QueryApartmentDto>(data);
            return new SuccessDataResult<QueryApartmentDto>(mappedData);
        }

        public IResult Update(QueryApartmentDto queryDto)
        {
            var updatedApartment = _mapper.Map<Apartment>(queryDto);
            _apartmentDal.Update(updatedApartment);
            return new SuccessResult(Messages.Updated);
        }
       
    }
}
