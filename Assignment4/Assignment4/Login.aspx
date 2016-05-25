<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Assignment4.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
		<div class="content">
			<div class="container">
				<div class="login-page">
					<div class="dreamcrub">
						<ul class="breadcrumbs">
							<li class="home">
								<a href="Index.aspx" title="Go to Home Page">Home</a>&nbsp;
								<span>&gt;</span>
							</li>
							<li class="women">
								Login
							</li>
						</ul>
						<ul class="previous">
							<li><a href="Index.aspx">Back to Previous Page</a></li>
						</ul>
						<div class="clearfix"></div>
					</div>
					<div class="account_grid">
						<div class="col-md-6 login-left wow fadeInLeft" data-wow-delay="0.4s">
							<h2>NEW CUSTOMERS</h2>
							<p>By creating an account with our store, you will be able to move through the checkout process faster, store multiple shipping addresses, view and track your orders in your account and more.</p>
							<a class="acount-btn" href="Registration.aspx">Create an Account</a>
						</div>
						<div class="col-md-6 login-right wow fadeInRight" data-wow-delay="0.4s">
							<h3>REGISTERED CUSTOMERS</h3>
							<p>If you have an account with us, please log in.</p>
								<div>
									<span>User Name or Email Address<label>*</label></span>
                                    <asp:TextBox ID="tbName" runat="server"></asp:TextBox>
								</div>
								<div>
									<span>Password<label>*</label></span>
                                    <asp:TextBox ID="tbPassword" runat="server"></asp:TextBox>
								</div>
                            <asp:Label ID="lblError" runat="server" Text=""></asp:Label><br />
								<a class="forgot" href="#">Forgot Your Password?</a>
                                <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
						</div>
						<div class="clearfix"> </div>
					</div>
				</div>
			</div>
            </div>
</asp:Content>
