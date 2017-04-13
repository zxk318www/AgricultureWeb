package com.thinkgem.jeesite.modules.sys.dao;



import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.agriculture.entity.User;
import com.thinkgem.jeesite.modules.agriculture.entity.UserVo;

import java.util.List;


/**
 * Mapper
 * 
 * @author Silver Howe
 * @version 1.0, 2017/2/10 15:59:51
 */
@MyBatisDao
public interface UserMapper {

    User findOne(String id);

    User findDeleteUserVoone(String id);

    User findByName(String name);

    List<User> find(Object param);

    List<UserVo> findUserVo(UserVo userVo);

    List<UserVo> findDeleteUserVo(UserVo userVo);

    void deleteOne(String id);

    void delete(User param);

    void insert(User param);

    void update(User param);

    void updateWithAllFields(User param);

}
