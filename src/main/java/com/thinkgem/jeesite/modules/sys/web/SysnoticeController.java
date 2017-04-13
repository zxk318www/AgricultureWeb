package com.thinkgem.jeesite.modules.sys.web;

import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.agriculture.entity.*;
import com.thinkgem.jeesite.modules.sys.service.GoodsService;
import com.thinkgem.jeesite.modules.sys.service.SysnoticeService;
import com.thinkgem.jeesite.modules.sys.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by Zhangsnke on 2017/3/20.
 */
@Controller
@RequestMapping(value = "SysnoticeCheck")
public class SysnoticeController {

    @Autowired
    SysnoticeService sysnoticeService;

    @Autowired
    UserService userService;

    @Autowired
    GoodsService goodsService;


    /**
     * 分页列表显示系统通知信息
     * @param key
     * @param rankType
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "findSysnoticePage")
    @ResponseBody
    public MiniPage findNoticePage(String key, String rankType, HttpServletRequest request, HttpServletResponse response){
        Sysnotice sysnotice = new Sysnotice();
        HttpSession session =request.getSession();
        Userinfo userinfo  = (Userinfo) session.getAttribute("userinfo");
        if(userinfo!=null){
            sysnotice.setFromuid(userinfo.getUid());
            sysnotice.setTouid(userinfo.getUid());
        }

        MiniPage ps = new MiniPage(request, response);

        MiniPage miniPage = sysnoticeService.findNoticeByPage(ps,sysnotice);
        return miniPage;
    }

    /**
     * 根据id获得系统通知，返回sysnotice
     * @param id
     * @return
     */
    @RequestMapping(value = "getSysnotice")
    @ResponseBody
    public Sysnotice getSysnotice(String id){
        if (StringUtils.isNoneBlank(id)){
            Sysnotice sysnotice = sysnoticeService.findSysnoticeByid(id);
            if (sysnotice!=null){
               return sysnotice;
            }
        }
        return null;
    }

    /**
     * 根据id删除sysnotice
     * @param id
     * @return
     */
    @RequestMapping(value = "removeSysnotice")
    @ResponseBody
    public String  removeSysnotice(String id){
        if (StringUtils.isNoneBlank(id)){
            Sysnotice sysnotice = sysnoticeService.findSysnoticeByid(id);
            if (sysnotice!=null){
                sysnotice.setDel_flag(1);
               boolean flag = sysnoticeService.saveSysnotice(sysnotice);
                if (flag){
                    return "ok";
                }
            }
        }
        return  null;
    }


    /**
     * 管理员新增通知操作（订单）
     * @param rankType
     * @param content
     * @return
     */
    @RequestMapping(value = "saveSysnotice")
    @ResponseBody
    public String saveSysnotice(String orderid ,String rankType,String content,String adminid){
        Sysnotice sysnotice = new Sysnotice();
        if (StringUtils.isNoneBlank(adminid)){
            Admininfo admininfo = userService.findAdminInfo(adminid);
            if (adminid!=null){
                sysnotice.setFromuid(admininfo.getUid());
                if (StringUtils.isNoneBlank(orderid)){
                    Order order = goodsService.findOrder(orderid);
                    if (order != null){
                        Goods goods = goodsService.findGoodsById(order.getGoodsid());
                        if (goods != null){
                            if (StringUtils.isNoneBlank(rankType)){
                                if ("1".equals(rankType)){
                                    sysnotice.setTitle("管理员提醒发货");
                                    sysnotice.setTouid(goods.getUinfoid());
                                    sysnotice.setContent("工号:["+admininfo.getUid()+"]管理员提醒你尽快发货!");
                                }else if("2".equals(rankType)){
                                    sysnotice.setTitle("管理员提醒收货");
                                    sysnotice.setTouid(order.getUid());
                                    sysnotice.setContent("工号:["+admininfo.getUid()+"]管理员提醒你尽快收货!");
                                }else if("4".equals(rankType)){
                                    sysnotice.setTitle("订单消息");
                                    if(StringUtils.isNoneBlank(content)){
                                        sysnotice.setContent("工号:["+admininfo.getUid()+"]管理员给您发来一封通知消息，消息内容【"+content+"】。");
                                        sysnotice.setTouid(goods.getUinfoid());
                                    }
                                }
                            }
                        }else{
                            return "操作失败，商品已下架！";
                        }
                    }

                }
            }
        }
        sysnotice = sysnoticeService.getSysId(sysnotice);
        boolean flag = sysnoticeService.saveSysnotice(sysnotice);
        if (flag){
            return "ok";
        }
        return null;
    }

    /**
     * 获取最新一条公告信息
     * @return
     */
    @RequestMapping("getLastSysN")
    @ResponseBody
    public void getLastSysn(ModelMap modelMap){
        Sysnotice sysnotice = sysnoticeService.getLastSysN();
        if (sysnotice!=null){
            modelMap.put("gonggao",sysnotice);
        }
    }


    /***********************************************以下管理员业务***********************************************************/

    /**
     * 添加公告
     * @param content
     * @param adminid
     * @return
     */
    @RequestMapping(value = "addSysN")
    @ResponseBody
    public String addN(String content,String adminid){
        Sysnotice sysnotice = new Sysnotice();
        if(StringUtils.isNoneBlank(content) && StringUtils.isNoneBlank(adminid)){
            Admininfo admininfo = userService.findAdminInfo(adminid);
            if (admininfo!=null){
                sysnotice.setFromuid(admininfo.getUid());
                sysnotice.setTouid("all");
            }
            content = sysnoticeService.switchcontent(content);
            if (StringUtils.isNoneBlank(content)){
                sysnotice.setContent(content);
            }

            sysnotice.setTitle("公告");
            sysnotice = sysnoticeService.getSysId(sysnotice);
            boolean flag = sysnoticeService.saveSysnotice(sysnotice);
            if (flag){
                return "ok";
            }
        }
        return  null;
    }

    /**
     * 管理员删除公告
     * @param id
     * @return
     */
    @RequestMapping(value = "removeSysn")
    @ResponseBody
    public String removeSysn(String id){
        if (StringUtils.isNoneBlank(id)){
            Sysnotice sysnotice = sysnoticeService.findSysnoticeByid(id);
            if (sysnotice!=null){
                boolean flag = sysnoticeService.removeSysn(sysnotice);
                if (flag){
                    return "ok";
                }
            }
        }
        return null;
    }


}
