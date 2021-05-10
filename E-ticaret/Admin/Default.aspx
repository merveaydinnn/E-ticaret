<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="E_ticaret.Admin.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    	<title>Admin Paneli </title>
	<meta charset="UTF-8" />
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css" />
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css" />
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css" />
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css" />
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css" />
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css" />
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css" />
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css" />
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css" />
	<link rel="stylesheet" type="text/css" href="css/main.css" />
<!--===============================================================================================-->
        <style type="text/css">
            .auto-style1 {
                font-family: Poppins-Medium;
                font-size: 16px;
                color: #555555;
                line-height: 1.2;
                display: -webkit-box;
                display: -webkit-flex;
                display: -moz-box;
                display: -ms-flexbox;
                display: flex;
                justify-content: center;
                align-items: center;
                padding: 0 20px;
                min-width: 120px;
                height: 50px;
                border-radius: 25px;
                background: #9152f8;
                background: -webkit-linear-gradient(bottom, #7579ff, #b224ef);
                background: -o-linear-gradient(bottom, #7579ff, #b224ef);
                background: -moz-linear-gradient(bottom, #7579ff, #b224ef);
                background: #9152f8;
                position: relative;
                z-index: 1;
                -webkit-transition: all 0.4s;
                -o-transition: all 0.4s;
                -moz-transition: all 0.4s;
                transition: all 0.4s;
                left: 0px;
                top: 0px;
            }
        </style>
</head>
<body>
	<div class="limiter">
		<div class="container-login100" style="background-image: url('images/bg-01.jpg');">
			<div class="wrap-login100">
				<form class="login100-form validate-form" runat="server">
					<span class="login100-form-logo">
						<i class="zmdi zmdi-landscape"></i>
					</span>

					<span class="login100-form-title p-b-34 p-t-27">
						Admin Girişi
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Enter username">

						<input id="txtKullaniciAdi" runat="server" class="input100" type="text" name="username" placeholder="Kullanıcı Adı" />
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<input id="txtSifre" runat="server" class="input100" type="password" name="pass" placeholder="Şifre" />
						<span class="focus-input100" data-placeholder="&#xf191;"></span>
					</div>

					<div class="contact100-form-checkbox">
						<input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me" />
						<label class="label-checkbox100" for="ckb1">
							Beni hatırla
						</label>
					</div>

					<div class="container-login100-form-btn">
                            <asp:Button  Cssclass="btn btn-primary btn-block btn-large" ID="btnGiris" runat="server" Text="Giriş Yap" OnClick="btnGiris_Click1"  />
						
					</div>

					
                        <div runat="server" id="alertHatali" visible="false" class="form-group"  >
                            <div class="alert alert-danger" role="alert">Kullanıcı Adı veya Şİfre Hatalı</div>
                        </div>

					<div class="text-center p-t-90">
						<a class="txt1" href="#">
							Şifremi Unuttum?
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>
 
</body>
</html>
