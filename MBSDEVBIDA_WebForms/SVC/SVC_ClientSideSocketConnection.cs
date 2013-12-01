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
        static void Main(string[] args)
        {
        /*    Socket socket = new Socket
            (AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
            try
            {
                IPEndPoint ipEndPoint = new IPEndPoint
                (IPAddress.Parse("127.0.01"), 8081);
                socket.Connect(ipEndPoint);
                NetworkStream stream = new NetworkStream(socket);
                BinaryWriter writer = new BinaryWriter(stream);
                BinaryReader reader = new BinaryReader(stream);
                writer.Write("dbrees/dbrees");
                bool result = reader.ReadBoolean();
            }
            catch (SocketException e)
            {
                Console.WriteLine("SocketException: {0}", e);
            }
        */
        }
        public void Client()
        {
            TcpClient tcpClient = new TcpClient();
            IPEndPoint ipEndPoint = new IPEndPoint(IPAddress.Parse("127.0.01"), 8081);
            try
            {
                tcpClient.Connect(ipEndPoint);
                NetworkStream ns = tcpClient.GetStream();


                byte[] inStream = new byte[10025];
                ns.Read(inStream, 0, (int)tcpClient.ReceiveBufferSize);
                string returndata = System.Text.Encoding.ASCII.GetString(inStream);
                Console.WriteLine("Data from Server : " + returndata);
                //string password = "admin";



                byte[] msg = Encoding.ASCII.GetBytes("admin");
                ns.Write(msg, 0, msg.Length);
                ns.Flush();


            }
            catch
            {

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
