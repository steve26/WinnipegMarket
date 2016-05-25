<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Assignment4.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form name="frmLogin" action="Login.php" method="post">
		<div class="content">
			<div class="container">
				<div class="login-page">
					<div class="dreamcrub">
						<ul class="breadcrumbs">
							<li class="home">
								<a href="Index.php" title="Go to Home Page">Home</a>&nbsp;
								<span>&gt;</span>
							</li>
							<li class="women">
								Login
							</li>
						</ul>
						<ul class="previous">
							<li><a href="Index.php">Back to Previous Page</a></li>
						</ul>
						<div class="clearfix"></div>
					</div>
					<div class="account_grid">
						<div class="col-md-6 login-left wow fadeInLeft" data-wow-delay="0.4s">
							<h2>NEW CUSTOMERS</h2>
							<p>By creating an account with our store, you will be able to move through the checkout process faster, store multiple shipping addresses, view and track your orders in your account and more.</p>
							<a class="acount-btn" href="Registration.php">Create an Account</a>
						</div>
						<div class="col-md-6 login-right wow fadeInRight" data-wow-delay="0.4s">
							<h3>REGISTERED CUSTOMERS</h3>
							<p>If you have an account with us, please log in.</p>
							<form>
								<div>
									<span>User Name or Email Address<label>*</label></span>
									<input type="text" name="tbUserName">
								</div>
								<div>
									<span>Password<label>*</label></span>
									<input type="password" name="tbPassword">
								</div>
								<a class="forgot" href="#">Forgot Your Password?</a>
								<input type="submit" value="Login" name="btnLogin">
							</form>
						</div>
						<div class="clearfix"> </div>
					</div>
				</div>
			</div>
</asp:Content>
