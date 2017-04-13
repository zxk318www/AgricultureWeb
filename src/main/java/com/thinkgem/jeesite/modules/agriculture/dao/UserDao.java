package com.thinkgem.jeesite.modules.agriculture.dao;




import com.thinkgem.jeesite.modules.agriculture.entity.User;

import java.util.List;


/**
 * Mapper
 * 
 * @author Silver Howe
 * @version 1.0, 2017/2/10 15:59:51
 */
public interface UserDao {

    User findOne(String id);

    List<User> find(Object param);

    void deleteOne(String id);

    void delete(User param);

    void insert(User param);

    void update(User param);

    void updateWithAllFields(User param);

}
