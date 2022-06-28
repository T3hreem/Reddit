import java.io.*;
import java.lang.invoke.SwitchPoint;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Arrays;
import java.util.Scanner;

public class Server {
    public void main(String[] args) throws Exception{
        ServerSocket serverSocket = new ServerSocket(1234);

        while (true){
            Socket socket = serverSocket.accept();
            System.out.println("Connected");
            RequestHandler requestHandler = new RequestHandler(socket);
            String[] arr = requestHandler.give();
            requestHandler.Switch(arr);
        }
    }
}


class RequestHandler {
    Socket socket;
    DataInputStream dis;
    DataOutputStream dos;
    String request;

    public RequestHandler(Socket socket) throws Exception {
            this.socket = socket;
            dis = new DataInputStream(socket.getInputStream());
            dos = new DataOutputStream(socket.getOutputStream());
        }

    public String[] give() {
            String[] arr = new String[0];
            try {
                StringBuilder stringBuilder = new StringBuilder();
                int c = dis.read();
                while (c != 0) {
                    stringBuilder.append((char) c);
                    c = dis.read();
                }
                request = stringBuilder.toString();

                arr = request.split("-");

            } catch (Exception e) {
                System.out.println(Arrays.toString(e.getStackTrace()));
                System.out.println("Something go wrong!");
            }
            return arr;
            }

    public void Switch(String[] arr) {
        switch (arr[0]) {
            case "checkInf":
                boolean result = new dataBase("C:\\Users\\Admin\\AndroidStudioProjects\\Redditt\\lib\\srvr\\src\\Data.txt").checkInf(arr);
                try {
                    if (result){
                        dos.writeBytes("true");
                        dos.flush();}
                    else {
                        dos.writeBytes("false");
                        dos.flush();
                    }
                }catch (Exception e){
                    System.out.println(Arrays.toString(e.getStackTrace()));
                }
                    break;
            case "":
                }
            }
        }

class dataBase{
    String path;
    public dataBase(String path){this.path = path;}
    public boolean checkInf(String[] arr){
        String email = arr[1];
        String password = arr[3];
        boolean result;

        File file = new File(path);
        try {
            Scanner scanner = new Scanner(file);
            while (scanner.hasNextLine()){
                String[] voroodi = scanner.nextLine().split("-");

                return !voroodi[0].equals(email);
            }
        }catch (Exception e){
            System.out.println(Arrays.toString(e.getStackTrace()));
        }
        return true;
    }
}