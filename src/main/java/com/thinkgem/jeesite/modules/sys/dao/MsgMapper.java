package com.thinkgem.jeesite.modules.sys.dao;



import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.agriculture.entity.Msg;

import java.util.List;


/**
 * Mapper
 * 
 * @author Silver Howe
 * @version 1.0, 2017/3/2 11:33:37
 */
@MyBatisDao
public interface MsgMapper {

    Msg findOne(String id);

    int findMaxById();

    int findMaxLou(String noteid);

    List<Msg> findAllBynoteid(String noteid);

    List<Msg> findAllDeleteByNoteid(String noteid);

    List<Msg> find(Object param);

    List<Msg> findDESC(Object param);

    List<Msg> findByuid(String uid);

    List<Msg> findLast();

    void deleteOne(String id);

    void delete(Msg param);

    void insert(Msg param);

    void update(Msg param);

    void updateWithAllFields(Msg param);

}
