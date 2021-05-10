<%@ Page Title="" Language="C#" MasterPageFile="~/WebSablon.Master" AutoEventWireup="true" CodeBehind="UyeEkleme.aspx.cs" Inherits="E_ticaret.UyeEkleme"%>
<asp:Content ID="Content1" ContentPlaceHolderID="CphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CphIcerik" runat="server">
    <div class="panel panel-primary">
        <div class=" panel-heading">Üye olma paneli</div>
        <div class="panel-body">
            <div class="row">
                <div class="col-md-9">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="text" class="col-sm-2 control-label">Kullanıcı Adı </label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="txtKullaniciAdi" CssClass="form-control" runat="server" placeholder="KullaniciAdi"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Bu alan boş olamaz" ControlToValidate="txtKullaniciAdi"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="text" class="col-sm-2 control-label">Şifre</label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="txtSifre" CssClass="form-control" runat="server" placeholder="Sifre"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Bu alan boş olamaz" ControlToValidate="txtsifre"></asp:RequiredFieldValidator>

                            </div>
                        </div>
                        <div class="form-group">
                            <label for="text" class="col-sm-2 control-label">Şifre Tekrar</label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="txtSifreTekrar" CssClass="form-control" runat="server" placeholder="SifreTekrar"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Bu alan boş olamaz" ControlToValidate="txtSifreTekrar"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Şifreler Eşleşmiyor" ControlToCompare="txtSifre" ControlToValidate="txtSifreTekrar"></asp:CompareValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="text" class="col-sm-2 control-label">Email</label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" placeholder="Email"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Bu alan boş olamaz" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <asp:LinkButton ID="btnUyeOl" CssClass="btn btn-primary" runat="server" OnClick="btnUyeOl_Click">Uye Ol</asp:LinkButton>
                            
                            </div>
                        </div>
                        <div runat="server" id="alertBasarili" visible="false" class="form-group">
                            <div class="alert alert-success" role="alert">Başarılı</div>
                        </div>
                        <div runat="server" id="alertHatali" visible="false" class="form-group">
                            <div class="alert alert-danger" role="alert">Üye İşlemi Oluşturulamadı</div>
                        </div>


                    </div>
                </div>


            </div>

        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="CphScript" runat="server">
</asp:Content>
