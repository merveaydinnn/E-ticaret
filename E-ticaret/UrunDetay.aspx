<%@ Page Title="" Language="C#" MasterPageFile="~/WebSablon.Master" AutoEventWireup="true" CodeBehind="UrunDetay.aspx.cs" Inherits="E_ticaret.UrunDetay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CphHead" runat="server">
    <style>
        .fiyat {
            background-color: red;
            text-align: center;
            height: 45px;
            line-height: 45px;
            font-family: 'Oswald', sans-serif, serif;
            color: white;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CphIcerik" runat="server">
    <div id="form1">

        <div class="panel panel-primary">
            <div class="panel-heading">Ürün Detayı</div>
            <div class="panel-body row ">

                <div class="col-md-6">
                    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource1">
                                <ItemTemplate>
                                    <li data-target="#carousel-example-generic" data-slide-to="<%#  Container.ItemIndex %>" class=" <%# Container.ItemIndex==0?"active":"" %>"></li>
                                </ItemTemplate>
                            </asp:Repeater>


                        </ol>

                        <!-- Wrapper for slides -->
                        <div class="carousel-inner" role="listbox">

                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                <ItemTemplate>
                                    <div class="item <%# Container.ItemIndex==0?"active":"" %>">
                                        <img src="<%#Eval("Adres") %>" alt="...">
                                    </div>

                                </ItemTemplate>
                            </asp:Repeater>

                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ProjeE-ticaretConnectionString %>' SelectCommand="Select * from Gorsel where UrunID=@UrunID">
                                <SelectParameters>
                                    <asp:QueryStringParameter QueryStringField="UrunID" DefaultValue="0" Name="UrunID"></asp:QueryStringParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>

                        <!-- Controls -->
                        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>

                </div>
                <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource2" OnItemCommand="Repeater3_ItemCommand">
                    <ItemTemplate>
                        <div class="col-md-6">
                            <div class="col-md-12 h1 "> <%# Eval("Ad") %>  </div>
                            <div class="col-md-6 h3 "><span class="fiyat"> <%# Convert.ToDouble(Eval("Fiyat")).ToString("0.00") %> TL </span></div>
                            <div class="col-md-6 h3 "></div>
                            <div class="col-md-12 text-justify"><%# Eval("Aciklama") %></div>
                            <div class="col-md-12" style="margin-top: 20px">
                              <asp:LinkButton ID="btnSepeteAt" CommandName="SepeteAt" CommandArgument='<%#Eval("UrunID") %>' CssClass="btn btn-primary btn-lg" runat="server">Sepete At</asp:LinkButton>
                                <asp:Button ID="btnSiparisTamamla" CssClass="btn btn-primary btn-lg" runat="server" Text="Hemen Ode" />

                            </div>

                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:ProjeE-ticaretConnectionString %>' SelectCommand="Select * from Urunler where UrunID=@UrunID">
                    <SelectParameters>
                        <asp:QueryStringParameter QueryStringField="UrunID" DefaultValue="0" Name="UrunID"></asp:QueryStringParameter>
                    </SelectParameters>
                </asp:SqlDataSource>


            </div>
            </div>
        
        </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="CphScript" runat="server">
</asp:Content>
