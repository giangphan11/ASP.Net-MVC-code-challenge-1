<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="cart.ascx.cs" Inherits="Nhom3.uc.cart" %>

<style type="text/css">
    .style1 {
        text-align: center;
    }

    .style2 {
        width: 48px;
    }

    .style3 {
        text-align: center;
        width: 66px;
    }

    .style5 {
        text-align: center;
        width: 58px;
    }

    .style11 {
        text-align: center;
        width: 92px;
    }
</style>

<div id="wp-centercol_inner">
    <div id="wp-pos-breadcrumbs">
        <span class="breadcrumbs pathway clearafter">
            <a href="" class="home"></a>
            <div id="crumbs"><span class="current">Giỏ Hàng</span></div>
        </span>

    </div>

    <div id="wp-mainbody-content">
        <div id="wp-mainbody">

            <div class="com-content ">
                <div class="article">

                    <div class="wp-article-content">


                        <div class="probyitem">
                            <table cellspacing="1" cellpadding="0" border="0" width="700">
                                <tbody>
                                    <tr>
                                        <td style="height: 63px" colspan="3">
                                            <table style="font-size: 12px; width: 100%; font-family: tahoma; cellspacing=0 cellpadding=0 align=center; border: 1px solid #dddddd; background-color: #dddddd;" border="0" cellspacing="1" cellpadding="5">
                                                <tbody>
                                                    <tr>
                                                        <td style="background-color: #ffffff; font-weight: 700;" class="style2">Xoá</td>
                                                        <td style="background-color: #ffffff; font-weight: 700;" class="style2">Update</td>
                                                        <td class="style3" style="background-color: #ffffff; font-weight: 700;">Mã&nbsp; SP</td>
                                                        <td class="style11" style="background-color: #ffffff"><strong>Tên sản phẩm</strong></td>
                                                        <td class="style5" style="background-color: #ffffff; font-weight: 700;">Số lượng</td>
                                                        <td class="style1" style="background-color: #ffffff; font-weight: 700;">Đơn giá</td>
                                                        <td class="style1" style="background-color: #ffffff; font-weight: 700;">Thành tiền</td>
                                                    </tr>
                                                    <asp:Repeater ID="rptcartV" runat="server" OnItemCommand="rptcartV_ItemCommand">
                                                        <ItemTemplate>
                                                            <tr style="background-color: #ffffff">

                                                                <td align="center">


                                                                    <asp:ImageButton CommandName="remove" CommandArgument='<%#((DataBinder.Eval(Container.DataItem, "pro"))
                    as DataAccess.Products_info).id%>'
                                                                        ID="ImageButton4" runat="server" ImageUrl="~/uploads/Actions-edit-delete-icon.png" />
                                                                </td>
                                                                <td style="background-color: #ffffff; font-weight: 700;" class="style2">
                                                                    <asp:ImageButton ID="ImageButton5" CommandName="update" CommandArgument='<%#((DataBinder.Eval(Container.DataItem, "pro"))
                    as DataAccess.Products_info).id%>'
                                                                        runat="server" ImageUrl="~/uploads/Actions-dialog-ok-apply-icon.png" />
                                                                </td>
                                                                <td align="center">

                                                                    <asp:Label ID="ID" runat="server" Text='<%#((DataBinder.Eval(Container.DataItem, "pro"))
                                                                                as DataAccess.Products_info).id%>'></asp:Label>
                                                                </td>
                                                                <td align="center" style="width: 200px">
                                                                    <%#((DataBinder.Eval(Container.DataItem, "pro"))
                                                                                as DataAccess.Products_info).pname%>
                                                                </td>
                                                                <td align="center">
                                                                    <asp:TextBox ID="txtSoluong" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,
                    "amount")%>'
                                                                        Width="44px"></asp:TextBox>
                                                                </td>
                                                                <td align="right">
                                                                    <%#string.Format("{0:0,000}", (double)((DataBinder.Eval(Container.DataItem, "pro"))
                                                                                as DataAccess.Products_info).ppricecurrent)%>
                                          
                                                                </td>
                                                                <td align="right">

                                                                    <%#string.Format("{0:0,000}", (double) DataAccess.HamXuLy.ToInt(DataBinder.Eval(Container.DataItem, "amount")) * (DataAccess.HamXuLy.ToFloat((DataBinder.Eval(Container.DataItem, "pro") as DataAccess.Products_info).ppricecurrent)))%> đ</td>
                                                            </tr>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                    <tr>
                                                        <td style="background-color: #ffffff;" colspan="5"></td>
                                                        <td class="giohang" width="90"
                                                            style="background-color: #ffffff; font-weight: 700;">Tổng tiền </td>
                                                        <td class="giohang" width="90"
                                                            style="background-color: #ffffff; font-weight: 700; text-align: right;"><%=this.tong %> đ</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 101px; height: 50px"></td>
                                        <td style="width: 520px; height: 50px"
                                            align="center">
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td
                                                            valign="bottom" align="center" width="140">
                                                            <asp:Button ID="Button1" runat="server" CssClass="ngothe"
                                                                OnClick="Button1_Click" Text="Tiếp Tục Mua" />
                                                        </td>
                                                        <td
                                                            valign="bottom" align="center" width="140">
                                                            <asp:Button ID="Button2" runat="server" CssClass="ngothe"
                                                                OnClick="Button2_Click" Text="Thanh Toán" />
                                                        </td>
                                                        <td
                                                            valign="bottom" align="center" width="140">
                                                            &nbsp;</td>
                                                        <td
                                                            valign="bottom" align="center" width="140">
                                                            &nbsp;</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                        <td style="height: 50px; width: 58px;"></td>
                                    </tr>
                                </tbody>
                            </table>


                        </div>


                    </div>
                    <span class="article_separator">&nbsp;</span>
                    <div id="jc">
                        <div id="comments">
                        </div>

                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
