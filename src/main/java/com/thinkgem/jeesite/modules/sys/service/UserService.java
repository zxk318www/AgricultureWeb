package com.thinkgem.jeesite.modules.sys.service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.agriculture.entity.*;
import com.thinkgem.jeesite.modules.sys.dao.*;
import com.thinkgem.jeesite.modules.sys.web.MiniPage;
import org.activiti.engine.impl.util.json.JSONObject;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.lang.reflect.Field;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Random;


/**
 * Created by Zhangsnke on 2017/2/22.
 */
@Service
@Transactional(readOnly = true)
public class UserService {
    /**用户*/
    @Autowired
    UserMapper userMapper;

    /**用户信息*/
    @Autowired
    UserinfoMapper userinfoMapper;

    @Autowired
    AdmininfoMapper admininfoMapper;

    @Autowired
    EvaluateMapper evaluateMapper;

    @Autowired
    GoodsMapper goodsMapper;

    @Autowired
    MsgMapper msgMapper;

    @Autowired
    NoteMapper noteMapper;

    @Autowired
    OrderMapper orderMapper;

    @Autowired
    ShoppingcartMapper shoppingcartMapper;

    @Autowired
    NoticeMapper noticeMapper;



    public User findOne(String id){
        User user = userMapper.findOne(id);
        if(user != null){
            return user;
        }
        return null;
    }

    public User findByName(String name){
        User user = userMapper.findByName(name);
        if(user != null){
            return user;
        }
        return null;
    }

    public Userinfo findUserInfo(String uid){
        Userinfo userinfo = userinfoMapper.findOne(uid);
        if(userinfo!=null){
            return userinfo;
        }
        return null;
    }

    public Admininfo findAdminInfo(String uid){
        Admininfo admininfo = admininfoMapper.findOne(uid);
        if (admininfo!=null){
            return  admininfo;
        }
        return  null;
    }



    /**
     * 通过user查找Userinfo
     * @param user
     * @return
     */
    public Userinfo findUserinfoByUser(User user){
        User user1 =new User();
        Userinfo userinfo = new Userinfo();
        if(user.getUname() != null && !"".equals(user.getUname())){
           user1 = findByName(user.getUname());
        }
        if(user1.getId() != null){
            userinfo = findUserInfo(user1.getId());
        }
        if(userinfo != null){
            return userinfo;
        }
        return null;
    }

    /**
     * 通过user查找Admininfo
     * @param user
     * @return
     */
    public Admininfo findAdminByUser(User user){
        User user1 =new User();
        Admininfo admininfo = new Admininfo();
        if(user.getUname() != null && !"".equals(user.getUname())){
            user1 = findByName(user.getUname());
        }
        if(user1.getId() != null){
            admininfo = findAdminInfo(user1.getId());
        }
        if (admininfo != null){
            return  admininfo;
        }
        return  null;
    }

    /**
     * 根据UserVo获取 User
     * @param u
     * @return
     */
    public User getUser (UserVo u){
        User user = new User();
        if(StringUtils.isNoneBlank(u.getId())){
            user.setId(u.getId());
        }else{
            //产生id = 当前年月日时+100之内的随机数
            Date date = new Date ();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHms");
            String str = sdf.format(date);
            Random rand = new Random();
            String str1 = String.valueOf(rand.nextInt(100)+1);
            String id = str+str1;

            user.setId(id);
        }
        if(StringUtils.isNoneBlank(u.getUsername())){
            user.setUname(u.getUsername());
        }
        if(StringUtils.isNoneBlank(u.getPassword())){
            user.setPwd(u.getPassword());
        }
        if(u.getUserlevel()!=null && !"".equals(u.getUserlevel()) )
        user.setState(u.getUserlevel());
        if(u.getUpdatedate()!= null){
            user.setUpdatedate(u.getUpdatedate());
        }
        if(u.getDeletedate()!= null){
            user.setDeletedate(u.getDeletedate());
        }
        if(u.getDelFlag()!=null){
            user.setDel_flag(u.getDelFlag());
        }else{
            user.setDel_flag(0);
        }
        return user;
    }


