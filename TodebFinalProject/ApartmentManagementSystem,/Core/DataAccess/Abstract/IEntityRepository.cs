﻿using Core.Entities.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Core.DataAccess.Abstract
{
    public interface IEntityRepository<TEntity> where TEntity : class, IEntity, new()
    {
        void Insert(TEntity entity);
        void Update(TEntity entity);
        void Delete(TEntity entity);
        ICollection<TEntity> GetAll(Expression<Func<TEntity,bool>> expression = null);
        TEntity Get(Expression<Func<TEntity, bool>> expression);
        void SaveChanges();
    }
}
