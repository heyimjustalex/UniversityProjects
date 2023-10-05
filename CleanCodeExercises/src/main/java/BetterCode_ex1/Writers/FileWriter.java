package BetterCode_ex1.Writers;

import java.io.IOException;

public class FileWriter
{
    public static void generateFile (String fileName, String extension, String paragraphContent) throws IOException
    {
            java.io.FileWriter myWriter = new java.io.FileWriter(fileName+"."+extension);
            myWriter.write(paragraphContent);
            myWriter.close();
    }


}
