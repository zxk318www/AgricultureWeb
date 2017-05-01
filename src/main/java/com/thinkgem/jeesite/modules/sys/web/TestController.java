package com.thinkgem.jeesite.modules.sys.web;

import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.agriculture.entity.*;
import com.thinkgem.jeesite.modules.sys.service.GoodsService;
import com.thinkgem.jeesite.modules.sys.service.NoteService;
import com.thinkgem.jeesite.modules.sys.service.SysnoticeService;
import com.thinkgem.jeesite.modules.sys.service.UserService;
import groovy.util.logging.Log4j;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.*;
import java.io.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 注册、登录校验、修改个人信息功能
 * Created by Zhangsnke on 2017/2/20.
 */
@Controller
@RequestMapping(value = "logincheck")
public class TestController extends BaseController {

    private static org.apache.log4j.Logger log = Logger.getLogger(Logger.class);


    @Autowired
    UserService userService;

    @Autowired
    SysnoticeService sysnoticeService;

    @Autowired
    NoteService noteService;

    @Autowired
    GoodsService goodsService;


    /**
     * 跳转到登录界面
     * @param username
     * @param model
     * @return
     */
    @RequestMapping(value = "tologin")
    public String toLogin(String username, Model model){
        model.addAttribute("username",username);
        return "modules/ui/login";

    }


