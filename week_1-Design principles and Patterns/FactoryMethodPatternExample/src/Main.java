public class Main {
    public static void main(String[] args){
        DocumentFactory wordFactory = new WordDocumentFactory();
        DocumentFactory pdfFactory = new PdfDocumentFactory();
        DocumentFactory excelFactory = new ExcelDocumentFactory();


        Document wordDoc = wordFactory.createDocument();
        Document excelDoc = excelFactory.createDocument();
        Document pdfDoc = pdfFactory.createDocument();

        wordDoc.open();
        excelDoc.open();
        pdfDoc.open();
    }
}
