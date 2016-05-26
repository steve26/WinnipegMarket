<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Assignment4.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="banner">
    <div class="container">
        <div class="banner-bottom">
            <div class="banner-bottom-left">
                <h2>B<br>U<br>Y</h2>
            </div>
            <div class="banner-bottom-right">
                <div  class="callbacks_container">
                    <ul class="rslides" id="slider4">
                        <li>
                            <div class="banner-info">
                                <h3>Start Shopping Now</h3>
                                <p>Start your shopping here...</p>
                            </div>
                        </li>
                        <li>
                            <div class="banner-info">
                                <h3>Top Sales</h3>
                                <p>Start your shopping here...</p>
                            </div>
                        </li>
                        <li>
                            <div class="banner-info">
                                <h3>New Arrivals</h3>
                                <p>Start your shopping here...</p>
                            </div>
                        </li>
                    </ul>
                </div>
                <script src="web/js/responsiveslides.min.js"></script>
                <script>
                    $(function () {
                        $("#slider4").responsiveSlides({
                            auto: true,
                            pager:true,
                            nav:false,
                            speed: 500,
                            namespace: "callbacks",
                            before: function () {
                                $('.events').append("<li>before event fired.</li>");
                            },
                            after: function () {
                                $('.events').append("<li>after event fired.</li>");
                            }
                        });

                    });
                </script>
            </div>
            <div class="clearfix"> </div>
        </div>
        <div class="shop">
            <a href="Products.aspx">SHOP COLLECTION NOW</a>
        </div>
    </div>
</div>
<div class="container">
    <div class="main-content">
        <div class="online-strip">
            <div class="col-md-4 follow-us">
                <h3>follow us : <a class="twitter" href="#"></a><a class="facebook" href="#"></a></h3>
            </div>
            <div class="col-md-4 shipping-grid">
                <div class="shipping">
                    <img src="web/images/shipping.png" alt="" />
                </div>
                <div class="shipping-text">
                    <h3>Free Shipping</h3>
                    <p>on orders over $ 199</p>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-4 online-order">
                <p>Order online</p>
                <h3>Tel:999 4567 8902</h3>
            </div>
            <div class="clearfix"></div>
        </div>

</asp:Content>