    /**
     * 登录校验(先查找cookie中是否已有记录，若无，则去数据库匹配)
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "login")
    @ResponseBody
    public String Login(HttpServletRequest request, HttpServletResponse response,Model model){
        HttpSession session = request.getSession();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String cookietime = request.getParameter("cookietime");

         //保存和读取cookie,再次登录时进行判断
        Cookie[] cookies = request.getCookies();
        String uname=null;
        String upwd =null;
         for (int i = 0; i < cookies.length; i++) {//对cookies中的数据进行遍历，找到用户名、密码的数据
             if ("username".equals(cookies[i].getName())) {
                     uname = cookies[i].getValue();
                 } else if ("password".equals(cookies[i].getName())) {
                     upwd = cookies[i].getValue();
                }
            }
            if(StringUtils.isNoneBlank(uname)&&StringUtils.isNoneBlank(upwd)) {
                if (uname.equals(username) && upwd.equals(password)) {
                    session.setAttribute("user", uname);
                    User u =userService.findByName(username);
                    if(u!=null){
                         Userinfo userinfo =  userService.findUserinfoByUser(u);
                           if (userinfo!=null){
                               //state = 0 在线
                               userinfo.setState(0);
                               try{
                                   userService.UpdateUserinfo(userinfo);
                                   session.setAttribute("userinfo",userinfo);
                                   session.setAttribute("pwd",u.getPwd());
                                   session.setAttribute("img",u.getImg());
                               }catch (Exception e){
                                   e.printStackTrace();
                               }
                           }

                         Admininfo admininfo = userService.findAdminByUser(u);
                            if(admininfo != null){
                                admininfo.setState(0);
                                try{
                                    userService.UpdateAdminInfo(admininfo);
                                    session.setAttribute("adminifo",admininfo);
                                    session.setAttribute("pwd",u.getPwd());
                                    session.setAttribute("img",u.getImg());
                                    log.error("Error:");
                                }catch (Exception e){
                                    e.printStackTrace();
                                }
                            }
                    }
                     return "02";
             }
        }
        //若在cookie中没找到用户信息，则进行数据库查询判断
        if(StringUtils.isNoneBlank(username)){
        User user = userService.findByName(username);
        if(user != null){
            Userinfo userinfo =userService.findUserInfo(user.getId());
            Admininfo admininfo = userService.findAdminInfo(user.getId());
           if(user.getPwd().equals(password)){
               //选中保存密码
               //开始保存Cookie
               Cookie cid=new Cookie("username",username);
               Cookie cpass=new Cookie("password",password);
                if("true".equals(cookietime)){
                    //保存用户信息
                    session.setAttribute("user",username);
                    session.setAttribute("pwd",password);
                    session.setAttribute("img",user.getImg());
                    //存5分钟(这个值应该大于或等于validTime)
                    cid.setMaxAge(60 * 5);
                    cpass.setMaxAge(60 *  5);
                    //cookie有效路径是网站根目录
                    cpass.setPath("/");
                    //向客户端写入
                    response.addCookie(cid);
                    response.addCookie(cpass);
                }else{
                    session.setAttribute("user",username);
                    session.setAttribute("img",user.getImg());
                    cid.setMaxAge(0);
                    cpass.setMaxAge(0);
                    cpass.setPath("/");
                    response.addCookie(cid);
                    response.addCookie(cpass);
                }
               if(userinfo!=null){
                   //更新在线字段
                   userinfo.setState(0);
                   try{
                       userService.UpdateUserinfo(userinfo);
                       session.setAttribute("userinfo",userinfo);
                       session.setAttribute("pwd",user.getPwd());
                       session.setAttribute("img",user.getImg());
                       return  "02";
                   }catch (Exception e){
                       e.printStackTrace();
                   }
               }
               if(admininfo!=null){
                   admininfo.setState(0);
                   try{
                       userService.UpdateAdminInfo(admininfo);
                       session.setAttribute("adminifo",admininfo);
                       session.setAttribute("pwd",user.getPwd());
                       session.setAttribute("img",user.getImg());
                       return  "02";
                   }catch (Exception e){
                       e.printStackTrace();
                   }
               }

           }else{
               return "01";
           }
        }
        }
        return null;
    }

    /**
     * 登录成功后跳转index界面
     * @param request
     * @param response
     * @param modelMap
     * @return
     */
    @RequestMapping(value = "index")
    public String Index(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap){
        Userinfo userinfo =new Userinfo();
        Admininfo admininfo = new Admininfo();
        //获取当期用户登录名
        String name = (String) request.getSession().getAttribute("user");
        User user = userService.findByName(name);
        HttpSession s = request.getSession();
        if(user!=null){
            userinfo =  userService.findUserinfoByUser(user);
            admininfo = userService.findAdminByUser(user);
            modelMap.addAttribute("uname",user.getUname());
            modelMap.addAttribute("uid",user.getId());
        }
        if (userinfo!=null){
            if(userinfo.getLevel()!=null && userinfo.getLevel()==5){
                //如果是会员用户，显示
                modelMap.addAttribute("level","尊贵的会员用户：");
            }else{
                modelMap.addAttribute("level","");
            }

            modelMap.addAttribute("user",userinfo.getName());
            s.setAttribute("s.name",userinfo.getName());
        }
        if(admininfo!=null){
            modelMap.addAttribute("user",admininfo.getName());
            //往index页面传递管理员标志
            modelMap.addAttribute("Admin","Yes");
            s.setAttribute("s.name",admininfo.getName());

        }
        //统计访问人数
        countPeople();

        List<Note> list = noteService.findLastNotes();
        if (list!=null && list.size()>0){
            modelMap.put("notes",list);
        }
        //显示公告信息
        List<Sysnotice> list1 = sysnoticeService.getLastNum();
        if (list1!=null && list1.size()>0){
            modelMap.put("sysns",list1);
        }
        List<Goods> list2 = goodsService.findLastGoods(null);
        for (Goods goods1 : list2) {
            if (StringUtils.isNoneBlank(goods1.getUinfoid())) {
                Userinfo userinfo2 = userService.findUserInfo(goods1.getUinfoid());
                if (userinfo2 != null) {
                    modelMap.put("goodsuser", userinfo2);
                    Date date = goods1.getPostdate();
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
                    String datestr = sdf.format(date);
                    goods1.setPostDateStr(datestr);
                    goods1 = goodsService.getTypeansState(goods1);
                }
            }
            modelMap.put("goods", list2);
        }
        //图片轮播

        List<Switchimg> list3 = sysnoticeService.getSwitchImgs();
        if (list3!=null && list3.size()>0){
            for (Switchimg switchimg:list3){
                if (StringUtils.isNoneBlank(switchimg.getImg())){
                    String s1 = switchimg.getImg();
                }
            }
            modelMap.put("simgs",list3);


        }

        return "modules/ui/newIndex";
    }

