using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibraryAutomationSystem.Entity
{
    public class User
    {
        public string memberName { get; set; }
        public string memberUserName { get; set; }
        public string memberPassword { get; set; }
        public string memberDOB { get; set; }
        public string memberDOJ { get; set; }
        public string memberSex { get; set; }
        public string memberPhoneNumber { get; set; }
        public string e_Mail { get; set; }
        public string memberAddress { get; set; }

        public User(string memberName, string memberUserName, string memberPassword, string memberDOB, string memberDOJ, string memberSex, string memberPhoneNumber, string e_Mail, string memberAddress)
        {

            this.memberName = memberName;
            this.memberUserName = memberUserName;
            this.memberPassword = memberPassword;
            this.memberDOB = memberDOB;
            this.memberDOJ = memberDOJ;
            this.memberSex = memberSex;
            this.memberPhoneNumber = memberPhoneNumber;
            this.e_Mail = e_Mail;
            this.memberAddress = memberAddress;
        }
        public User(string memberUserName, string memberPassword)
        {
            this.memberUserName = memberUserName;
            this.memberPassword = memberPassword;
        }

    }
}
