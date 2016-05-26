<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="Assignment4.Checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="cart-items">
	<div class="container">
	<div class="dreamcrub">
			   	 <ul class="breadcrumbs">
                    <li class="home">
                       <a href="Index.aspx" title="Go to Home Page">Home</a>&nbsp;
                       <span>&gt;</span>
                    </li>
                    <li class="women">
                       Cart
                    </li>
                </ul>
                <ul class="previous">
                	<li><a href="Index.aspx">Back to Previous Page</a></li>
                </ul>
                <div class="clearfix"></div>
			   </div>
			 <h2>MY SHOPPING BAG (<asp:Label ID="lblNumber" runat="server" Text=""></asp:Label>)</h2>
		<div class="cart-gd">
				
			 <div class="cart-header">
				 <div class="close1"> </div>
				 <div class="cart-sec simpleCart_shelfItem">
						<div class="cart-item cyc">
							 <asp:Label ID="lblErrorMsg" runat="server" Text=""></asp:Label><br />
    <asp:Button ID="btnRemoveAll" runat="server" Text="Remove All" OnClick="btnRemoveAll_Click" /><br />
    <asp:GridView ID="gvCart" runat="server" OnRowCommand="gvCart_RowCommand" OnRowEditing="gvCart_RowEditing" DataKeyNames="ProductID" OnRowDataBound="gvCart_RowDataBound" ShowFooter="true"  >
        <Columns>
            <asp:ButtonField CommandName="del" ButtonType="Button" Text="remove" />
            <asp:ButtonField CommandName="edit" ButtonType="Button" Text="Update" />
        </Columns>
    </asp:GridView>
    <asp:Button ID="btnCheckOut" runat="server" Text="Check Out" OnClick="btnCheckOut_Click" /><br /><br />
    <asp:Panel ID="pnlQuantity" runat="server" Visible="false">
        <asp:DropDownList ID="ddlQuantity" runat="server">
                    <asp:ListItem Text="1" />
                    <asp:ListItem Text="2" />
                    <asp:ListItem Text="3" />
                    <asp:ListItem Text="4" />
                    <asp:ListItem Text="5" />
                    <asp:ListItem Text="6" />
                    <asp:ListItem Text="7" />
                    <asp:ListItem Text="8" />
                    <asp:ListItem Text="9" />
                    <asp:ListItem Text="10" />
                </asp:DropDownList>
        <asp:Button ID="btnUpdate" runat="server" Text="UpdateQuantity" OnClick="btnUpdate_Click" /></asp:Panel>
						</div>
					   
					   </div>
					   <div class="clearfix"></div>
											
				  
			 </div>
			 
			  </div>
		</div>
	</div>

</asp:Content>
