using AutoMobileComapny.Class;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AutoMobileComapny
{
    public partial class AutoMobile1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string GetCompany(string companyId)
        {
            // your data table
            DataTable dataTable = new DataTable();
            string connString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["AutoMobileCompany"].ConnectionString;
            string query = "select * from Company ";
            if (!string.IsNullOrEmpty(companyId))
            {
                query += "where companyId =" + companyId;
            }
            SqlConnection conn = new SqlConnection(connString);
            SqlCommand cmd = new SqlCommand(query, conn);
            conn.Open();

            // create data adapter
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            // this will query your database and return the result to your datatable
            da.Fill(dataTable);

            IList<Company> CompanyList = new List<Company>();
            CompanyList = (from DataRow dr in dataTable.Rows
                           select new Company()
                           {
                               CompanyId = Convert.ToInt32(dr["CompanyId"]),
                               CompanyName = dr["CompanyName"].ToString()
                           }).ToList();

            conn.Close();
            da.Dispose();

            return new JavaScriptSerializer().Serialize(new { CompanyList });
        }

        [WebMethod]
        public static string GetBrand(string companyId)
        {
            // your data table
            DataTable dataTable = new DataTable();
            string connString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["AutoMobileCompany"].ConnectionString;
            string query = "select * from Brand";
            if (!string.IsNullOrEmpty(companyId))
            {
                query += "  where CompanyId = " + companyId;
            }
            SqlConnection conn = new SqlConnection(connString);
            SqlCommand cmd = new SqlCommand(query, conn);
            conn.Open();

            // create data adapter
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            // this will query your database and return the result to your datatable
            da.Fill(dataTable);

            IList<Brand> BrandList = new List<Brand>();
            BrandList = (from DataRow dr in dataTable.Rows
                         select new Brand()
                         {
                             BrandId = Convert.ToInt32(dr["BrandId"]),
                             BrandName = dr["BrandName"].ToString(),
                             CompanyId = Convert.ToInt32(dr["CompanyId"])
                         }).ToList();

            conn.Close();
            da.Dispose();

            return new JavaScriptSerializer().Serialize(new { BrandList });
        }

        [WebMethod]
        public static string GetModel(string companyId)
        {
            // your data table
            DataTable dataTable = new DataTable();
            string connString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["AutoMobileCompany"].ConnectionString;
            string query = "select m.* from Model m "
                         + "inner join Brand b on b.BrandId = m.BrandId "
                         + "inner join Company c on c.CompanyId = b.CompanyId ";

            if (!string.IsNullOrEmpty(companyId))
            {
                query += " where c.CompanyId =" + companyId;
            }

            SqlConnection conn = new SqlConnection(connString);
            SqlCommand cmd = new SqlCommand(query, conn);
            conn.Open();

            // create data adapter
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            // this will query your database and return the result to your datatable
            da.Fill(dataTable);

            IList<Model> ModelList = new List<Model>();
            ModelList = (from DataRow dr in dataTable.Rows
                         select new Model()
                         {
                             ModelId = Convert.ToInt32(dr["ModelId"]),
                             ModelName = dr["ModelName"].ToString(),
                             BrandId = Convert.ToInt32(dr["BrandId"]),
                             VehicleType = dr["VehicleType"].ToString(),
                             Price = Convert.ToDecimal(dr["Price"])
                         }).ToList();

            conn.Close();
            da.Dispose();

            return new JavaScriptSerializer().Serialize(new { ModelList });
        }

        [WebMethod]
        public static string GetDealer(string companyId)
        {
            // your data table
            DataTable dataTable = new DataTable();
            string connString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["AutoMobileCompany"].ConnectionString;
            string query = "Select D.DealerName,D.Location,B.BrandId from Dealer D "
                         + "inner join DealerAndBrandDetails DBD on DBD.DealerId = D.DealerId "
                         + "inner join Brand B on b.BrandId = DBD.BrandId";

            SqlConnection conn = new SqlConnection(connString);
            SqlCommand cmd = new SqlCommand(query, conn);
            conn.Open();

            // create data adapter
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            // this will query your database and return the result to your datatable
            da.Fill(dataTable);

            IList<Dealer> DealerList = new List<Dealer>();
            DealerList = (from DataRow dr in dataTable.Rows
                         select new Dealer()
                         {
                             DealerName = dr["DealerName"].ToString(),
                             Location = dr["Location"].ToString(),
                             BrandId = Convert.ToInt32(dr["BrandId"])
                         }).ToList();

            conn.Close();
            da.Dispose();

            return new JavaScriptSerializer().Serialize(new { DealerList });
        }
    }
}