    /**
     * 跳转到注册界面
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "sigin")
    public String Sigin(HttpServletRequest request, HttpServletResponse response){
        return "modules/ui/sigin";
    }

    /**
     * 跳转到管理员注册页面
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "siginAdmin")
    public String SiginAdmin(HttpServletRequest request, HttpServletResponse response){
        return "modules/ui/siginAdmin";
    }


    /**
     * 用户注册
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "checksigin")
    @ResponseBody
    public String CheckSigin(String img ,HttpServletRequest request, HttpServletResponse response, Model model) throws ParseException {
        String jsonStr = request.getParameter("submitData");
        JsonMapper js=new JsonMapper();
        UserVo userVo= js.fromJson(jsonStr,UserVo.class);
        String regid = request.getParameter("regid");
        String sex = request.getParameter("sex");
        if(StringUtils.isNoneBlank(regid)){
            if ("6".equals(regid)){
                //普通用户
                userVo.setLevel(1);
                userVo.setUserlevel(0);
            }else{
                //会员用户
                userVo.setLevel(5);
                userVo.setUserlevel(1);
            }
        }
        if (StringUtils.isNoneBlank(sex)){
            if("1".equals(sex)){
                //性别为男
                userVo.setSex("男");
            }else{
                //性别为女
                userVo.setSex("女");
            }
        }
        if (StringUtils.isNoneBlank(img)){
            img = userService.changeImg(img);
        }
        Date date =new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss ");
        String datestr = sdf.format(date);
        userVo.setUpdatedate(sdf.parse(datestr));
        //根据UserVo获取user和userinfo
        User user = userService.getUser(userVo);
        Userinfo userinfo =userService.getUserinfo(userVo,user);
            user.setImg(img);
            boolean flag = userService.saveUserandUserinfo(userinfo,user);
            if(flag){
                System.out.println("保存User和Userinfo状态"+flag);
                return "01";
            }else{
                return "当前用户已注册！";
            }
    }

    /**
     * 管理员登记
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "checkAdminsigin")
    @ResponseBody
    public String checkAdminSigin(String img,HttpServletRequest request, HttpServletResponse response, Model model) throws ParseException {
        String jsonStr = request.getParameter("submitData");
        JsonMapper js=new JsonMapper();
        AdminVo adminVo = js.fromJson(jsonStr,AdminVo.class);
        adminVo.setUserstate(2);
        Date date =new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss ");
        String datestr = sdf.format(date);
        adminVo.setUpdatedate(sdf.parse(datestr));
        User user = userService.getUserByAdminVo(adminVo);
        Admininfo admininfo = userService.getAdmininfo(adminVo,user);
        if (StringUtils.isNoneBlank(img)){
            img = userService.changeImg(img);
        }
        user.setImg(img);
            boolean flag = userService.saveUserandAdmininfo(admininfo,user);
            if(flag){
                System.out.println("保存User和Admininfo状态"+flag);
                //返回工号
                return user.getId();

            }else{
                return "01";
            }
     }


    /**
     * 判断注册信息是否可用
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "checkname")
    @ResponseBody
    public String checkName(HttpServletRequest request, HttpServletResponse response){
        String str = request.getParameter("data");
        String btn = request.getParameter("btn");
        if(StringUtils.isNoneBlank(str)){
            Object obj = userService.getUserinfoByEle(btn,str);
           if(obj!=null){
              return "该信息已有用户使用！";
           }
        }else{
            return null;
        }
        return null;
    }

    /**
     * 登出
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "logout")
    @ResponseBody
    public String logout(HttpServletRequest request, HttpServletResponse response) throws ParseException {
        Date date = new Date ();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String datestr = sdf.format(date);
        date = sdf.parse(datestr);
        String uid = request.getParameter("uid");
        if(StringUtils.isNoneBlank(uid)){
            User user = userService.findOne(uid);
            if(user != null){
                Userinfo userinfo = userService.findUserinfoByUser(user);
                Admininfo admininfo = userService.findAdminByUser(user);
                if(userinfo!=null){
                    //设置最近登录时间
                    userinfo.setLlogindate(date);
                    //state = 1 下线
                    userinfo.setState(1);
                    try{
                        userService.UpdateUserinfo(userinfo);
                        return  "01";
                    }catch (Exception e){
                        e.printStackTrace();
                        log.error(e);
                    }
                }
                if(admininfo!=null){
                    admininfo.setLlogindate(date);
                    admininfo.setState(1);
                    try{
                        userService.UpdateAdminInfo(admininfo);
                        return  "01";
                    }catch (Exception e){
                        e.printStackTrace();
                    }
                }

            }
        }
        return  "02";
    }

    /**
     * 跳转到 updateUser界面
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "toupdateUser")
    public String toUpdateUser(HttpServletRequest request, HttpServletResponse response){

        return "modules/ui/updateUser";

    }

    /**
     * 管理员跳转到adminIndex页面
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "toAdminIndex")
    public String toAdminIndex(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap){
        HttpSession session = request.getSession();
        Admininfo admininfo = (Admininfo) session.getAttribute("adminifo");
        session.setAttribute("admininfo",admininfo);
        modelMap.put("admininfo",admininfo);
        String img = (String) session.getAttribute("img");
        if (StringUtils.isNoneBlank(img)){
            img = userService.changeMax1px(img);
            //将头像放大1px  20px->50px
            modelMap.put("img1px",img);
        }
        Sysnotice sysnotice = sysnoticeService.getLastSysN();
        if (sysnotice!=null){
            modelMap.put("gonggao",sysnotice);
        }

        List<Sysnotice> list = sysnoticeService.getLastNum();
        if (list.size()>0){
            modelMap.put("gonggaos",list);
        }
        List<Msg> list1 = noteService.findLastMsgs();
        if (list1.size()>0){
            for(Msg msg:list1){
                Note note = noteService.findById(msg.getNoteid());
                if (note!=null){

                    msg.setNoteName(note.getTitle());
                }
            }
            modelMap.put("msg",list1);
        }
        int ordernum = goodsService.getCompleteOrder();
        //成交订单数
        modelMap.put("ordernum",ordernum);
        int notenum = noteService.getNoteNum();
        //帖子数目
        modelMap.put("notenum",notenum);

        int usernum = userService.getonlineUserNume();
        modelMap.put("usernum",usernum);

        int viewnum = countPeople();
        modelMap.put("viewnum",viewnum);
        return "modules/ui/admin-index";
    }

    /**
     * 跳转到userIndex
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "toUserIndex")
    public String toUserIndex(HttpServletRequest request, HttpServletResponse response){
        return "modules/ui/userIndex";
    }

    /**
     * 更新userinfo信息
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "updateUserinfo")
    @ResponseBody
    public String updateUserinfo(String img ,HttpServletRequest request, HttpServletResponse response, Model model){
        String localuser = request.getParameter("localuser");
        String jsonStr = request.getParameter("submitData");
        HttpSession session = request.getSession();
        JsonMapper js=new JsonMapper();
        UserVo userVo= js.fromJson(jsonStr,UserVo.class);
        String sex = request.getParameter("sex");
        if (StringUtils.isNoneBlank(sex)){
            if("1".equals(sex)){
                //性别为男
                userVo.setSex("男");
            }else{
                //性别为女
                userVo.setSex("女");
            }
        }
        if (StringUtils.isNoneBlank(img)){
            img = userService.changeImg(img);
        }
        Date date =new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss ");
        String datestr = sdf.format(date);
        try {
            userVo.setUpdatedate(sdf.parse(datestr));
        } catch (ParseException e) {
            e.printStackTrace();
        }

        //根据UserVo获取user和userinfo
        User user = userService.getUser(userVo);
        Userinfo userinfo =userService.getUserinfo(userVo,user);
        User local = userService.findByName(localuser);
        Userinfo localuserinfo = userService.findUserInfo(local.getId());

        //将数据库原本的id赋值
        if(StringUtils.isNoneBlank(local.getId())){
            user.setId(local.getId());
            userinfo.setUid(local.getId());
        }
        if(localuserinfo.getLevel()!=null){
            userinfo.setLevel(localuserinfo.getLevel());
        }
        if(StringUtils.isNoneBlank(localuserinfo.getId())){
            userinfo.setId(localuserinfo.getId());
        }
        user.setImg(img);
        boolean flag = userService.UpdateUserAndUserinfo(userinfo,user);
        if(flag){
            System.out.println("保存User和Userinfo状态"+flag);
            session.setAttribute("userinfo",userinfo);
            session.setAttribute("pwd",user.getPwd());
            session.setAttribute("user",user.getUname());
            session.setAttribute("img",user.getImg());
            return "01";

        }else{
            return "出现未知错误！请联系管理员";
        }
    }

    /**
     * 跳转到管理员修改密码
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "toupdateAdmin")
    public String toUpdateAdmin(HttpServletRequest request, HttpServletResponse response){
        return "modules/ui/updateAdmin";
    }


    /**
     * 更新Admininfo表
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "updateAdmininfo")
    @ResponseBody
    public String updateAdmin(String img,HttpServletRequest request, HttpServletResponse response, Model model){
        String localuser = request.getParameter("localuser");
        String jsonStr = request.getParameter("submitData");
        HttpSession session = request.getSession();
        JsonMapper js=new JsonMapper();
        AdminVo adminVo = js.fromJson(jsonStr,AdminVo.class);
        adminVo.setUserstate(2);
        Date date =new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss ");
        String datestr = sdf.format(date);
        try {
            adminVo.setUpdatedate(sdf.parse(datestr));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        if (StringUtils.isNoneBlank(img)){
            img = userService.changeImg(img);
        }
        //根据UserVo获取user和userinfo
        User user = userService.getUserByAdminVo(adminVo);
        Admininfo admininfo = userService.getAdmininfo(adminVo,user);
        //通过当前用户，查找数据库对应的实体
        User local = userService.findByName(localuser);
        Admininfo localAdmininfo = userService.findAdminInfo(local.getId());

        //将数据库原本的id赋值
        if(StringUtils.isNoneBlank(local.getId())){
            user.setId(local.getId());
            admininfo.setUid(local.getId());
        }

        if(StringUtils.isNoneBlank(localAdmininfo.getId())){
            admininfo.setId(localAdmininfo.getId());
        }
        user.setImg(img);
        boolean flag = userService.UpdateUserAndAdmininfo(admininfo,user);
        if(flag){
            System.out.println("保存User和Admininfo状态"+flag);
            session.setAttribute("adminifo",admininfo);
            session.setAttribute("pwd",user.getPwd());
            session.setAttribute("user",user.getUname());
            session.setAttribute("img",user.getImg());
            return "01";

        }else{
            return "出现未知错误！请联系管理员";
        }
    }

    /**
     * 找回密码
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "getPwd")
    @ResponseBody
    public String getPwd(HttpServletRequest request, HttpServletResponse response, Model model){
        Userinfo userinfo = new Userinfo();
        Admininfo admininfo = new Admininfo();
        String loginname = request.getParameter("loginname");
        String rank = request.getParameter("rank");
        String content = request.getParameter("content");
        String regid =request.getParameter("regid");
        User user = userService.findByName(loginname);
        if(user!=null){
            if("1".equals(regid)){
                 userinfo = userService.findUserinfoByUser(user);
                if(userinfo!=null){
                    //1:证件号码
                    if("1".equals(rank)){
                        if(userinfo.getIdCard().equals(content)){
                            return user.getPwd();
                        }else{
                            return "00";
                        }
                    }
                    //手机号码
                    if("2".equals(rank)){
                        if(userinfo.getMoblie().equals(content)){
                            return user.getPwd();
                        }else{
                            return "00";
                        }
                    }
                }
            }
            if("2".equals(regid)){
                admininfo = userService.findAdminByUser(user);

                if(admininfo!=null){
                    //管理员工号
                    if("1".equals(rank)){
                        if(admininfo.getUid().equals(content)){
                            return user.getPwd();
                        }else{
                            return "00";
                        }
                    }
                    //管理员联系电话
                    if("2".equals(rank)){
                        if(admininfo.getPhone().equals(content)){
                            return user.getPwd();
                        }else{
                            return "00";
                        }
                    }
                }
            }
        }

        return "00";
    }


    /******************************************以下管理员业务***************************************************************/

