package com.thinkgem.jeesite.modules.sys.web;

import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.agriculture.entity.*;
import com.thinkgem.jeesite.modules.sys.service.NoteService;
import com.thinkgem.jeesite.modules.sys.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by Zhangsnke on 2017/3/1.
 */
@Controller
@RequestMapping(value = "Tiezicheck")
public class TieZiController  extends BaseController {

    @Autowired
    NoteService noteService;

    @Autowired
    UserService userService;
    /**
     * 跳转到帖子主页
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "toTieziIndex")
    public String toTieziIndex(String op,HttpServletRequest request, HttpServletResponse response,ModelMap modelMap){
        HttpSession session = request.getSession();
        Admininfo admininfo = (Admininfo) session.getAttribute("admininfo");
        if (StringUtils.isNoneBlank(op)){
            if ("1".equals(op)){
                modelMap.put("admininfo",admininfo);
                session.removeAttribute("userinfo");
            }
        }
        return "modules/ui/TieZiIndex";
    }

    /**
     * 返回所有帖子（但是不显示整改和驳回的）
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "findTieZi")
    @ResponseBody
    public MiniPage findTieZi(String op,String key,String rankType,HttpServletRequest request, HttpServletResponse response){
        //增加模糊查询
        if(StringUtils.isNoneBlank(key)){
            key = "%"+key+"%";
        }else {
            key = null;
        }
        Note note = new Note();
        if(StringUtils.isNoneBlank(rankType)){
            if("1".equals(rankType)){
                note.setType(key);
            }
            if("2".equals(rankType)){
                note.setTitle(key);
            }
            if("3".equals(rankType)){
                note.setContent(key);
            }
            if("4".equals(rankType)){
                note.setUid(key);
            }
        }
        MiniPage ps = new MiniPage(request, response);
        int a =2;
        if (StringUtils.isNoneBlank(op)){
            //管理员
            if ("1".equals(op)){
                a=1;
            }
        }
        MiniPage miniPage = noteService.findAll(ps,note,a);
        return miniPage;
    }

    /**
     * 获取选中的帖子信息
     * @param id
     * @param modelMap
     * @return
     * @throws ParseException
     */
    @RequestMapping(value = "gettiezi")
    public String getTieZi(String pageIndex,String pageSize,String id,String op, ModelMap modelMap,HttpServletRequest request, HttpServletResponse response) throws ParseException {
        HttpSession session = request.getSession();
        Admininfo admininfo = (Admininfo) session.getAttribute("admininfo");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        if(StringUtils.isNoneBlank(id)){
            Note note = noteService.findById(id);
            if(note!=null){
                //获取点击量
                int num = note.getNum();
                num+=1;
                note.setNum(num);
                noteService.updateNote(note);
                modelMap.put("id",id);

                //获得帖子浏览数
                if(note.getNum()!=null){
                    modelMap.put("num",note.getNum());
                }
                if(StringUtils.isNoneBlank(note.getId())){
                    modelMap.put("noteid",note.getId());
                }
                //获得帖子标题
                if(StringUtils.isNoneBlank(note.getTitle())){
                    modelMap.put("title",note.getTitle());
                }
                //获得帖子正文
                if(StringUtils.isNoneBlank(note.getContent())){
                    modelMap.put("content",note.getContent());
                }
                //获得帖子类型
                if(StringUtils.isNoneBlank(note.getType())){
                    modelMap.put("type",note.getType());
                }

                //获得帖子发帖人
                if(StringUtils.isNoneBlank(note.getUid())){
                    User user = userService.findOne(note.getUid());
                    if(StringUtils.isNoneBlank(user.getUname())){
                        modelMap.put("uname",user.getUname());
                        modelMap.put("uid",user.getId());
                    }
                }
                if(StringUtils.isNoneBlank(pageIndex)){
                    modelMap.put("pageIndex", Integer.parseInt(pageIndex));
                }
                if(StringUtils.isNoneBlank(pageSize)){
                    modelMap.put("pageSize",Integer.parseInt(pageSize));
                }
                //获得回复帖子
                if(StringUtils.isNoneBlank(note.getId())){
                    Msg msg = new Msg();
                    msg.setNoteid(note.getId());
                    MiniPage ps = new MiniPage(request, response);
                    MiniPage miniPage =noteService.findAllMsgByPage(ps,msg,modelMap);
                    List<Msg> list = miniPage.getData();
                        for(Msg msg1 :list){
                            String datestr=sdf.format(msg1.getCreateDate());
                            msg1.setCreateDateStr(datestr);
                            User user =userService.findOne(msg1.getUid());
                            if(user!=null){
                                if(StringUtils.isNoneBlank(user.getUname())){
                                    msg1.setUname(user.getUname());
                                    if (StringUtils.isNoneBlank(user.getImg())){
                                        String img = user.getImg();
                                        img = noteService.changeBig(img);
                                        msg1.setMsgphoto(img);
                                    }

                                }
                                //会员显示
                                if (user.getState()==1){
                                    msg1.setHy("1");
                                }else{
                                    msg1.setHy("0");
                                }
                            }
                            //加载图片修改
                            if(StringUtils.isNoneBlank(msg1.getMsg())){
                               msg1 = noteService.changeMsg(msg1);

                            }
                            if(msg1.getLou()!=null){
                                String str = String.valueOf(msg1.getLou());
                                msg1.setLoustr("#"+str);
                            }

                        }
                    //存放回复消息list
                    modelMap.put("msglist",list);
                }
                //获得发帖时间
                if(note.getPostdate()!=null){
                    String date = sdf.format(note.getPostdate());
                    modelMap.put("postdate",date);
                }
            }
        }
        if (StringUtils.isNoneBlank(op)){
            if ("1".equals(op)){
                if (admininfo!=null){
                    modelMap.put("admininfo",admininfo);
                }
            }
        }
        return "modules/ui/tiezishow";
    }

