<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Assignment4.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="contact">
	<div class="container">
	<div class="dreamcrub">
			   	 <ul class="breadcrumbs">
                    <li class="home">
                       <a href="Index.php" title="Go to Home Page">Home</a>&nbsp;
                       <span>&gt;</span>
                    </li>
                    <li class="women">
                       Contact
                    </li>
                </ul>
                <ul class="previous">
                	<li><a href="Index.php">Back to Previous Page</a></li>
                </ul>
                <div class="clearfix"></div>
			   </div>
		<div class="contact-info">
			<h2>FIND US HERE</h2>
		</div>
		<div class="contact-map">
			<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d6632.248000703498!2d151.265683!3d-33.7832959!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6b12abc7edcbeb07%3A0x5017d681632bfc0!2sManly+Vale+NSW+2093%2C+Australia!5e0!3m2!1sen!2sin!4v1433329298259" style="border:0"></iframe>
		</div>
		<div class="contact-form">
			<div class="contact-info">
				<h3>CONTACT FORM</h3>
			</div>
				<div class="contact-left">
					<asp:TextBox ID="tbName" Text="Enter Name" runat="server" />
					<asp:TextBox ID="tbEmail" Text="Enter Email" runat="server" />
					<asp:TextBox ID="tbSubject" Text="Enter Subject" runat="server" />
				</div>
				<div class="contact-right">
					<asp:TextBox ID="tbMessage" Text="Enter Message" runat="server" />
				</div>
				<div class="clearfix"></div>
				<asp:Button ID="btnSend" runat="server" Text="Send" Height="48px" OnClick="btnSend_Click" Width="156px"/>	
		</div>
	</div>
</div>
</asp:Content>
