using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.Concrete.SqlViews
{
    public class MessageInformationView
    {
        public int Id { get; set; }
        public string Sender { get; set; }
        public string Receiver { get; set; }
        public string Content { get; set; }
        public bool IsItRead { get; set; }
        public DateTime TimeToSend { get; set; }

    }
}
