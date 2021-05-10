<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSablon.Master" AutoEventWireup="true" CodeBehind="KategoriIslemleri.aspx.cs" Inherits="E_ticaret.Admin.KategoriIslemleri" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CphHead" runat="server">
      <style>
        table tr td img {
            height: 50px;
            width: 50px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CphIcerik" runat="server">
      <div class="panel panel-primary">
        <div class="panel-heading">Ürün Düzenleme Sayfası</div>
        <div class="panel-body">
            <asp:Panel ID="Panel1" runat="server">
                <div class="row">
                   
                    <asp:GridView ID="GridView1" CssClass="table" runat="server" AutoGenerateColumns="False" DataKeyNames="KategoriID" DataSourceID="SqlDataSource1" CellPadding="4" GridLines="Horizontal" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px">
                        <Columns>
                            <asp:BoundField DataField="KategoriID" HeaderText="KategoriID" ReadOnly="True" InsertVisible="False" SortExpression="KategoriID" Visible="False"></asp:BoundField>
                            <asp:BoundField DataField="Ad" HeaderText="Ad" SortExpression="Ad"></asp:BoundField>
                            <asp:ImageField DataImageUrlField="Gorsel"></asp:ImageField>
                            <asp:CommandField ShowEditButton="True" ButtonType="Image" CancelImageUrl="~/Admin/images/icons/cancel.png" EditImageUrl="~/Admin/images/icons/paper.png" UpdateImageUrl="~/Admin/images/icons/checked.png"></asp:CommandField>
                            <asp:CommandField ShowDeleteButton="True" ButtonType="Image" DeleteImageUrl="~/Admin/images/icons/delete (1).png"></asp:CommandField>

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
                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ProjeE-ticaretConnectionString %>' DeleteCommand="DELETE FROM [Kategori] WHERE [KategoriID] = @KategoriID" InsertCommand="INSERT INTO [Kategori] ([Ad], [Gorsel]) VALUES (@Ad, @Gorsel)" SelectCommand="SELECT * FROM [Kategori] ORDER BY [KategoriID] DESC" UpdateCommand="UPDATE [Kategori] SET [Ad] = @Ad, [Gorsel] = @Gorsel WHERE [KategoriID] = @KategoriID">
                        <DeleteParameters>
                            <asp:Parameter Name="KategoriID" Type="Int32"></asp:Parameter>
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Ad" Type="String"></asp:Parameter>
                            <asp:Parameter Name="Gorsel" Type="String"></asp:Parameter>
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Ad" Type="String"></asp:Parameter>
                            <asp:Parameter Name="Gorsel" Type="String"></asp:Parameter>
                            <asp:Parameter Name="KategoriID" Type="Int32"></asp:Parameter>
                        </UpdateParameters>
                    </asp:SqlDataSource>

                </div>

            </asp:Panel>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="CphScript" runat="server">
</asp:Content>
