package com.thinkgem.jeesite.modules.sys.service;

import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.agriculture.entity.Classes;
import com.thinkgem.jeesite.modules.sys.dao.ClassesMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by Zhangsnke on 2017/4/5.
 */
@Service
@Transactional(readOnly = true)
public class ClassesService {
    @Autowired
    ClassesMapper classesMapper;

    /**
     * 查找专家课堂
     * @return
     */
    public List<Classes> findAll(){
        List<Classes> list = classesMapper.find(null);
        if (list!=null && list.size()>0){
            return list;
        }
        return null;
    }

    /**
     * 根据id查找classes
     * @param id
     * @return
     */
    public Classes findById(String id){
        if (StringUtils.isNoneBlank(id)){
            Classes classes = classesMapper.findOne(id);
            if (classes!=null){
                return classes;
            }
        }
        return null;
    }

    /**
     * 获取video视频路径
     * @param content
     * @return
     */
    public String getVideo(String content){
        if (StringUtils.isNoneBlank(content)){
            String str = content.substring(content.indexOf("src")+5,content.indexOf(".mp4")+4);
            return str;
        }
        return null;
    }

    /**
     * 获取视频内容
     * @param content
     * @return
     */
    public String getContent(String content){
        if (StringUtils.isNoneBlank(content)){
            String str = content.substring(content.indexOf(">")+1);
            return str;
        }
        return null;
    }

    /**
     * 补全Classes
     * @param classes
     * @return
     */
    public Classes getClasses(Classes classes){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMddHHms");
        Date date = new Date();
        String dateStr = sdf.format(date);
        String datestr2 = sdf1.format(date);
        int num = (int) (Math.random()*10000);
        String str = String.valueOf(num);
        int sub = (int) (Math.random()*8);
        str = datestr2+str;
        str = str.substring(sub);
        String str1 = "v00"+str;
        try {
            date = sdf.parse(dateStr);
            classes.setPostdate(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        classes.setId(str1);
        classes.setDelFlag(0);
        return classes;
    }

    /**
     * 保存Classes
     * @param classes
     * @return
     */
    @Transactional(readOnly = false)
    public boolean saveClasses(Classes classes){
        if (classes!=null){
            Classes classes1 = classesMapper.findOne(classes.getId());
            if (classes1==null){
                classesMapper.insert(classes);
                Classes classes2 = classesMapper.findOne(classes.getId());
                if (classes2!=null){
                    return true;
                }
            }
        }
        return false;
    }
}
