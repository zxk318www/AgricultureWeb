package com.thinkgem.jeesite.modules.sys.dao;


import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.agriculture.entity.Evaluate;

import java.util.List;


/**
 * Mapper
 * 
 * @author Silver Howe
 * @version 1.0, 2017/3/10 10:21:07
 */
@MyBatisDao
public interface EvaluateMapper {

    Evaluate findOne(String id);

    List<Evaluate> findByUid(String uid);

    List<Evaluate> find(Object param);

    void deleteOne(String id);

    void delete(Evaluate param);

    void insert(Evaluate param);

    void update(Evaluate param);

    void updateWithAllFields(Evaluate param);

}