    /**
     * 根据adminVo获取User
     * @param adminVo
     * @return
     */
    public User getUserByAdminVo (AdminVo adminVo){
        User user = new User();
        //user的id
        if (StringUtils.isNoneBlank(adminVo.getId())){
            user.setId(adminVo.getId());
        }else{
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHmmss");
            Date date = new Date();
            String dateStr = sdf.format(date);
            int num = (int) (Math.random()*10000);
            String str = String.valueOf(num);
            int sub = (int) (Math.random()*4);
            str = dateStr+str;
            str = str.substring(sub,sub+4);
            String str1 = "admin00"+str;
            user.setId(str1);
        }
        //user的uname
        if(StringUtils.isNoneBlank(adminVo.getUname())){
            user.setUname(adminVo.getUname());
        }
        //user的pwd
        if(StringUtils.isNoneBlank(adminVo.getPwd())){
            user.setPwd(adminVo.getPwd());
        }
        //user的state
        user.setState(2);
        //user的Update
        if(adminVo.getUpdatedate()!= null){
            user.setUpdatedate(adminVo.getUpdatedate());
        }
        ///user的deletedate
        if(adminVo.getDeletedate()!= null){
            user.setDeletedate(adminVo.getDeletedate());
        }
        //user的del_flag
        if(adminVo.getDel_flag()!=null){
            user.setDel_flag(adminVo.getDel_flag());
        }else{
            user.setDel_flag(0);
        }
        return user;
    }

    /**
     * 根据AdmininVo ,User 获取Admininfo
     * @param a
     * @param user
     * @return
     */
    public Admininfo getAdmininfo(AdminVo a,User user){
        //uid
        Admininfo adminfo = new Admininfo();
        if(StringUtils.isNoneBlank(a.getId())){
            adminfo.setUid(a.getId());
        }
        if(StringUtils.isNoneBlank(user.getId())){
            adminfo.setUid(user.getId());
        }
        //id
        if(StringUtils.isNoneBlank(a.getId())){
            adminfo.setId(a.getId());
        }else {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHmmss");
            Date date = new Date();
            String dateStr = sdf.format(date);
            int num = (int) (Math.random()*10000);
            String str = String.valueOf(num);
            int sub = (int) (Math.random()*4);
            str = dateStr+str;
            str = str.substring(sub,sub+4);
            String str1 = "a00"+str;
            adminfo.setId(str1);
        }

        //name
        if(StringUtils.isNoneBlank(a.getName())){
            adminfo.setName(a.getName());
        }
        //phone
        if(StringUtils.isNoneBlank(a.getPhone())){
            adminfo.setPhone(a.getPhone());
        }
        //address
        if(StringUtils.isNoneBlank(a.getAddress())){
            adminfo.setAddress(a.getAddress());
        }
        //state
        if(a.getState()!=null){
            adminfo.setState(a.getState());
        }else{
            adminfo.setState(0);
        }
        if(a.getLlogindate()!=null){
            adminfo.setLlogindate(a.getLlogindate());
        }
        if(a.getDel_flag()!=null){
            adminfo.setDel_flag(a.getDel_flag());
        }else{
            adminfo.setDel_flag(0);
        }

        return adminfo;
    }

