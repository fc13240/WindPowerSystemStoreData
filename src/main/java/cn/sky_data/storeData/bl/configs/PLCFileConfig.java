package cn.sky_data.storeData.bl.configs;

import java.io.Serializable;

/**
 * Created by chenhaonee on 2017/5/31.
 */
public class PLCFileConfig implements Serializable{
    private String name;
    private boolean hasHead;
    private int headSize;
    private int bodyUnitSize;

    private int timestampStartIndex;
    private int timestampSize;

    public PLCFileConfig() {
    }

    PLCFileConfig(String name, boolean hasHead, int headSize, int bodyUnitSize, int timestampStartIndex, int timestampSize) {
        this.name = name;
        this.hasHead = hasHead;
        this.headSize = headSize;
        this.bodyUnitSize = bodyUnitSize;
        this.timestampStartIndex = timestampStartIndex;
        this.timestampSize = timestampSize;
    }

    public String getName() {

        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isHasHead() {
        return hasHead;
    }

    public void setHasHead(boolean hasHead) {
        this.hasHead = hasHead;
    }

    public int getHeadSize() {
        return headSize;
    }

    public void setHeadSize(int headSize) {
        this.headSize = headSize;
    }

    public int getBodyUnitSize() {
        return bodyUnitSize;
    }

    public void setBodyUnitSize(int bodyUnitSize) {
        this.bodyUnitSize = bodyUnitSize;
    }

    public int getTimestampStartIndex() {
        return timestampStartIndex;
    }

    public void setTimestampStartIndex(int timestampStartIndex) {
        this.timestampStartIndex = timestampStartIndex;
    }

    public int getTimestampSize() {
        return timestampSize;
    }

    public void setTimestampSize(int timestampSize) {
        this.timestampSize = timestampSize;
    }
}