    /**
     * 跳转到管理员用户管理模块
     * @param request
     * @param response
     * @param modelMap
     * @return
     */
    @RequestMapping(value = "toadminUserIndex")
    public String toadminUserIndex(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap){
        HttpSession session = request.getSession();
        Admininfo admininfo = (Admininfo) session.getAttribute("admininfo");
        modelMap.put("admininfo",admininfo);
        return "modules/ui/adminUserIndex";
    }


    /**
     * 管理员查找所有的用户信息
     * @param key
     * @param rankType
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "findAllUserPage")
    @ResponseBody
    public MiniPage findAllUserPage(String key,String rankType,HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession();
        UserVo userVo = new UserVo();
        if(StringUtils.isNoneBlank(rankType) &&StringUtils.isNoneBlank(key)){
            if ("1".equals(rankType)){
                key = "%"+key+"%";
                userVo.setId(key);
            }else if("2".equals(rankType)){
                key = "%"+key+"%";
                userVo.setUsername(key);
            }else if("3".equals(rankType)){
                if (key.contains("会员")){
                    userVo.setUserlevel(1);
                }else if (key.contains("普通")){
                    userVo.setUserlevel(0);
                }
            }
        }
        MiniPage ps = new MiniPage(request, response);
        MiniPage miniPage = userService.findUserPage(ps,userVo);
        return miniPage;
    }

    /**
     * 删除user和userinfo
     * @param uid
     * @return
     */
    @RequestMapping(value = "removeUser")
    @ResponseBody
    public String removeUser(String uid){
        if (StringUtils.isNoneBlank(uid)){
            User user = userService.findOne(uid);
            Userinfo userinfo =userService.findUserinfoByUser(user);
            if (user!=null && userinfo!=null){
              boolean flag =  userService.removeUserandUserinfo(user,userinfo);
                if (flag){
                    return "ok";
                }
            }
        }
        return null;
    }


