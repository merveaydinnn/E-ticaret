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
    public partial class Siparislerim : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSorgula_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection("Data Source=DESKTOP-SGKVCTD; Initial Catalog=ProjeE-ticaret; Integrated Security=true");
            string selectSorgusu = string.Format("Select * from Fatura where ReferansNo = '{0}' or Email = '{0}'",txtReferansNo.Text);
            SqlDataAdapter liste = new SqlDataAdapter(selectSorgusu,con);
            DataTable tablo = new DataTable();
            // referans numarası uniqe bir değer olduğu için eposta için hata veriyor eposta için ayrı sorgu acıyoruz
            try
            { 
                liste.Fill(tablo);
            

            }
            catch
            {
                selectSorgusu= string.Format("Select * from Fatura where Email = '{0}'", txtReferansNo.Text);
                liste = new SqlDataAdapter(selectSorgusu, con);
                liste.Fill(tablo);

            }
           rptSiparisler.DataSource = tablo;
            rptSiparisler.DataBind();



        }
    }
}