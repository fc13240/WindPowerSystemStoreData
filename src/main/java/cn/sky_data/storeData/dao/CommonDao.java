package cn.sky_data.storeData.dao;

import cn.sky_data.storeData.model.Offset;
import cn.sky_data.storeData.model.PLCFile;
import cn.sky_data.storeData.vo.RealDataParsed;

/**
 * Created by chenhaonee on 2017/6/14.
 */
public interface CommonDao {

    void commit(PLCFile file, Offset offset);

    void commit(TSDBUtil dbUtil, short id, RealDataParsed value, Offset offset);

}