    /**
     * 管理员对用户所进行的的操作，
     * rank = 1,金额（用户余额）充值
     * rank = 2,升级会员（user的state,和userinfo的level为5）
     * rank = 3,发送通知（给用户添加一个系统通知）
     * @param id
     * @param adminid
     * @param rank
     * @param content
     * @param balance
     * @return
     */
    @RequestMapping(value = "updateUserByAdmin")
    @ResponseBody
    public String updateUserByAdmin(String id ,String adminid,String rank,String content,String balance){
        if (StringUtils.isNoneBlank(id) && StringUtils.isNoneBlank(adminid) && StringUtils.isNoneBlank(rank)){
            User user = userService.findOne(id);
            Admininfo admininfo = userService.findAdminInfo(adminid);
            Sysnotice sysnotice = new Sysnotice();
            if (user!=null && admininfo!=null){
                Userinfo userinfo = userService.findUserinfoByUser(user);
                if (userinfo!=null){
                    if ("1".equals(rank)){
                        if (StringUtils.isNoneBlank(balance)){
                            userinfo.setBalance(Double.parseDouble(balance));
                             userService.UpdateUserinfo(userinfo);
                             content = "帮您成功充值"+balance+"元";


                        }
                    }else if ("2".equals(rank)){
                        //会员
                        user.setState(1);
                        userinfo.setLevel(5);
                        userService.UpdateUser(user);
                        userService.UpdateUserinfo(userinfo);
                        content = "帮您升级到了会员用户,重新登录后会员服务生效！";

                    } else if ("4".equals(rank)){
                        user.setState(0);
                        userinfo.setLevel(1);
                        userService.UpdateUser(user);
                        userService.UpdateUserinfo(userinfo);
                        content = "把您降格到了普通用户,重新登录后会员服务失效！";
                    }

                sysnotice = sysnoticeService.getSysnoByAdminCreate(admininfo,content,user);
                if (sysnotice!=null) {
                    boolean flag = sysnoticeService.saveSysnotice(sysnotice);
                    if (flag) {
                        return "ok";
                    }
                }

                }
            }
        }
        return  null;
    }

