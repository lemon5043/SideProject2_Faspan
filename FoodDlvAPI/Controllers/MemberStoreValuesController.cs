﻿//using Microsoft.AspNetCore.Http;
//using Microsoft.AspNetCore.Mvc;
//using System.Text;
//using System.Web;
//using static Org.BouncyCastle.Math.EC.ECCurve;

//namespace FoodDlvAPI.Controllers
//{
//    [Route("api/[controller]")]
//    [ApiController]
//    public class MemberStoreValuesController : ControllerBase
//    {
//        [HttpPost]
//        public string Ecpay(Ecpayobj Order)
//        {
//            var orderId= Guid.NewGuid().ToString().Replace("-", "").Substring(0, 20);
//            var EcpayParameter = new Dictionary<string, object>
//            {
//             //特店交易編號
//                { "MerchantTradeNo",  orderId},
//             //特店編號， 2000132 測試綠界編號
//                { "MerchantID",  "3002607"},
//              //交易類型 固定填入 aio
//                { "PaymentType",  "aio"},
//                 //交易金額
//                { "TotalAmount",  int.Parse(inModel.Amt)},
//              //特店交易時間 yyyy/MM/dd HH:mm:ss
//                { "MerchantTradeDate",  DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss")},
//               //交易描述
//                { "TradeDesc",  "測試交易"},
//                  //完成後發通知
//                { "ReturnURL","https://localhost:7093"},
//                //付款完成後導頁
//                { "OrderResultURL","https://localhost:7093"},
//                 //選擇預設付款方式信用卡
//                { "ChoosePayment",  "Credit"},
//                //CheckMacValue 加密類型 固定填入 1 (SHA256)
//                { "EncryptType",  "1"},
//                };
//            //商品名稱
//                EcpayParameter["ItemName"]=string.Join(",", Orde);
//            //檢查碼
//            EcpayParameter["CheckMacValue"] = GetCheckMacValue(EcpayParameter);

//            StringBuilder s = new StringBuilder();
//            s.AppendFormat("<form id='payForm' action='{0}' method='post'>", "https://payment-stage.ecpay.com.tw/Cashier/AioCheckOut/V5");
//            foreach (KeyValuePair<string, object> item in EcpayParameter)
//            {
//                s.AppendFormat("<input type='hidden' name='{0}' value='{1}' />", item.Key, item.Value);
//            }
//            s.Append("</form>");
//            return s.ToString();
//        }
//        /// <summary>
//        /// 取得 檢查碼
//        /// </summary>
//        /// <param name="order"></param>
//        /// <returns></returns>
//        private string GetCheckMacValue(Dictionary<string, object> order)
//        {
//            var param = order.Keys.OrderBy(x => x).Select(key => key + "=" + order[key]).ToList();

//            var checkValue = string.Join("&", param);

//            //測試用的 HashKey
//            var hashKey = "spPjZn66i0OhqJsQ";

//            //測試用的 HashIV
//            var HashIV = "hT5OJckN45isQTTs";

//            checkValue = $"HashKey={hashKey}" + "&" + checkValue + $"&HashIV={HashIV}";

//            checkValue = HttpUtility.UrlEncode(checkValue).ToLower();

//            checkValue = EncryptSHA256(checkValue);

//            return checkValue.ToUpper();
//        }
//        /// <summary>
//        /// 字串加密SHA256
//        /// </summary>
//        /// <param name="source">加密前字串</param>
//        /// <returns>加密後字串</returns>

//        public string EncryptSHA256(string source)
//        {
//            string result = string.Empty;

//            using (System.Security.Cryptography.SHA256 algorithm = System.Security.Cryptography.SHA256.Create())
//            {
//                var hash = algorithm.ComputeHash(Encoding.UTF8.GetBytes(source));

//                if (hash != null)
//                {
//                    result = BitConverter.ToString(hash)?.Replace("-", string.Empty)?.ToUpper();
//                }

//            }
//            return result;
//        }
//        /// <summary>
//		/// 16 進制字串解密
//		/// </summary>
//		/// <param name="source">加密前字串</param>
//		/// <param name="cryptoKey">加密金鑰</param>
//		/// <param name="cryptoIV">cryptoIV</param>
//		/// <returns>解密後的字串</returns>
//		public string DecryptAESHex(string source, string cryptoKey, string cryptoIV)
//        {
//            string result = string.Empty;

