<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Single.aspx.cs" Inherits="Assignment4.Single" %>
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
                            <a href="Single.aspx?product='<%# Eval("ID") %>'"><asp:Label Text='<%# Eval("Pro_Name") %>' runat="server" /></a>
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
					<div class="tags">
						<h4 class="tag_head">Brands</h4>
						<ul class="tags_links">
                            <asp:DataList ID="dlBrands" runat="server">
                        <ItemTemplate>
                            	<li><a href="Products.aspx?brand='<%# Eval("Brand_ID") %>'"><%# Eval("Brand_Name") %></li></a>
                        </ItemTemplate>
                    </asp:DataList>
						</ul>
					</div>
				     </div>

			</div>
			<div class="new-product">
				<div class="col-md-5 zoom-grid">
					<div class="flexslider">
                        <asp:DataList ID="dlSingleProduct" runat="server">
                            <ItemTemplate>  
                                <ul class="slides">
                            <li data-thumb='<%# Eval("Image") %>'">';
                            <div class="thumb-image"> <img src='<%# Eval("Image") %>'" data-imagezoom="true" class="img-responsive" alt="" /> </div>
                            </li>
                            <li data-thumb='<%# Eval("Image") %>'">
                            <div class="thumb-image"> <img src='<%# Eval("Image") %>' data-imagezoom="true" class="img-responsive" alt="" /> </div>
                            </li>
                            <li data-thumb='<%# Eval("Image") %>'>
                            <div class="thumb-image"> <img src='<%# Eval("Image") %>' data-imagezoom="true" class="img-responsive" alt="" /> </div>
                            </li>
                            </ul>
                            </div>
                            </div>
                            <div class="col-md-7 dress-info">
                            <div class="dress-name">
						    <h3><%# Eval("Product") %></h3>
                            <span><%# Eval("Price") %></span>
                            <div class="clearfix"></div>
                            <p><%# Eval("Description") %></p>
                            </div>
                            <div class="span span1">
                            <p class="left">BRAND</p>
                            <p class="right"><%# Eval("Brand_Name") %></p>
                            <div class="clearfix"></div>
                            </div>
                            <div class="span span2">
                            <p class="left">STORE</p>
                            <p class="right"><%# Eval("Store_Name") %></p>
                            <div class="clearfix"></div>
                            </div>
                            <div class="span span3">
                            <p class="left">CATEGORY</p>
                            <p class="right"><%# Eval("Category") %></p>
                            <div class="clearfix"></div>
                            </div>
                            <div class="span span4">
                            <div class="purchase">
                            <a href="#">Purchase Now</a>
                            <div class="social-icons">
                            <ul>
                            <li><a class="facebook1" href="#"></a></li>
                            <li><a class="twitter1" href="#"></a></li>
                            <li><a class="googleplus1" href="#"></a></li>
                            </ul>
                            </div>
                            <div class="clearfix"></div>
                            </div>
                            </ItemTemplate>
                        </asp:DataList>
                        
					
				<script src="web/js/imagezoom.js"></script>
					<!-- FlexSlider -->
					<script defer src="web/js/jquery.flexslider.js"></script>
					<script>
						// Can also be used with $(document).ready()
						$(window).load(function() {
						  $('.flexslider').flexslider({
							animation: "slide",
							controlNav: "thumbnails"
						  });
						});
					</script>
				</div>
				<div class="clearfix"></div>
					<div class="reviews-tabs">
      <!-- Main component for a primary marketing message or call to action -->
      <ul class="nav nav-tabs responsive hidden-xs hidden-sm" id="myTab">
        <li class="test-class active"><a class="deco-none misc-class" href="#how-to"> More Information</a></li>
        <li class="test-class"><a href="#features">Specifications</a></li>
        <li class="test-class"><a class="deco-none" href="#source">Reviews (7)</a></li>
      </ul>

      <div class="tab-content responsive hidden-xs hidden-sm">
        <div class="tab-pane active" id="how-to">
                        <asp:DataList ID="dlDescription" runat="server">
                                <ItemTemplate>
                                    <p class="tab-text"><%# Eval("Description") %></p>
                                </ItemTemplate>
                            </asp:DataList>
        </div>
        <div class="tab-pane" id="features">
          <p class="tab-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum nibh urna, euismod ut ornare non, volutpat vel tortor. Integer laoreet placerat suscipit. Sed sodales scelerisque commodo. Nam porta cursus lectus. Proin nunc erat, gravida a facilisis quis, ornare id lectus. Proin consectetur nibh quis urna gravida mollis.This tab has icon in consectetur adipiscing eliconse consectetur adipiscing elit. Vestibulum nibh urna, ctetur adipiscing elit. Vestibulum nibh urna, t.consectetur adipiscing elit. Vestibulum nibh urna,  Vestibulum nibh urna,it.</p>
		  <p class="tab-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit,There are many variations of passages of Lorem Ipsum available, 
									sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
		</div>
        <div class="tab-pane" id="source">
		  <div class="response">
						<div class="media response-info">
							<div class="media-left response-text-left">
								<a href="#">
									<img class="media-object" src="web/images/icon1.png" alt="" />
								</a>
								<h5><a href="#">Username</a></h5>
							</div>
							<div class="media-body response-text-right">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,There are many variations of passages of Lorem Ipsum available, 
									sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
								<ul>
									<li>MARCH 21, 2015</li>
									<li><a href="Single.php">Reply</a></li>
								</ul>
							</div>
							<div class="clearfix"> </div>
						</div>
						<div class="media response-info">
							<div class="media-left response-text-left">
								<a href="#">
									<img class="media-object" src="web/images/icon1.png" alt="" />
								</a>
								<h5><a href="#">Username</a></h5>
							</div>
							<div class="media-body response-text-right">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,There are many variations of passages of Lorem Ipsum available, 
									sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
								<ul>
									<li>MARCH 26, 2054</li>
									<li><a href="Single.php">Reply</a></li>
								</ul>		
							</div>
							<div class="clearfix"> </div>
						</div>
						<div class="media response-info">
							<div class="media-left response-text-left">
								<a href="#">
									<img class="media-object" src="web/images/icon1.png" alt="" />
								</a>
								<h5><a href="#">Username</a></h5>
							</div>
							<div class="media-body response-text-right">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,There are many variations of passages of Lorem Ipsum available, 
									sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
								<ul>
									<li>MAY 25, 2015</li>
									<li><a href="Single.php">Reply</a></li>
								</ul>		
							</div>
							<div class="clearfix"> </div>
						</div>
						<div class="media response-info">
							<div class="media-left response-text-left">
								<a href="#">
									<img class="media-object" src="web/images/icon1.png" alt="" />
								</a>
								<h5><a href="#">Username</a></h5>
							</div>
							<div class="media-body response-text-right">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,There are many variations of passages of Lorem Ipsum available, 
									sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
								<ul>
									<li>FEB 13, 2015</li>
									<li><a href="Single.php">Reply</a></li>
								</ul>		
							</div>
							<div class="clearfix"> </div>
						</div>
						<div class="media response-info">
							<div class="media-left response-text-left">
								<a href="#">
									<img class="media-object" src="web/images/icon1.png" alt="" />
								</a>
								<h5><a href="#">Username</a></h5>
							</div>
							<div class="media-body response-text-right">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,There are many variations of passages of Lorem Ipsum available, 
									sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
								<ul>
									<li>JAN 28, 2015</li>
									<li><a href="Single.php">Reply</a></li>
								</ul>		
							</div>
							<div class="clearfix"> </div>
						</div>
						<div class="media response-info">
							<div class="media-left response-text-left">
								<a href="#">
									<img class="media-object" src="web/images/icon1.png" alt="" />
								</a>
								<h5><a href="#">Username</a></h5>
							</div>
							<div class="media-body response-text-right">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,There are many variations of passages of Lorem Ipsum available, 
									sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
								<ul>
									<li>APR 18, 2015</li>
									<li><a href="Single.php">Reply</a></li>
								</ul>		
							</div>
							<div class="clearfix"> </div>
						</div>
						<div class="media response-info">
							<div class="media-left response-text-left">
								<a href="#">
									<img class="media-object" src="web/images/icon1.png" alt="" />
								</a>
								<h5><a href="#">Username</a></h5>
							</div>
							<div class="media-body response-text-right">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,There are many variations of passages of Lorem Ipsum available, 
									sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
								<ul>
									<li>DEC 25, 2014</li>
									<li><a href="Single.php">Reply</a></li>
								</ul>		
							</div>
							<div class="clearfix"> </div>
						</div>
					</div>
        </div>
      </div>		
	</div>

			</div>
			<div class="clearfix"></div>
			</div>
   </div>
   <div class="other-products products-grid">
		<div class="container">
			<header>
				<h3 class="like text-center">Other Interesting Products</h3>   
			</header>
            <asp:DataList ID="dlAllProducts" runat="server" HorizontalAlign="Center">
                   <ItemTemplate>
                             <div class="col-md-4 product simpleCart_shelfItem text-center">
                            <a href='Single.php?product='><img style = "width:200px; length:200px;" src='<%# Eval("Image") %>' alt="" /></a>
                            <div class="mask">
                            <a href='Single.php?product=<%# Eval("ID") %>'>Quick View</a>
                            </div>
                            <a class="product_name" href='Single.php?product=<%# Eval("ID") %>'><%# Eval("Product") %></a>
                            <p><a class="item_add" href="#"><i></i> <span class="item_price"><%# Eval("Price") %>'</span></a></p>
                            </div>
                                    </ItemTemplate>
                                </asp:DataList>
                            

		</div>
</asp:Content>
