using DAL_Project;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WinnipegMarketClassLIbrary
{
    public class Users
    {
        public int Id { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Address { get; set; }
        public bool isAdmin { get; set; } // 1 = Y, 0 = N

        public Users()
        {

        }
        public Users(int Id, string Email, string Password, string FirstName, string LastName, string Address, bool IsAdmin)
        {
            this.Id = Id;
            this.Email = Email;
            this.Password = Password;
            this.FirstName = FirstName;
            this.LastName = LastName;
            this.Address = Address;
            this.isAdmin = IsAdmin;
        }

        public void Login(string email, string password)
        {
            DAL d = new DAL(ConfigurationManager.ConnectionStrings["dbWinnipegMarket"].ConnectionString);
            d.AddParam("Email", email);
            d.AddParam("Password", password);
            d.ExecuteProcedure("spLogin");
        }
        public void AddUser()
        {
            DAL d = new DAL(ConfigurationManager.ConnectionStrings["dbWinnipegMarket"].ConnectionString);
            d.AddParam("Email", Email);
            d.AddParam("Password", Password);
            d.AddParam("First_Name", FirstName);
            d.AddParam("Last_Name", LastName);
            d.AddParam("User_Type", isAdmin);
            d.ExecuteProcedure("spAddUser");
        }
        public void DeleteUser(int Id)
        {
            DAL d = new DAL(ConfigurationManager.ConnectionStrings["dbWinnipegMarket"].ConnectionString);
            d.AddParam("User_ID", Id);
            d.ExecuteProcedure("spDeleteUsers");
        }
        public void UpdateUser()
        {
            DAL d = new DAL(ConfigurationManager.ConnectionStrings["dbWinnipegMarket"].ConnectionString);
            d.AddParam("Email", Email);
            d.AddParam("Password", Password);
            d.AddParam("First_Name", FirstName);
            d.AddParam("Last_Name", LastName);
            d.AddParam("User_Type", isAdmin);
            d.ExecuteProcedure("spUpdateUsers");
        }
    }
}
