<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSablon.Master" AutoEventWireup="true" CodeBehind="UrunEkleme.aspx.cs" Inherits="E_ticaret.Admin.UrunEkleme" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CphIcerik" runat="server">
    <div class="panel panel-primary">
        <div class="panel-heading">Ürün Ekleme Sayfası</div>
        <div class="panel-body">
            <div class="form-horizontal">
            <table class="table">
                <tr class="form-group">
                    <td class="text-right"><label>Ürün Adi</label></td>
                    <td>
                        <input type="text" class="form-control" id="txtUrunAdi" runat="server" placeholder="Ürün Adı" required > </td>
                    


                </tr>
                   <tr class="form-group">
                    <td class="text-right"><label>Birim Fiyatı</label></td>
                    <td>
                        <input type="number" class="form-control" id="txtBirimFiyat" runat="server" placeholder="Birim Fiyat" required > </td>
                    

                </tr>
                  <tr class="form-group">
                    <td class="text-right"><label>Kategori</label></td>
                    <td>

                        <asp:DropDownList CssClass="form-control" ID="ddlKategori" runat="server" DataSourceID="SqlDataSource2" DataTextField="Ad" DataValueField="KategoriID"></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:ProjeE-ticaretConnectionString %>' SelectCommand="SELECT * FROM [Kategori]"></asp:SqlDataSource>
                    </td>
                    

                </tr>
                  <tr class="form-group">
                    <td class="text-right"><label>Açıklama</label></td>
                    <td>
                        <textarea type="number" class="form-control" id="txtAciklama" role="5" runat="server" placeholder="Açıklama" required >  </textarea></td>
                    
                </tr>
                   <tr class="form-group">
                    <td class="text-right"><label>Ürün Resmi</label></td>
                    <td>
                        <asp:FileUpload ID="FurunResimleri" runat="server"  />
                        </td>
                    
                </tr>
                   <tr class="form-group">
                    <td class="text-right"></td>
                    <td>
                        <asp:Button ID="btnGonder" CssClass="btn btn-primary" runat="server" Text="Ekle" OnClick="btnGonder_Click"  />
                        </td>
                    
                </tr>
                  <tr class="form-group">
                    <td class="text-right"></td>
                    <td>
                       <div class="alert alert-danger" id="hataMesaji" runat="server" visible="false"></div>
                         <div class="alert alert-success" id="basariMesaji" runat="server" visible="false"></div>
                        
                    </td>
                    
                </tr>

            </table>

            </div>
            <table class="table">
                <thead>
                    <tr>
                        <th>Ürün Resmi </th>
                        <th>Ürün Adı </th>
                        <th>Ürün Açıklaması</th>
                        <th>Birim Fiyatı </th>

                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <img src="<%# Eval("GorselID") %>" height="50" width="50" /></td>
                                <td><%# Eval("Ad") %></td>
                                <td><%# Eval("Aciklama") %></td>
                                <td><%# Convert.ToDouble( Eval("Fiyat")).ToString("0.00") %> TL</td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>


                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ProjeE-ticaretConnectionString %>' SelectCommand="SELECT top 5 * FROM [Urunler] ORDER BY [UrunID] DESC"></asp:SqlDataSource>
                </tbody>

            </table>

        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="CphScript" runat="server">
</asp:Content>
