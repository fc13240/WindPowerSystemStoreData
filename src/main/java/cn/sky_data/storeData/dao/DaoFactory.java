package cn.sky_data.storeData.dao;

import cn.sky_data.storeData.dao.machine.MachineInfoDao;
import cn.sky_data.storeData.dao.machine.impl.MachineInfoDaoImpl;
import cn.sky_data.storeData.dao.plc.PLCFileDao;

/**
 * Created by chenhaonee on 2017/5/18.
 */
public class DaoFactory {

    public static MachineInfoDao getMachineInfoDao() {
        return new MachineInfoDaoImpl();
    }

    public static PLCFileDao getPLCDao(){
        return PLCFileDao.getInstance();
    }

    public static  CommonDao getCommonDao(){return new CommonDaoImpl();};

}
