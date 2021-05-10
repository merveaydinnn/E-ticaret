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
    public partial class Urunler : System.Web.UI.Page
    {
        public PagedDataSource pds;
        protected void Page_Load(object sender, EventArgs e)
        {
            Urungetir();


        }

        public void Urungetir()
        {
            SqlConnection baglanti = new SqlConnection();
            baglanti = new SqlConnection("Data Source=DESKTOP-SGKVCTD;Initial Catalog=ProjeE-ticaret;Integrated Security=True");
            string selectSorgusu = string.Format("Select * From Urunler");
            SqlDataAdapter komut = new SqlDataAdapter(selectSorgusu, baglanti);
            DataTable tablo = new DataTable();
            komut.Fill(tablo);

            pds = new PagedDataSource();
            pds.AllowPaging = true;
            pds.PageSize = 8;
            pds.DataSource = tablo.DefaultView;
            int sayfa;

            if (Request.QueryString["sayfa"] != null)
            {
                sayfa = Convert.ToInt32(Request.QueryString["sayfa"]);


            }
            else
            {
                sayfa = 1;
            }
            pds.CurrentPageIndex = sayfa - 1;
            rptUrunler.DataSource = pds;
            rptUrunler.DataBind();



        }

        protected void rptUrunler_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "SepeteAt")
            {

                // Response.Write(string.Format("<script>alert('{0}')</script>", e.CommandArgument));
                SepeteAt(Convert.ToInt32(e.CommandArgument));
            }
        }
        DataRow UrunBilgileri(int UrunID)


        {
            SqlConnection con = new SqlConnection("Data Source=DESKTOP-SGKVCTD;Initial Catalog=ProjeE-ticaret;Integrated Security=True");
            SqlCommand cmd = new SqlCommand();
            string selectSorgusu = string.Format("select * from Urunler where UrunID={0}", UrunID);
            SqlDataAdapter sorgu = new SqlDataAdapter(selectSorgusu, con);
            DataTable tablo = new DataTable();
            sorgu.Fill(tablo);
            DataRow satir = tablo.Rows[0];
            return satir;

        }
        public bool SepetteUrunVarmi(int UrunID){

            DataTable sepet = new DataTable();
            sepet = (DataTable)Session["Sepet"];
            for (int i = 0; i < sepet.Rows.Count; i++)
            {
                if (Convert.ToInt32(sepet.Rows[i]["UrunID"]) == UrunID)
                {
                    return true;
                }

            }
            return false;
        }
        public void SepeteAt(int UrunID)
        {
            DataTable sepet = new DataTable();
            if (Session["Sepet"] == null)
            {
                sepet.Columns.Add("UrunID");
                sepet.Columns.Add("Gorsel");
                sepet.Columns.Add("Ad");
                sepet.Columns.Add("BirimFiyat");
                sepet.Columns.Add("UrunMiktari");
                sepet.Columns.Add("Tutar");



                DataRow urunBilgileri = UrunBilgileri(UrunID);
                sepet.Rows.Add();
                sepet.Rows[sepet.Rows.Count - 1]["UrunID"] = urunBilgileri["UrunID"].ToString();
                sepet.Rows[sepet.Rows.Count - 1]["Gorsel"] = urunBilgileri["GorselID"].ToString();
                sepet.Rows[sepet.Rows.Count - 1]["Ad"] = urunBilgileri["Ad"].ToString();
                sepet.Rows[sepet.Rows.Count - 1]["BirimFiyat"] = urunBilgileri["Fiyat"].ToString();
                sepet.Rows[sepet.Rows.Count - 1]["UrunMiktari"] = "1";
                sepet.Rows[sepet.Rows.Count - 1]["Tutar"] = urunBilgileri["Fiyat"].ToString();
                Session["Sepet"] = sepet;

            }
            else if(!SepetteUrunVarmi(UrunID)) //spet tanımlı fakat ilgili urun yoksa

            {
                sepet = (DataTable)Session["Sepet"];
                DataRow urunBilgileri = UrunBilgileri(UrunID);
                sepet.Rows.Add();
                sepet.Rows[sepet.Rows.Count - 1]["UrunID"] = urunBilgileri["UrunID"].ToString();
                sepet.Rows[sepet.Rows.Count - 1]["Gorsel"] = urunBilgileri["GorselID"].ToString();
                sepet.Rows[sepet.Rows.Count - 1]["Ad"] = urunBilgileri["Ad"].ToString();
                sepet.Rows[sepet.Rows.Count - 1]["BirimFiyat"] = urunBilgileri["Fiyat"].ToString();
                sepet.Rows[sepet.Rows.Count - 1]["UrunMiktari"] = "1";
                sepet.Rows[sepet.Rows.Count - 1]["Tutar"] = urunBilgileri["Fiyat"].ToString();
                Session["Sepet"] = sepet;


            }
            else if (SepetteUrunVarmi(UrunID)) // sepette aynı üründen var mı 
            {
                sepet = (DataTable)Session["Sepet"];
                for (int i = 0; i < sepet.Rows.Count; i++)
                {
                    if (Convert.ToInt32(sepet.Rows[i]["UrunID"]) == UrunID)
                    {
                        sepet.Rows[i]["UrunMiktari"] = Convert.ToInt32(sepet.Rows[i]["UrunMiktari"]) + 1;
                        sepet.Rows[i]["Tutar"] = Convert.ToInt32(sepet.Rows[i]["UrunMiktari"]) * Convert.ToDouble(sepet.Rows[i]["BirimFiyat"]);
                        break;

                    }
                }
                Session["Sepet"] = sepet;

            }

        }
    }
}