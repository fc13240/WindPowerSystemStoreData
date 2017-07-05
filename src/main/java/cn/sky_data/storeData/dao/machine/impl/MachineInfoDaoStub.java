package cn.sky_data.storeData.dao.machine.impl;

import cn.sky_data.storeData.dao.machine.MachineInfoDao;
import cn.sky_data.storeData.model.MachineInfo;

import java.util.Optional;

/**
 * Created by chenhaonee on 2017/5/18.
 */
public class MachineInfoDaoStub implements MachineInfoDao {

    @Override
    public Optional<MachineInfo> find(String ip) {
        switch (ip) {
            case "10.0.2.101":
                return Optional.ofNullable(new MachineInfo((short) 1, (short) 1)) ;
        }
        return null;
    }
}
