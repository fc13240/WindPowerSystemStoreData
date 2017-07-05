package cn.sky_data.storeData.model;

import java.io.Serializable;

/**
 * Created by chenhaonee on 2017/6/14.
 */
public class Offset implements Serializable{
    private String topic;
    private int partition;
    private long offset;

    public Offset() {
    }

    public Offset(String topic, int partition, long offset) {

        this.topic = topic;
        this.partition = partition;
        this.offset = offset;
    }

    public String getTopic() {

        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public int getPartition() {
        return partition;
    }

    public void setPartition(int partition) {
        this.partition = partition;
    }

    public long getOffset() {
        return offset;
    }

    public void setOffset(long offset) {
        this.offset = offset;
    }
}
