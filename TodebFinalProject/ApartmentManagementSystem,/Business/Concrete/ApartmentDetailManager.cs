using AutoMapper;
using Business.Abstract;
using Business.Constants;
using Core.Utilities.Results.Abstract;
using Core.Utilities.Results.Concrete;
using DataAccess.Abstract;
using DTOs.Concrete.ApartmentDetailDto.Commands;
using DTOs.Concrete.ApartmentDetailDto.Queries;
using Entities.Concrete;
using Entities.Concrete.SqlViews;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Concrete
{
    public class ApartmentDetailManager : IApartmentDetailService
    {
        private readonly IApartmentDetailDal _apartmentDetailDal;
        private readonly IMapper _mapper;
        public ApartmentDetailManager(IApartmentDetailDal apartmentDetailDal,IMapper mapper)
        {
            _apartmentDetailDal = apartmentDetailDal;
            _mapper = mapper;
        }

        public IResult Add(CommandApartmentDetailDto commandDto)
        {
            var addedApartmentDetail = _mapper.Map<ApartmentDetail>(commandDto);
            _apartmentDetailDal.Insert(addedApartmentDetail);
            return new SuccessResult(Messages.Added);
        }

        public IResult Delete(QueryApartmentDetailDto queryDto)
        {
            var deletedApartment = _mapper.Map<ApartmentDetail>(queryDto);
            _apartmentDetailDal.Delete(deletedApartment);
            return new SuccessResult(Messages.Deleted);
        }

        public IDataResult<IList<CommandApartmentDetailDto>> GetAll()
        {
            var data = _apartmentDetailDal.GetAll();
            var mappedData = data.Select(x => _mapper.Map<CommandApartmentDetailDto>(x)).ToList();
            return new SuccessDataResult<IList<CommandApartmentDetailDto>>(mappedData, Messages.Listed);
        }

        public IDataResult<IList<ApartmentDetailView>> GetAllApartmentWithDetail()
        {
            var data = _apartmentDetailDal.GetAllApartmentsWithDetails().ToList();
            return new SuccessDataResult<IList<ApartmentDetailView>>(data, Messages.Listed);
        }

        public IDataResult<QueryApartmentDetailDto> GetById(int id)
        {
            var data = _apartmentDetailDal.Get(x => x.Id == id);
            var mappedData = _mapper.Map<QueryApartmentDetailDto>(data);
            return new SuccessDataResult<QueryApartmentDetailDto>(mappedData);
        }

        public IResult Update(QueryApartmentDetailDto queryDto)
        {
            var updatedApartment = _mapper.Map<ApartmentDetail>(queryDto);
            _apartmentDetailDal.Update(updatedApartment);
            return new SuccessResult(Messages.Updated);
        }
    }
}
