<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Assignment4.Registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="registration-form">
        <div class="container">
            <div class="dreamcrub">
                <ul class="breadcrumbs">
                    <li class="home">
                        <a href="Index.php" title="Go to Home Page">Home</a>&nbsp;
                        <span>&gt;</span>
                    </li>
                    <li class="women">
                        Registration
                    </li>
                </ul>
                <ul class="previous">
                    <li><a href="Index.php">Back to Previous Page</a></li>
                </ul>
                <div class="clearfix"></div>
            </div>
            <h2>Registration</h2>
            <div class="registration-grids">
                <div class="reg-form">
                    <div class="reg">
                        <p>Welcome, please enter the following details to continue.</p>
                        <p>If you have previously registered with us, <a href="Login.php">click here</a></p>
                        <form>
                            <ul>
                                <li class="text-info">First Name: </li>
                                <li><input type="text" value="" name="tbFirstName"></li>
                            </ul>
                            <ul>
                                <li class="text-info">Last Name: </li>
                                <li><input type="text" value="" name="tbLastName"></li>
                            </ul>
                            <ul>
                                <li class="text-info">Email: </li>
                                <li><input type="text" value="" name="tbEmail"></li>
                            </ul>
                            <ul>
                                <li class="text-info">Password: </li>
                                <li><input type="password" value="" name="tbPassword"></li>
                            </ul>
                            <ul>
                                <li class="text-info">Re-enter Password:</li>
                                <li><input type="password" value="" name="tbPassword2"></li>
                            </ul>
                            <ul>
                                <li class="text-info">Mobile Number:</li>
                                <li><input type="text" value="" name="tbPhoneNumber"></li>
                            </ul>
                            <input type="submit" value="REGISTER NOW" name="btnRegister">
                            <p class="click">By clicking this button, you are agree to my  <a href="#">Policy Terms and Conditions.</a></p>
                        </form>
                    </div>
                </div>
                <div class="reg-right">
                    <h3>Completely Free Account</h3>
                    <div class="strip"></div>
                    <p> Our site is completly free with no hidden charges. Browse freely without ever having to sign up. We only
                        ask for you to create an account for if you are planning to place an order of any kind. No debit or credit card required!</p>
                    <h3 class="lorem">Shop From Hundreds of Stores.</h3>
                    <div class="strip"></div>
                    <p>Be able to locate a product you want near you, and compare prices in order to find the cheapest ones possible.</p>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>

</asp:Content>
