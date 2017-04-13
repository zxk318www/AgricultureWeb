package com.thinkgem.jeesite.modules.sys.dao;


import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.agriculture.entity.Admininfo;

import java.util.List;


/**
 * Mapper
 * 
 * @author Silver Howe
 * @version 1.0, 2017/2/10 15:59:51
 */
@MyBatisDao
public interface AdmininfoMapper {

    Admininfo findOne(String id);

    int findMaxById();

    List<Admininfo> find(Object param);

    void deleteOne(String id);

    void delete(Admininfo param);

    void insert(Admininfo param);

    void update(Admininfo param);

    void updateWithAllFields(Admininfo param);

}
