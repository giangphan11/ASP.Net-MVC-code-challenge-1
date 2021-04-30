<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DonDatHang.ascx.cs" Inherits="Nhom3.AdminControls.DonDatHang" %>
<%@ Register Assembly="FreeTextBox" Namespace="FreeTextBoxControls" TagPrefix="FTB" %>
<style type="text/css">
    .style1 {
        text-align: center;
    }

    .button {
        border: none;
        color: white;
        padding: 16px 32px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 4px 2px;
        transition-duration: 0.4s;
        cursor: pointer;
    }

    .button1 {
        background-color: white;
        color: black;
        border: 2px solid #4CAF50;
    }

        .button1:hover {
            background-color: #4CAF50;
            color: white;
        }

    .button2 {
        background-color: white;
        color: black;
        border: 2px solid #008CBA;
    }

        .button2:hover {
            background-color: #008CBA;
            color: white;
        }

    .button3 {
        background-color: white;
        color: black;
        border: 2px solid #d63031;
    }

        .button3:hover {
            background-color: #d63031;
            color: white;
        }
</style>
<asp:MultiView ID="MultiView1" runat="server">
    <asp:View ID="View1" runat="server">
        &nbsp;&nbsp;
        <div class="card">
            <div class="card-header">
                <h3>Đơn đặt hàng
                </h3>
            </div>
            <div class="card-content">

                <table style="width: 650px;">
                    <tr>
                        <td style="font-weight: 700">Xem đơn hàng
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"
                        OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"
                        Width="98px">
                        <asp:ListItem Value="3">Tất cả</asp:ListItem>
                        <asp:ListItem Value="0">Xác nhận đơn</asp:ListItem>
                        <asp:ListItem Value="1">Đang ship</asp:ListItem>
                        <asp:ListItem Value="2">Đã thanh toán</asp:ListItem>
                    </asp:DropDownList>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Literal ID="Literal1" runat="server" Text="Không có đơn hàng nào"
                        Visible="False"></asp:Literal>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="GridView1" runat="server" AllowPaging="True"
                                AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333"
                                GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging"
                                OnRowCommand="GridView1_RowCommand" PageSize="10" Style="margin-top: 0px"
                                Width="746px">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="id" HeaderText="id" SortExpression="id">
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="TenKhachHang" HeaderText="TenKhachHang"
                                        SortExpression="TenKhachHang">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="TongTien" DataFormatString="{0:#,##0 VNĐ}"
                                        HeaderText="TongTien" SortExpression="TongTien">
                                        <HeaderStyle HorizontalAlign="Right" />
                                        <ItemStyle HorizontalAlign="Right" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="status" SortExpression="status">
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%#  (Eval("status").ToString()=="0") ? "Xác nhận đơn" : "" %>'></asp:Label>
                                            <asp:Label ID="Label4" runat="server" Text='<%#  (Eval("status").ToString()=="1") ? "Đang ship" : "" %>'></asp:Label>
                                            <asp:Label ID="Label5" runat="server" Text='<%#  (Eval("status").ToString()=="2") ? "Đã thanh toán" : "" %>'></asp:Label>
                                        </ItemTemplate>

                                        <ItemStyle HorizontalAlign="Center" />

                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Thao Tác">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server"
                                                CommandArgument='<%# Eval("id") %>' CommandName="Xem">Xem</asp:LinkButton>
                                            &nbsp;||
                                    <asp:LinkButton ID="LinkButton2" runat="server"
                                        CommandArgument='<%# Eval("id") %>' CommandName="guoimail">Gửi Mail</asp:LinkButton>
                                            &nbsp;||
                                    <asp:LinkButton ID="LinkButton3" runat="server"
                                        CommandArgument='<%# Eval("id") %>' CommandName="xoa" OnLoad="Delete_Load">Xóa</asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                </Columns>
                                <EditRowStyle BackColor="#2461BF" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#EFF3FB" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                <SortedDescendingHeaderStyle BackColor="#006699" />
                            </asp:GridView>



                        </td>
                    </tr>
                </table>
    </asp:View>


    <asp:View ID="View2" runat="server">
        &nbsp;&nbsp;
        <div class="card">
            <div class="card-header">
                <h3>THÔNG TIN ĐƠN HÀNG
                </h3>
            </div>
            <div class="card-content">


                <asp:GridView ID="GridView_DanhSachSanPham" runat="server" AllowPaging="True"
                    AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333"
                    GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging"
                    OnRowCommand="GridView1_RowCommand" PageSize="5"
                    Style="margin-top: 0px; text-align: center;" Width="581px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="Id">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server"
                                    Text='<%# DataAccess.Products_info.getby_id(Eval("ProductsId").ToString()).id %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tên Sản Phẩm">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server"
                                    Text='<%# DataAccess.Products_info.getby_id(Eval("ProductsId").ToString()).pname %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Giá">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server"
                                    Text='<%# string.Format("{0:0,000 vnd}", (double) DataAccess.Products_info.getby_id(Eval("ProductsId").ToString()).ppricecurrent )%>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="SoLuong" HeaderText="Số Lượng">
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#006699" />
                </asp:GridView>
                <strong>&nbsp;
        <br />
                    Tổng Tiền:
                    <asp:Label ID="lblTongTien" runat="server" Text="Label"></asp:Label>
                </strong>
                <br />

                <br />
                <br />
                <strong><span>THÔNG TIN KHÁCH HÀNG : </span>
                    <span style="text-decoration: underline">
                        <br />
                        <br />
                    </span></strong>
                <table border="0" cellpadding="0" cellspacing="0" width="600" align="center"
                    style="border: 1px solid #000000;">
                    <tr>
                        <td colspan="3">
                            <div class="style1">
                            </div>
                            <asp:HiddenField ID="HiddenField1" runat="server" />

                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center;" colspan="3">
                            <h3>
                                <asp:Label ID="lblThongBao" runat="server"
                                    Style="font-weight: 700; color: #FF0000" Text=""></asp:Label>
                            </h3>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 125px">Họ tên :</td>
                        <td style="width: 5px"></td>
                        <td style="width: 479px">
                            <asp:TextBox ID="txthoten" runat="server" Width="320px" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 125px; height: 24px;">Địa chỉ :</td>
                        <td style="width: 5px; height: 24px;"></td>
                        <td style="width: 479px; height: 24px;">
                            <asp:TextBox ID="txtdiachi" runat="server" TextMode="MultiLine" Width="320px"
                                ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 125px">Email :</td>
                        <td style="width: 5px"></td>
                        <td style="width: 479px">
                            <asp:TextBox ID="txtemail" runat="server" Width="320px" ReadOnly="True"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="width: 125px; height: 24px;">Điện thoại</td>
                        <td style="width: 5px; height: 24px;"></td>
                        <td style="width: 479px; height: 24px;">
                            <asp:TextBox ID="txtdienthoai" runat="server" Width="320px" ReadOnly="True"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="width: 125px; height: 102px;">Thông tin thêm :</td>
                        <td style="width: 5px; height: 102px;"></td>
                        <td style="width: 479px; height: 102px;">
                            <asp:TextBox ID="txtghichu" runat="server" Height="100px" TextMode="MultiLine"
                                Width="320px" ReadOnly="True"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="width: 125px">Trạng thái xử lý:</td>
                        <td style="width: 5px"></td>
                        <td style="width: 479px">
                            <asp:CheckBoxList ID="checklisstbox" runat="server">
                                <asp:ListItem Value="0" onclick="MutExChkList(this);">Xác nhận đơn</asp:ListItem>
                                <asp:ListItem Value="1" onclick="MutExChkList(this);">Đang ship</asp:ListItem>
                                <asp:ListItem Value="2" onclick="MutExChkList(this);">Đã thanh toán</asp:ListItem>
                            </asp:CheckBoxList>
                        </td>

                    </tr>
                    <tr>
                        <td style="width: 125px"></td>
                        <td style="width: 5px"></td>
                        <td style="width: 479px"></td>
                    </tr>
                    <tr>
                        <td style="width: 125px; height: 24px;"></td>
                        <td style="width: 5px; height: 24px;"></td>
                        <td style="width: 479px; height: 24px;">
                            <asp:Button ID="bntCapNhat" class="button button2" runat="server" Text="Cập Nhật"
                                OnClick="bntCapNhat_Click" />
                            &nbsp;&nbsp;
                        <asp:Button ID="Button1" runat="server" class="button button1" Text="Quay Lại"
                            OnClick="bntQuayLai_Click" />
                            &nbsp;
                        <asp:Button ID="bntHuyDonHang" class="button button3" runat="server" Text="Hủy Đơn Hàng"
                            Width="165px" OnClick="bntHuyDonHang_Click" />

                        </td>

                    </tr>
                </table>

            </div>
        </div>

    </asp:View>

    <asp:View ID="View3" runat="server">
        <table id="Table4" border="0" cellpadding="0" style="border-collapse: collapse" width="100%">
            <tr>
                <td style="height: 19px; width: 73px;"></td>
                <td style="height: 19px" width="15"></td>
                <td style="height: 19px; font-weight: 700; color: #FF0000;">&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 73px; height: 19px;">&nbsp;</td>
                <td width="15" style="height: 19px">&nbsp;</td>
                <td style="height: 19px">&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 73px">Tiêu đề
                </td>
                <td width="15">&nbsp;
                </td>
                <td>
                    <asp:TextBox ID="txttitle" runat="server" CssClass="txt" Width="250px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 73px;">Email đến
                </td>
                <td width="15"></td>
                <td>
                    <asp:TextBox ID="txtTo" runat="server" CssClass="txt" Width="250px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 73px; height: 19px" valign="top">Nội dung
                </td>
                <td style="height: 19px" width="15">&nbsp;
                </td>
                <td style="height: 19px">
                    <%-- <FTB:FreeTextBox ID="FreeTextBox1" runat="server" Height="400px" 
                        SupportFolder="~/FTB/FreeTextBox/" >
                    </FTB:FreeTextBox>--%>
                    <FTB:FreeTextBox ID="FreeTextBox1" runat="server" Width="580px">
                    </FTB:FreeTextBox>
                </td>
            </tr>
            <tr>
                <td style="height: 24px; width: 73px;"></td>
                <td style="height: 24px"></td>
                <td style="height: 24px"></td>
            </tr>
            <tr>
                <td style="height: 24px; width: 73px;">&nbsp;
                </td>
                <td style="height: 24px">&nbsp;
                </td>
                <td style="height: 24px">
                    <asp:Button ID="bntGuoiMail" runat="server" Text="Gửi mail"
                        OnClick="bntGuoiMail_Click" />

                    &nbsp;<asp:Button ID="btncancel" runat="server" CausesValidation="False"
                        class="button button3" Height="25px" OnClick="btncancel_Click" Text="Hủy bỏ"
                        Width="66px" />
                </td>
            </tr>
        </table>
        </div>
        </div>
    </asp:View>
</asp:MultiView>
<script type="text/javascript">
    function MutExChkList(chk) {
        var chkList = chk.parentNode.parentNode.parentNode;
        var chks = chkList.getElementsByTagName("input");
        for (var i = 0; i < chks.length; i++) {
            if (chks[i] != chk && chk.checked) {
                chks[i].checked = false;
            }
        }
    }
</script>
