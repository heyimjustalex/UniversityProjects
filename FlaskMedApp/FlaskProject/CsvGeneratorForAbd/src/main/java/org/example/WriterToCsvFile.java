package org.example;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.stream.Collectors;

public class WriterToCsvFile {

    PrintWriter writer;

    public WriterToCsvFile(String fileName) throws IOException {
        writer = new PrintWriter(new FileWriter(fileName));
    }

    void writeLineToFile(List<Object> data) {
        String line = data.stream().map(Object::toString).collect(Collectors.joining(";"));
        writer.println(line);
    }

    void closeWriter() {
        writer.close();
    }
}
