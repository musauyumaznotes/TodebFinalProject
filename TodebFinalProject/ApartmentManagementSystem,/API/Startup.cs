using Business.Abstract;
using Business.Concrete;
using Business.Configuration.Mapper;
using DataAccess.Abstract;
using DataAccess.Concrete;
using DataAccess.Concrete.EntityFramework;
using DataAccess.Concrete.EntityFramework.Contexts;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.OpenApi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace API
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddDbContext<HousingEstateContext>(ServiceLifetime.Transient);


            services.AddAutoMapper(config =>
            {
                config.AddProfile(new MapperProfile());
            });

            #region Inversion Of Control
            services.AddScoped<IApartmentService, ApartmentManager>();
            services.AddScoped<IApartmentDal, EfApartmentDal>();

            services.AddScoped<IApartmentDetailService, ApartmentDetailManager>();
            services.AddScoped<IApartmentDetailDal, EfApartmentDetailDal>();

            services.AddScoped<IBlockService, BlockManager>();
            services.AddScoped<IBlockDal, EfBlockDal>();

            services.AddScoped<IDuesService, DuesManager>();
            services.AddScoped<IDuesDal, EfDuesDal>();

            services.AddScoped<IElectricBillService, ElectricBillManager>();
            services.AddScoped<IElectricBillDal, EfElectricBillDal>();

            services.AddScoped<IGasBillService, GasBillManager>();
            services.AddScoped<IGasBillDal, EfGasBillDal>();

            services.AddScoped<IHouseHoldTypeService, HouseHoldTypeManager>();
            services.AddScoped<IHouseHoldTypeDal, EfHouseHoldTypeDal>();

            services.AddScoped<ILandlordService, LandlordManager>();
            services.AddScoped<ILandlordDal, EfLandlordDal>();

            services.AddScoped<ILesseeService, LesseeManager>();
            services.AddScoped<ILesseeDal, EfLesseeDal>();

            services.AddScoped<IPhoneService, PhoneManager>();
            services.AddScoped<IPhoneDal, EfPhoneDal>();

            services.AddScoped<IWaterBillService, WaterBillManager>();
            services.AddScoped<IWaterBillDal, EfWaterBillDal>();

            services.AddScoped<IUserDal, EfUserDal>();
            services.AddScoped<IUserService, UserManager>();
            
            services.AddScoped<IMessageDal, EfMessageDal>();
            services.AddScoped<IMessageService, MessageManager>();
            #endregion

            services.AddControllers();
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "API", Version = "v1" });
            });
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseSwagger();
                app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "API v1"));
            }

            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
