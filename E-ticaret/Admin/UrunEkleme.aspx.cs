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
    public partial class UrunEkleme : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGonder_Click(object sender, EventArgs e)
        {

            FurunResimleri.SaveAs(Server.MapPath("~") + "img\\Urunler\\" + FurunResimleri.FileName);
            string resimYolu = "/img/Urunler/" + FurunResimleri.FileName;

            SqlConnection con = new SqlConnection();
            con = new SqlConnection("Data Source=DESKTOP-SGKVCTD; Initial Catalog=ProjeE-ticaret; Integrated Security=true");
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = string.Format("insert into Urunler(Ad,Aciklama,Fiyat,GorselID,KategoriID) values ('{0}','{1}','{2}','{3}',{4})",
                txtUrunAdi.Value, txtAciklama.Value, txtBirimFiyat.Value, resimYolu, ddlKategori.SelectedValue);
            cmd.Connection = con;
            cmd.CommandType = System.Data.CommandType.Text;
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Repeater1.DataBind();
                hataMesaji.InnerText = "Ürün Eklendi.";
                hataMesaji.Visible = true;





            }
            catch (Exception ex)
            {
                hataMesaji.InnerText = ex.Message;
                hataMesaji.Visible=true;
            }

        }
    }
}