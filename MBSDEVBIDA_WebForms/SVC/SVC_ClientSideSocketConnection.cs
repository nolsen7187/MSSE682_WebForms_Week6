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
        static byte[] receiveBuffer { get; set; }
        static Socket sck, receiveSck;

        public bool Client(string WebLogon, string Password)
        {
            //Send Data from Application
            sck = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
            IPEndPoint ipEndPoint = new IPEndPoint(IPAddress.Parse("127.0.01"), 7187);

            try
            {
                sck.Connect(ipEndPoint);
            }
            catch
            {
                Console.Write("Failed to establish connection with authentication server!");
                return false;
            }
            password = Password;
            username = WebLogon;

            byte[] data = Encoding.ASCII.GetBytes(@"<?xml version='1.0'?><xmlroot><USERNAME>" + username + "</USERNAME>" + "<PASSWORD>" + password + "</PASSWORD></xmlroot>");
            sck.Send(data);
            Console.Write("Data sent!");
            Console.Read();
            
            //sck.Shutdown(SocketShutdown.Both);
            //sck.Disconnect(true);
            //Send Data from Application End

            //Receive Response
            receiveSck = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
            IPEndPoint receiveIpEndPoint = new IPEndPoint(IPAddress.Parse("127.0.01"), 7188);
            receiveSck.Bind(receiveIpEndPoint);
            receiveSck.Listen(100);

            Socket accepted = receiveSck.Accept();
            receiveBuffer = new byte[accepted.SendBufferSize];
            int bytesRead = accepted.Receive(receiveBuffer);
            byte[] formatted = new byte[bytesRead];
            for (int i = 0; i < bytesRead; i++)
            {
                formatted[i] = receiveBuffer[i];
            }
            string strData = Encoding.ASCII.GetString(formatted);
            //receiveSck.Shutdown(SocketShutdown.Both);
            //receiveSck.Disconnect(true);

            receiveSck.Close();
            sck.Close();
            accepted.Close();

            return true;
            //sck.Receive(
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