﻿using FoodDlvAPI.Models.DTOs;
using System.ComponentModel.DataAnnotations;
using System.Xml.Linq;

namespace FoodDlvAPI.Models.ViewModels
{
	public class MemberEditVM
	{
		public int Id { get; set; }
		public int AccountStatusId { get; set; }
		[Required(ErrorMessage = "請輸入{0}")]
		[Display(Name = "名字")]
		public string FirstName { get; set; }
		[Required(ErrorMessage = "請輸入{0}")]
		[Display(Name = "姓氏")]
		public string LastName { get; set; }
		[Required(ErrorMessage = "請輸入{0}")]
		[Display(Name = "手機號碼")]
		[StringLength(10, ErrorMessage = "號碼不能大於{1}")]
		public string Phone { get; set; }
		[Display(Name = "性別")]
		public bool Gender { get; set; }
		[Display(Name = "生日")]
		public DateTime Birthday { get; set; }
		[Display(Name = "電子郵件")]
		[EmailAddress(ErrorMessage = "輸入的{0}有誤")]
		public string Email { get; set; }

		[Display(Name = "帳號")]
		[Required]
		public string Account { get; set; }
		[Display(Name = "密碼")]
		[Required]
		[DataType(DataType.Password)]
		public string Password { get; set; }

	}
	public static class MemberEditVMExts
	{
		public static MemberEditVM ToMemberEditVM(this MemberDTO source)
		{
			return new MemberEditVM
			{
				Id = source.Id,
				AccountStatusId = source.AccountStatusId,
				FirstName = source.FirstName,
				LastName = source.LastName,
				Phone = source.Phone,
				Account = source.Account,
				Password = source.Password,

			};
		}
		public static MemberRegisterDto ToMemberRegisterDto(this MemberEditVM source)
		{
			return new MemberRegisterDto
			{
				Id = source.Id,
				AccountStatusId = source.AccountStatusId,
				FirstName = source.FirstName,
				LastName = source.LastName,
				Phone = source.Phone,
				Account = source.Account,
				Password = source.Password,

			};
		}
	}
}
