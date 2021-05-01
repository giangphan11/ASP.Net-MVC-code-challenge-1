<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="khohang.ascx.cs" Inherits="Nhom3.AdminControls.khohang" %>
&nbsp;&nbsp;
<div class="card">
    <div class="card-header">
        <h3>Kho hàng
        </h3>
    </div>
    <div class="card-content">
        
        <asp:GridView ID="GridView1" Width="900px" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" Height="40px"/>
            <Columns>
                <asp:BoundField DataField="id" HeaderText="Mã" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="id_item" HeaderText="ID" SortExpression="id_item" />
                <asp:BoundField DataField="pname" HeaderText="Tên" SortExpression="pname" />
                <asp:BoundField DataField="pcount" HeaderText="Số lượng" SortExpression="pcount" />
                <asp:BoundField DataField="ppriceold" HeaderText="Giá cũ" SortExpression="ppriceold" />
                <asp:BoundField DataField="ppricecurrent" HeaderText="Giá hiện tại" SortExpression="ppricecurrent" />
                <asp:BoundField DataField="pngaydang" HeaderText="Ngày tạo" SortExpression="pngaydang" />
                <asp:TemplateField HeaderText="Thao tác">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Cập nhật"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Huỷ"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Sửa"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Bạn có chắc xoá sản phẩm này?')" Text="Xoá"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" Height="40px" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connectionString %>" DeleteCommand="DELETE FROM [Products] WHERE [id] = @id" InsertCommand="INSERT INTO [Products] ([id_item], [pname], [pcount], [pnew], [ppriceold], [ppricecurrent], [pngaydang], [pkhuyenmai], [active]) VALUES (@id_item, @pname, @pcount, @pnew, @ppriceold, @ppricecurrent, @pngaydang, @pkhuyenmai, @active)" SelectCommand="SELECT [id], [id_item], [pname], [pcount], [pnew], [ppriceold], [ppricecurrent], [pngaydang], [pkhuyenmai], [active] FROM [Products]" UpdateCommand="UPDATE [Products] SET [id_item] = @id_item, [pname] = @pname, [pcount] = @pcount, [pnew] = @pnew, [ppriceold] = @ppriceold, [ppricecurrent] = @ppricecurrent, [pngaydang] = @pngaydang, [pkhuyenmai] = @pkhuyenmai, [active] = @active WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="id_item" Type="Int32" />
                <asp:Parameter Name="pname" Type="String" />
                <asp:Parameter Name="pcount" Type="Int32" />
                <asp:Parameter Name="pnew" Type="Boolean" />
                <asp:Parameter Name="ppriceold" Type="Double" />
                <asp:Parameter Name="ppricecurrent" Type="Double" />
                <asp:Parameter Name="pngaydang" Type="String" />
                <asp:Parameter Name="pkhuyenmai" Type="Boolean" />
                <asp:Parameter Name="active" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="id_item" Type="Int32" />
                <asp:Parameter Name="pname" Type="String" />
                <asp:Parameter Name="pcount" Type="Int32" />
                <asp:Parameter Name="pnew" Type="Boolean" />
                <asp:Parameter Name="ppriceold" Type="Double" />
                <asp:Parameter Name="ppricecurrent" Type="Double" />
                <asp:Parameter Name="pngaydang" Type="String" />
                <asp:Parameter Name="pkhuyenmai" Type="Boolean" />
                <asp:Parameter Name="active" Type="Boolean" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        
    </div>
</div>