//            if (!string.IsNullOrEmpty(source))
//            {
//                // 將 16 進制字串 轉為 byte[] 後
//                byte[] sourceBytes = ToByteArray(source);

//                if (sourceBytes != null)
//                {
//                    // 使用金鑰解密後，轉回 加密前 value
//                    result = Encoding.UTF8.GetString(DecryptAES(sourceBytes, cryptoKey, cryptoIV)).Trim();
//                }
//            }

//            return result;
//        }
//        /// <summary>
//		/// 將16進位字串轉換為byteArray
//		/// </summary>
//		/// <param name="source">欲轉換之字串</param>
//		/// <returns></returns>
//		public byte[] ToByteArray(string source)
//        {
//            byte[] result = null;

//            if (!string.IsNullOrWhiteSpace(source))
//            {
//                var outputLength = source.Length / 2;
//                var output = new byte[outputLength];

//                for (var i = 0; i < outputLength; i++)
//                {
//                    output[i] = Convert.ToByte(source.Substring(i * 2, 2), 16);
//                }
//                result = output;
//            }

//            return result;
//        }

//        /// <summary>
//        /// 字串解密AES
//        /// </summary>
//        /// <param name="source">解密前字串</param>
//        /// <param name="cryptoKey">解密金鑰</param>
//        /// <param name="cryptoIV">cryptoIV</param>
//        /// <returns>解密後字串</returns>
//        public byte[] DecryptAES(byte[] source, string cryptoKey, string cryptoIV)
//        {
//            byte[] dataKey = Encoding.UTF8.GetBytes(cryptoKey);
//            byte[] dataIV = Encoding.UTF8.GetBytes(cryptoIV);

//            using (var aes = System.Security.Cryptography.Aes.Create())
//            {
//                aes.Mode = System.Security.Cryptography.CipherMode.CBC;
//                // 智付通無法直接用PaddingMode.PKCS7，會跳"填補無效，而且無法移除。"
//                // 所以改為PaddingMode.None並搭配RemovePKCS7Padding
//                aes.Padding = System.Security.Cryptography.PaddingMode.None;
//                aes.Key = dataKey;
//                aes.IV = dataIV;

//                using (var decryptor = aes.CreateDecryptor())
//                {
//                    byte[] data = decryptor.TransformFinalBlock(source, 0, source.Length);
//                    int iLength = data[data.Length - 1];
//                    var output = new byte[data.Length - iLength];
//                    Buffer.BlockCopy(data, 0, output, 0, output.Length);
//                    return output;
//                }
//            }
//        }
//        /// <summary>
//		/// 加密後再轉 16 進制字串
//		/// </summary>
//		/// <param name="source">加密前字串</param>
//		/// <param name="cryptoKey">加密金鑰</param>
//		/// <param name="cryptoIV">cryptoIV</param>
//		/// <returns>加密後的字串</returns>
//		public string EncryptAESHex(string source, string cryptoKey, string cryptoIV)
//        {
//            string result = string.Empty;

//            if (!string.IsNullOrEmpty(source))
//            {
//                var encryptValue = EncryptAES(Encoding.UTF8.GetBytes(source), cryptoKey, cryptoIV);

//                if (encryptValue != null)
//                {
//                    result = BitConverter.ToString(encryptValue)?.Replace("-", string.Empty)?.ToLower();
//                }
//            }

//            return result;
//        }
//        /// <summary>
//		/// 字串加密AES
//		/// </summary>
//		/// <param name="source">加密前字串</param>
//		/// <param name="cryptoKey">加密金鑰</param>
//		/// <param name="cryptoIV">cryptoIV</param>
//		/// <returns>加密後字串</returns>
//		public byte[] EncryptAES(byte[] source, string cryptoKey, string cryptoIV)
//        {
//            byte[] dataKey = Encoding.UTF8.GetBytes(cryptoKey);
//            byte[] dataIV = Encoding.UTF8.GetBytes(cryptoIV);

//            using (var aes = System.Security.Cryptography.Aes.Create())
//            {
//                aes.Mode = System.Security.Cryptography.CipherMode.CBC;
//                aes.Padding = System.Security.Cryptography.PaddingMode.PKCS7;
//                aes.Key = dataKey;
//                aes.IV = dataIV;

//                using (var encryptor = aes.CreateEncryptor())
//                {
//                    return encryptor.TransformFinalBlock(source, 0, source.Length);
//                }
//            }
//        }
//    }
//}
