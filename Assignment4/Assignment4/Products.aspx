﻿<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="Assignment4.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
		<div class="products-page">
			<div class="products">
				<div class="product-listy">
					<h2>new Products</h2>
                    <ul class="product-list">
                    <asp:DataList ID="dlNewProducts" runat="server">
                        <ItemTemplate>
                            <li>
                            <a href='Single.aspx?product=<%# Eval("ID") %>'><asp:Label Text='<%# Eval("Pro_Name") %>' runat="server" /></a>
                                </li>
                        </ItemTemplate>
                    </asp:DataList>
                        </ul>
				</div>
				<div class="latest-bis">
					<img src="web/images/l4.jpg" class="img-responsive" alt="" />
					<div class="offer">
						<p>40%</p>
						<small>Top Offer</small>
					</div>
				</div>
				<div class="tags">
					<h4 class="tag_head">Brands</h4>
					<ul class="tags_links">
                        <asp:DataList ID="dlBrands" runat="server">
                            <ItemTemplate>
                                <li><a href='Products.aspx?brand=<%# Eval("Brand_ID") %>'>
                                    <asp:Label Text='<%# Eval("Brand_Name") %>' runat="server" /></a></li>
                            </ItemTemplate>
                        </asp:DataList>
						
					</ul>

				</div>

			</div>
			<div class="new-product">
				<div class="new-product-top">
					<ul class="product-top-list">
						<li><a href="Index.php">Home</a>&nbsp;<span>&gt;</span></li>
						<li><span class="act">Best Sales</span>&nbsp;</li>
					</ul>
					<p class="back"><a href="Index.php">Back to Previous</a></p>
					<div class="clearfix"></div>
				</div>
				<div class="mens-toolbar">
					<div class="sort">
						<div class="sort-by">
							<label>Sort By</label>
							<select name="OrderProducts">
								<option value="1">Brand</option>
								<option value="2">Name</option>
								<option value="3">Price</option>
								<option value="4">Store</option>
							</select>
							<a href=""><img src="web/images/arrow2.gif" alt="" class="v-middle"></a>
						</div>
					</div>
					<ul class="women_pagenation">
						<li>Page:</li>
						<li class="active"><a href="#">1</a></li>
						<li><a href="#">2</a></li>
					</ul>
					<div class="clearfix"></div>
				</div>
				<div id="cbp-vm" class="cbp-vm-switcher cbp-vm-view-grid">
					<div class="pages">
						<div class="limiter visible-desktop">
							<label>Show</label>
							<select>
								<option value="" selected="selected">9</option>
								<option value="">15</option>
								<option value="">30</option>
							</select> per page
						</div>
					</div>
					<div class="clearfix"></div>
					<asp:DataList ID="dlProducts" runat="server" >
                        <ItemTemplate>
                            <li>
                                    <a href='Single.aspx?product=<%# Eval("ID") %>' class="cbp-vm-image">
                                    <div class="simpleCart_shelfItem">
                                    <div class="view view-first">
                                    <div class="inner_content clearfix">
                                    <div class="product_image">
                                        <asp:Image ID="imgProductImage" CssClass="img-responsive" ImageUrl='<%# Eval("Image") %>' runat="server" />
                                    <div class="mask">
                                    <div class="info">Quick View</div>
                                    </div>
                                    <div class="product_container">
                                    <div class="cart-left">
                                    <p class="title">
                                        <asp:Label Text='<%# Eval("Product") %>' runat="server" /></p>
                                    </div>
                                    <div class="pricey"><span class="item_price">
                                        <asp:Label Text='<%# Eval("Price") %>' runat="server" /></span></div>
                                    <div class="clearfix"></div>
                                    </div>
                                    </div>
                                    </div>
                                    </div>
                                        </div>
                                    </a>
                        </li>
                        </ItemTemplate>
                </asp:DataList>
						
	</ul>
	</div>
	<script src="web/js/cbpViewModeSwitch.js" type="text/javascript"></script>
	<script src="web/js/classie.js" type="text/javascript"></script>
	</div>
	<div class="clearfix"></div>
	</div>
	<div class="clearfix"></div>
	</div>
	<!-- content-section-ends -->
	<div class="other-products">
		<div class="container">
			<h3 class="like text-center">Featured Collection</h3>
			<ul id="flexiselDemo3">
                <asp:DataList ID="dlProductScroll" runat="server">
                    <ItemTemplate>
                        <li><a href="Single.php?product='<%# Eval("ID") %>'"><img src='<%# Eval("Image") %>' class="img-responsive"/></a>
					<div class="product liked-product simpleCart_shelfItem">
					<a class="like_name" href="Single.php?product='<%# Eval("ID") %>'"><%# Eval("Product") %></a>
					<p><a class="item_add" href="Checkout.aspx?product='<%# Eval("ID") %>'""><i></i> <span class=" item_price"><%# Eval("Price") %></span></a></p>
					</div>
					</li>
                    </ItemTemplate>
                </asp:DataList>
			</ul>
			<script type="text/javascript">
				$(window).load(function() {
					$("#flexiselDemo3").flexisel({
						visibleItems: 4,
						animationSpeed: 1000,
						autoPlay: true,
						autoPlaySpeed: 3000,
						pauseOnHover: true,
						enableResponsiveBreakpoints: true,
						responsiveBreakpoints: {
							portrait: {
								changePoint:480,
								visibleItems: 1
							},
							landscape: {
								changePoint:640,
								visibleItems: 2
							},
							tablet: {
								changePoint:768,
								visibleItems: 3
							}
						}
					});

				});
			</script>
			<script type="text/javascript" src="web/js/jquery.flexisel.js"></script>
		</div>
	</div>
</asp:Content>
