package cn.sky_data.storeData.dao;
/**
 * Created by chenhaonee on 17-1-22.
 */
import cn.sky_data.storeData.vo.RealDataParsed;
import okhttp3.*;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

public class TSDBUtil implements Serializable {
    private static final Logger logger = LoggerFactory.getLogger(TSDBUtil.class);
    private String hostname;
    private static final MediaType JSON = MediaType.parse("application/json; charset=utf-8");
    private CloseableHttpClient httpClient;
    private static OkHttpClient client;

    public static void initConnection() {
        client = new OkHttpClient.Builder()
                .connectionPool(new ConnectionPool(50, 60, TimeUnit.SECONDS))
                .connectTimeout(20, TimeUnit.SECONDS)
                .readTimeout(20, TimeUnit.SECONDS)
                .build();
    }

    public TSDBUtil(String url) {
        this.hostname = url;
    }

    public boolean save(short machineId, RealDataParsed value) {
        JSONArray params = buildParams(machineId, value);
        boolean result = false;
        for (int i = 0; i < 3; i++) {
            result = doPostInOKHttp(params);
            if (result)
                break;
        }
        if (result) {
            logger.debug("RealTimeData file with machineId " + machineId + " stored successfully");
        } else {
            logger.warn("RealTimeData file with machineId " + machineId + " stored failed");
            logger.warn("file content is " + value);
        }
        return result;
    }

    private JSONArray buildParams(short machineId, RealDataParsed value) {
        List<JSONObject> params = new ArrayList<>();
        value.getValue().forEach((k, v) -> {
            JSONObject mainObject = new JSONObject();
            mainObject.put("timestamp", value.getTimestamp());

            JSONObject tag = new JSONObject();
            tag.put("machineId", machineId);
            mainObject.put("metric", "wind." + k);
            mainObject.put("tags", tag);
            mainObject.put("value", v);
            params.add(mainObject);
        });
        return new JSONArray(params);
    }

    @Deprecated
    private boolean doPostInHttpClient(JSONArray params) {
        String urlInString = hostname + "/api/put?details/";
        StringEntity entity = new StringEntity(params.toString(),
                ContentType.APPLICATION_FORM_URLENCODED);
        if (httpClient == null)
            httpClient = HttpClientBuilder.create().build();
        HttpPost request = new HttpPost(urlInString);
        request.setEntity(entity);

        CloseableHttpResponse response;
        int code = 0;
        try {
            response = httpClient.execute(request);
            logger.warn(response.toString());
            code = response.getStatusLine().getStatusCode();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (httpClient != null)
                    httpClient.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return code >= 200 && code < 300;
    }

    private boolean doPostInOKHttp(JSONArray params) {
        String url = hostname + "/api/put?details/";

        RequestBody requestBody = RequestBody.create(JSON, params.toString());
        Request request = new Request.Builder()
                .url(url)
                .post(requestBody)
                .build();
        Response response = null;
        try {
            response = client.newCall(request).execute();
            return response.isSuccessful();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return response != null ? response.isSuccessful() : false;
    }
}
