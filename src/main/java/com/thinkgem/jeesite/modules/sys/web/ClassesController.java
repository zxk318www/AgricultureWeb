package com.thinkgem.jeesite.modules.sys.web;

/**
 * Created by Zhangsnke on 2017/4/5.
 * 专家课堂Controller
 */

import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.agriculture.entity.Admininfo;
import com.thinkgem.jeesite.modules.agriculture.entity.Classes;
import com.thinkgem.jeesite.modules.agriculture.entity.Userinfo;
import com.thinkgem.jeesite.modules.sys.service.ClassesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value = "classescheck")
public class ClassesController {
    @Autowired
    ClassesService classesService;

    /**
     * 跳转到专家课堂页面
     * @param request
     * @param response
     * @param modelMap
     * @return
     */
    @RequestMapping(value = "toclassesIndex")
    public String toClassesIndex(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap){
        HttpSession session = request.getSession();
        Admininfo admininfo = (Admininfo) session.getAttribute("admininfo");
        Userinfo userinfo  = (Userinfo) session.getAttribute("userinfo");
        if (admininfo!=null){
            modelMap.put("admininfo",admininfo);
        }
        if (userinfo!=null){
            modelMap.put("userinfo",userinfo);
        }
        List<Classes> list = classesService.findAll();
        if (list!=null&&list.size()>0){
            modelMap.put("classeslist",list);
        }
        return "modules/ui/classesIndex";

    }


    /**
     * 根据id查找ClassesVideo
     * @param id
     * @return
     */
    @RequestMapping(value = "findClassesVideo")
    @ResponseBody
    public Classes findClassById(String id){
        if (StringUtils.isNoneBlank(id)){
            Classes classes = classesService.findById(id);
            if (classes!=null){
                return classes;
            }
        }
        return null;
    }

    @RequestMapping(value = "getUpload")
    @ResponseBody
    public String getUpload(String text,String adminid ,String title){
        Classes classes = new Classes();
        if (StringUtils.isNoneBlank(text)){

            String video = classesService.getVideo(text);
            classes.setVideo(video);
            String content = classesService.getContent(text);
            classes.setContent(content);
            if (StringUtils.isNoneBlank(adminid)){
                classes.setPoster(adminid);
            }
            if (StringUtils.isNoneBlank(title)){
                classes.setTitle(title);
            }
            classes = classesService.getClasses(classes);

        }
        boolean flag = classesService.saveClasses(classes);
        if (flag){
            return "ok";
        }
        return null;
    }

}
