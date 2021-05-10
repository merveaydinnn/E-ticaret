using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_ticaret.Admin
{
    public partial class KategoriEkleme : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGonder_Click(object sender, EventArgs e)
        {
            FkategoriResimleri.SaveAs(Server.MapPath("~") + "img\\Kategoriler\\" + FkategoriResimleri.FileName);
            string resimYolu = "/images/Kategoriler/" + FkategoriResimleri.FileName;
            SqlConnection con = new SqlConnection("Data Source=DESKTOP-SGKVCTD; Initial Catalog=ProjeE-ticaret; Integrated Security=true");
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = string.Format("insert into Kategori(Ad,Gorsel) values('{0}','{1}') ",txtKategoriAdi.Value,resimYolu);
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.Connection = con;
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                hataMesaji.Visible = false;
                Repeater1.DataBind();

            }
            catch (Exception ex )
            {
                hataMesaji.Visible = true;

                hataMesaji.InnerText = ex.Message;

            }
        }
    }
}