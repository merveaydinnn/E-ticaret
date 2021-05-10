using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_ticaret
{
    public partial class Cart : System.Web.UI.Page
    {
        public DataTable sepet;
        double genelToplam;
        protected void Page_Load(object sender, EventArgs e)
        {
            sepet = new DataTable();
            sepet = (DataTable)Session["Sepet"];
            rptSepet.DataSource = sepet;
            double toplamTutar = 0;
            if (sepet != null)
            {
                for (int i = 0; i < sepet.Rows.Count; i++)
                    toplamTutar += Convert.ToDouble(sepet.Rows[i]["Tutar"]);


            }



            divToplamTutar.InnerText = toplamTutar.ToString("0.00 TL");
            divKDVTutar.InnerText = (toplamTutar * 0.08).ToString("0.00 TL");
            divGenelToplam.InnerText = ((toplamTutar * 0.08) + toplamTutar).ToString("0.00 TL");
            rptSepet.DataBind();
            genelToplam = ((toplamTutar * 0.08) + toplamTutar);
        }

        protected void rptSepet_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "miktarAzalt")
            {
                for (int i = 0; i < sepet.Rows.Count; i++)
                {
                    if (sepet.Rows[i]["UrunID"].ToString() == e.CommandArgument.ToString())
                    {
                        sepet.Rows[i]["UrunMiktari"] = Convert.ToInt32(sepet.Rows[i]["UrunMiktari"]) - 1;
                        sepet.Rows[i]["Tutar"] = Convert.ToInt32(sepet.Rows[i]["UrunMiktari"]) * Convert.ToDouble(sepet.Rows[i]["BirimFiyat"]);
                        Session["Sepet"] = sepet;
                        break;
                    }
                }
                double toplamTutar = 0;
                for (int i = 0; i < sepet.Rows.Count; i++)
                {
                    toplamTutar += Convert.ToDouble(sepet.Rows[i]["Tutar"]);

                }
                divToplamTutar.InnerText = toplamTutar.ToString("0.00 TL");
                divKDVTutar.InnerText = (toplamTutar * 0.08).ToString("0.00 TL");
                divGenelToplam.InnerText = ((toplamTutar * 0.08) + toplamTutar).ToString("0.00 TL");
                rptSepet.DataBind();
                genelToplam = ((toplamTutar * 0.08) + toplamTutar);
            }
            else if (e.CommandName == "miktarArtir")
            {
                for (int i = 0; i < sepet.Rows.Count; i++)
                {
                    if (sepet.Rows[i]["UrunID"].ToString() == e.CommandArgument.ToString())
                    {
                        sepet.Rows[i]["UrunMiktari"] = Convert.ToInt32(sepet.Rows[i]["UrunMiktari"]) + 1;
                        sepet.Rows[i]["Tutar"] = Convert.ToInt32(sepet.Rows[i]["UrunMiktari"]) * Convert.ToDouble(sepet.Rows[i]["BirimFiyat"]);
                        Session["Sepet"] = sepet;
                        break;
                    }
                }
                double toplamTutar = 0;
                for (int i = 0; i < sepet.Rows.Count; i++)
                {
                    toplamTutar += Convert.ToDouble(sepet.Rows[i]["Tutar"]);

                }
                divToplamTutar.InnerText = toplamTutar.ToString("0.00 TL");
                divKDVTutar.InnerText = (toplamTutar * 0.08).ToString("0.00 TL");
                divGenelToplam.InnerText = ((toplamTutar * 0.08) + toplamTutar).ToString("0.00 TL");
                rptSepet.DataBind();
                genelToplam = ((toplamTutar * 0.08) + toplamTutar);
            }
            else if (e.CommandName == "sepettenCikar")
            {
                for (int i = 0; i < sepet.Rows.Count; i++)
                {
                    if (sepet.Rows[i]["UrunID"].ToString() == e.CommandArgument.ToString())
                    {
                        sepet.Rows.RemoveAt(i);
                        Session["Sepet"] = sepet;
                        break;
                    }
                }
                double toplamTutar = 0;
                for (int i = 0; i < sepet.Rows.Count; i++)
                {
                    toplamTutar += Convert.ToDouble(sepet.Rows[i]["Tutar"]);

                }
                divToplamTutar.InnerText = toplamTutar.ToString("0.00 TL");
                divKDVTutar.InnerText = (toplamTutar * 0.08).ToString("0.00 TL");
                divGenelToplam.InnerText = ((toplamTutar * 0.08) + toplamTutar).ToString("0.00 TL");
                rptSepet.DataBind();
                genelToplam = ((toplamTutar * 0.08) + toplamTutar);

            }

        }

        protected void btnTamamla_Click(object sender, EventArgs e)
        {
            Session["ToplamTutar"] = divToplamTutar.InnerText;
            Session["KDVTutar"] = divKDVTutar.InnerText;
            Session["GenelToplam"] = genelToplam;
            Response.Redirect("Checkout.aspx");
        }
    }
}