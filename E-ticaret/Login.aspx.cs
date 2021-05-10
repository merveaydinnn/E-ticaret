using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_ticaret
{
   
 
    public partial class Login : System.Web.UI.Page
    {
        SqlCommand cmd = new SqlCommand();
        SqlConnection con = new SqlConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
           


        }

        protected void btnGiris_Click(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection("Data Source=DESKTOP-SGKVCTD; Initial Catalog=ProjeE-ticaret; Integrated Security=true");
                SqlCommand cmd = new SqlCommand("sp_login", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@KullaniciAdi", SqlDbType.VarChar)).Value = txtKullaniciAdi.Text;
                cmd.Parameters.Add(new SqlParameter("@Sifre", SqlDbType.VarChar)).Value = txtSifre.Text;
                con.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    alertHatali.Visible = false;
                    Session["KullaniciAdi"] = txtKullaniciAdi.Text;
                    Session["sBaslik.InnerText"] = string.Format(" Hoşgeldin  {0}  ", txtKullaniciAdi.Text);
                    reader.Close();
                    con.Close();
                    Response.Redirect("Urunler.aspx");


                }
                else
                {

                    alertHatali.Visible = true;
                    reader.Close();
                    con.Close();
                }



            }
            catch (Exception)
            {

            }
        }

        protected void btnAdminGiris_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");

        }

        protected void btnUyeOL_Click(object sender, EventArgs e)
        {
            Response.Redirect("UyeEkleme.aspx");
        }
    }
}