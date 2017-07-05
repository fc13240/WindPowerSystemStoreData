package cn.sky_data.storeData.dao.machine;

import cn.sky_data.storeData.model.MachineInfo;
import cn.sky_data.storeData.model.Offset;

import java.util.List;
import java.util.Optional;

/**
 * Created by chenhaonee on 2017/6/14.
 */
public interface OffsetDao {
    Optional<List<Offset>> findAll();

    void save(Offset o);
}
