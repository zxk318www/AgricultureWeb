package com.thinkgem.jeesite.modules.sys.dao;



import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.agriculture.entity.Switchimg;

import java.util.List;


/**
 * Mapper
 * 
 * @author Silver Howe
 * @version 1.0, 2017/4/22 22:35:39
 */
@MyBatisDao
public interface SwitchimgMapper {

    Switchimg findOne(String id);

    List<Switchimg> find(Object param);

    void deleteOne(String id);

    void delete(Switchimg param);

    void insert(Switchimg param);

    void update(Switchimg param);

    void updateWithAllFields(Switchimg param);

}
