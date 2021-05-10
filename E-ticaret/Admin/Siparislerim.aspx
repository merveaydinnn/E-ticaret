<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSablon.Master" AutoEventWireup="true" CodeBehind="Siparislerim.aspx.cs" Inherits="E_ticaret.Admin.Siparislerim" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CphIcerik" runat="server">

    
    <div class=" panel panel-primary">
        <div class="panel-heading">Siparişlerim</div>
        <div class="panel-body">
            <asp:GridView ID="GridView1" CssClass="table" runat="server" AutoGenerateColumns="False" DataKeyNames="FaturaID" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
                <Columns>
                    <asp:BoundField DataField="FaturaID" HeaderText="FaturaID" ReadOnly="True" InsertVisible="False" SortExpression="FaturaID" Visible="False"></asp:BoundField>
                    <asp:BoundField DataField="Tarih" HeaderText="Tarih" ReadOnly="True" InsertVisible="False" SortExpression="Tarih" Visible="True"></asp:BoundField>                  
                    <asp:BoundField DataField="MusteriID" ReadOnly="True" HeaderText="MusteriID" SortExpression="MusteriID" Visible="False"></asp:BoundField>
                    <asp:TemplateField HeaderText="Durum" SortExpression="Durum">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" SelectedValue='<%# Bind("Durum") %>'>
                                <asp:ListItem>Sipariş Bekliyor</asp:ListItem>
                                <asp:ListItem>Sipariş Onaylandı</asp:ListItem>
                                <asp:ListItem>Kargoya Verildi</asp:ListItem>
                                <asp:ListItem>Sipariş Tamamlandı</asp:ListItem>
                                <asp:ListItem>Sipariş iptal Edildi</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("Durum") %>' ID="Label1"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="ReferansNo" HeaderText="ReferansNo" SortExpression="ReferansNo"></asp:BoundField>
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"></asp:BoundField>
                    <asp:BoundField DataField="KargoTakipNo" HeaderText="KargoTakipNo" SortExpression="KargoTakipNo"></asp:BoundField>

                    <asp:CommandField CancelImageUrl="~/Admin/images/icons/cancel.png" EditImageUrl="~/Admin/images/icons/paper.png" ShowEditButton="True" UpdateImageUrl="~/Admin/images/icons/checked.png" ButtonType="Image"></asp:CommandField>
                    <asp:CommandField DeleteImageUrl="~/Admin/images/icons/delete (1).png" ShowDeleteButton="True" ButtonType="Image"></asp:CommandField>
                   
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#333333"></FooterStyle>

                <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White"></HeaderStyle>

                <PagerStyle HorizontalAlign="Center" BackColor="#336666" ForeColor="White"></PagerStyle>

                <RowStyle BackColor="White" ForeColor="#333333"></RowStyle>

                <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

                <SortedAscendingCellStyle BackColor="#F7F7F7"></SortedAscendingCellStyle>

                <SortedAscendingHeaderStyle BackColor="#487575"></SortedAscendingHeaderStyle>

                <SortedDescendingCellStyle BackColor="#E5E5E5"></SortedDescendingCellStyle>

                <SortedDescendingHeaderStyle BackColor="#275353"></SortedDescendingHeaderStyle>
            </asp:GridView>


            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ProjeE-ticaretConnectionString %>' DeleteCommand="DELETE FROM [Fatura] WHERE [FaturaID] = @FaturaID" InsertCommand="INSERT INTO [Fatura] ([Tarih], [MusteriID], [Durum], [ReferansNo], [Email]) VALUES (@Tarih, @MusteriID, @Durum, @ReferansNo, @Email)" SelectCommand="SELECT * FROM [Fatura] ORDER BY [FaturaID] DESC" UpdateCommand="UPDATE Fatura SET Durum = @Durum WHERE (FaturaID = @FaturaID)">
                <DeleteParameters>
                    <asp:Parameter Name="FaturaID" Type="Int32"></asp:Parameter>
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Tarih" Type="DateTime"></asp:Parameter>
                    <asp:Parameter Name="MusteriID" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="Durum" Type="String"></asp:Parameter>
                    <asp:Parameter Name="ReferansNo" Type="Object"></asp:Parameter>
                    <asp:Parameter Name="Email" Type="String"></asp:Parameter>
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Durum" Type="String"></asp:Parameter>
                    <asp:Parameter Name="FaturaID" Type="Int32"></asp:Parameter>
                </UpdateParameters>
            </asp:SqlDataSource>
        </div></div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="CphScript" runat="server">
</asp:Content>