    /**
     * 根据UserVo ， User 获取Userinfo
     * @param u
     * @param user
     * @return
     */
    public Userinfo getUserinfo (UserVo u , User user){
        Userinfo userinfo = new Userinfo();
        //uid
        if(StringUtils.isNoneBlank(u.getId())){
            userinfo.setUid(u.getId());
        }
        if(StringUtils.isNoneBlank(user.getId())){
            userinfo.setUid(user.getId());
        }
        //id
        if(StringUtils.isNoneBlank(u.getId())){
            userinfo.setId(u.getId());
        }else{
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHmmss");
            Date date = new Date();
            String dateStr = sdf.format(date);
            int num = (int) (Math.random()*10000);
            String str = String.valueOf(num);
            int sub = (int) (Math.random()*8);
            str = dateStr+str;
            str = str.substring(sub);
            userinfo.setId(str);
        }
        //name
        if(StringUtils.isNoneBlank(u.getName())){
            userinfo.setName(u.getName());
        }
        //age
        if(StringUtils.isNoneBlank(u.getAge())){
            userinfo.setAge(u.getAge());
        }
        //idCard
        if(StringUtils.isNoneBlank(u.getIdCard())){
            userinfo.setIdCard(u.getIdCard());
        }
        //phone
        if(StringUtils.isNoneBlank(u.getPhone())){
            userinfo.setPhone(u.getPhone());
        }
        //moblie
        if(StringUtils.isNoneBlank(u.getMoblie())){
            userinfo.setMoblie(u.getMoblie());
        }
        //sex
        if(StringUtils.isNoneBlank(u.getSex())){
            userinfo.setSex(u.getSex());
        }
        //address
        if(StringUtils.isNoneBlank(u.getAddress())){
            userinfo.setAddress(u.getAddress());
        }
        //level
        if(u.getLevel()!=null){
            userinfo.setLevel(u.getLevel());
        }
        if(u.getBalance()!=null){
            userinfo.setBalance(u.getBalance());
        }
        if(u.getState()!=null){
            userinfo.setState(u.getState());
        }else{
            userinfo.setState(0);
        }
        if(u.getLlogindate()!=null){
            userinfo.setLlogindate(u.getLlogindate());
        }
        if(u.getDelFlag()!=null){
            userinfo.setDel_flag(u.getDelFlag());
        }else{
            userinfo.setDel_flag(0);
        }
        if(u.getBalance()!=null){
            userinfo.setBalance(u.getBalance());
        }else{
            userinfo.setBalance(0.0);
        }
        if(u.getLlogindate()!=null){
            userinfo.setLlogindate(u.getLlogindate());
        }else{
            userinfo.setLlogindate(user.getUpdatedate());
        }
        return userinfo;
    }

    /**
     * 保存user表
     * @param user
     * @return
     */
    @Transactional(readOnly = false)
    public boolean saveUser(User user){
        userMapper.insert(user);
        User user1 = userMapper.findOne(user.getId());
        if(user1!=null){
            return true;
        }
        return false;
    }

    /**
     * 保存userinfo表
     * @param userinfo
     * @return
     */
    @Transactional(readOnly = false)
    public boolean saveUserInfo(Userinfo userinfo){
        userinfoMapper.insert(userinfo);
        Userinfo userinfo1 = userinfoMapper.findOne(userinfo.getUid());
        if(userinfo1!=null){
            return true ;
        }
        return false;
    }

    /**
     * 替换保存数据html
     * @param img
     * @return
     */
    public String changeImg(String img){
        if(StringUtils.isNoneBlank(img)){
            String str = img;
            str = str.replace("&lt;","<");
            str = str.replace("&quot;","\"");
            str = str.replace("&qpos;","\'");
            str = str.replace("&gt;",""+'>');
            str = str.replace("&amp;","&");
            str = str.replace("/>","style=\"max-width:20px; max-height:20px\"/>");
            str = str.replace(".gif\" border=\"0\" alt=\"\" style=\"max-width:20px;max-height:20px\"/>",".gif\" border=\"0\" alt=\"\" />");
            System.out.println(str);
            return str;
        }
        return null;
    }

    /**
     * 将图片放大1倍
     * @param img
     * @return
     */
    public String changeMax1px(String img){
        if(StringUtils.isNoneBlank(img)){
            String str =img;
            str = str.replace("style=\"max-width:20px; max-height:20px\"/>","class=\"am-comment-avatar\" style=\"max-width:50px; max-height:50px\"/>");
            System.out.println(str);
            return str;
        }
        return null;
    }


