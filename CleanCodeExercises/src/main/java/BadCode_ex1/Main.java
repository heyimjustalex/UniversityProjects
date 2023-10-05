package BadCode_ex1;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        List<String> myWordsToSave = new ArrayList<>(5);
        myWordsToSave.add("Test1");
        myWordsToSave.add("Test2");
        myWordsToSave.add("Test3");
        myWordsToSave.add("Test4");
        myWordsToSave.add("Test5");

        ListExporter exporter = new ListExporter();

        try{
            exporter.combineFilesAndSave(myWordsToSave,"txt","output","C:\\Users\\root\\Desktop\\AUI_LAB3\\clean_code3\\input.txt",true);
        }
        catch (IOException e)
        {

        }
    }
}
