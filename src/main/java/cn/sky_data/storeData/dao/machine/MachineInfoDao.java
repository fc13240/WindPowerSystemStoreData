package cn.sky_data.storeData.dao.machine;

import cn.sky_data.storeData.model.MachineInfo;

import java.util.Optional;

/**
 * Created by chenhaonee on 2017/5/18.
 */
public interface MachineInfoDao {
    Optional<MachineInfo> find(String ip);
}
