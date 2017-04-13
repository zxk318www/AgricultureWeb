package com.thinkgem.jeesite.modules.sys.dao;


import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.agriculture.entity.Notice;
import com.thinkgem.jeesite.modules.agriculture.entity.NoticeVo;

import java.util.List;


/**
 * Mapper
 * 
 * @author Silver Howe
 * @version 1.0, 2017/3/17 9:51:35
 */
@MyBatisDao
public interface NoticeMapper {

    NoticeVo findOne(String id);

    List<Notice> findByuid(String uid);

    Notice findNotice(String id);

    List<NoticeVo> find(Object param);

    void deleteOne(String id);

    void delete(Notice param);

    void insert(Notice param);

    void update(Notice param);

    void updateWithAllFields(Notice param);

}
