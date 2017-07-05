package cn.sky_data.storeData.model;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Timestamp;
import java.util.Date;

/**
 * Created by chenhaonee on 2017/4/15.
 */
public class PLCFile implements Serializable {
    private short fileId;
    private String fileName;
    private String fileType;
    private short farmId;
    private short machineId;
    private Blob fileStore;
    private Timestamp firstRecordTimestamp;
    private Timestamp lastRecordTimestamp;

    public PLCFile() {

    }

    public PLCFile(String fileType) {
        this.fileType = fileType;
    }

    public short getFileId() {
        return fileId;
    }

    public void setFileId(short fileId) {
        this.fileId = fileId;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFileType() {
        return fileType;
    }

    public void setFileType(String fileType) {
        this.fileType = fileType;
    }

    public short getFarmId() {
        return farmId;
    }

    public void setFarmId(short farmId) {
        this.farmId = farmId;
    }

    public short getMachineId() {
        return machineId;
    }

    public void setMachineId(short machineId) {
        this.machineId = machineId;
    }

    public Blob getFileStore() {
        return fileStore;
    }

    public void setFileStore(Blob fileStore) {
        this.fileStore = fileStore;
    }

    public Timestamp getFirstRecordTimestamp() {
        return firstRecordTimestamp;
    }

    public void setFirstRecordTimestamp(Timestamp firstRecordTimestamp) {
        this.firstRecordTimestamp = firstRecordTimestamp;
    }

    public Timestamp getLastRecordTimestamp() {
        return lastRecordTimestamp;
    }

    public void setLastRecordTimestamp(Timestamp lastRecordTimestamp) {
        this.lastRecordTimestamp = lastRecordTimestamp;
    }
}
