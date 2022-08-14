using AutoMapper;
using Business.Abstract;
using Business.Constants;
using Core.Utilities.Results.Abstract;
using Core.Utilities.Results.Concrete;
using DataAccess.Abstract;
using DTOs.Concrete.BlockDto.Commands;
using DTOs.Concrete.BlockDto.Queries;
using Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Concrete
{
    public class BlockManager : IBlockService
    {
        private readonly IBlockDal _blockDal;
        private readonly IMapper _mapper;

        public BlockManager(IBlockDal blockDal, IMapper mapper)
        {
            _blockDal = blockDal;
            _mapper = mapper;
        }

        public IResult Add(CommandBlockDto commandDto)
        {
            var addedEntity = _mapper.Map<Block>(commandDto);
            _blockDal.Insert(addedEntity);
            return new SuccessResult(Messages.Added);
        }

        public IResult Delete(QueryBlockDto queryDto)
        {
            var deletedEntity = _mapper.Map<Block>(queryDto);
            _blockDal.Delete(deletedEntity);
            return new SuccessResult(Messages.Deleted);
        }

        public IDataResult<IList<CommandBlockDto>> GetAll()
        {
            var data = _blockDal.GetAll();
            var mappedData = data.Select(x => _mapper.Map<CommandBlockDto>(x)).ToList();
            return new SuccessDataResult<IList<CommandBlockDto>>(mappedData, Messages.Listed);
        }

        public IDataResult<QueryBlockDto> GetById(int id)
        {
            var data = _blockDal.Get(x => x.Id == id);
            var mappedData = _mapper.Map<QueryBlockDto>(data);
            return new SuccessDataResult<QueryBlockDto>(mappedData,Messages.Brought);

        }

        public IResult Update(QueryBlockDto queryDto)
        {
            var updatedEntity = _mapper.Map<Block>(queryDto);
            _blockDal.Delete(updatedEntity);
            return new SuccessResult(Messages.Updated);
        }
    }
}
