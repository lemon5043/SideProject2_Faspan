﻿using System.ComponentModel.DataAnnotations;
using System.Xml.Linq;

namespace FoodDlvProject2.Models.ViewModels
{
	public class DeliveryRecordIndexVM
	{
		[Display(Name = "訂單編號")]
		public long Id { get; set; }
		[Display(Name = "訂單最後狀態時間")]
		public DateTime OrderDate { get; set; }
		[Display(Name = "外送公里數")]
		public decimal Milage { get; set; }
		[Display(Name = "訂單狀態")]
		public string Status { get; set; }
		[Display(Name = "外送員姓名")]
		public string DriverName { get; set; }

		public int DeliveryDriversId { get; set; }
	}
}