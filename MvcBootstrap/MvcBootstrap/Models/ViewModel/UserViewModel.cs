﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MvcBootstrap.Models.ViewModel
{
    public class UserViewModel
    {
        [Key]
        public long ID { get; set; }

        [StringLength(50)]
        public string UserName { get; set; }

        [StringLength(50)]
        public string Password { get; set; }

        [StringLength(150)]
        public string Name { get; set; }

        [StringLength(250)]
        public string Email { get; set; }

        [StringLength(11)]
        public string Phone { get; set; }

        [StringLength(250)]
        public string Address { get; set; }
    }
}