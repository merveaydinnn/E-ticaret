using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_ticaret.Admin
{
    public partial class UrunDuzenle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSorgula_Click(object sender, EventArgs e)
        {
            string sorgu = string.Format("Select * from Urunler where Ad like '%{0}%'",txtUrunAdi.Text);
            SqlDataSource1.SelectCommand = sorgu;
            GridView1.DataBind();

        }
    }
}