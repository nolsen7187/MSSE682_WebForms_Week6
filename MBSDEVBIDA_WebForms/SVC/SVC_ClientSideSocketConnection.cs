using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Net;
using System.Net.Sockets;

using System.Text;
using System.Threading.Tasks;

namespace SVC
{
    public class SVC_ClientSideSocketConnection
    {
        private string password = "";
        private string username = "";

        static Socket sck;

        public void Client(string WebLogon, string Password)
        {
            sck = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
            IPEndPoint ipEndPoint = new IPEndPoint(IPAddress.Parse("127.0.01"), 7187);

            try
            {
                sck.Connect(ipEndPoint);
            }
            catch
            {
                Console.Write("Failed to establish connection with authentication server!");
            }
            password = Password;
            username = WebLogon;

            byte[] data = Encoding.ASCII.GetBytes(@"<?xml version='1.0'?><xmlroot><USERNAME>" + username + "</USERNAME>" + "<PASSWORD>" + password + "</PASSWORD></xmlroot>");
            sck.Send(data);
            Console.Write("Data sent!");
            Console.Read();
            sck.Close();
            //sck.Bind(ipEndPoint);
            /*TcpClient tcpClient = new TcpClient();
            IPEndPoint ipEndPoint = new IPEndPoint(IPAddress.Parse("127.0.01"), 7187);
            try
            {
                tcpClient.Connect(ipEndPoint);
                NetworkStream networkStream = tcpClient.GetStream();
                byte[] inStream = new byte[10025];

                networkStream.Read(inStream, 0, (int)tcpClient.ReceiveBufferSize);
                string returndata = System.Text.Encoding.ASCII.GetString(inStream);
                Console.WriteLine("Data from Server : " + returndata);
                password = "dbrees";
                username = "dbrees";
                byte[] msg = Encoding.ASCII.GetBytes("admin");
                networkStream.Write(msg, 0, msg.Length);
                networkStream.Flush();


            }
            catch (SocketException e)
            {
                Console.WriteLine("SocketException: {0}", e);
            }
            /*Socket socket = new Socket
            (AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
            try
            {
                IPEndPoint ipEndPoint = new IPEndPoint(IPAddress.Parse("127.0.01"), 8081);
                socket.Connect(ipEndPoint);

                NetworkStream stream = new NetworkStream(socket);
                BinaryWriter writer = new BinaryWriter(stream);
                BinaryReader reader = new BinaryReader(stream);

                writer.Write("dbrees/dbrees");
                bool result = reader.ReadBoolean();

                socket.Shutdown(socket);
                socket.Close(socket);
            }
            catch (SocketException e)
            {
                Console.WriteLine("SocketException: {0}", e);
            }*/
        }
    }
}
