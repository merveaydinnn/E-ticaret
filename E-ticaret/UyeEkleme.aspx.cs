using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_ticaret
{
    public partial class UyeEkleme : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }






        protected void btnUyeOl_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection("Data Source=DESKTOP-SGKVCTD;Initial Catalog=ProjeE-ticaret;Integrated Security=True");
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = string.Format("Insert Into Uyeler(KullaniciAdi,Password,Eposta) values ('{0}','{1}','{2}')", txtKullaniciAdi.Text, txtSifre.Text, txtEmail.Text);
            cmd.Connection = con;
            cmd.CommandType = System.Data.CommandType.Text;
            try
            {
                alertHatali.Visible = false;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                alertBasarili.Visible = true;
                Response.Redirect("Login.aspx");


            }
            catch
            {
                alertBasarili.Visible = false;
                con.Close();
                alertHatali.Visible = true;
            }

        }
    }
}

