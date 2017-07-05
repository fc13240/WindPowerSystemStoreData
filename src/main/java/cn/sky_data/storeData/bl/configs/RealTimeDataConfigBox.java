package cn.sky_data.storeData.bl.configs;

import java.util.List;

/**
 * 实时数据文件的配置类
 * 包括风机类型，每一条数据的片段数，以及具体的测点配置信息
 * Created by chenhaonee on 2017/6/16.
 */
public class RealTimeDataConfigBox {
    private String name;
    private int pieces;
    private List<RealTimeDataConfig> measurements;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPieces() {
        return pieces;
    }

    public void setPieces(int pieces) {
        this.pieces = pieces;
    }

    public List<RealTimeDataConfig> getMeasurements() {
        return measurements;
    }

    public void setMeasurements(List<RealTimeDataConfig> measurements) {
        this.measurements = measurements;
    }
}
