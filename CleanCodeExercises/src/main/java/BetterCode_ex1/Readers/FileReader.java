package BetterCode_ex1.Readers;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class FileReader
{
    public static List<String> readFile(String filePath)
    {
        List<String> listOfReadStrings = null;
       try
       {
           listOfReadStrings = extractLinesFrom(filePath);
       }
       catch (FileNotFoundException e)
       {
           System.out.println("There is no such file");
           e.printStackTrace();
           System.exit(-1);
       }
       catch (IOException e)
       {
           System.out.println("Reading file error");
           e.printStackTrace();
           System.exit(-1);
       }

       return listOfReadStrings;
    }

    private static List<String> extractLinesFrom(String filePath) throws IOException
    {
        File file = new File(filePath);
        BufferedReader bufferedReader = new BufferedReader(new java.io.FileReader(file));
        List<String> listOfReadStrings = new ArrayList<>();
        String str;

        while ((str = bufferedReader.readLine()) != null)
        {
            listOfReadStrings.add(str);
        }

        return listOfReadStrings;
    }

}

