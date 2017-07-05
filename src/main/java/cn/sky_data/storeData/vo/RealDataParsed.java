package cn.sky_data.storeData.vo;

import java.util.Map;

/**
 * Created by chenhaonee on 2017/6/16.
 */
public class RealDataParsed {
    private long timestamp;
    private Map<String,String> value;

    public RealDataParsed() {
    }

    public RealDataParsed(long timestamp, Map<String, String> value) {

        this.timestamp = timestamp;
        this.value = value;
    }

    public long getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(long timestamp) {
        this.timestamp = timestamp;
    }

    public Map<String, String> getValue() {
        return value;
    }

    public void setValue(Map<String, String> value) {
        this.value = value;
    }
}
