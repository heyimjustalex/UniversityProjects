package BetterCode_ex1;

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

        try {
            MyCustomFilesCreator.createCustomFiles("input.txt", myWordsToSave);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

    }




}
