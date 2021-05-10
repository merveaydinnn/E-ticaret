using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_ticaret.Admin
{
    public partial class Login : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            alertHatali.Visible = false;
        }

        SqlCommand cmd = new SqlCommand();
        SqlConnection con = new SqlConnection();

        protected void btnGiris_Click1(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection("Data Source=DESKTOP-SGKVCTD; Initial Catalog=ProjeE-ticaret; Integrated Security=true");
                SqlCommand cmd = new SqlCommand("sp_admin_Giris", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@KullaniciAdi", SqlDbType.VarChar)).Value = txtKullaniciAdi.Value;
                cmd.Parameters.Add(new SqlParameter("@Sifre", SqlDbType.VarChar)).Value = txtSifre.Value;
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    
                    alertHatali.Visible = false;
                    reader.Close();
                    con.Close();
                    Session["KullaniciAdi"] = txtKullaniciAdi.Value;
                    Response.Redirect("AdminPaneli.aspx");


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
    }
}