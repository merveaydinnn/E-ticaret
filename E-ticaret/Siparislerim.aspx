<%@ Page Title="" Language="C#" MasterPageFile="~/WebSablon.Master" AutoEventWireup="true" CodeBehind="Siparislerim.aspx.cs" Inherits="E_ticaret.Siparislerim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CphIcerik" runat="server">

    <div class=" panel panel-primary">
        <div class="panel-heading">Siparişlerim</div>
        <div class="panel-body">
            <div class="row">
                <div class="form-group">

                    <label for="text" class="col-sm-3 control-label">Referans Numaranız : </label>
                    <div class="col-sm-8">
                        <asp:TextBox ID="txtReferansNo" CssClass="form-control" runat="server" placeholder="Referans Numaranız"></asp:TextBox>
                    </div>
                    <div class="col-sm-1">
                        <asp:LinkButton ID="btnSorgula" CssClass="btn btn-primary" runat="server" OnClick="btnSorgula_Click">Ara</asp:LinkButton>
                    </div>
                </div>

            </div>
            <div class="row">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Fatura No</th>
                            <th>Fatura Tarihi</th>
                            <th>Referans No</th>
                            <th>Email</th>
                            <th>Sipariş Durumu</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rptSiparisler" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <%-- Sipariş bekliyorsa tablo sarı olsun --%>
                                    <tr class="<%#Eval("Durum").ToString()=="Sipariş Bekliyor"?"warning":""%>">
                                    <td><%#Eval("FaturaID")%></td>
                                    <td><%#Eval("Tarih")%></td>
                                    <td><%#Eval("ReferansNo")%></td>
                                    <td><%#Eval("Email")%></td>
                                    <td><%#Eval("Durum")%></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>


        </div>

    </div>



</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="CphScript" runat="server">
</asp:Content>
