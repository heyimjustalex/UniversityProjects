package exceptions;

import java.io.*;

class FileObject implements Serializable {

    private static final long serialVersionUID = 1L;

    String name;
    String surname;

    // ...


    @Override
    public String toString() {
        return "FileObject{" +
                "name='" + name + '\'' +
                ", surname='" + surname + '\'' +
                '}';
    }
}

public class Demo {

    public static void main(String[] args) {

    }

    public static FileObject retreiveObject(String fileName) {
        try {
            FileInputStream fileInStream = new FileInputStream(fileName);
            ObjectInputStream objectInStream = new ObjectInputStream(fileInStream);

            FileObject fileObject = (FileObject) objectInStream.readObject();
            objectInStream.close();

            return fileObject;
        } catch (IOException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
