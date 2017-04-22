package com.thinkgem.jeesite.modules.sys.service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StreamUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.agriculture.entity.*;
import com.thinkgem.jeesite.modules.sys.dao.GoodsMapper;
import com.thinkgem.jeesite.modules.sys.dao.OrderMapper;
import com.thinkgem.jeesite.modules.sys.dao.SwitchimgMapper;
import com.thinkgem.jeesite.modules.sys.dao.SysnoticeMapper;
import com.thinkgem.jeesite.modules.sys.web.MiniPage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by Zhangsnke on 2017/3/20.
 */
@Service
@Transactional(readOnly = true)
public class SysnoticeService {

    @Autowired
    SysnoticeMapper sysnoticeMapper;

    @Autowired
    OrderMapper orderMapper;

    @Autowired
    GoodsMapper goodsMapper;

    @Autowired
    UserService userService;

    @Autowired
    SwitchimgMapper switchimgMapper;



    /**
     * 查询所有卖家订单
     * @return
     */
    public MiniPage findNoticeByPage(MiniPage mp, Sysnotice sysnotice){
        Page<Sysnotice> page = new Page<Sysnotice>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        page.setPageNo(mp.getPageNo() + 1);
        page.setPageSize(mp.getPageSize());
         if("postdate".equals(mp.getSortField())){
            page.setOrderBy("t."+mp.getSortField()+" "+mp.getSortOrder());
        }

        System.out.println("t."+mp.getSortField()+" "+mp.getSortOrder());
        sysnotice.setPage(page);
        List<Sysnotice> list = sysnoticeMapper.find(sysnotice);
        if(list.size()!=0){
            for (Sysnotice sysnotice1 :list){
                if(sysnotice1.getPostdate()!=null){
                    sysnotice1.setPostdateStr(sdf.format(sysnotice1.getPostdate()));
                }
            }
            mp.setTotal(page.getCount());
            mp.setData(list);
        }
        return mp;
    }

    /**
     * 保存sysnotice(已存在则更新，若无，则新增)
     * @param sysnotice
     * @return
     */
    @Transactional(readOnly = false)
    public boolean saveSysnotice(Sysnotice sysnotice){
        Sysnotice sysn = sysnoticeMapper.findOne(sysnotice.getId());
        if(sysn!=null){
            sysnoticeMapper.update(sysnotice);
            return  true;
        }else{
            if (sysnotice!=null){
                sysnoticeMapper.insert(sysnotice);
                Sysnotice sysnotice1 = sysnoticeMapper.findOne(sysnotice.getId());
                if (sysnotice1!=null){
                    return true;
                }
            }
        }
        return false;
    }

