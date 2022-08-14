using AutoMapper;
using Business.Abstract;
using Business.Constants;
using Core.Utilities.Results.Abstract;
using Core.Utilities.Results.Concrete;
using DataAccess.Abstract;
using DTOs.Concrete.DuesDto.Commands;
using DTOs.Concrete.DuesDto.Queries;
using Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Concrete
{
    public class DuesManager : IDuesService
    {
        private readonly IDuesDal _duesDal;
        private readonly IMapper _mapper;

        public DuesManager(IMapper mapper, IDuesDal duesDal)
        {
            _mapper = mapper;
            _duesDal = duesDal;
        }

        public IResult Add(CommandDuesDto commandDto)
        {
            var addedEntity = _mapper.Map<Dues>(commandDto);
            _duesDal.Insert(addedEntity);
            return new SuccessResult(Messages.Added);
        }

        public IResult Delete(QueryDuesDto queryDto)
        {
            var deletedEntity = _mapper.Map<Dues>(queryDto);
            _duesDal.Delete(deletedEntity);
            return new SuccessResult(Messages.Deleted);
        }

        public IDataResult<IList<CommandDuesDto>> GetAll()
        {
            var data = _duesDal.GetAll();
            var mappedEntity = data.Select(x=>_mapper.Map<CommandDuesDto>(x)).ToList();
            return new SuccessDataResult<IList<CommandDuesDto>>(mappedEntity,Messages.Listed);
        }

        public IDataResult<QueryDuesDto> GetById(int id)
        {
            var data = _duesDal.Get(x => x.Id == id);
            var mappedEntity = _mapper.Map<QueryDuesDto>(data);
            return new SuccessDataResult<QueryDuesDto>(mappedEntity,Messages.Brought);
        }

        public IResult Update(QueryDuesDto queryDto)
        {
            var updatedEntity = _mapper.Map<Dues>(queryDto);
            _duesDal.Update(updatedEntity);
            return new SuccessResult(Messages.Deleted);
        }
    }
}
