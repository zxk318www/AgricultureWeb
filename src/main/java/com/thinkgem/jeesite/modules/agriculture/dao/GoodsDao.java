package com.thinkgem.jeesite.modules.agriculture.dao;



import com.thinkgem.jeesite.modules.agriculture.entity.Goods;

import java.util.List;


/**
 * Mapper
 * 
 * @author Silver Howe
 * @version 1.0, 2017/2/10 15:59:51
 */
public interface GoodsDao {

    Goods findOne(String id);

    List<Goods> find(Object param);

    void deleteOne(String id);

    void delete(Goods param);

    void insert(Goods param);

    void update(Goods param);

    void updateWithAllFields(Goods param);

}