    /**
     * 补全sysnotice,自动补全id
     * @param sysnotice
     * @return
     */
    public Sysnotice getSysnotice(Sysnotice sysnotice,NoticeVo noticeVo){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHmmss");
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();
        String dateStr = sdf.format(date);
        String datestrs = sdf1.format(date);
        try {
            //postDate
            sysnotice.setPostdate(sdf1.parse(datestrs));
            sysnotice.setPostdateStr(datestrs);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        int num = (int) (Math.random()*10000);
        String str = String.valueOf(num);
        int sub = (int) (Math.random()*8);
        str = dateStr+str;
        str = str.substring(sub);
        String str1 = "sys00"+str;
        //id
        sysnotice.setId(str1);
        if (noticeVo!=null){
            if (StringUtils.isNoneBlank(noticeVo.getOrderid())){
                Order order = orderMapper.findOne(noticeVo.getOrderid());
                if (order!=null){
                    //订单买家ToUid
                    sysnotice.setTouid(order.getUid());
                    sysnotice.setQtid(order.getId());
                }
            }
           if (StringUtils.isNoneBlank(noticeVo.getGoodsid())){
               Goods goods = goodsMapper.findOne(noticeVo.getGoodsid());
               if (goods!=null){
                   //商品卖家FromUid
                   sysnotice.setFromuid(goods.getUinfoid());
                   sysnotice.setTitle(goods.getName());
               }
           }
        }
        sysnotice.setDel_flag(0);
        return sysnotice;
    }

    /**
     * 根据qtid这个字段对sysnotice系统通知进行查询
     * @param id
     * @return
     */
    public Sysnotice findSysnByQtid(String id){
       if (StringUtils.isNoneBlank(id)){
           Sysnotice sysnotice = sysnoticeMapper.findByQtid(id);
           if(sysnotice!=null){
               return sysnotice;
           }
       }
        return  null;
    }

    /**
     * 根据id这个字段对sysnotice系统通知进行查询
     * @param id
     * @return
     */
    public Sysnotice findSysnoticeByid(String id){
        if (StringUtils.isNoneBlank(id)){
            Sysnotice sysnotice = sysnoticeMapper.findOne(id);
            if (sysnotice!=null){
                return sysnotice;
            }
        }
        return null;
    }

    /**
     * 根据商品评价获得系统通知
     * @param userinfo
     * @param goods
     * @return
     */
    public Sysnotice getSysnoticeByPj(Userinfo userinfo,Goods goods){
        Sysnotice sysnotice = new Sysnotice();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHmmss");
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();
        String dateStr = sdf.format(date);
        String datestrs = sdf1.format(date);
        try {
            //postDate
            sysnotice.setPostdate(sdf1.parse(datestrs));
            sysnotice.setPostdateStr(datestrs);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        int num = (int) (Math.random()*10000);
        String str = String.valueOf(num);
        int sub = (int) (Math.random()*8);
        str = dateStr+str;
        str = str.substring(sub);
        String str1 = "sys00"+str;
        //id
        sysnotice.setId(str1);
        if (userinfo!=null){
            sysnotice.setTouid(goods.getUinfoid());
        }
        if (goods!=null){
            sysnotice.setFromuid(userinfo.getUid());
        }
        sysnotice.setTitle("买家商品评价通知");
        sysnotice.setContent("买家:["+userinfo.getName()+"]已经对商品【"+goods.getName()+"】做了评价！");
        sysnotice.setDel_flag(0);
        return sysnotice;

    }

    /**
     * 查找最近一条公告
     * @return
     */
    public Sysnotice getLastSysN(){
        Sysnotice sysnotice = sysnoticeMapper.findLastOne();
        if (sysnotice!=null){
            return  sysnotice;
        }
        return null;
    }


    /**
     * 根据数量返回相应的公告
     * @param
     * @return
     */
    public List<Sysnotice> getLastNum(){
        SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        List<Sysnotice> list = sysnoticeMapper.findLastList();
        if (list.size()>0){
            for(Sysnotice sysnotice:list){
                if (sysnotice.getPostdate()!=null){
                    sysnotice.setPostdateStr(sdf.format(sysnotice.getPostdate()));
                }
            }
            return  list;
        }

        return  null;
    }




    /******************************************以下管理员业务***************************************************************/

    /**
     * 管理员操作商品获取系统通知
     * @param admininfo
     * @param goods
     * @param op
     * @param yy
     * @return
     */
    public Sysnotice getSysnoticeByAdmin(Admininfo admininfo ,Goods goods,String op,String yy){
        Sysnotice sysnotice = new Sysnotice();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHmmss");
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();
        String dateStr = sdf.format(date);
        String datestrs = sdf1.format(date);
        try {
            //postDate
            sysnotice.setPostdate(sdf1.parse(datestrs));
            sysnotice.setPostdateStr(datestrs);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        int num = (int) (Math.random()*10000);
        String str = String.valueOf(num);
        int sub = (int) (Math.random()*8);
        str = dateStr+str;
        str = str.substring(sub);
        String str1 = "sys00"+str;
        //id
        sysnotice.setId(str1);
        if (admininfo!=null){
            //设置管理员工号
            sysnotice.setFromuid(admininfo.getUid());
        }
        if(goods!=null){
            //商品卖家id
            sysnotice.setTouid(goods.getUinfoid());
        }
        if (StringUtils.isNoneBlank(op)&&StringUtils.isNoneBlank(yy)){
            sysnotice.setTitle("商品"+op+"通知");
            sysnotice.setContent("工号:["+admininfo.getUid()+"]管理员已经对商品【"+goods.getName()+"】进行了"+op+"操作，原因【"+yy+"】！");
        }
        sysnotice.setDel_flag(0);
        return sysnotice;
    }


    /**
     * 管理员操作商品获取系统通知
     * @param admininfo
     * @param note
     * @param op
     * @param yy
     * @return
     */
    public Sysnotice getSysnoticeByAdminNote(Admininfo admininfo ,Note note,String op,String yy){
        Sysnotice sysnotice = new Sysnotice();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHmmss");
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();
        String dateStr = sdf.format(date);
        String datestrs = sdf1.format(date);
        try {
            //postDate
            sysnotice.setPostdate(sdf1.parse(datestrs));
            sysnotice.setPostdateStr(datestrs);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        int num = (int) (Math.random()*10000);
        String str = String.valueOf(num);
        int sub = (int) (Math.random()*8);
        str = dateStr+str;
        str = str.substring(sub);
        String str1 = "sys00"+str;
        //id
        sysnotice.setId(str1);
        if (admininfo!=null){
            //设置管理员工号
            sysnotice.setFromuid(admininfo.getUid());
        }
        if(note!=null){
            //商品卖家id
            sysnotice.setTouid(note.getUid());
        }
        if (StringUtils.isNoneBlank(op)&&StringUtils.isNoneBlank(yy)){
            sysnotice.setTitle("帖子"+op+"通知");
            sysnotice.setContent("工号:["+admininfo.getUid()+"]管理员已经对帖子【"+note.getTitle()+"】进行了"+op+"操作，原因【"+yy+"】！");
        }
        sysnotice.setDel_flag(0);
        return sysnotice;
    }


    /**
     * 管理员给用户发送消息
     * @param admininfo
     * @param cotent
     * @param user
     * @return
     */
    public Sysnotice getSysnoByAdminCreate(Admininfo admininfo,String cotent,User user){
        Sysnotice sysnotice = new Sysnotice();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHmmss");
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();
        String dateStr = sdf.format(date);
        String datestrs = sdf1.format(date);
        try {
            //postDate
            sysnotice.setPostdate(sdf1.parse(datestrs));
            sysnotice.setPostdateStr(datestrs);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        int num = (int) (Math.random()*10000);
        String str = String.valueOf(num);
        int sub = (int) (Math.random()*8);
        str = dateStr+str;
        str = str.substring(sub);
        String str1 = "sys00"+str;
        //id
        sysnotice.setId(str1);
        if (admininfo!=null){
            //设置管理员工号
            sysnotice.setFromuid(admininfo.getUid());
        }
        if (user!=null){
            sysnotice.setTouid(user.getId());
        }
        if (StringUtils.isNoneBlank(cotent)){
            sysnotice.setTitle("工号:["+admininfo.getUid()+"]管理员发来一封通知消息");
            sysnotice.setContent("工号:["+admininfo.getUid()+"]管理员给您发来一封通知消息，消息内容【"+cotent+"】。");
        }
        sysnotice.setDel_flag(0);
        return sysnotice;
    }

    /**
     * 补全Sysnotice id和 postdate
     * @param sysnotice
     * @return
     */
    public Sysnotice getSysId(Sysnotice sysnotice){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHmmss");
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();
        String dateStr = sdf.format(date);
        String datestrs = sdf1.format(date);
        try {
            //postDate
            sysnotice.setPostdate(sdf1.parse(datestrs));
            sysnotice.setPostdateStr(datestrs);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        int num = (int) (Math.random()*10000);
        String str = String.valueOf(num);
        int sub = (int) (Math.random()*8);
        str = dateStr+str;
        str = str.substring(sub);
        String str1 = "sys00"+str;
        sysnotice.setId(str1);
        sysnotice.setDel_flag(0);
        return sysnotice;
    }


    /**
     * 图片大小转换
     * @param content
     * @return
     */
    public String switchcontent(String content){
        if (StringUtils.isNoneBlank(content)){
            content = content.replace("/>","style=\"max-width:50px; max-height:50px\"/>");
            content = content.replace(".gif\" border=\"0\" alt=\"\" style=\"width:120px;height:90px\"/>",".gif\" border=\"0\" alt=\"\" />");
            return content;
        }
        return null;
    }


    /**
     * 删除sysnotice
     * @param sysnotice
     * @return
     */
    @Transactional(readOnly = false)
    public boolean removeSysn(Sysnotice sysnotice){
        if (sysnotice!=null){
            Sysnotice sysnotice1 = sysnoticeMapper.findOne(sysnotice.getId());
            if (sysnotice1!=null){
                sysnoticeMapper.delete(sysnotice);
                Sysnotice sysnotice2 = sysnoticeMapper.findOne(sysnotice.getId());
                if (sysnotice2!=null){
                    return  false;
                }else {
                    return true;
                }
            }
        }
        return false;
    }

    /**
     * 自动补充SwitchImg实体类（轮播图片实体类）
     * @return
     */
    public Switchimg getSwitchImg(Switchimg switchimg){
        //自动生成id
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHmmss");
        Date date = new Date();
        String dateStr = sdf.format(date);
        int num = (int) (Math.random()*10000);
        String str = String.valueOf(num);
        int sub = (int) (Math.random()*8);
        str = dateStr+str;
        str = str.substring(sub);
        String str1 = "si00"+str;
        switchimg.setId(str1);
        //添加删除标记——默认为0
        switchimg.setDelFlag(0);

        //更改图片大小
        String img = switchimg.getImg();
        if (StringUtils.isNoneBlank(img)){
            img = img.replace("/>","style=\"width:800px; height:500px\"/>");
            switchimg.setImg(img);
        }
        return switchimg;

    }

    /**
     * 保存轮播图片，如果已存在则走更新，若无则新增记录
     * @param switchimg
     * @return
     */
    @Transactional(readOnly = false)
    public boolean saveSwitchImg(Switchimg switchimg){
        if (switchimg!=null){
           Switchimg switchimg1 =  switchimgMapper.findOne(switchimg.getId());
            if (switchimg1!=null){
                switchimgMapper.update(switchimg);
                return true;
            }else{
                switchimgMapper.insert(switchimg);
                Switchimg switchimg2 = switchimgMapper.findOne(switchimg.getId());
                if (switchimg2!=null){
                    return true;
                }
            }
        }
        return false;
    }

    /**
     * 返回录播图片
     * @return
     */
    public List<Switchimg> getSwitchImgs(){
        List<Switchimg> list = switchimgMapper.find(null);
        if (list!=null && list.size()>0){
            return list;
        }
        return null;
    }

}
