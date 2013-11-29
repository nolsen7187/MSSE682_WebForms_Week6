using System;
using System.Configuration;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;

namespace DAL
{
    /// V1 Week 6/
    /// <summary>
    /// This is the Data Repository class
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public class DataRepository<T> : IDataRepository<T>, IDataRepository where T : class
    {

        readonly DbContext _dbContext;

        //Set _dbContext variable to the dbContext based on the FFREntities for this project
        public DataRepository()
        {
            _dbContext = new DbContext(ConfigurationManager.ConnectionStrings["AXMbsDevEntities"].ConnectionString);
        }
        public void Dispose()
        {
            if (_dbContext != null)
            {
                _dbContext.Dispose();
            }
        }

        /// <summary>
        /// This method is used to return a collection of objects
        /// by specific key i.e a column name and the
        /// specific value associated with the column
        /// </summary>
        /// <param name="KeyName">The name of the key</param>
        /// <param name="KeyVal">The integer value of the column</param>
        /// <returns></returns>
        public virtual IQueryable<T> GetBySpecificKey(string KeyName, int KeyVal)
        {

            var itemParameter = Expression.Parameter(typeof(T), "ItemId");
            var whereExpression = Expression.Lambda<Func<T, bool>>
                (
                Expression.Equal(
                    Expression.Property(
                        itemParameter,
                       KeyName
                        ),
                    Expression.Constant(KeyVal)
                    ),
                new[] { itemParameter }
                );
            try
            {
                return GetAll().Where(whereExpression).AsQueryable();
            }
            catch
            {
                return null;
            }

        }
        /// <summary>
        /// This method is used to return a collection of objects
        /// by specific key i.e a column name and the
        /// specific value associated with the column
        /// </summary>
        /// <param name="KeyName">The name of the key</param>
        /// <param name="KeyVal">The string value of the column</param>
        /// <returns></returns>
        public virtual IQueryable<T> GetBySpecificKey(string KeyName, string KeyVal)
        {

            var itemParameter = Expression.Parameter(typeof(T), "item");
            var whereExpression = Expression.Lambda<Func<T, bool>>
                (
                Expression.Equal(
                    Expression.Property(
                        itemParameter,
                       KeyName
                        ),
                    Expression.Constant(KeyVal)
                    ),
                new[] { itemParameter }
                );
            try
            {
                return GetAll().Where(whereExpression).AsQueryable();
            }
            catch
            {
                return null;
            }

        }

        /// Returns all the records from a table based on the dbcontext stored in the _dbContext variable
        public virtual IQueryable<T> GetAll()
        {
            return _dbContext.Set<T>().AsQueryable();
        }
        /// Creates a record in db
        public virtual void Create(T entity)
        {
            _dbContext.Set<T>().Add(entity);
            _dbContext.SaveChanges();
        }

        // Method to Delete a record from a table 
        public virtual void Delete(T entity)
        {
            var entry = _dbContext.Entry(entity);
            if (entry != null)
            {
                entry.State = EntityState.Deleted;
            }
            else
            {
                _dbContext.Set<T>().Attach(entity);
            }
            _dbContext.Entry(entity).State = EntityState.Deleted;
            _dbContext.SaveChanges();

        }
        public virtual void Update(T entity)
        {
            _dbContext.Set<T>().Attach(entity);
            _dbContext.Entry(entity).State = EntityState.Modified;
            _dbContext.SaveChanges();
        }
        // Interface to fetch all objects in FFR DB that can be queried
        IQueryable IDataRepository.GetAll()
        {
            return GetAll();
        }
        //Generic Create
        void IDataRepository.Create(object entity)
        {
            Create((T)entity);
        }
        //Generic Update
        void IDataRepository.Update(object entity)
        {
            Update((T)entity);
        }
        //Generic Delete
        void IDataRepository.Delete(object entity)
        {
            Delete((T)entity);
        }

        IQueryable IDataRepository.GetBySpecificKey(string KeyName, string KeyVal)
        {
            return GetBySpecificKey(KeyName, KeyVal);
        }

        IQueryable IDataRepository.GetBySpecificKey(string KeyName, int KeyVal)
        {
            return GetBySpecificKey(KeyName, KeyVal);
        }
    }

    /// This is a generic inteface extending a class.
    public interface IDataRepository<T> where T : class
    {
        IQueryable<T> GetAll();
        void Create(T entity);
        void Update(T entity);
        void Delete(T entity);
        IQueryable<T> GetBySpecificKey(string KeyName, string KeyVal);
        IQueryable<T> GetBySpecificKey(string KeyName, int KeyVal);
    }
    /// This is a generic interface for any type of object
    public interface IDataRepository
    {
        IQueryable GetAll();
        void Create(object entity);
        void Update(object entity);
        void Delete(object entity);
        IQueryable GetBySpecificKey(string KeyName, string KeyVal);
        IQueryable GetBySpecificKey(string KeyName, int KeyVal);
    }
}