    /**
     * 保存admininfo表
     * @param admininfo
     * @return
     */
    @Transactional(readOnly = false)
    public boolean saveAdmininfo(Admininfo admininfo){
        admininfoMapper.insert(admininfo);
        Admininfo admininfo1 = admininfoMapper.findOne(admininfo.getUid());
        if(admininfo1!=null){
            return  true;
        }
        return  false;
    }
    /**
     * 注册保存user和userinfo表
     * @param userinfo
     * @param user
     * @return
     */
    @Transactional(readOnly = false)
    public boolean saveUserandUserinfo(Userinfo userinfo,User user){
        User user1 = findByName(user.getUname());
        if(user1!=null){
            return false;
        }else{
            saveUserInfo(userinfo);
            saveUser(user);
            return true;
        }

    }

    /**
     * 管理员登记保存user和admininfo表
     * @param admininfo
     * @param user
     * @return
     */
    @Transactional(readOnly = false)
    public boolean saveUserandAdmininfo(Admininfo admininfo,User user){
        User user1 = findByName(user.getUname());
        if(user1!=null){
            return  false;
        }else{
            saveAdmininfo(admininfo);
            saveUser(user);
            return true;
        }
    }

    /**
     * 查找User
     * @param object
     * @return
     */
    public User findUser(Object object){
        List<User> list = userMapper.find(object);
        for(User user :list){
            if(user!=null){
                return user;
            }
        }
        return null;
    }

    /**
     * 查找Userinfo
     * @param object
     * @return
     */
    public Userinfo findUserinfo(Object object){
        List<Userinfo> list = userinfoMapper.find(object);
        for(Userinfo userinfo : list){
            if(userinfo!=null){
                return userinfo;
            }
        }
        return null;
    }

    /**
     * 封装一个判断是否已有注册信息方法
     * @param object
     * @param obj
     * @return
     */
    public Object  getUserinfoByEle (Object object ,Object obj){
        Userinfo userinfo =new Userinfo();
        User user =new User();
        if("username".equals(object) || "uname".equals(object)){
            user.setUname((String) obj);
             user = findUser(user);
            return user;
        }
        if("idCard".equals(object)){
            userinfo.setIdCard((String) obj);
            Userinfo u2=findUserinfo(userinfo);
            return u2;
        }
        if("moblie".equals(object) || "phone".equals(object)){
            userinfo.setMoblie((String) obj);
            Userinfo u3 = findUserinfo(userinfo);
            return u3;
        }
        return null;
    }

    /**
     * 更新User表
     * @param user
     * @return
     */
    @Transactional(readOnly = false)
    public void UpdateUser (User user){
        if(user.getId()!=null && !"".equals(user.getId())){
            userMapper.update(user);
        }
    }

    /**
     * 更新Userinfo表
     * @param userinfo
     */
    @Transactional(readOnly = false)
    public void UpdateUserinfo(Userinfo userinfo){
        if(userinfo.getUid()!=null && !"".equals(userinfo.getUid())){
            userinfoMapper.update(userinfo);
        }
    }

    /**
     * 更新Admininfo表
     * @param admininfo
     */
    @Transactional(readOnly = false)
    public void UpdateAdminInfo(Admininfo admininfo){
        if(admininfo.getUid()!=null && !"".equals(admininfo.getUid())){
            admininfoMapper.update(admininfo);
        }
    }

    /**
     * 更新User和Userinfo表
     * @param userinfo
     * @param user
     * @return
     */
    @Transactional(readOnly = false)
    public boolean UpdateUserAndUserinfo(Userinfo userinfo,User user){
        User user1 = findByName(user.getUname());
        if(user1!=null){
            UpdateUserinfo(userinfo);
            UpdateUser(user);
            return true;

        }else{
            return false;
        }
    }

