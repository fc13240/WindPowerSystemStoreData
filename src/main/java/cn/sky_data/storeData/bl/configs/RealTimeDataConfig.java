package cn.sky_data.storeData.bl.configs;

/**
 * Created by chenhaonee on 2017/5/31.
 */
public class RealTimeDataConfig {
    private String name;
    private String dataType;
    private short dataLength;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDataType() {
        return dataType;
    }

    public void setDataType(String dataType) {
        this.dataType = dataType;
    }

    public short getDataLength() {
        return dataLength;
    }

    public void setDataLength(short dataLength) {
        this.dataLength = dataLength;
    }
}
