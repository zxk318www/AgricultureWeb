package com.thinkgem.jeesite.modules.sys.dao;

import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.agriculture.entity.Shoppingcart;

import java.util.List;


/**
 * Mapper
 * 
 * @author Silver Howe
 * @version 1.0, 2017/2/10 15:59:51
 */
@MyBatisDao
public interface ShoppingcartMapper {

    Shoppingcart findOne(String id);

    List<Shoppingcart> findByuid(String uid);

    int findMaxById();

    List<Shoppingcart> find(Object param);

    void deleteOne(String id);

    void delete(Shoppingcart param);

    void insert(Shoppingcart param);

    void update(Shoppingcart param);

    void updateWithAllFields(Shoppingcart param);

}
