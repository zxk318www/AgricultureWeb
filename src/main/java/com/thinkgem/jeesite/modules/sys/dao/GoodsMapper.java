package com.thinkgem.jeesite.modules.sys.dao;



import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.agriculture.entity.Goods;

import java.util.List;


/**
 * Mapper
 * 
 * @author Silver Howe
 * @version 1.0, 2017/2/10 15:59:51
 */
@MyBatisDao
public interface GoodsMapper {

    Goods findOne(String id);

    List<Goods> findByuid(String uid);

    Goods findDeleteOne(String id);

    List<Goods> find(Object param);

    List<Goods> findLastGoods(Object param);

    List<Goods> findDelete(Object param);

    List<Goods> findG(Object param);

    Goods findByTitle(String name);

    void deleteOne(String id);

    void delete(Goods param);

    void insert(Goods param);

    void update(Goods param);

    void updateWithAllFields(Goods param);

}
