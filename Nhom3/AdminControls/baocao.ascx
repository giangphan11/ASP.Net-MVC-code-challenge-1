<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="baocao.ascx.cs" Inherits="Nhom3.AdminControls.baocao" %>

&nbsp;&nbsp;
<asp:DropDownList style="width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    box-sizing: border-box;
    border: none;
    background-color: #3CBC8D;
    color: white;" ID="drpDate" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpDate_SelectedIndexChanged" />
&nbsp;&nbsp;

<div class="card main1">
    <div class="card-header">
        <h3>Báo cáo -  Thống kê</h3>
    </div>
    <div class="card-content">
        <canvas id="myChart"></canvas>
    </div>
</div>

&nbsp;&nbsp;

<div class="card main1">
    <div class="card-header">
        <h3>Thống kê tổng giá theo đơn hàng</h3>
    </div>
    <div class="card-content">
        <canvas id="myChart2"></canvas>
    </div>
</div>

&nbsp;&nbsp;

<div class="card main1">
    <div class="card-header">
        <h3>Thống kê tổng đơn giá theo ngày trong tháng</h3>
    </div>
    <div class="card-content">
        <canvas id="myChart3"></canvas>
    </div>
</div>
