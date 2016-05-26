<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="Assignment4.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
		<div class="products-page">
			<div class="products">
				<div class="product-listy">
					<h2>new Products</h2>
						<asp:ListBox CssClass="product-list" ID="lbnewProducts" runat="server" />
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
						<li><a href="Products.aspx"></li></a>;
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
							<select name="OrderProducts" method="post">
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
					<div class="cbp-vm-options">
						<a href="#" class="cbp-vm-icon cbp-vm-grid cbp-vm-selected" data-view="cbp-vm-view-grid" title="grid">Grid View</a>
						<a href="#" class="cbp-vm-icon cbp-vm-list" data-view="cbp-vm-view-list" title="list">List View</a>
					</div>
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
					<asp:DataList ID="dlProducts" runat="server">
                        <ItemTemplate>
                            <li>
                                    <a href="Single.aspx" class="cbp-vm-image">
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
                <?php
				$sql = "SELECT * FROM tbProducts";
				$stmt = sqlsrv_query($conn, $sql);
				while($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC)) {
					echo '<li><a href="Single.php?mode='.$row[Pro_ID].'"><img src="web/images/'.$row[Product_Image].'" class="img-responsive"/></a>';
					echo '<div class="product liked-product simpleCart_shelfItem">';
					echo '<a class="like_name" href="Single.php?mode='.$row[Pro_ID].'">'.$row[Pro_Name].'</a>';
					echo '<p><a class="item_add" href="Checkout.php""><i></i> <span class=" item_price">'.$row[Price].'</span></a></p>';
					echo '</div>';
					echo '</li>';
				}
                ?>
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
