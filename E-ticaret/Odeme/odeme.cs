using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace E_ticaret.Odeme
{
    public class StringString
    {
        public string Text1 { get; set; }
        public string Text2 { get; set; }
    }
    public class odeme
    {
        //public static bool OdemeYap(string mMail,string mAd, string mSoyad,string mTel,string gKodu, 
        //    string kartNo,string mIp , string ska,string sky, string cekilecekTutar,string fNo)
        //{
        //    NameValueCollection data = new NameValueCollection();
        //    string backref = "http://wwww.webadresi.com/redirect.aspx";
        //    data.Add("BACK_REF", backref);
        //    data.Add("BILL_COUNTRYCODE","TR");
        //    data.Add("BILL_EMAIL",mMail);
        //    data.Add("BILL_FNAME", mAd);        
        //    data.Add("BILL_LNAME", mSoyad);
        //    data.Add("BILL_PHONE", mTel);
        //    data.Add("CC_CVV", gKodu);
        //    data.Add("CC_NUMBER", kartNo);
        //    data.Add("CLIENT_IP", mIp);
        //    data.Add("EXP_MONTH", ska);
        //    data.Add("EXP_YEAR", sky);
        //    data.Add("MERCHANT", "OPU_TEST"); // SANAL HİZMET ALDIĞIMIZ ID VERİLECEK
        //    data.Add("ORDER_DATE", string.Format("{0:yyyy-MM-dd HH:mm:ss }", DateTime.UtcNow)) ;
        //    data.Add("ORDER_PCODE[0]","001");
        //    data.Add("ORDER_PINFO[0]", "E-TICARET.COM"); // HANGİ SİTE
        //    data.Add("ORDER_PNAME[0]", "URUNAlisVerisi"); // URUNUN ADI
        //    data.Add("ORDER_PRICE[0]", cekilecekTutar);
        //    data.Add("ORDER_PRICE_TYPE[0]", "GROSS");// KDV DAHİL
        //    data.Add("ORDER_QTY[0]","1"); //MİKTAR

        //    data.Add("ORDER_REF",fNo);//SİPARİŞ NUMARASI
        //    data.Add("PAY_MEHOD","CCVISAMC");
        //    data.Add("PRICES_CURRENCY", "TRY");

        //    var deger ="";
        //    foreach (var val in data)
        //    {
        //        var value = val as string;
        //        var byteCount = Encoding.UTF8.GetByteCount(data.Get(value));
        //        deger += byteCount + data.Get(value);

        //    }
        //    var signatureKey = "SECRET_KEY";



       // }
        public static string HashWithSignature(String hashString, String signature)
        {
            var binaryHash = new HMACMD5(Encoding.UTF8.GetBytes(signature)).ComputeHash(Encoding.UTF8.GetBytes(hashString));
            var hash = BitConverter.ToString(binaryHash).Replace("-", string.Empty).ToLowerInvariant();

            return hash;

        }
        private static string POSTFormPayu(string url, NameValueCollection data)
        {
            var result = new List<StringString>();
            var webClient = new WebClient();
            StringString sonucItem = null;
            try
            {
                string request = System.Text.Encoding.UTF8.GetString(webClient.UploadValues(url,data)).Trim();
                return request;
            }
            catch (WebException ex)
            {

                throw;
            }
        }


    }
}