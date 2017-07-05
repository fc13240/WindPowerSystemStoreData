package cn.sky_data.storeData.bl.configs;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.commons.io.IOUtils;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.IOException;
import java.io.Serializable;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArrayList;

/**
 * Created by chenhaonee on 2017/5/31.
 */
public class DataConfigFactory implements Serializable {
    private static Map<String, PLCFileConfig> plcFileConfigs = new HashMap<>();
    private static Map<String, RealTimeDataConfigBox> realTimeDataConfigs = new HashMap<>();

    private static DataConfigFactory dataConfigFactory = new DataConfigFactory();

    private DataConfigFactory() {
        loadConfig();
    }

    public static PLCFileConfig getConfig(String name) {
        return plcFileConfigs.getOrDefault(name, null);
    }

    public static RealTimeDataConfigBox getDefaultRealTimeDataConfigs() {
        return realTimeDataConfigs.get("WT2000D110");
    }

    private static void loadConfig() {
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            String content = IOUtils.toString(DataConfigFactory.class.getClassLoader().getResourceAsStream("fileDecode.json"), Charset.forName("UTF-8"));
            JSONObject json = new JSONObject(content);
            JSONArray plc = json.getJSONArray("plc");
            plc.forEach(o -> {
                try {
                    PLCFileConfig config = objectMapper.readValue(o.toString(), PLCFileConfig.class);
                    plcFileConfigs.put(config.getName(), config);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            });
            JSONArray realTime = json.getJSONArray("realTime");
            realTime.forEach(o -> {
                try {
                    RealTimeDataConfigBox config = objectMapper.readValue(o.toString(), RealTimeDataConfigBox.class);
                    realTimeDataConfigs.put(config.getName(), config);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            });
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