    /**
     * 更新User和Admininfo表
     * @param admininfo
     * @param user
     * @return
     */
    @Transactional(readOnly = false)
    public boolean UpdateUserAndAdmininfo(Admininfo admininfo,User user){
        User user1 = findByName(user.getUname());
        if(user1!=null){
            UpdateAdminInfo(admininfo);
            UpdateUser(user);
            return true;
        }else{
            return false;
        }
    }


    /***************************************************以下管理员业务********************************************************/

    /**
     * 分页查询所有用户
     * @param mp
     * @param userVo
     * @return
     */
    public MiniPage findUserPage(MiniPage mp, UserVo userVo) {
        Page<UserVo> page = new Page<UserVo>();
        page.setPageNo(mp.getPageNo() + 1);
        page.setPageSize(mp.getPageSize());

        if ("price".equals(mp.getSortField())) {
            page.setOrderBy("t." + mp.getSortField() + " " + mp.getSortOrder());
        } else if ("postdate".equals(mp.getSortField())) {
            page.setOrderBy("t." + mp.getSortField() + " " + mp.getSortOrder());
        }
        System.out.println("t." + mp.getSortField() + " " + mp.getSortOrder());
        userVo.setPage(page);
        List<UserVo> list = userMapper.findUserVo(userVo);
        //使用迭代器删除User表中的“游客”这个系统用户
        Iterator<UserVo> it = list.iterator();
        UserVo u = it.next();
        if ("11111".equals(u.getId())) {
            it.remove();// 迭代器删除--能成功实现
        }
        if (list.size()>0){
            for (UserVo vo :list){
                if (vo.getState() == 0){
                    vo.setStateStr("在线");
                }else if(vo.getState()==1){
                    vo.setStateStr("下线");
                }
                if (vo.getUserlevel()==0){
                    vo.setUlStr("普通用户");
                }else if(vo.getUserlevel()==1){
                    vo.setUlStr("会员用户");
                }
            }
            mp.setTotal(page.getCount());
            mp.setData(list);
        }
        return mp;
    }

    /**
     * 删除user和Userinfo
     * @param user
     * @param userinfo
     * @return
     */
    @Transactional(readOnly = false)
    public boolean removeUserandUserinfo(User user,Userinfo userinfo){
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateStr = sdf.format(date);
        if (user!=null && userinfo!=null){
            List<Evaluate> list = evaluateMapper.findByUid(user.getId());
            //评价
            if (list!=null && list.size()>0){
                for (Evaluate evaluate :list){
                    evaluate.setDel_flag(1);
                    evaluateMapper.update(evaluate);
                }
            }
            //商品
            List<Goods> list1 = goodsMapper.findByuid(user.getId());
            if (list1!=null && list1.size()>0){
                for(Goods goods:list1){
                    goods.setDel_flag(1);
                    goodsMapper.update(goods);
                }
            }
            //帖子回复信息
            List<Msg> list2 = msgMapper.findByuid(user.getId());
            if (list2!=null && list2.size()>0){
                for (Msg msg :list2){
                    msg.setDelFlag(1);
                    msgMapper.update(msg);
                }
            }
            //帖子信息
            List<Note> list3 = noteMapper.findByuid(user.getId());
            if (list3!=null && list3.size()>0){
                for (Note note :list3){
                    note.setDel_flag(1);
                    noteMapper.update(note);
                }
            }
            //订单信息
            List<Order> list4 = orderMapper.findByuid(user.getId());
            if (list4!=null && list4.size()>0){
                for(Order order:list4){
                    order.setDelFlag(1);
                    orderMapper.update(order);
                }
            }
            //购物车
            List<Shoppingcart> list5 = shoppingcartMapper.findByuid(user.getId());
            if (list5!=null && list5.size()>0){
                for (Shoppingcart shoppingcart:list5){
                    shoppingcart.setDel_flag(1);
                    shoppingcartMapper.update(shoppingcart);
                }
            }
            List<Notice> list6 = noticeMapper.findByuid(user.getId());
            if (list6!=null && list6.size()>0){
                for (Notice notice :list6){
                    notice.setDelFlag(1);
                    noticeMapper.update(notice);
                }
            }
            user.setDel_flag(1);
            try {
                user.setDeletedate(sdf.parse(dateStr));
            } catch (ParseException e) {
                e.printStackTrace();
            }
            userinfo.setDel_flag(1);
            userMapper.update(user);
            userinfoMapper.update(userinfo);
            return  true;
        }
        return false;
    }

