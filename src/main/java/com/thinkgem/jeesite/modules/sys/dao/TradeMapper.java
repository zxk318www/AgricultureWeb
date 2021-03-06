package com.thinkgem.jeesite.modules.sys.dao;



import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.agriculture.entity.Trade;

import java.util.List;


/**
 * Mapper
 * 
 * @author Silver Howe
 * @version 1.0, 2017/2/10 15:59:51
 */
@MyBatisDao
public interface TradeMapper {

    Trade findOne(String id);

    List<Trade> find(Object param);

    void deleteOne(String id);

    void delete(Trade param);

    void insert(Trade param);

    void update(Trade param);

    void updateWithAllFields(Trade param);

}
