import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Arrays;
import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
        boolean result;
        switch (arr[0]) {
            case "signup":
                result = new dataBase("C:\\Users\\Admin\\AndroidStudioProjects\\Redditt\\lib\\srvr\\src\\Data.txt").signup(arr);
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

            case "login":
                int result1 = new dataBase("C:\\Users\\Admin\\AndroidStudioProjects\\Redditt\\lib\\srvr\\src\\Data.txt").login(arr);
            case "person":
                }
            }
        }

class dataBase{
    String path;
    public dataBase(String path){this.path = path;}

    public boolean signup(String[] arr){
        String email = arr[1];
        boolean result;

        File file = new File(path);
        try {
            Scanner scanner = new Scanner(file);
            while (scanner.hasNextLine()){
                String[] voroodi = scanner.nextLine().split("-");
                if (voroodi[0].equals(email))
                    return false;
            }
            Pattern pattern = Pattern.compile("");
            Matcher matcher = pattern.matcher(email);
            return !matcher.find();
        }catch (Exception e){
            System.out.println(Arrays.toString(e.getStackTrace()));
        }
        return true;
    }

    public  int login(String[] arr){
        String username = arr[2];
        String password = arr[3];
        File file = new File(path);
        try {
            Scanner sc = new Scanner(file);
            while (sc.hasNextLine()){
                String[] voroodi = sc.nextLine().split("-");
                if (username.equals(voroodi[2])){
                    return 0;
                }
            }
            return 1;
        }catch (Exception e){
            System.out.println(Arrays.toString(e.getStackTrace()));
        }
        return 1;
    }
}