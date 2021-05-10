<%@ Page Title="" Language="C#" MasterPageFile="~/WebSablon.Master" AutoEventWireup="true" CodeBehind="KategoriUrunListesi.aspx.cs" Inherits="E_ticaret.KategoriUrunListesi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CphIcerik" runat="server">

     <div class="panel panel-primary">
        <div class="panel-heading text-center">Ürün Listesi</div>
        <div class="panel-body">
            <div class="row">
                <asp:Repeater ID="rptUrunler" runat="server" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                        <div class="col-sm-6 col-md-3">
                            <div class="thumbnail">
                                <img src="<%# Eval("GorselID") %>" style="width: 200px; height: 200px;" alt="...">
                                <div class="caption">
                                    <h3>"<%# Eval("Ad") %>"</h3>
                                    <p><a href="UrunDetay.aspx?UrunID=<%#Eval("UrunID") %>" class="btn btn-primary" role="button">Detaylar</a> <a href="#" class="btn btn-default" role="button">Spete At</a></p>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>

                </asp:Repeater>
                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ProjeE-ticaretConnectionString %>' SelectCommand="SELECT * FROM [Urunler] WHERE ([KategoriID] = @KategoriID)">
                    <SelectParameters>
                        <asp:QueryStringParameter QueryStringField="KategoriID" DefaultValue="0" Name="KategoriID" Type="Int32"></asp:QueryStringParameter>
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>


            <%--<div class="row">
                <center>
                <nav aria-label="Page navigation">
                <ul class="pagination">
             <li>
      <a href="Urunler.aspx?sayfa=<%Response.Write(pds.CurrentPageIndex==0?1:pds.CurrentPageIndex); %>" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
                    <% for (int i = 1; i <= pds.PageCount; i++)
                        {%>
                             <li class="<%Response.Write((Request.QueryString["sayfa"]==null?"1":Request.QueryString["sayfa"].ToString()) == i.ToString()?"active" : "");%>" ><a href="Urunler.aspx?sayfa=<%Response.Write(i);%> %>"><% Response.Write(i); %></a></li>


                      <% }%>
   
   
    <li>
      <a href="Urunler.aspx?sayfa=<%Response.Write(pds.CurrentPageIndex==pds.Count-1?pds.Count:pds.CurrentPageIndex+1); %>" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>

    </center>
            </div>--%>

        </div>
    </div>



</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="CphScript" runat="server">
</asp:Content>