    /**
     * 保存msg表
     * @param msg
     * @param noteid
     * @param uid
     * @return
     * @throws ParseException
     */
    @RequestMapping(value = "saveMsg")
    @ResponseBody
    public String saveMsg(String msg,String noteid,String uid,ModelMap modelMap) throws ParseException{
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String datestr = sdf.format(date);
        date = sdf.parse(datestr);
        Msg msg1 = new Msg();
        msg1.setCreateDate(date);
        msg1.setCreateDateStr(datestr);
        if(StringUtils.isNoneBlank(msg)){
            msg1.setMsg(msg);
        }
        if(StringUtils.isNoneBlank(noteid)){
            msg1.setNoteid(noteid);
        }
        if(StringUtils.isNoneBlank(uid)){
            msg1.setUid(uid);
        }
        msg1.setDelFlag(0);
        msg1 = noteService.getMsg(msg1);
        if(StringUtils.isNoneBlank(msg1.getMsg())){
            msg1 = noteService.changeMsg(msg1);
        }
        refresh(noteid,modelMap);
        msg1 = noteService.getLou(msg1);
        if(msg1!=null){
            boolean flag = noteService.saveMsg(msg1);
            if(flag){
                refresh(noteid,modelMap);
                return "ok";
            }
        }
        return null;
    }

    /**
     * 删除回复信息Msg
     * @param id
     * @return
     */
    @RequestMapping(value = "removUserMsg")
    @ResponseBody
    public String removUserMsg(String id){
        if (StringUtils.isNoneBlank(id)){
            Msg msg = noteService.findMsgByid(id);
            if(msg!=null){
                boolean flag = noteService.removeMsg(msg);
                if (flag){
                    return "ok";
                }
            }
        }
        return null;
    }



    /**
     * 刷新帖子页面
     * @param noteid
     * @param modelMap
     */
    @RequestMapping(value = "refresh")
    @ResponseBody
    public void refresh(String noteid,ModelMap modelMap){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Msg msg = new Msg();
        if(StringUtils.isNoneBlank(noteid)){
            msg.setNoteid(noteid);
        }
        List<Msg> list = noteService.findMsgAll();
        if(list!=null){
            for(Msg msg2 :list){
                User user =userService.findOne(msg2.getUid());
                if(user!=null){
                    if(StringUtils.isNoneBlank(user.getUname())){
                        msg2.setUname(user.getUname());
                        String str=sdf.format(msg2.getCreateDate());
                        msg2.setCreateDateStr(str);
                    }
                }
            }
            //存放回复消息list
            modelMap.put("msglist",list);
        }
    }

