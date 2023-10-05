package BetterCode_ex1;

import BetterCode_ex1.Readers.FileReader;
import BetterCode_ex1.Structures.Tuple;
import BetterCode_ex1.Writers.FileWriter;
import BetterCode_ex1.Writers.PdfWriter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class MyCustomFilesCreator
{

    public static void createCustomFiles(String fileToRead, List<String> myWordsAsInput) throws IOException
    {

        List<String> listOfReadStrings = FileReader.readFile(fileToRead);
        String readFileContent = String.join("\n",listOfReadStrings);
        String inputWordsContent = String.join("\n",myWordsAsInput);

        FileWriter.generateFile("outputFile", "txt",readFileContent+inputWordsContent);

        PdfWriter pdfWriter = new PdfWriter("outputPDF");
        pdfWriter.addParagraph(readFileContent+inputWordsContent);
        pdfWriter.addMetaInfo("TITLEEEE_TEST",new Tuple("KEYHERE","VALUEHERE"));
        pdfWriter.closeDocument();


    }

    public static void generateALotOfFiles()
    {
        List<String> myWordsToSave = new ArrayList<>(5);
        myWordsToSave.add("Test1");
        myWordsToSave.add("Test2");

        for (Integer i=0;i<10000;i++)

        {
            String s = Integer.toString(i);
            try
            {
                MyCustomFilesCreator.createCustomFiles("input"+s+".txt", myWordsToSave);
            }
            catch (Exception e)
            {
                e.printStackTrace();
            }
        }
    }

}
