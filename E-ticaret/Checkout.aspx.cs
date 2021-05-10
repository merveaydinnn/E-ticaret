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
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSiparisTamamla_Click(object sender, EventArgs e)
        {
            Random rnd = new Random();
            int rastFatura = rnd.Next(100000, 999999);

            bool odeme = OdemeYap(txtEmail.Text, txtAd.Text, txtSoyad.Text,
                 txtTelefon.Text, txtKartNo.Text, txtGuvenlikNo.Text,
                 ddlSonKullanmaAyi.SelectedValue, ddlSonKullanmaYili.SelectedValue, Session["GenelToplam"].ToString(), rastFatura.ToString());

            if (odeme == true)
            {

                SqlConnection con = new SqlConnection();
                con = new SqlConnection("Data Source=DESKTOP-SGKVCTD; Initial Catalog=ProjeE-ticaret; Integrated Security=true");
                #region Musteri Kaydı 
                //Response.Write("<script>alert('Odeme Gerçekleşti');</script>");
                SqlCommand cmd = new SqlCommand("sp_MusteriEkleme", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@Ad", SqlDbType.VarChar)).Value = txtAd.Text;
                cmd.Parameters.Add(new SqlParameter("@Soyad", SqlDbType.VarChar)).Value = txtSoyad.Text;
                cmd.Parameters.Add(new SqlParameter("@Eposta", SqlDbType.VarChar)).Value = txtEmail.Text;
                cmd.Parameters.Add(new SqlParameter("@Telefon", SqlDbType.VarChar)).Value = txtTelefon.Text;
                cmd.Parameters.Add(new SqlParameter("@IlceID", SqlDbType.Int)).Value = ddlIlcec.SelectedValue;
                cmd.Parameters.Add(new SqlParameter("@Adres", SqlDbType.VarChar)).Value = txtAdres.Text;
                try
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        reader.Close();
                        con.Close();
                    }
                    else
                    {
                        reader.Close();
                        con.Close();
                    }

                }
                catch (Exception)
                {
                    con.Close();
                    return;

                }

                #endregion


                #region  fatura kaydı oluşturuldu

                SqlCommand fatura = new SqlCommand("sp_FaturaEkleme", con);
                fatura.CommandType = CommandType.StoredProcedure;
                fatura.Parameters.Add(new SqlParameter("@Durum", SqlDbType.VarChar)).Value = "Sipariş Bekliyor";
                fatura.Parameters.Add(new SqlParameter("@Email", SqlDbType.VarChar)).Value = txtEmail.Text;
                try
                {
                    con.Open();
                    SqlDataReader reader = fatura.ExecuteReader();
                    if (reader.Read())
                    {
                        reader.Close();
                        con.Close();
                    }
                    else
                    {
                        reader.Close();
                        con.Close();
                    }

                }
                catch
                {

                    con.Close();
                    return;
                }

                #endregion

                #region Fatura Detay Kaydı Oluşturma

                DataTable sepet = new DataTable();
                sepet = (DataTable)Session["Sepet"];
                for (int i = 0; i < sepet.Rows.Count; i++)

                {
                    SqlCommand faturaDetay = new SqlCommand();

                    faturaDetay.CommandText=string.Format("INSERT INTO FaturaDetay(UrunID,FaturaID,Miktar)VALUES({0}, (select max(FaturaID) from Fatura), {1});" ,
                       sepet.Rows[i]["UrunID"].ToString(), sepet.Rows[i]["UrunMiktari"].ToString());
                    faturaDetay.Connection = con;
                    faturaDetay.CommandType = CommandType.Text;
                    try
                    {
                        con.Open();
                        faturaDetay.ExecuteNonQuery();
                        con.Close();

                    }
                    catch 
                    {

                        con.Close();
                        return;
                    }
                 
                }
                #endregion

                #region StoredPProcedure ile Fatura detay ekleme
                //SqlCommand faturaDetay = new SqlCommand("sp_FaturaDetayEkleme", con);

                //faturaDetay.CommandType = CommandType.StoredProcedure;
                //faturaDetay.Parameters.Add(new SqlParameter("UrunID", SqlDbType.Int)).Value = sepet.Rows[i]["UrunID"].ToString();
                //faturaDetay.Parameters.Add(new SqlParameter("@Miktar", SqlDbType.TinyInt)).Value = sepet.Rows[i]["UrunMiktari"].ToString();
                //try
                //{
                //    con.Open();
                //    SqlDataReader reader = fatura.ExecuteReader();
                //    if (reader.Read())
                //    {
                //        reader.Close();
                //        con.Close();
                //    }
                //    else
                //    {
                //        reader.Close();
                //        con.Close();
                //    }

                //}
                //catch
                //{

                //    con.Close();
                //    return;
                //}
                #endregion
                #region ReferansNo Alma

                string sorgu = "Select top 1 ReferansNo from Fatura order by FaturaID desc";
                SqlDataAdapter referanSorgu = new SqlDataAdapter(sorgu,con);
                DataTable tablo = new DataTable();
                referanSorgu.Fill(tablo);
                Session["ReferansNo"]=tablo.Rows[0][0].ToString();


                #endregion

                Response.Redirect("SiparisOnaylama.aspx");



            }
            else
            {
                Response.Write("<script>alert('Hata oluştu');</script>");

            }
        }
        public bool OdemeYap(string mMail, string mAd, string mSoyad, string mTel, string kartNo, string gKodu,
              string ska, string sky, string cekilecekTutar, string fNo)
        {

            return true;
        }

    }
}