using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.Spatial;

[Table("Credential")]
[Serializable]
public partial class Credential
{
    [Key]
    [StringLength(50)]
    public string GroupID { get; set; }

    [StringLength(50)]
    public string RoleID { get; set; }

}