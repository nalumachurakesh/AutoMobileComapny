using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AutoMobileComapny.Class
{
    public class Model
    {
        public int ModelId { get; set; }
        public string ModelName { get; set; }
        public int BrandId { get; set; }
        public string VehicleType { get; set; }
        public decimal Price { get; set; }
    }
}