    /**
     * 分页查询所有被删除的用户
     * @param mp
     * @param userVo
     * @return
     */
    public MiniPage findDeleteUserPage(MiniPage mp, UserVo userVo) {
        Page<UserVo> page = new Page<UserVo>();
        page.setPageNo(mp.getPageNo() + 1);
        page.setPageSize(mp.getPageSize());

        if ("llogindate".equals(mp.getSortField())) {
            page.setOrderBy("f." + mp.getSortField() + " " + mp.getSortOrder());
        }
        System.out.println("f." + mp.getSortField() + " " + mp.getSortOrder());
        userVo.setPage(page);
        List<UserVo> list = userMapper.findDeleteUserVo(userVo);
        if (list.size()>0){
            for (UserVo vo :list){
                if (vo.getUserlevel()==0){
                    vo.setUlStr("普通用户");
                }else if(vo.getUserlevel()==1){
                    vo.setUlStr("会员用户");
                }
            }
            mp.setTotal(page.getCount());
            mp.setData(list);
        }
        return mp;
    }

    /**
     * 查找被删除的用户user
     * @param id
     * @return
     */
    public User findDeleteOne(String id){
        if (StringUtils.isNoneBlank(id)){
            User user = userMapper.findDeleteUserVoone(id);
            if (user!=null){
                return user;
            }
        }
        return  null;
    }

    /**
     * 查找被删除的userinfo
     * @param uid
     * @return
     */
    public Userinfo findDeleteUserinfo(String uid){
        if (StringUtils.isNoneBlank(uid)){
            Userinfo userinfo = userinfoMapper.findDeleteOne(uid);
            if (userinfo!=null){
                return  userinfo;
            }
        }
        return  null;
    }

    /**
     * 回复删除的UserVo
     * @param user
     * @param userinfo
     * @return
     */
    @Transactional(readOnly = false)
    public boolean rebackUserVo(User user ,Userinfo userinfo){
        if (user!=null && userinfo !=null){
            user.setDel_flag(0);
            userMapper.update(user);
            userinfo.setDel_flag(0);
            userinfoMapper.update(userinfo);
            return true;
        }
        return  false;
    }


    /**
     * 从回收站删除Uservo(User和Userinfo)
     * @param user
     * @param userinfo
     * @return
     */
    @Transactional(readOnly = false)
    public boolean RealDeleteU(User user,Userinfo userinfo){
        if (user!=null && userinfo!=null){
            User user1 = this.findDeleteOne(user.getId());
            if (user1!=null){
                userMapper.delete(user);
                User user2 = this.findDeleteOne(user.getId());
                if (user2 !=null){
                    return false;
                }else{
                    Userinfo userinfo1 = this.findDeleteUserinfo(userinfo.getUid());
                    if (userinfo1!=null){
                        userinfoMapper.delete(userinfo);
                        Userinfo userinfo2 = this.findDeleteUserinfo(userinfo.getUid());
                        if (userinfo2!=null){
                            return false;
                        }else{
                            return true;
                        }
                    }
                }
            }
        }
        return  false;
    }

    /**
     * 获取在线用户人数
     * @return
     */
    public Integer getonlineUserNume(){
        Userinfo userinfo = new Userinfo();
        userinfo.setState(0);
        List<Userinfo> list = userinfoMapper.find(userinfo);
        if (list!=null && list.size()>=0){
            return list.size();
        }
        return  null;
    }
}
