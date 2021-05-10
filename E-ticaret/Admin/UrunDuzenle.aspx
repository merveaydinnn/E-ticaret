<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSablon.Master" AutoEventWireup="true" CodeBehind="UrunDuzenle.aspx.cs" Inherits="E_ticaret.Admin.UrunDuzenle" %>

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
            <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSorgula">

                <div class="row">

                    <div class="form-group">
                        <label for="text" class="col-sm-3 control-label">Ürün Adı : </label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="txtUrunAdi" CssClass="form-control" runat="server" placeholder="Ürün Adı"></asp:TextBox>
                        </div>
                        <div class="col-sm-1">
                            <asp:LinkButton ID="btnSorgula" CssClass="btn btn-primary" runat="server" OnClick="btnSorgula_Click">Ara</asp:LinkButton>
                            <br />
                        </div>
                    </div>

                </div>

                <div class="row">

                    <asp:GridView ID="GridView1" CssClass="table" runat="server" AutoGenerateColumns="False" DataKeyNames="UrunID" DataSourceID="SqlDataSource1" CellPadding="4" GridLines="Horizontal" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px">
                        <Columns>
                            <asp:BoundField DataField="UrunID" HeaderText="UrunID" ReadOnly="True" InsertVisible="False" SortExpression="UrunID" Visible="False"></asp:BoundField>
                            <asp:BoundField DataField="Ad" HeaderText="Ad" SortExpression="Ad"></asp:BoundField>
                            <asp:BoundField DataField="Aciklama" HeaderText="Aciklama" SortExpression="Aciklama" Visible="False"></asp:BoundField>
                            <asp:BoundField DataField="Fiyat" HeaderText="Fiyat" SortExpression="Fiyat"></asp:BoundField>
                            <asp:BoundField DataField="KategoriID" HeaderText="KategoriID" SortExpression="KategoriID"></asp:BoundField>
                            <asp:ImageField DataImageUrlField="GorselID"></asp:ImageField>
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
                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ProjeE-ticaretConnectionString %>' DeleteCommand="DELETE FROM [Urunler] WHERE [UrunID] = @UrunID" InsertCommand="INSERT INTO [Urunler] ([Ad], [Aciklama], [Fiyat], [GorselID], [KategoriID]) VALUES (@Ad, @Aciklama, @Fiyat, @GorselID, @KategoriID)" SelectCommand="SELECT * FROM [Urunler] ORDER BY [UrunID] DESC" UpdateCommand="UPDATE [Urunler] SET [Ad] = @Ad, [Aciklama] = @Aciklama, [Fiyat] = @Fiyat, [GorselID] = @GorselID, [KategoriID] = @KategoriID WHERE [UrunID] = @UrunID">
                        <DeleteParameters>
                            <asp:Parameter Name="UrunID" Type="Int32"></asp:Parameter>
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Ad" Type="String"></asp:Parameter>
                            <asp:Parameter Name="Aciklama" Type="String"></asp:Parameter>
                            <asp:Parameter Name="Fiyat" Type="Decimal"></asp:Parameter>
                            <asp:Parameter Name="GorselID" Type="String"></asp:Parameter>
                            <asp:Parameter Name="KategoriID" Type="Int32"></asp:Parameter>
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Ad" Type="String"></asp:Parameter>
                            <asp:Parameter Name="Aciklama" Type="String"></asp:Parameter>
                            <asp:Parameter Name="Fiyat" Type="Decimal"></asp:Parameter>
                            <asp:Parameter Name="GorselID" Type="String"></asp:Parameter>
                            <asp:Parameter Name="KategoriID" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="UrunID" Type="Int32"></asp:Parameter>
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>

            </asp:Panel>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="CphScript" runat="server">
</asp:Content>