    /**
     * 管理员查找所有的用户信息
     * @param key
     * @param rankType
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "findDeleteUserPage")
    @ResponseBody
    public MiniPage findDeleteUserPage(String key,String rankType,HttpServletRequest request, HttpServletResponse response){

        UserVo userVo = new UserVo();
        if(StringUtils.isNoneBlank(rankType) &&StringUtils.isNoneBlank(key)){
            if ("1".equals(rankType)){
                key = "%"+key+"%";
                userVo.setId(key);
            }else if("2".equals(rankType)){
                key = "%"+key+"%";
                userVo.setUsername(key);
            }else if("3".equals(rankType)){
                if (key.contains("会员")){
                    userVo.setUserlevel(1);
                }else if (key.contains("普通")){
                    userVo.setUserlevel(0);
                }
            }
        }
        MiniPage ps = new MiniPage(request, response);
        MiniPage miniPage = userService.findDeleteUserPage(ps,userVo);
        return miniPage;
    }

    /**
     * 管理员回收被删除的UserVo(user和userinfo)这条数据
     * @param uid
     * @return
     */
    @RequestMapping(value = "rebackUserVo")
    @ResponseBody
    public String rebackUserVo(String uid){
        if (StringUtils.isNoneBlank(uid)) {
            User user = userService.findDeleteOne(uid);
            Userinfo userinfo = userService.findDeleteUserinfo(uid);
            if(user!=null && userinfo!=null){
                boolean flag = userService.rebackUserVo(user,userinfo);
                if (flag){
                    return "ok";
                }
            }
        }
        return null;
    }

