package BadCode_ex1;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfDocumentInfo;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;
import java.io.*;
import java.util.*;

public class ListExporter
{
    public ListExporter() {}

    public static void combineFilesAndSave(List<String> input, String extension,
                                           String fileName, String otherFilePath,
                                           boolean generatePdf) throws IOException
    {
        /// rewrite input into one string
        String combinedString = "";
        for (String str:
             input) {
            combinedString += str+'\n';
        }

        //other file read
        File file = new File(otherFilePath);
        BufferedReader br = new BufferedReader(new FileReader(file));
        String st;
        List<String> listOfReadStrings = new ArrayList<>();

        while ((st = br.readLine()) != null)
        {
            listOfReadStrings.add(st);
        }

        for (String str:
                listOfReadStrings) {
            combinedString += str+'\n';
        }

        if(generatePdf)
        {
            String dest = fileName+".pdf";
            PdfWriter writer = new PdfWriter(dest);
            PdfDocument pdfDoc = new PdfDocument(writer);
            pdfDoc.addNewPage();
            Document document = new Document(pdfDoc);
            document.add(new Paragraph(combinedString));

            /// SET PDF METADATA
           PdfDocumentInfo info = pdfDoc.getDocumentInfo();
           pdfDoc.getDocumentInfo().setTitle("TITLEEEE HEEEEEREEEEEEEEEE");
           pdfDoc.getDocumentInfo().setMoreInfo("MetadataHEREEEEEEEE", "metadataValueHEREEEEEEE");

           pdfDoc.close();
           document.close();
        }

        try {
            FileWriter myWriter = new FileWriter(fileName+"."+extension);
            myWriter.write(combinedString);
            myWriter.close();
            System.out.println("Successfully wrote to the file.");
        } catch (IOException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }
    }
    }




