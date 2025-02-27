﻿namespace FoodDlvProject2.Models.DTOs
{
    public class MemberEditDTO
    {
        public int Id { get; set; }
        public int AccountStatusId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Phone { get; set; }
        public bool Gender { get; set; }
        public DateTime Birthday { get; set; }
        public string Email { get; set; }
        public int Balance { get; set; }
        public string Account { get; set; }
        public string Password { get; set; }
        public DateTime RegistrationTime { get; set; }
    }
}