    /**
     * 从回收站删除UserVo(user和userinfo)这条数据
     * @param uid
     * @return
     */
    @RequestMapping(value = "deleteUserVo")
    @ResponseBody
    public String deleteUserVo(String uid){
        if (StringUtils.isNoneBlank(uid)){
            User user = userService.findDeleteOne(uid);
            Userinfo userinfo = userService.findDeleteUserinfo(uid);
            if(user!=null && userinfo!=null){
                boolean flag = userService.RealDeleteU(user,userinfo);
                if (flag){
                    return "ok";
                }
            }
        }
        return null;
    }

    public Integer countPeople(){
        int a = userService.getonlineUserNume();
        int number = 0;
        if (a!=0){
            number = a;
        }
        File file = new File("count.txt");
            if(!file.exists())
            {
                number++;
                try{
                    file.createNewFile();
                    PrintWriter out = new PrintWriter(new BufferedWriter(new OutputStreamWriter(new FileOutputStream("count.txt"),"utf-8")));
                    out.write(number);
                    out.flush();
                    out.close();
                    return number;
                }catch(IOException ex){}
            }
            else
                try{
                    BufferedReader br=new BufferedReader(new InputStreamReader(new FileInputStream("count.txt"),"utf-8"));
                    number = br.read();
                    number++;
                    br.close();
                    PrintWriter out = new PrintWriter(new BufferedWriter(new OutputStreamWriter(new FileOutputStream("count.txt"),"utf-8")));
                    out.write(number);
                    out.flush();
                    out.close();
                    return number;
                }catch(IOException ex){}
         return null;
    }

}
