//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Yp02_Davydov_Alsh
{
    using System;
    using System.Collections.Generic;
    using System.Linq;

    public partial class Partners
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Partners()
        {
            this.Partner_products = new HashSet<Partner_products>();
        }
    
        public int ID_partner { get; set; }
        public int Type { get; set; }
        public string Name { get; set; }
        public string Director_name { get; set; }
        public string Director_middle_name { get; set; }
        public string Director_last_name { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Adress { get; set; }
        public long INN { get; set; }
        public int Rating { get; set; }

        public string Header => $"{Partner_type.Name_Type} | {Name}";
        public string Ratin => $"Рэйтинг: {Rating}";
        public string Number => $"+7 {Phone}";
        public string Discount => $"{CalculateDiscount(Partner_products.Sum(s => s.Num_of_products))}%";

        private int CalculateDiscount(long? totalSum)
        {
            if (totalSum > 300000) return 15;
            if (totalSum > 500000) return 10;
            if (totalSum > 10000) return 5;
            return 0;
        }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Partner_products> Partner_products { get; set; }
        public virtual Partner_type Partner_type { get; set; }
    }
}
