package com.thinkgem.jeesite.modules.sys.dao;



import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.agriculture.entity.Classes;

import java.util.List;


/**
 * Mapper
 * 
 * @author Silver Howe
 * @version 1.0, 2017/4/5 16:44:23
 */
@MyBatisDao
public interface ClassesMapper {

    Classes findOne(String id);

    List<Classes> find(Object param);

    void deleteOne(String id);

    void delete(Classes param);

    void insert(Classes param);

    void update(Classes param);

    void updateWithAllFields(Classes param);

}
