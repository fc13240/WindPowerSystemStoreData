package cn.sky_data.storeData.exception;

/**
 * Created by chenhaonee on 2017/6/14.
 */
public class NoOffsetFoundException extends RuntimeException {
    public NoOffsetFoundException(String message) {
        super(message);
    }

    public NoOffsetFoundException() {
        super("获取kafka的offset失败。系统无法启动。请检查数据库状态");
    }
}
