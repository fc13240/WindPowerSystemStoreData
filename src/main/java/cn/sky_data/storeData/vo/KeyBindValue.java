package cn.sky_data.storeData.vo;

import org.json.JSONObject;

/**
 * Created by chenhaonee on 2017/5/19.
 */
public class KeyBindValue {
    private String key;
    private byte[] value;

    public KeyBindValue(String key, byte[] value) {

        this.key = key;
        this.value = value;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public byte[] getValue() {
        return value;
    }

    public void setValue(byte[] value) {
        this.value = value;
    }

    public static String getValueInJSON(String key,byte[] value){
        JSONObject data = new JSONObject();
        data.put("key",key);
        data.put("value",value);
        return data.toString();
    }
}
