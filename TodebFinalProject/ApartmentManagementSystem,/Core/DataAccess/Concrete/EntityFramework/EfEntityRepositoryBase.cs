using Core.DataAccess.Abstract;
using Core.Entities.Abstract;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Core.DataAccess.Concrete.EntityFramework
{
    public class EfEntityRepositoryBase<TEntity, TContext> : IEntityRepository<TEntity> where TEntity : class, IEntity, new() where TContext : DbContext, new()
    {
        protected readonly TContext _context;

        public EfEntityRepositoryBase(TContext context)
        {
            _context = context;
        }

        public void Delete(TEntity entity)
        {
            _context.Remove(entity);
            SaveChanges();
        }

        public TEntity Get(Expression<Func<TEntity, bool>> expression)
        {
            return _context.Set<TEntity>().FirstOrDefault(expression);
        }

        public ICollection<TEntity> GetAll(Expression<Func<TEntity, bool>> expression = null)
        {
            return expression == null
                            ? _context.Set<TEntity>().ToList()
                            : _context.Set<TEntity>().Where(expression).ToList();
        }

        public void Insert(TEntity entity)
        {
            _context.Add(entity);
            SaveChanges();
        }

        public void SaveChanges()
        {
            _context.SaveChanges();
        }

        public void Update(TEntity entity)
        {
            _context.Update(entity);
            SaveChanges();
        }
    }
}