    /**
     *
     * 新增帖子
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "toAddTiezi")
    public String toAddTiezi(HttpServletRequest request, HttpServletResponse response){
        return "modules/ui/addTiezi";
    }


    /**
     * 保存note（发帖保存）
     * @param content
     * @param title
     * @param uid
     * @param type
     * @return
     */
    @RequestMapping(value = "saveNote")
    @ResponseBody
    public String saveNote(String content,String title,String uid,String type,String operate){
        Note note = new Note();

        if(StringUtils.isNoneBlank(content)){
           note = noteService.changNote(note,content);
        }
        if(StringUtils.isNoneBlank(title)){
            note.setTitle(title);
        }
        if(StringUtils.isNoneBlank(uid)){
            note.setUid(uid);
        }
        if(StringUtils.isNoneBlank(type)){
            note.setType(type);
        }

        try {
            note = noteService.getNote(title,note,operate);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        System.out.println(note.toString());
        boolean flag = noteService.saveNote(note);
        if(flag){
            return "ok";
        }
        return null;
    }

    /**
     * 跳转到个人帖子主页
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "toUserNoteIndex")
    public String toUserNoteIndex(HttpServletRequest request, HttpServletResponse response){
        return "modules/ui/UserNoteIndex";
    }

    /**
     * 返回帖子
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "findUserNote")
    @ResponseBody
    public MiniPage findUserNote(String userinfoid,String key,String rankType,HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession();
        Note note = new Note();
        Userinfo u  = (Userinfo) session.getAttribute("userinfo");
        if(StringUtils.isNoneBlank(u.getUid())){
            note.setUid(u.getUid());
        }
        System.out.println(userinfoid);
        //增加模糊查询
        if(StringUtils.isNoneBlank(key)){
            key = "%"+key+"%";
        }else {
            key = null;
        }

        if(StringUtils.isNoneBlank(rankType)){
            if("2".equals(rankType)){
                note.setTitle(key);
            }
            if("1".equals(rankType)){
                note.setType(key);
            }
            if("3".equals(rankType)){
                note.setContent(key);
            }
            if("4".equals(rankType)){
                note.setUid(key);
            }
        }
        MiniPage ps = new MiniPage(request, response);
        MiniPage miniPage = noteService.findAll(ps,note,1);
        return miniPage;
    }

    /**
     * 编辑更新帖子
     * @param id
     * @param request
     * @param response
     * @param modelMap
     * @return
     */
    @RequestMapping(value = "toUpdateNote")
    public String toUpdateNote(String id,HttpServletRequest request, HttpServletResponse response,ModelMap modelMap){

        if(StringUtils.isNoneBlank(id)){
            Note note = noteService.findById(id);
            if(note!=null){
                //获得帖子标题
                if(StringUtils.isNoneBlank(note.getTitle())){
                    modelMap.put("title",note.getTitle());
                }
                //获得帖子正文
                if(StringUtils.isNoneBlank(note.getContent())){
                    modelMap.put("content",note.getContent());
                }
                //获得帖子类型
                int type = 0;
                if(StringUtils.isNoneBlank(note.getType())){
                    if("种植经验贴".equals(note.getType())){
                        type = 1;
                    }else if("交流贴".equals(note.getType())){
                        type = 2;
                    }else if("通知贴".equals(note.getType())){
                        type = 3;
                    }else if ("需求采购贴".equals(note.getType())){
                        type = 4;
                    }
                    modelMap.put("type",type);
                }
            }
        }
       return  "modules/ui/updateNote";
    }

    /**
     * 个人帖子中心根据id删除note
     * @param id
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "removeNote")
    @ResponseBody
    public String removeNote(String id,HttpServletRequest request, HttpServletResponse response){
        if(StringUtils.isNoneBlank(id)){
           boolean flag =  noteService.removeNote(id);
            if(flag){
                return "ok";
            }
        }
        return null;
    }


    /**
     * 返回帖子
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "findUserMsg")
    @ResponseBody
    public MiniPage findUserMsg(String userinfoid,String key,String rankType,HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession();
        Msg msg = new Msg();
        Userinfo u  = (Userinfo) session.getAttribute("userinfo");
        if(StringUtils.isNoneBlank(u.getUid())){
            msg.setUid(u.getUid());
        }
        System.out.println(userinfoid);
        //增加模糊查询
        if(StringUtils.isNoneBlank(key)){
            key = "%"+key+"%";
        }else {
            key = null;
        }
        if(StringUtils.isNoneBlank(rankType)){
           if("2".equals(rankType)){
                msg.setMsg(key);
            }
        }
        MiniPage ps = new MiniPage(request, response);
        MiniPage miniPage = noteService.findAllMsg(ps,msg);
        return miniPage;
    }



    /*********************************************以下为管理员操作**********************************************************/

    /**
     * 根据管理员对帖子的操作，进行相应的变更，插入一条系统通知
     * @param id
     * @param adminid
     * @param rank
     * @param operate
     * @param yy
     * @return
     */
    @RequestMapping(value = "updateNoteandSysn")
    @ResponseBody
    public String updateNoteandSaveSysn(String id,String adminid,String rank,String operate,String yy){
        if (StringUtils.isNoneBlank(adminid)) {
            Admininfo admininfo = userService.findAdminInfo(adminid);
            if (StringUtils.isNoneBlank(id) && StringUtils.isNoneBlank(rank)) {
                Note note = noteService.findById(id);
                if (note!=null){
                    if (StringUtils.isNoneBlank(operate)&&StringUtils.isNoneBlank(yy)){
                        boolean flag = noteService.updateNoteandSaveSn(admininfo,note,rank,operate,yy);
                        if (flag){
                            return "ok";
                        }
                    }
                }
            }
        }
        return null;
    }


    /**
     * 返回所有被删除的帖子
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "findDeleteTieZi")
    @ResponseBody
    public MiniPage findDeleteTieZi(String op,String key,String rankType,HttpServletRequest request, HttpServletResponse response){
        //增加模糊查询
        if(StringUtils.isNoneBlank(key)){
            key = "%"+key+"%";
        }else {
            key = null;
        }
        Note note = new Note();
        if(StringUtils.isNoneBlank(rankType)){
            if("1".equals(rankType)){
                note.setType(key);
            }
            if("2".equals(rankType)){
                note.setTitle(key);
            }
            if("3".equals(rankType)){
                note.setContent(key);
            }
            if("4".equals(rankType)){
                note.setUid(key);
            }
        }
        MiniPage ps = new MiniPage(request, response);

        MiniPage miniPage = noteService.findDeleteAll(ps,note);
        return miniPage;
    }


    /**
     * 回收被删除的Note
     * @param id
     * @return
     */
    @RequestMapping(value = "rebackTiezi")
    @ResponseBody
    public String rebackTiezi(String id){
        if (StringUtils.isNoneBlank(id)){
            Note note = noteService.findDeleteOne(id);
            if (note!=null){
                note.setDel_flag(0);
                boolean flag = noteService.rebackNote(note);
                if (flag){
                    return "ok";
                }
            }
        }
        return null;
    }


    /**
     * 从数据库删除Note
     * @param id
     * @return
     */
    @RequestMapping(value = "realDeleteTiezi")
    @ResponseBody
    public String RealDeleteTiezi(String id){
        if (StringUtils.isNoneBlank(id)){
            Note note = noteService.findDeleteOne(id);
            if (note!=null){
                boolean flag = noteService.RealDeleteNote(note);
                if (flag){
                    return "ok";
                }
            }
        }
        return  null;
    }

    /**
     * 删除Msg
     * @param id
     * @return
     */
    @RequestMapping(value = "removeMsg")
    @ResponseBody
    public String removeMsg(String id){
        if (StringUtils.isNoneBlank(id)){
            Msg msg = noteService.findMsgByid(id);
            if (msg!=null){
                boolean flag = noteService.removeMsg(msg);
                if (flag){
                    return "ok";

                }
            }
        }
        return null;
    }

    /**
     * 显示最新评论的帖子信息
     * @param id
     * @return
     */
    @RequestMapping(value = "toShowMsg")
    @ResponseBody
    public String toShowMsg(String id){
        if (StringUtils.isNoneBlank(id)){
            Msg msg = noteService.findMsgByid(id);
            if (msg!=null && StringUtils.isNoneBlank(msg.getNoteid())){
                Note note = noteService.findById(msg.getNoteid());
                if (note!=null){
                    return note.getId();
                }
            }
        }
        return  null;
    }

}
