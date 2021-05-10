<%@ Page Title="" Language="C#" MasterPageFile="~/WebSablon.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="E_ticaret.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CphHead" runat="server">
    <style>
        .baslik {
            color: whitesmoke;
            font-family: 'Oswald', sans-serif, serif;
            font-weight: bold;
        }

        .kirmizi {
            color: darkred;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CphIcerik" runat="server">
    <div id="form1">
        <div class="panel panel panel-primary">
            <div class="panel-heading">
                <div class="row baslik">
                    <div class="col-md-2 h4 ">Ürün resmi </div>
                    <div class="col-md-3 h4">Urun adı </div>
                    <div class="col-md-2 h4">Birim fiyat</div>
                    <div class="col-md-2 h4">Urun Miktarı </div>
                    <div class="col-md-2 h5">Tutar </div>


                </div>
            </div>

            <div class="panel-body">

                <asp:Repeater ID="rptSepet" runat="server" OnItemCommand="rptSepet_ItemCommand">
                    <ItemTemplate>
                        <div class="row" style="margin-bottom: 10px">
                            <div class="col-md-2">

                                <img src="<%# Eval("Gorsel")%>" width="90" height="90" class="img-rounded" />
                            </div>
                            <div class="col-md-3  " style="line-height: 30px"><%# Eval("Ad")%> </div>
                            <div class="col-md-2  " style="line-height: 30px"><%# Convert.ToDouble(Eval("BirimFiyat")).ToString("0.00")%> TL</div>
                            <div class="col-md-2  " style="line-height: 30px">
                                <asp:LinkButton ID="LinkButton1" CommandName="miktarAzalt" CommandArgument='<%# Eval("UrunID")%> ' runat="server">-</asp:LinkButton>
                                <asp:TextBox CssClass="form-group text-center "  type="number" ReadOnly minLength="1" Width="50px" ID="txtMiktar" runat="server" Style="line-height: 30px" Text='<%# Eval("UrunMiktari") %>'></asp:TextBox>
                             <asp:LinkButton ID="LinkButton2" CommandName="miktarArtir" CommandArgument='<%# Eval("UrunID")%> ' runat="server">+</asp:LinkButton>
                            </div>
                            <div class="col-md-2  " style="line-height: 30px"><%# Convert.ToDouble(Eval("Tutar")).ToString("0.00")%> TL</div>
                            <div class="col-md-1  " style="line-height: 30px">
                                <asp:LinkButton  CommandName="sepettenCikar" CommandArgument='<%# Eval("UrunID")%> ' ID="LinkButton3" runat="server">
                                <span class="glyphicon glyphicon-remove-circle"></span>
                            </asp:LinkButton>

                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <div class="panel-footer">
                <div class="row">
                    <div class="col-md-4 col-lg-offset-8 h5">
                        <div class="col-md-6"> Toplam Tutar: </div>
                       <%-- toplam tutarı sesionda tutma--%>
                        <div id="divToplamTutar"  runat="server"  class="col-md-5 kirmizi"><%# Session["ToplamTutar"]==null?"0":Session["ToplamTutar"] %> TL </div> 
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4 col-lg-offset-8 h5">
                        <div class="col-md-6 ">KDV Tutar: </div>
                        <div  id="divKDVTutar"  runat="server"  class="col-md-5 kirmizi"><%# Session["KDVTutar"]==null?"0":Session["KDVTutar"] %> TL </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4 col-lg-offset-8 h5">
                        <div class="col-md-6">Genel Toplam: </div>
                        <div id="divGenelToplam"  runat="server"  class="col-md-5 kirmizi "><%# Session["GenelToplam"]==null?"0":Session["GenelToplam"] %> TL</div>
                    </div>
                </div>
                <div class="row text-center">
                    <asp:Button ID="btnTamamla" CssClass="btn btn-primary btn-lg" runat="server" Text="Siparişi Tamamla" OnClick="btnTamamla_Click" />
                    <a href="Urunler.aspx" class="btn btn-success btn-lg">Alışverişe Devam</a>
                </div>
            </div>
        </div>


    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="CphScript" runat="server">
</asp:Content>
