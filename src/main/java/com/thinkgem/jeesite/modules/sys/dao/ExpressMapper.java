package com.thinkgem.jeesite.modules.sys.dao;



import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.agriculture.entity.Express;

import java.util.List;


/**
 * Mapper
 * 
 * @author Silver Howe
 * @version 1.0, 2017/3/20 14:22:10
 */
@MyBatisDao
public interface ExpressMapper {

    Express findOne(String id);

    Express findByOrder(String orderid);

    List<Express> find(Object param);

    void deleteOne(String id);

    void delete(Express param);

    void insert(Express param);

    void update(Express param);

    void updateWithAllFields(Express param);

}
