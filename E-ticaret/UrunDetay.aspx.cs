using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_ticaret
{
    public partial class UrunDetay : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSepeteAt_Click(object sender, EventArgs e)
        {

        }

        protected void Repeater3_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.ToString() == "SepeteAt")
            {
                Urunler u = new Urunler();
                u.SepeteAt(Convert.ToInt32(e.CommandArgument));
            }
        }


    }
}


