package com.thinkgem.jeesite.modules.sys.dao;


import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.agriculture.entity.Order;

import java.util.List;


/**
 * Mapper
 * 
 * @author Silver Howe
 * @version 1.0, 2017/3/14 9:55:19
 */
@MyBatisDao
public interface OrderMapper {

    Order findOne(String id);

    Order findDeleteOne(String id);

    List<Order> findByuid(String uid);

    List<Order> find(Object param);

    List<Order> findComplete();

    List<Order> findDelete(Object param);

    void deleteOne(String id);

    void delete(Order param);

    void insert(Order param);

    void update(Order param);

    void updateWithAllFields(Order param);

}
