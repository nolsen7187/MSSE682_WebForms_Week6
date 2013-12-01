using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.IO;
using System.Net;
using System.Net.Sockets;

namespace SRVSKT
{
    class Program
    {
        static void Main(string[] args)
        {
            MyListener listener = new MyListener();
            listener.Listen();
        }
    }
    public class MyListener
    {
        static byte[] buffer { get; set; }
        static Socket sck;

        public void Listen()
        {
            sck = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
            IPEndPoint ipEndPoint = new IPEndPoint(IPAddress.Parse("127.0.01"), 7187);
            sck.Bind(ipEndPoint);
            sck.Listen(100);

            Socket accepted = sck.Accept();
            buffer = new byte[accepted.SendBufferSize];
            int bytesRead = accepted.Receive(buffer);
            byte[] formatted = new byte[bytesRead];
            for (int i = 0; i < bytesRead; i++)
            {
                formatted[i] = buffer[i];
            }


            string strData = Encoding.ASCII.GetString(formatted);
            Console.WriteLine(strData);
            Console.Read();
            sck.Close();
            accepted.Close();


            /* TcpListener listener = null;
             try
             {
                 Int32 port = 7187;
                 IPAddress ipAddr = IPAddress.Parse("127.0.0.1");
                 listener = new TcpListener(ipAddr, port);
                 // Start listening for incoming client requests
                 listener.Start();
                 while (true)
                 {
                     Console.Write("Waiting for a connection... ");
                     TcpClient tcpClient = listener.AcceptTcpClient();
                     // get a stream to read/write
                     NetworkStream stream = tcpClient.GetStream();
                     // read the data sent by the client.
                     BinaryReader reader = new BinaryReader(stream);
                     BinaryWriter writer = new BinaryWriter(stream);
                     string credentials = reader.ReadString();
                     Console.WriteLine("credentials: " + credentials);
                     // process the credentials and return a true / false
                     // close the socket when you’re done using it
                     tcpClient.Close();
                 }
             }
             catch(SocketException e)
             {
             Console.WriteLine("SocketException: {0}", e);
             }
             finally
             {
             // Stop listening for new clients
             listener.Stop();
             }*/
        }
    }

}
