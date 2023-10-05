package BetterCode_ex1.Writers;
import BetterCode_ex1.Structures.Tuple;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfDocumentInfo;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;
import java.io.FileNotFoundException;
import java.io.IOException;


public class PdfWriter
{
    private String outputFileName;
    private PdfDocument pdfDoc;
    private com.itextpdf.kernel.pdf.PdfWriter pdfWriter;
    private Document document;
    private String paragraphContent;

    public PdfWriter(String outputFileName) throws FileNotFoundException
    {
        this.outputFileName = outputFileName;
        this.pdfWriter = new com.itextpdf.kernel.pdf.PdfWriter(outputFileName+".pdf");
        this.pdfDoc = new PdfDocument(this.pdfWriter);

    }

    public void addMetaInfo (String title, Tuple<String,String> moreInfo) throws IOException
    {
        PdfDocumentInfo pdfDocumentInfo = this.pdfDoc.getDocumentInfo();
        pdfDocumentInfo.setTitle(title);
        pdfDocumentInfo.setMoreInfo(moreInfo.key, moreInfo.value);
    }

    public void addParagraph(String paragraphContent) throws IOException
    {
        // This is a deprecated method. Use putParagrapgh() instead
        // This function is not thread safe
        this.paragraphContent = paragraphContent;
        this.pdfDoc.addNewPage();
        this.document = new Document(this.pdfDoc);
        this.document.add(new Paragraph(paragraphContent));
    }



    public void closeDocument()
    {
        this.pdfDoc.close();
        this.document.close();
    }


}
