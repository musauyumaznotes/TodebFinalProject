using AutoMapper;
using Business.Abstract;
using Business.Constants;
using Core.Utilities.Results.Abstract;
using Core.Utilities.Results.Concrete;
using DataAccess.Abstract;
using DTOs.Concrete.LandlordDto.Commands;
using DTOs.Concrete.LandlordDto.Queries;
using Entities.Concrete;
using Entities.Concrete.SqlViews;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Concrete
{
    public class LandlordManager : ILandlordService
    {
        private readonly ILandlordDal _landlordDal;
        private readonly IMapper _mapper;
        public LandlordManager(ILandlordDal landlordDal, IMapper mapper)
        {
            _landlordDal = landlordDal;
            _mapper = mapper;
        }

        public IResult Add(CommandLandlordDto commandDto)
        {
            var addedEntity = _mapper.Map<Landlord>(commandDto);
            _landlordDal.Insert(addedEntity);
            return new SuccessResult(Messages.Added);
        }

        public IResult Delete(QueryLandlordDto queryDto)
        {
            var deletedEntity = _mapper.Map<Landlord>(queryDto);
            _landlordDal.Delete(deletedEntity);
            return new SuccessResult(Messages.Deleted);
        }

        public IDataResult<IList<CommandLandlordDto>> GetAll()
        {
            var data = _landlordDal.GetAll();
            var mappedEntity = data.Select(x=> _mapper.Map<CommandLandlordDto>(x)).ToList();
            return new SuccessDataResult<IList<CommandLandlordDto>>(mappedEntity, Messages.Listed);
        }

        public IDataResult<QueryLandlordDto> GetById(int id)
        {
            var data = _landlordDal.Get(x => x.Id == id);
            var mappedEntity = _mapper.Map<QueryLandlordDto>(data);
            return new SuccessDataResult<QueryLandlordDto>(mappedEntity, Messages.Brought);
        }

        public IDataResult<IList<UserInformationView>> GetLanlordInformation()
        {
            var data =_landlordDal.GetLanlordInformation();
            return new SuccessDataResult<IList<UserInformationView>>(data,Messages.Listed);
        }

        public IResult Update(QueryLandlordDto queryDto)
        {
            var updatedEntity = _mapper.Map<Landlord>(queryDto);
            _landlordDal.Update(updatedEntity);
            return new SuccessResult(Messages.Updated);
        }
    }
}
