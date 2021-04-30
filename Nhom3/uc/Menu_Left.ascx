<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Menu_Left.ascx.cs" Inherits="Nhom3.uc.Menu_Left" %>
<div id="wp-pos-left">
    <%--chen vao day--%>
    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
</div>
<%--thống kê truy cập--%>
<div class="box-cyan icon-24-disc wp-modulecontainer">
    <div class="wp-modulecontainer_inner">
        <h3 class="wp-moduletitle">

            <span class="wp-moduleicon">THỐNG KÊ TRUY CẬP</span></h3>

        <div class="wp-modulecontent">
            <p align="center">Số lượt truy cập: <%= Application["DaTruyCap"].ToString() %></p>
            <p align="center">Số người Online: <%= Application["DangTruyCap"].ToString() %></p>
        </div>
    </div>
</div>
<%--end thống kê truy cập--%>

<div class="clearbreak"></div>


</div></div>

<a href="default.aspx?page=cart">
    <%-- giỏ hàng--%>
    <div class="cart_right">
        <p>
            <span id="cart_right_product_count">
                <%=this.item.Count %></span> Sản phẩm
        </p>
        <p>
            <span class="text_bold"><span id="cart_right_total">
                <%=this.tong %></span> đ</span>
        </p>
    </div>
</a>