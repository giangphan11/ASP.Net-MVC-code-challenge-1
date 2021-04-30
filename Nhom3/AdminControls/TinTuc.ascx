<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TinTuc.ascx.cs" Inherits="Nhom3.AdminControls.TinTuc" %>
<%@ Register Assembly="FreeTextBox" Namespace="FreeTextBoxControls" TagPrefix="FTB" %>
<style type="text/css">
    .style6 {
        width: 100%;
    }

    .style8 {
        height: 19px;
        text-align: center;
        font-size: large;
    }

    .style14 {
        text-align: center;
    }

    .style15 {
        width: 553px;
        text-align: left;
    }

    .style16 {
        width: 129px;
        text-align: left;
    }

    .style17 {
        width: 553px;
        text-align: center;
    }

    .style18 {
        width: 129px;
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
                <h3>Tin tức
                </h3>
            </div>
            <div class="card-content" >
                <table >
                    <tr>
                        <td>
                            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Thêm Mới</asp:LinkButton>
                            <asp:Image ID="Image1" runat="server"
                                ImageUrl="~/uploads/admin/add-user-icon.png" /></td>
                        <td>
                            <%--  <cc1:collectionpager id="CollectionPager1" runat="server" resultsformat="Hiển thị {0}-{1} (tất cả {2})"
                        sectionpadding="5" slidersize="5"></cc1:collectionpager>--%>
                        </td>
                    </tr>
                </table>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True"
                    AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" OnPageIndexChanging="GridView1_PageIndexChanging"
                    OnRowCommand="GridView1_RowCommand" PageSize="5" Style="margin-top: 0px"
                    Width="746px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="id" SortExpression="id">
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TieuDe" HeaderText="Tiêu Đề" SortExpression="pname">
                            <ControlStyle BorderWidth="200px" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Hình Ảnh">
                            <ItemTemplate>
                                <img alt="" src='uploads/tintuc/<%# Eval("HinhDaiDien") %>' style="height: 100px; width: 96px;" />
                            </ItemTemplate>
                            <ControlStyle Width="100px" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="NgayDang" HeaderText="Ngày Đăng"
                            SortExpression="NgayDang">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Tình Trạng">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server"
                                    Text='<%#  (Boolean.Parse(Eval("TrangThai").ToString())) ? "Hiển Thị" : "Không Hiển thị" %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:CheckBox ID="CheckBox7" runat="server" Checked='<%# Bind("active") %>' />
                            </EditItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Thao Tác">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton2" runat="server" AlternateText="Sửa"
                                    CommandArgument='<%# Eval("id") %>' CommandName="sua"
                                    ImageUrl="~/uploads/admin/edit.jpeg" />
                                /
                        <asp:ImageButton ID="ImageButton1" runat="server" AlternateText="Xóa"
                            CommandArgument='<%# Eval("id") %>' CommandName="del"
                            ImageUrl="~/uploads/admin/remove.jpg" OnLoad="Delete_Load" />
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
                <br />
    </asp:View>
    <asp:View ID="View2" runat="server">

        &nbsp;&nbsp;
<div class="card">
    <div class="card-header">
        <h3>Tin tức
        </h3>
    </div>
    <div class="card-content">
        <table align="center" class="style6"
            style="border-style: solid; border-width: 0px">
            <tr>
                <td colspan="3" class="style8">
                    <asp:HiddenField ID="HiddenField_HinhAnh" runat="server" />
                    <asp:HiddenField ID="HiddenField_Id" runat="server" />
                    <strong>
                        <asp:Label ID="Label2" runat="server"
                            Text="Label" Style="text-align: center"></asp:Label></strong>
                </td>
            </tr>
            <tr>
                <td class="style16">Tiêu đề</td>
                <td class="style15">
                    <asp:TextBox ID="txtTieuDe" runat="server" Width="513px" CssClass="form_input"></asp:TextBox><br />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                        ControlToValidate="txtTieuDe" ErrorMessage="(*)"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style16">Nội dung tóm tắt</td>
                <td class="style15">
                    <FTB:FreeTextBox ID="txtTomTat" runat="server" Height="150px">
                    </FTB:FreeTextBox>
                    <br />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                        ControlToValidate="txtTomTat" ErrorMessage="(*)"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style16">Nội dung</td>
                <td class="style15">

                    <FTB:FreeTextBox ID="txtNoiDung"
                        ToolbarLayout="ParagraphMenu,FontFacesMenu,FontSizesMenu,FontForeColorsMenu,FontForeColorPicker,FontBackColorsMenu,FontBackColorPicker|Bold,Italic,Underline,Strikethrough,Superscript,Subscript,RemoveFormat|JustifyLeft,JustifyRight,JustifyCenter,JustifyFull;BulletedList,NumberedList,Indent,Outdent;CreateLink,Unlink,InsertImage|Cut,Copy,Paste,Delete;Undo,Redo,Print,Save|SymbolsMenu,StylesMenu,InsertHtmlMenu|InsertRule,InsertDate,InsertTime|InsertTable,EditTable;InsertTableRowAfter,InsertTableRowBefore,DeleteTableRow;InsertTableColumnAfter,InsertTableColumnBefore,DeleteTableColumn|InsertForm,InsertTextBox,InsertTextArea,InsertRadioButton,InsertCheckBox,InsertDropDownList,InsertButton|InsertDiv,EditStyle,InsertImageFromGallery,Preview,SelectAll,WordClean,NetSpell"
                        runat="Server"
                        DesignModeCss="/demos/demo.css" ImageGalleryPath="~/uploads/" />
                    <br />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                        ControlToValidate="txtNoiDung" ErrorMessage="(*)"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style16">Hình ảnh</td>
                <td class="style15">
                    <asp:Image ID="e_image" runat="server" Height="90px" Width="90px" />
                    <asp:FileUpload ID="flimg" runat="server" Style="text-align: left" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="style16">Tình trạng</td>
                <td class="style15">
                    <asp:CheckBox ID="ckbTinhTrang" runat="server" Text="Đăng Bài" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <table align="center" class="style6">
            <tr>
                <td class="style14" colspan="3">&nbsp;
                </td>
            </tr>
            <tr>
                <td class="style18">&nbsp;</td>
                <td class="style17">
                    <asp:Button ID="bntCapNhat" runat="server" Text="Cập Nhật" class="button button1"
                         OnClick="bntCapNhat_Click" />
                    <asp:Button ID="bntHuy" runat="server" Text="Bỏ Qua" class="button button3"
                        OnClick="bntHuy_Click" />
                </td>
                <td class="style14">&nbsp;</td>
            </tr>
        </table>
		
    </div>
</div>


        
        
    </asp:View>
</asp:MultiView>