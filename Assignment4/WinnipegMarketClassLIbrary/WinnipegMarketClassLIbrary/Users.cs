﻿using DAL_Project;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using DAL_Project;

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

        public static Users Login(string email, string password)
        {
            Users x = null;
            DAL d = new DAL(ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString);

            d.AddParam("Email", email);
            d.AddParam("Password", password);

            DataSet ds = d.ExecuteProcedure("spLogin");
            if (ds.Tables[0].Rows.Count > 0)
            {
                x.Address = (string)ds.Tables[0].Rows[0]["Address"];
                x.Email = (string)ds.Tables[0].Rows[0]["Email"];
                x.FirstName = (string)ds.Tables[0].Rows[0]["FirstName"];
                x.Id = Convert.ToInt32(ds.Tables[0].Rows[0]["Id"]);
                x.isAdmin = Convert.ToBoolean(ds.Tables[0].Rows[0]["Id"]);
                x.LastName = (string)ds.Tables[0].Rows[0]["LastName"];
                x.Password = (string)ds.Tables[0].Rows[0]["Password"];
            }
            return x;
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
