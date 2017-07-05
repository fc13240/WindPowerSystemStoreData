package cn.sky_data.storeData.model;

/**
 * Created by chenhaonee on 2017/5/6.
 */
public class MachineInfo {
    public short machineId;
    public short farmId;

    public MachineInfo(short machineId, short farmId) {
        this.machineId = machineId;
        this.farmId = farmId;
    }
}
