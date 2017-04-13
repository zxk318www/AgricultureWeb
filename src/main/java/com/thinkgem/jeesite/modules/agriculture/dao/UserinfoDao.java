package com.thinkgem.jeesite.modules.agriculture.dao;



import com.thinkgem.jeesite.modules.agriculture.entity.Userinfo;

import java.util.List;


/**
 * Mapper
 * 
 * @author Silver Howe
 * @version 1.0, 2017/2/10 15:59:51
 */
public interface UserinfoDao{

    Userinfo findOne(String id);

    List<Userinfo> find(Object param);

    void deleteOne(String id);

    void delete(Userinfo param);

    void insert(Userinfo param);

    void update(Userinfo param);

    void updateWithAllFields(Userinfo param);

}
