<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TinTuc_ChiTiet.ascx.cs" Inherits="Nhom3.uc.TinTuc_ChiTiet" %>
<div id="wp-centercol_inner">
    <div id="wp-pos-breadcrumbs">
        <span class="breadcrumbs pathway clearafter">
            <a href="../Default.aspx" class="home"></a>
            <div id="crumbs"><a href="../Default.aspx">Tin Tức</a></div>
        </span>

    </div>

    <div id="wp-mainbody-content">
        <div id="wp-mainbody">

            <div class="com-content ">
                <div class="article">
                    <h1 class="contentheading">
                        <%=this.tintuc.TieuDe %></h1>
                    <div class="wp-article-toolbar">

                        <div class="post-meta">
                            <span class="dates"><%=this.tintuc.NgayDang %></span>


                        </div>
                    </div>
                    <div class="wp-article-content"><%=this.tintuc.NoiDung %></div>
                    <div class="related-new">
                        <h3 style="color: #666; font-weight: 600;" class="wp-moduletitle">
                            <span class="wp-moduleicon">BÀI LIÊN QUAN</span>
                        </h3>

                        <ul>

                            <asp:Repeater ID="Repeater1" runat="server">
                                <ItemTemplate>
                                    <li><a href="#"><%# Eval("TieuDe")%></a></li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                 

                    <div id="fb-root" class=" fb_reset">
                        <div style="position: absolute; top: -10000px; height: 0px; width: 0px;">
                            <div>
                                <iframe scrolling="no" frameborder="0" name="fb_xdm_frame_http" allowtransparency="true" id="fb_xdm_frame_http" aria-hidden="true" title="Facebook Cross Domain Communication Frame" tab-index="-1" style="border: medium none;" src="http://static.ak.facebook.com/connect/xd_arbiter.php?version=24#channel=f168a570e193948&amp;origin=http%3A%2F%2Fthoitrangkorea.com&amp;channel_path=%2Ftin-tuc%2Fao-so-mi-trang-tinh-khoi-cho-nang-cong-so.html%3Ffb_xd_fragment%23xd_sig%3Df324acd861df8d6%26"></iframe>
                                <iframe scrolling="no" frameborder="0" name="fb_xdm_frame_https" allowtransparency="true" id="fb_xdm_frame_https" aria-hidden="true" title="Facebook Cross Domain Communication Frame" tab-index="-1" style="border: medium none;" src="https://s-static.ak.facebook.com/connect/xd_arbiter.php?version=24#channel=f168a570e193948&amp;origin=http%3A%2F%2Fthoitrangkorea.com&amp;channel_path=%2Ftin-tuc%2Fao-so-mi-trang-tinh-khoi-cho-nang-cong-so.html%3Ffb_xd_fragment%23xd_sig%3Df324acd861df8d6%26"></iframe>
                            </div>
                        </div>
                        <div style="position: absolute; top: -10000px; height: 0px; width: 0px;">
                            <div></div>
                        </div>
                    </div>


                </div>

            </div>
        </div>
    </div>
</div>
