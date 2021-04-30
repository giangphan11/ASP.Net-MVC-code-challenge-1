<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DanhMuc.ascx.cs" Inherits="Nhom3.AdminControls.DanhMuc" %>

<style>
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
                <h3>Danh mục
                </h3>
            </div>
            <div class="card-content">
                <table>
                    <tr>
                        <td>&nbsp;<asp:Image ID="Image1" runat="server" ImageUrl="~/uploads/admin/add-user-icon.png" />
                            <asp:LinkButton
                                ID="lbtThemMoi" runat="server" OnClick="lbtThemMoi_Click">Thêm Mới</asp:LinkButton><asp:Label
                                    ID="Label1" runat="server" ForeColor="Red"></asp:Label>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td width="100%">
                            <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand">
                                <HeaderTemplate>
                                    <table border="0" cellpadding="0" cellspacing="0" width="700">
                                        <tr style="background-color: #006699; font-weight: bold; height: 30px; color: #ffffff">
                                            <td align="center">Tên Danh Mục
                                            </td>
                                            <td align="left">Trạng Thái Hiển Thị
                                            </td>
                                            <td align="left">Thuộc Danh Mục
                                            </td>
                                            <td align="left">Thao tác
                                            </td>
                                        </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr onmouseout="style.backgroundColor='#ffffff'" onmouseover="style.backgroundColor='#eef7ff'"
                                        style="height: 30px;">
                                        <td align="left">
                                            <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("id") %>'
                                                CommandName="edit" Text='<%# Eval("names") %>'></asp:LinkButton>
                                        </td>
                                        <td align="left">
                                            <asp:Label ID="lblactive" runat="server" Text='<%# Eval("active") %>'></asp:Label>
                                        </td>
                                        <td align="left">
                                            <asp:Label ID="lblparent" runat="server" Text='<%# Eval("parentid") %>'></asp:Label>
                                        </td>
                                        <td align="left">
                                            <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/uploads/admin/edit.jpeg"
                                                AlternateText="Sửa" CommandArgument='<%# Eval("id") %>' CommandName="edit" />
                                            /
                                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/uploads/admin/remove.jpg"
                                        a AlternateText="Xóa" CommandArgument='<%# Eval("id") %>' CommandName="del" OnLoad="Delete_Load" />
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </table>
                                </FooterTemplate>
                            </asp:DataList>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 435px">&nbsp;
                        </td>
                    </tr>
                </table>
    </asp:View>
    <asp:View ID="View2" runat="server">
        <table border="0" style="width: 750px">
            <tr>
                <td style="width: 150px; height: 21px"></td>
                <td style="width: 500px; height: 21px">THÊM DANH MỤC
                </td>
            </tr>
            <tr>
                <td style="width: 100px">Tên Danh Mục :
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" Width="200px"></asp:TextBox><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox1" ErrorMessage="*"></asp:RequiredFieldValidator>thuộc
                    danh mục&nbsp;
                    <asp:DropDownList ID="DropDownList2" runat="server" Width="162px" AutoPostBack="True">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width: 100px">Vị Trí :
                </td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" Width="103px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox2"
                        ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="TextBox2"
                        ErrorMessage=" Number" MaximumValue="100" MinimumValue="1" Type="Integer"></asp:RangeValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 100px">Trạng Thái :
                </td>
                <td>
                    <asp:CheckBox ID="cbstatus" runat="server" Text="Hiển Thị" />
                </td>
            </tr>
            <tr>
                <td style="width: 100px"></td>
                <td>
                    <asp:Button ID="bntThemMoi" runat="server" Text="Thêm Mới"
                        OnClick="bntThemMoi_Click" />&nbsp;<asp:Button
                            ID="Button4" runat="server" Text="Thoát" Width="49px"
                            CausesValidation="False" OnClick="Button4_Click1" />
                </td>
            </tr>
        </table>
    </asp:View>
    <asp:View ID="View3" runat="server">
        &nbsp;&nbsp;
        <div class="card">
            <div class="card-header">
                <h3>SỬA DANH MỤC
                </h3>
            </div>
            <div class="card-content">

                <table border="0" style="width: 750px">
                    <tr>
                        <td style="width: 150px; height: 21px">
                            <asp:HiddenField ID="HiddenField1" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px">Tên Danh Mục :
                        </td>
                        <td>
                            <asp:TextBox ID="e_txtten" runat="server" Width="200px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox1"
                                ErrorMessage="*"></asp:RequiredFieldValidator>thuộc danh mục&nbsp;
                    <asp:DropDownList ID="DropDownList1" runat="server" Width="162px" AutoPostBack="True">
                    </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px">Vị Trí :
                        </td>
                        <td>
                            <asp:TextBox ID="e_txtvitri" runat="server" Width="103px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="e_txtvitri"
                                ErrorMessage="*"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="e_txtvitri"
                                ErrorMessage=" Number" MaximumValue="100" MinimumValue="1" Type="Integer"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px">Trạng Thái :
                        </td>
                        <td>
                            <asp:CheckBox ID="e_CheckBox1" runat="server" Text="Hiển Thị" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px"></td>
                        <td>&nbsp;<asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" Text="Lưu Lại" CssClass="button button2" />
                            <asp:Button ID="Button3" runat="server" OnClick="Button4_Click" Text="Thoát"  CssClass="button button3"
                                CausesValidation="False" />
                        </td>
                    </tr>
                </table>

            </div>
        </div>

    </asp:View>
</asp:MultiView>