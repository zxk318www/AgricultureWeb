package com.thinkgem.jeesite.modules.sys.dao;


import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.agriculture.entity.Sysnotice;

import java.util.List;


/**
 * Mapper
 * 
 * @author Silver Howe
 * @version 1.0, 2017/3/20 9:43:14
 */
@MyBatisDao
public interface SysnoticeMapper {

    Sysnotice findOne(String id);

    Sysnotice findByQtid(String qtid);

    List<Sysnotice> find(Object param);

    Sysnotice findLastOne();

    List<Sysnotice> findLastList();

    void deleteOne(String id);

    void delete(Sysnotice param);

    void insert(Sysnotice param);

    void update(Sysnotice param);

    void updateWithAllFields(Sysnotice param);

}
