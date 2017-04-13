package com.thinkgem.jeesite.modules.sys.web;

import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.agriculture.entity.*;
import com.thinkgem.jeesite.modules.sys.service.GoodsService;
import com.thinkgem.jeesite.modules.sys.service.NoticeService;
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
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Zhangsnke on 2017/3/17.
 */
@Controller
@RequestMapping(value = "Noticecheck")
public class NoticeController extends BaseController {
    @Autowired
    UserService userService;

    @Autowired
    NoticeService noticeService;

    @Autowired
    GoodsService goodsService;

    @Autowired
    SysnoticeService sysnoticeService;


    /**
     * 跳转到通知消息主页
     * @param request
     * @param response
     * @param modelMap
     * @return
     */
    @RequestMapping(value = "toNoticeIndex")
    public String toNoticeIndex(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap){
        HttpSession session = request.getSession();
        Userinfo uinfo = (Userinfo) session.getAttribute("userinfo");
        modelMap.put("userinfo",uinfo);
        return "modules/ui/NoticeIndex";
    }

    /**
     * 分页查询订单通知消息
     * @param key
     * @param rankType
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "findNoticePage")
    @ResponseBody
    public MiniPage findNoticePage(String key,String rankType,HttpServletRequest request, HttpServletResponse response){
        NoticeVo noticeVo = new NoticeVo();
        HttpSession session =request.getSession();
        Userinfo userinfo  = (Userinfo) session.getAttribute("userinfo");
        if(userinfo!=null){
            noticeVo.setUid(userinfo.getUid());
        }
        if(StringUtils.isNoneBlank(rankType) &&StringUtils.isNoneBlank(key)){
            if("1".equals(rankType)){
                if(key.contains("已付款")){
                    noticeVo.setState(0);
                }else{
                    noticeVo.setState(1);
                }
                System.out.print(noticeVo.getState());

            }else if("2".equals(rankType)){
                key = "%"+key+"%";
                noticeVo.setOrderid(key);
            }else if("3".equals(rankType)){
                key = "%"+key+"%";
                noticeVo.setGoodstitle(key);
            }
        }
        MiniPage ps = new MiniPage(request, response);

        MiniPage miniPage = noticeService.findNoticeByPage(ps,noticeVo);
        return miniPage;
    }

    /**
     * 查找是否存在该通知消息,
     * 返回Order的id
     * @param noticeid
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "checkNotice")
    @ResponseBody
    public String checkNotice(String noticeid,HttpServletRequest request, HttpServletResponse response){
        HttpSession session =request.getSession();
        Userinfo userinfo  = (Userinfo) session.getAttribute("userinfo");
        if(StringUtils.isNoneBlank(noticeid)){
            NoticeVo noticeVo = noticeService.findNoticeVObyId(noticeid);
            if(userinfo!=null){
                if(noticeVo!=null){
                    if(noticeVo.getUid().equals(userinfo.getUid())){
                        return noticeVo.getOrderid();
                    }
                }
            }
        }
        return null;
    }

    /**
     * 显示订单（查看订单）
     * @param noticeid
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "toshowNotice")
    public String toshowNotice(String noticeid,String op,HttpServletRequest request, HttpServletResponse response,ModelMap modelMap){
        HttpSession session = request.getSession();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Userinfo userinfo  = (Userinfo) session.getAttribute("userinfo");
        if(StringUtils.isNoneBlank(noticeid)){
            Order order =  goodsService.findOrder(noticeid);
            Sysnotice sysnotice = sysnoticeService.findSysnByQtid(order.getId());
            if (sysnotice!=null){
                modelMap.put("sysnotice",sysnotice);
            }
            if(order!=null){
                Express express = noticeService.findExpress(order.getId());
                if (express!=null){
                    modelMap.put("express",express);
                }
                Goods goods = goodsService.findGoodsById(order.getGoodsid());
                if(order.getState()==0){
                    order.setStateStr("已付款");
                }else if(order.getState()==1){
                    order.setStateStr("未付款");
                }else if (order.getState()==2){
                    order.setStateStr("已付款，商家已发货");
                }
                if(order.getBuydate()!=null){
                    order.setBuydateStr(sdf.format(order.getBuydate()));
                }
                modelMap.put("order",order);
                if(goods!=null){
                    Userinfo userinfo1 = userService.findUserInfo(goods.getUinfoid());
                    if(goods.getType()==0){
                        goods.setTypeStr("水果");
                        System.out.println();
                    }else if(goods.getType()==1){
                        goods.setTypeStr("蔬菜");
                    }else if(goods.getType()==2){
                        goods.setTypeStr("农林");
                        System.out.println();
                    }else if(goods.getType()==3){
                        goods.setTypeStr("其他");
                    }
                    modelMap.put("goods",goods);
                }
            }
        }
        if(userinfo!=null){
            //补充userinfo，尽量不使用session,避免查看订单因为session失效
            modelMap.put("uinfo",userinfo);
        }


        return  "modules/ui/showNotices";
    }

    /**
     * 商家点击发货按钮后，进行表格更新，更新order的state为2
     * 插入express快递数据，插入sysnotice系统通知数据
     * @param id
     * @param kdmc
     * @param kddh
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "updateNotice")
    @ResponseBody
    public String UpdateNotice(String id,String kdmc ,String kddh ,HttpServletRequest request, HttpServletResponse response ){
        HttpSession session = request.getSession();
        NoticeVo noticeVo = new NoticeVo();
        Userinfo userinfo  = (Userinfo) session.getAttribute("userinfo");
        if (StringUtils.isNoneBlank(id)){
             noticeVo =  noticeService.findNoticeVObyId(id);
        }
        Sysnotice sysnotice = new Sysnotice();
        sysnotice = sysnoticeService.getSysnotice(sysnotice,noticeVo);
        Express ex = new Express();
        Express express = noticeService.getExpress(ex,noticeVo);
        if (StringUtils.isNoneBlank(kdmc) && StringUtils.isNoneBlank(kddh)){
            sysnotice.setContent("您购买的【"+sysnotice.getTitle()+"】商品，卖家："+userinfo.getName()+"已发货；"+kdmc+"，快递单号："+kddh+"；请注意查收。");
            sysnotice.setTitle("商家发货信息通知");
            express.setName(kdmc);
            express.setKddh(kddh);
        }

        boolean flag = noticeService.saveNoticeVoandExpressandSysn(noticeVo,sysnotice,express);
        if (flag){
            return "ok";
        }
        return  null;
    }


    /**
     * 查看商品评价，通过NoticeVo通知，返回goodsid
     * @param id
     * @return
     */
    @RequestMapping(value = "getGoodsid")
    @ResponseBody
    public String getGoodsId(String id){
        if (StringUtils.isNoneBlank(id)){
           NoticeVo noticeVo =  noticeService.findNoticeVObyId(id);
            if (noticeVo!=null){
                return noticeVo.getGoodsid();
            }
        }
        return  null;
    }

    /**
     * 删除订单消息
     * @param id
     * @return
     */
    @RequestMapping(value = "removeNotice")
    @ResponseBody
    public String removeNotice(String id){
        if (StringUtils.isNoneBlank(id)){
            Notice notice = noticeService.findNotice(id);
            if (notice!=null){
                notice.setDelFlag(1);
                boolean flag = noticeService.saveNotice(notice);
                if (flag){
                    return "ok";
                }
            }
        }
        return  null;
    }



    /**************************************以下为管理员业务***************************************************************/
    /**
     * 查看商品评价，通过order订单，返回goodsid
     * @param id
     * @return
     */
    @RequestMapping(value = "getGoodsidByOrder")
    @ResponseBody
    public String getGoodsIdByOrder(String id){
        if (StringUtils.isNoneBlank(id)){
            Order order = noticeService.findOrder(id);
            if (order!=null){
                return order.getGoodsid();
            }
        }
        return  null;
    }


}
