using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.IO;
using System.Net;
using System.Net.Sockets;
using System.Runtime.Serialization.Formatters.Binary;
using System.Runtime.Serialization.Formatters;

namespace SRVSKT
{
    class Program
    {
        static void Main(string[] args)
        {
            TcpListener listener = new TcpListener(IPAddress.Parse("127.0.0.1"), 8081);
            TcpClient tcpClient = listener.AcceptTcpClient();//High Level Listening 
            NetworkStream stream = tcpClient.GetStream();//For TCP

            BinaryReader reader = new BinaryReader(stream);// Create binary reader based off of stream
            BinaryWriter writer = new BinaryWriter(stream);// Create binary writer based off of stream

            BinaryFormatter formatter = new BinaryFormatter();//Should pass in stream
            formatter.AssemblyFormat = FormatterAssemblyStyle.Simple;

            tcpClient.Close();

            Socket socket = listener.AcceptSocket(); // Low Level Listening 
            NetworkStream socketStream = new NetworkStream(socket); // For Socket

            BinaryReader socketReader = new BinaryReader(socketStream);// Create binary reader based off of stream
            BinaryWriter socketWriter = new BinaryWriter(socketStream);// Create binary writer based off of stream

            socket.Shutdown(SocketShutdown.Both);
            socket.Close(); // or tcpClient.Close()

        }
    }
}
