<%@ Page Title="" Language="C#" MasterPageFile="~/WebSablon.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="E_ticaret.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CphIcerik" runat="server">

    <div class="panel panel-primary">
        <div class=" panel-heading">Siparişi Tamamlama Bölümü</div>
        <div class="panel-body">
            <div class="row">
                <div class="col-md-9">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="text" class="col-sm-2 control-label">Ad</label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="txtAd" CssClass="form-control" runat="server" placeholder="Ad " required></asp:TextBox>

                            </div>
                        </div>
                           <div class="form-group">
                            <label for="text" class="col-sm-2 control-label">Soyad</label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="txtSoyad" CssClass="form-control" runat="server" placeholder="Soyad" required></asp:TextBox>

                            </div>
                        </div>
                        <div class="form-group">
                            <label for="text" class="col-sm-2 control-label">Email</label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" placeholder="Email" type="email" required></asp:TextBox>

                            </div>
                        </div>
                        <div class="form-group">
                            <label for="text" class="col-sm-2 control-label">Telefon</label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="txtTelefon" CssClass="form-control" runat="server" placeholder="Telefon" type="number" MinLength="11" MaxLength="11" required></asp:TextBox>

                            </div>
                        </div>
                        <div class="form-group">
                            <label for="text" class="col-sm-2 control-label">Şehir</label>
                            <div class="col-sm-10">

                                <asp:DropDownList CssClass="form-control" ID="ddlSehir" runat="server" required DataSourceID="SqlDataSource1" DataTextField="Il" DataValueField="IlID" AutoPostBack="True">
                                </asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ProjeE-ticaretConnectionString %>' SelectCommand="SELECT * FROM [Iller] ORDER BY [Il]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="text" class="col-sm-2 control-label">İlçe</label>
                            <div class="col-sm-10">

                                <asp:DropDownList ID="ddlIlcec" CssClass="form-control" runat="server" required DataSourceID="SqlDataSource2" DataTextField="Ilce" DataValueField="IlceID">
                                </asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:ProjeE-ticaretConnectionString %>' SelectCommand="SELECT * FROM [Ilceler] WHERE ([IlID] = @IlID) ORDER BY [Ilce]">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlSehir" PropertyName="SelectedValue" DefaultValue="0" Name="IlID" Type="Int32"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="text" class="col-sm-2 control-label">Adres</label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="txtAdres" Rows="5" CssClass="form-control" runat="server" type="text" required></asp:TextBox>

                            </div>
                        </div>
                        <div class="form-group">
                            <label for="text" class="col-sm-2 control-label">Kart Numarası </label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="txtKartNo" CssClass="form-control" placeholder="Kart Numarası" runat="server" type="text" MaxLength="16" MinLength="16" required></asp:TextBox>

                            </div>
                        </div>
                           <div class="form-group">
                            <label for="text" class="col-sm-2 control-label">Güvenlik Numarası </label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="txtGuvenlikNo" CssClass="form-control" placeholder="Güvenlik Numarası"  runat="server" type="text" MaxLength="4" MinLength="3" required></asp:TextBox>
                            </div>
                        </div>

                           <div class="form-group">
                            <label for="text" class="col-sm-2 control-label">Son Kullanma Ayı</label>
                            <div class="col-sm-10">
                                <asp:DropDownList CssClass="form-control" ID="ddlSonKullanmaAyi" runat="server">
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>6</asp:ListItem>
                                    <asp:ListItem>7</asp:ListItem>
                                    <asp:ListItem>8</asp:ListItem>
                                    <asp:ListItem>9</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                    <asp:ListItem>11</asp:ListItem>
                                    <asp:ListItem>12</asp:ListItem>
                                </asp:DropDownList>
                         
                            </div>
                        </div>
                              <div class="form-group">
                            <label for="text" class="col-sm-2 control-label">Son Kullanma Yılı</label>
                            <div class="col-sm-10">
                                <asp:DropDownList CssClass="form-control" ID="ddlSonKullanmaYili" runat="server">
                                    <asp:ListItem>2021</asp:ListItem>
                                    <asp:ListItem>2022</asp:ListItem>
                                    <asp:ListItem>2023</asp:ListItem>
                                    <asp:ListItem>2025</asp:ListItem>
                                    <asp:ListItem>2026</asp:ListItem>
                                    <asp:ListItem>2027</asp:ListItem>
                                    <asp:ListItem>2028</asp:ListItem> 
                                     <asp:ListItem>2029</asp:ListItem> 
                                     <asp:ListItem>2030</asp:ListItem>                                     
                                </asp:DropDownList>
                            </div>
                        </div>




                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <asp:Button ID="btnSiparisTamamla" CssClass="btn btn-primary" runat="server" Text="Sipariş Tamamla" OnClick="btnSiparisTamamla_Click" />
                            </div>
                        </div>


                    </div>
                </div>
                <div class="col-md-3">
                    <div class="panel panel-primary">
                        <div class="panel-heading">Sipariş Toplamı </div>
                        <div class="panel-body row">
                            <table class="table table-hover ">
                                <tr>
                                    <td>Toplam Tutar : </td>
                                    <td><% Response.Write(Session["ToplamTutar"] == null ? "0" : Session["ToplamTutar"]);%> </td>
                                </tr>
                                <tr>
                                    <td>KDV Tutar :</td>
                                    <td><% Response.Write(Session["KDVTutar"] == null ? "0" : Session["KDVTutar"]); %> </td>
                                </tr>
                                <tr>
                                    <td>Kargo Bedeli : </td>
                                    <td><% Response.Write(Session["GenelToplam"] == null ? "0" : "10"); %> TL</td>
                                </tr>
                                <tr class="success">
                                    <td>Genel Toplam :</td>
                                    <td><% Response.Write(Session["GenelToplam"] == null ? "0" : (Convert.ToDouble(Session["GenelToplam"]) + 10).ToString()); %> TL</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="CphScript" runat="server">
</asp:Content>
