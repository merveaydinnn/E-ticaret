<%@ Page Title="" Language="C#" MasterPageFile="~/WebSablon.Master" AutoEventWireup="true" CodeBehind="SiparisOnaylama.aspx.cs" Inherits="E_ticaret.SiparisOnaylama" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CphIcerik" runat="server">

    <div class="row">
        <div class="col-md-12 text-center">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    Sipariş Onaylama Bölümü
                </div>
                <div class="panel-body">
                    <img src="img/sepet.png" style="width: 150px" />
                    <h4>Siparişiniz Alınmıştır.Talebiniz En Kısa Zamanda İşleme Konulacaktır .</h4>
                    <h3>Referans Numaranız <span id="referansNumarasi" runat="server" style="color: darkred"> </span></h3>

                </div>
            </div>

        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="CphScript" runat="server">
</asp:Content>
