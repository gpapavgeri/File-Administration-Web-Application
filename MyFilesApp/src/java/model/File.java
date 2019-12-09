/**
 * @author Georgia Papavgeri
 */
package model;

import java.sql.Blob;

public class File {
    private int fileId;
    private String fileName;
    private Blob fileAsBlob;

    public File() {
    }

    public int getFileId() {
        return fileId;
    }

    public void setFileId(int fileId) {
        this.fileId = fileId;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public Blob getFileAsBlob() {
        return fileAsBlob;
    }

    public void setFileAsBlob(Blob fileAsBlob) {
        this.fileAsBlob = fileAsBlob;
    }
    
}
