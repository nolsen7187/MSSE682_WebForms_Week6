using System;
using System.Collections.Generic;
using System.Linq;

using System.Net;
using System.Net.Sockets;

using System.Text;
using System.Threading.Tasks;

namespace SRVSKT
{
    class Program
    {
        static void Main(string[] args)
        {
            TcpListener listener = new TcpListener(IPAddress.Parse("127.0.0.1"), 8081);
        }
    }
}
