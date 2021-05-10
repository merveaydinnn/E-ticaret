<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSablon.Master" AutoEventWireup="true" CodeBehind="KategoriEkleme.aspx.cs" Inherits="E_ticaret.Admin.KategoriEkleme" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CphIcerik" runat="server">
     <div class="panel panel-primary">
        <div class="panel-heading">Kategori  Ekleme Sayfası</div>
        <div class="panel-body">
            <div class="form-horizontal">
            <table class="table">
                <tr class="form-group">
                    <td class="text-right"><label>Kategori Adi</label></td>
                    <td>
                        <input type="text" class="form-control" id="txtKategoriAdi" runat="server" placeholder="Kategori Adı" required > </td>

                </tr>                  
                   <tr class="form-group">
                    <td class="text-right"><label>Kategori Resmi</label></td>
                    <td>
                        <asp:FileUpload ID="FkategoriResimleri" runat="server"  />
                        </td>
                    
                </tr>
                   <tr class="form-group">
                    <td class="text-right"></td>
                    <td>
                        <asp:Button ID="btnGonder" CssClass="btn btn-primary" runat="server" Text="Ekle" OnClick="btnGonder_Click"/>
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
                        <th>Kategori Resmi </th>
                        <th>Kategori Adı </th>                      

                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <img src="<%# Eval("Gorsel") %>" height="100" width="100" /></td>
                                <td><%# Eval("Ad") %></td>
                             
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>


                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ProjeE-ticaretConnectionString %>' SelectCommand="SELECT * FROM [Kategori] ORDER BY [KategoriID] DESC"></asp:SqlDataSource>
                </tbody>

            </table>

        </div>
    </div>



</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="CphScript" runat="server">
</asp:Content>
