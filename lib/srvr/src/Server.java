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
        int result;
        switch (arr[0]) {
            case "signup":
                result = new dataBase("C:\\Users\\Admin\\AndroidStudioProjects\\Redditt\\lib\\srvr\\src\\Data.txt").signup(arr);
                try {
                        dos.writeBytes(String.valueOf(result));
                        dos.flush();
                }catch (Exception e){
                    System.out.println(Arrays.toString(e.getStackTrace()));
                }
                    break;

            case "login":
                result = new dataBase("C:\\Users\\Admin\\AndroidStudioProjects\\Redditt\\lib\\srvr\\src\\Data.txt").login(arr);
                try {
                        dos.writeBytes(String.valueOf(result));
                        dos.flush();
                }catch (Exception e){
                    System.out.println(Arrays.toString(e.getStackTrace()));
                }

                break;
            case "person":
                }
            }
        }

class dataBase{
    public String path;
    public dataBase(String path){
        this.path = path;
    }

    public int login(String[] arr){
        String username = arr[2];
        String password = arr[3];
        int num = 0;

        File file = new File(path);
        try {
            Scanner scanner = new Scanner(file);
            while (scanner.hasNextLine()){
                num++;
                String[] voroodi = scanner.nextLine().split("-");
                if (voroodi[1].equals(username))
                    if (voroodi[2].equals(password))
                        return num;
            }
            return 0;
        }catch (Exception e){
            System.out.println(Arrays.toString(e.getStackTrace()));
            return 0;
        }
    }

    public  int signup(String[] arr){
        String email = arr[1];
        File file = new File(path);
        try {
            Pattern pattern = Pattern.compile("^[a-zA-Z0-9_.]+@[a-zA-Z0-9]+\\.([a-zA-Z]{3})$");
            Matcher matcher = pattern.matcher(email);
            if (!matcher.find()){
                return 0;
            }
            Scanner sc = new Scanner(file);
            while (sc.hasNextLine()){
                String[] voroodi = sc.nextLine().split("-");
                if (voroodi[0].equals(email)){
                    return -1;
                }
            }
            boolean rslt = writeFile(arr);
            if (rslt)
                return 1;
            else
                return 0;
        }catch (Exception e){
            System.out.println(Arrays.toString(e.getStackTrace()));
        }
        return 0;
    }

    public boolean writeFile(String[] arr){
        String result = arr[1] + "-" + arr[2] + "-" + arr[3];
        File file = new File(path);
        try {
            RandomAccessFile randomAccessFile = new RandomAccessFile(path,"rw");
            randomAccessFile.seek(file.length());
            randomAccessFile.writeUTF(result);
        }catch (IOException e){
            System.out.println(Arrays.toString(e.getStackTrace()));
            return false;
        }
        return true;
    }
}