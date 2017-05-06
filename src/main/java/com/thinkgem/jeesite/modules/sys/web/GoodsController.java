package com.thinkgem.jeesite.modules.sys.web;


import com.google.common.collect.Lists;
import com.thinkgem.jeesite.common.excel.ExportExcel;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.utils.ZxingHandler;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.agriculture.entity.*;
import com.thinkgem.jeesite.modules.sys.service.GoodsService;
import com.thinkgem.jeesite.modules.sys.service.SysnoticeService;
import com.thinkgem.jeesite.modules.sys.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by Zhangsnke on 2017/3/7.
 */
@Controller
@RequestMapping(value = "Goodscheck")
public class GoodsController extends BaseController {

    @Autowired
    GoodsService goodsService;

    @Autowired
    UserService userService;

    @Autowired
    SysnoticeService sysnoticeService;


    /**
     * 分页处理商品展示信息（默认只展示6个）
     * @param pageIndex
     * @param pageSize
     * @param request
     * @param response
     * @param modelMap
     * @return
     */
    @RequestMapping(value = "getGoodsPage")
    public String getGoodsPage(String type , String name,String pageIndex,String pageSize,HttpServletRequest request, HttpServletResponse response,ModelMap modelMap) {
        Goods goods = new Goods();
        HttpSession session = request.getSession();
        Userinfo uinfo = (Userinfo) session.getAttribute("userinfo");
        Admininfo admininfo = (Admininfo) session.getAttribute("admininfo");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

        if(StringUtils.isNoneBlank(pageIndex)){
            modelMap.put("pageIndex", Integer.parseInt(pageIndex));
        }
        if(StringUtils.isNoneBlank(pageSize)){
            modelMap.put("pageSize",Integer.parseInt(pageSize));
        }
        if(StringUtils.isNoneBlank(type)){
            int a = Integer.parseInt(type);
          goods.setType(a);
            modelMap.put("ranktype",a);
        }

        //解决location.href中文参数乱码问题

        if (StringUtils.isNoneBlank(name)){
            try {
                name = URLDecoder.decode(request.getParameter("name"), "utf-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            if (StringUtils.isNoneBlank(name)){
                String key = "%"+name+"%";
                goods.setName(key);
                modelMap.put("name",key);
            }
        }
        MiniPage ps = new MiniPage(request, response);
        MiniPage miniPage = goodsService.findGoodsByPage(ps, goods,modelMap);
        List<Goods> list = miniPage.getData();
        for (Goods goods1 : list) {
            if (StringUtils.isNoneBlank(goods1.getUinfoid())) {
                Userinfo userinfo = userService.findUserInfo(goods1.getUinfoid());
                if (userinfo != null && uinfo !=null) {
                    modelMap.put("goodsuser", userinfo);
                    Date date = goods1.getPostdate();
                    String datestr = sdf.format(date);
                    goods1.setPostDateStr(datestr);
                    goods1 = goodsService.getTypeansState(goods1);
                    if(uinfo.getName().equals(userinfo.getName())){
                        goods1.setShow("1");
                    }
                }
                System.out.println(goods1.toString());
            }
            modelMap.put("goods", list);
        }
        return "modules/ui/goodsIndex";
    }

    /**
     * 返回所要查看商品的id
     * @param title
     * @param modelMap
     * @return
     */
    @RequestMapping(value = "showgoodsInfo")
    @ResponseBody
    public String getGoodsInfo(String title,ModelMap modelMap){
       if(StringUtils.isNoneBlank(title)){
            Goods goods = goodsService.findGoodsByTitle(title);
            if(StringUtils.isNoneBlank(goods.getId())){
                return goods.getId();
            }
       }
        return "ok";
    }

    /**
     * 根据商品id获取商品信息，并跳转到商品信息页面
     * @param id
     * @param modelMap
     * @return
     */
    @RequestMapping(value = "toshowgoods")
    public String toshowGoodsInfo(String id, ModelMap modelMap){
        if(StringUtils.isNoneBlank(id)){
            Goods goods = goodsService.findGoodsById(id);
            goods = goodsService.getTypeansState(goods);
            Userinfo userinfo =goodsService.getUserinfoByGoods(goods);
            List<Evaluate> list= goodsService.getEvaluate(goods);
            int num =0;
            if(list!=null){
                for(Evaluate evaluate :list){
                    User user = goodsService.getUserByEvaluate(evaluate);
                    if (user!=null){
                        evaluate.setUsername(user.getUname());
                    }
                    if(evaluate.getPostdate()!=null){
                        evaluate.setPostdateStr(evaluate.getPostdate());
                        num += evaluate.getLevel();
                    }
                }
                //产品评分等级
                BigDecimal b1 = new BigDecimal(num);
                BigDecimal b2 = new BigDecimal(list.size());
                BigDecimal b3 = b1.divide(b2, 1, BigDecimal.ROUND_HALF_EVEN);
                modelMap.put("score",b3);
                b3 = b3.setScale(0, BigDecimal.ROUND_HALF_UP);
                modelMap.put("level",b3);
                modelMap.put("evaluate",list);
            }
            modelMap.put("goods",goods);
            modelMap.put("goodsuserinfo",userinfo);
            //文件保存目录路径
            String classpath = this.getClass().getResource("/").getPath().replaceFirst("/", "");
            String webappRoot = classpath.replaceAll("WEB-INF/classes/", "");
            String imgpath = webappRoot+"upload/QR/";
            String imgpath2 = imgpath+goods.getId()+".png";
            ZxingHandler.encode2(goods.toString(),100,100,imgpath2);
            String answer = ZxingHandler.decode2(imgpath2);
            if (StringUtils.isNoneBlank(answer)){
                System.out.println(answer);
                modelMap.put("answer",0);
            }else{
                modelMap.put("answer",1);
            }
        }
        return "modules/ui/goodsshow";
    }

    /**
     * 跳转到购物车中心
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "toshoppingcartIndex")
    public String toShoppingcart(HttpServletRequest request, HttpServletResponse response){
        return "modules/ui/shoppingcarIndex";
    }

    /**
     * 校验二维码（二维码编码）
     * @return
     */
    @RequestMapping(value = "checkQR")
    @ResponseBody
    public String checkQR(String goodsid){
        if (StringUtils.isNoneBlank(goodsid)){
            //文件保存目录路径
            String classpath = this.getClass().getResource("/").getPath().replaceFirst("/", "");
            String webappRoot = classpath.replaceAll("WEB-INF/classes/", "");
            String imgpath = webappRoot+"upload/QR/";
            String imgpath2 = imgpath+goodsid+".png";
            String img = ZxingHandler.decode2(imgpath2);
            return img;
        }
        return  null;
    }
    /**
     * 返回个人购物车
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "findUserShoppingCar")
    @ResponseBody
    public MiniPage findUserShoppingCar(String key,String rankType,HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession();
        Shoppingcart shoppingcart = new Shoppingcart();
        Userinfo userinfo  = (Userinfo) session.getAttribute("userinfo");
        if(StringUtils.isNoneBlank(userinfo.getUid())){
            shoppingcart.setUinfoid(userinfo.getUid());
        }
        if(StringUtils.isNoneBlank(rankType)){
            if("1".equals(rankType)){
                if(StringUtils.isNoneBlank(key)){
                   if(key.contains("已结算")){
                       shoppingcart.setState(1);
                   }else{
                       shoppingcart.setState(0);
                   }
                }
            }
            //商品名称模糊查询
            if("2".equals(rankType)){
                if(StringUtils.isNoneBlank(key)){
                    key = "%"+key+"%";

                }else{
                    key = null;
                }
                shoppingcart.setGoodstitle(key);
            }
            if("3".equals(rankType)){
                if(StringUtils.isNoneBlank(key)){
                    if(key.contains("水果")){
                        shoppingcart.setType(0);
                    }
                    if(key.contains("蔬菜")){
                        shoppingcart.setType(1);
                    }
                    if(key.contains("农林")){
                        shoppingcart.setType(2);
                    }
                    if(key.contains("其他")){
                        shoppingcart.setType(3);
                    }
                }
            }
        }
        MiniPage ps = new MiniPage(request, response);
        MiniPage miniPage = goodsService.findAllShoppingcart(ps,shoppingcart);
        return miniPage;
    }

    /**
     * 将商品加入购物车，保存shoppingcart表
     * @param goodsid
     * @param num
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "saveShopCart")
    @ResponseBody
    public String saveShoppingcart(String goodsid,String num,HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession();
        Shoppingcart shoppingcart = new Shoppingcart();
        Userinfo userinfo  = (Userinfo) session.getAttribute("userinfo");
        //购物车uinfoid
        if(StringUtils.isNoneBlank(userinfo.getUid())){
            shoppingcart.setUinfoid(userinfo.getUid());
        }
        //购物车num数量
        if(StringUtils.isNoneBlank(num)){
            shoppingcart.setNum(Integer.parseInt(num));
        }else{
            shoppingcart.setNum(1);
        }
        shoppingcart.setState(0);
        shoppingcart.setDel_flag(0);
        shoppingcart = goodsService.getShopCart(shoppingcart,goodsid);

        boolean flag = goodsService.SaveShoppingcart(shoppingcart);
        if(flag){
            return "ok";
        }
        return null;
    }


    /**
     * 根据购物车id查找goodsid,返回goodsid
     * @param id
     * @return
     */
    @RequestMapping(value = "getGoodsid")
    @ResponseBody
    public String getGoodsid(String id ){
        if(StringUtils.isNoneBlank(id)){
            Shoppingcart shoppingcart = goodsService.findShopCart(id);
            if(StringUtils.isNoneBlank(shoppingcart.getGoodsid())){
                return   shoppingcart.getGoodsid();
            }
        }
        return null;
    }

    /**
     * 根据订单id查找goodsid,返回goodsid
     * @param id
     * @return
     */
    @RequestMapping(value = "getGoodsidByOrder")
    @ResponseBody
    public String getGoodsidByOrder(String id ){
        if(StringUtils.isNoneBlank(id)){
            Order order = goodsService.findOrder(id);
            if(StringUtils.isNoneBlank(order.getGoodsid())){
                return   order.getGoodsid();
            }
        }
        return null;
    }

    /**
     * 删除购物车中心的购物车信息，通过id
     * @param id
     * @return
     */
    @RequestMapping("removeShopcart")
    @ResponseBody
    public String removeShopcart(String id){
        if(StringUtils.isNoneBlank(id)){
            boolean flag = goodsService.removeShopcart(id);
            if(flag){
                return "ok";
            }
        }
        return null;
    }

    /**
     * 更新购物车商品数量
     * @param id
     * @param num
     * @return
     */
    @RequestMapping(value = "updateShopcart")
    @ResponseBody
    public String updateShopCart(String id,String num){
        if(StringUtils.isNoneBlank(id)){
            Shoppingcart shoppingcart = goodsService.findShopCart(id);
            if (StringUtils.isNoneBlank(num)){
                shoppingcart.setNum(Integer.parseInt(num));
            }
            goodsService.UpdateShopCart(shoppingcart);
        }
        return "ok";
    }

    /**
     * 跳转到购买页面
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "toBought")
    public String toBought(String id ,String num,HttpServletRequest request, HttpServletResponse response,ModelMap modelMap){
        HttpSession session = request.getSession();
        Userinfo userinfo1 = (Userinfo) session.getAttribute("userinfo");
        if(StringUtils.isNoneBlank(id)){
            Goods goods = goodsService.findGoodsById(id);
            goods = goodsService.getTypeansState(goods);
            Userinfo userinfo =goodsService.getUserinfoByGoods(goods);
            modelMap.put("goods",goods);
            modelMap.put("goodsuserinfo",userinfo);
            modelMap.put("user",userinfo1);
            if(StringUtils.isNoneBlank(num)){
                modelMap.put("goodsnum",num);
            }
        }
        return "modules/ui/bought";
    }


    /**
     * 返回个人订单
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "findOrdersByPage")
    @ResponseBody
    public MiniPage findOrdersByPage(String key,String rankType,String op,HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession();
        Order order = new Order();
        Userinfo userinfo = new Userinfo();
        if (StringUtils.isNoneBlank(op)){
            if ("2".equals(op)){
                userinfo  = (Userinfo) session.getAttribute("userinfo");
            }
        }
        if(StringUtils.isNoneBlank(userinfo.getUid())){
            order.setUid(userinfo.getUid());
        }
        if(StringUtils.isNoneBlank(rankType)){
            if("1".equals(rankType)){
                if(StringUtils.isNoneBlank(key)){
                    if(key.contains("已付")){
                        order.setState(0);
                    }else if(key.contains("已收")){
                        order.setState(3);
                    }else if(key.contains("未")){
                        order.setState(1);
                    }else if(key.contains("等待收")){
                        order.setState(2);
                    }else if(key.contains("已完")){
                        order.setState(4);
                    }
                }
            }
            //订单名称模糊查询
            if("2".equals(rankType)){
                if(StringUtils.isNoneBlank(key)){
                    key = "%"+key+"%";
                    System.out.println(key);
                }else{
                    key = null;
                }
                order.setGoodstitle(key);
            }

            if("3".equals(rankType)){
                if(StringUtils.isNoneBlank(key)){
                    key = "%"+key+"%";
                    System.out.println(key);
                }else{
                    key = null;
                }
                order.setId(key);
            }

        }
        MiniPage ps = new MiniPage(request, response);
        MiniPage miniPage = goodsService.findAllOrders(ps,order);

        return miniPage ;
    }

    /**
     * 导出成Excel
     * @param request
     * @param response
     */
    @RequestMapping(value = "getEXCCC")
    @ResponseBody
    public void Exp(HttpServletRequest request, HttpServletResponse response){
        List<Order> orders = goodsService.findAllOrder();
        String headers="编号,订单号,买家用户编号,商品编号,商品名称,下单日期,商品数量,订单金额";
        //设置数据行
        List<List<String>> dataList = Lists.newArrayList();
        Order o = null;
        List<String> dataRows = null;
        for(int i=0;i<orders.size();i++){
            o = orders.get(i);
            //数据行好头部一一对应
            dataRows = Lists.newArrayList();
            dataRows.add((i+1)+"");
            dataRows.add(StringUtils.toStr("s","",o.getId()));
            dataRows.add(StringUtils.toStr("s","",o.getUid()));
            dataRows.add(StringUtils.toStr("s","",o.getGoodsid()));
            dataRows.add(StringUtils.toStr("s","",o.getGoodstitle()));
            dataRows.add(StringUtils.toStr("d","",o.getBuydate()));
            dataRows.add(String.valueOf(o.getNum()));
            dataRows.add(String.valueOf(o.getTotal()));
            dataList.add(dataRows); //一行数据
        }
        ExportExcel.ExpExc("订单列表.xlsx","订单信息数据", headers,dataList,response);



    }


    /**
     * 用户下单，保存order表
     * @param goodsid
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "boughtGoods")
    @ResponseBody
    public String boughtGoods(String goodsid,String num,HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession();
        String uname = request.getParameter("uname");
        String umoblie = request.getParameter("umoblie");
        String uaddress = request.getParameter("uaddress");
        String uphone = request.getParameter("uphone");
        String state = request.getParameter("state");
        String balance =request.getParameter("balance");
        String total = request.getParameter("total");
        Userinfo userinfo  = (Userinfo) session.getAttribute("userinfo");
        Order order = new Order();
        double price = 0;
        if(StringUtils.isNoneBlank(uname)){
            order.setUname(uname);
        }else if(StringUtils.isNoneBlank(userinfo.getName())){
            order.setUname(userinfo.getName());
        }

        if(StringUtils.isNoneBlank(umoblie)){
            order.setMoblie(umoblie);
        }else if(StringUtils.isNoneBlank(userinfo.getMoblie())){
            order.setMoblie(userinfo.getMoblie());
        }
        if(StringUtils.isNoneBlank(uphone)){
            order.setPhone(uphone);
        }else if(StringUtils.isNoneBlank(userinfo.getPhone())){
            order.setPhone(userinfo.getPhone());
        }

        if(StringUtils.isNoneBlank(uaddress)){
            order.setAddress(uaddress);
        }else if(StringUtils.isNoneBlank(userinfo.getAddress())){
            order.setAddress(userinfo.getAddress());
        }

        if(StringUtils.isNoneBlank(goodsid)){
            Goods goods = goodsService.findGoodsById(goodsid);
            //获得商品单价；
            price = goods.getPrice();
            if(goods!=null){
                order.setGoodsid(goods.getId());
                order.setGoodstitle(goods.getName());
            }
        }
        //更新用户信息
        if(StringUtils.isNoneBlank(state)){
            if("0".equals(state)){
                order.setState(0);
                if(userinfo!=null){
                    order.setUid(userinfo.getUid());
                }
            }else if("1".equals(state)||"2".equals(state)){
                order.setState(1);
                if(userinfo!=null){
                    order.setUid(userinfo.getUid());
                }
            }
        }
        Order order1 = goodsService.getOrder(order);
        if(StringUtils.isNoneBlank(total) && StringUtils.isNoneBlank(num)){
            order1.setNum(Integer.parseInt(num));
//             total = Integer.parseInt(num)*price;
            double totals = Double.parseDouble(total);
            order1.setTotal(totals);
        }
        Notice notice = new Notice();
        Notice notice1 = goodsService.getNotice(notice,order1);
        boolean flag = goodsService.saveOrderandNotice(order1,notice1);
        if(flag){
            if("0".equals(state)){
                if(userinfo!=null){
                    userinfo.setBalance(Double.parseDouble(balance));
                    userService.UpdateUserinfo(userinfo);
                }
            }
           return "ok";
        }
        return null;
    }

    /**
     * 删除购物车中心的订单信息，通过id
     * @param id
     * @return
     */
    @RequestMapping("removeOrder")
    @ResponseBody
    public String removeOrder(String id){
        if(StringUtils.isNoneBlank(id)){
            boolean flag = goodsService.removeOrder(id);
            if(flag){
                return "ok";
            }
        }
        return null;
    }


    /**
     * 获取当前用户的balance
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "getBalance")
    @ResponseBody
    public Double getBalance(HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession();
        Userinfo userinfo  = (Userinfo) session.getAttribute("userinfo");
        if(userinfo!=null){
            Userinfo userinfo1 = userService.findUserInfo(userinfo.getUid());
            if(userinfo1!=null){
                return userinfo1.getBalance();
            }
        }
        return null;
    }

    /**
     * 在交易中心的订单列表中付款(更新order)
     * @param orderid
     * @param state
     * @return
     */
    @RequestMapping(value = "updateOrder")
    @ResponseBody
    public String updateOrder(String orderid,String state,String balance,HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession();
        Userinfo userinfo  = (Userinfo) session.getAttribute("userinfo");
        if(userinfo!=null){
            if(StringUtils.isNoneBlank(orderid)){
                Order order = goodsService.findOrder(orderid);
                if(StringUtils.isNoneBlank(state)){
                    if("0".equals(state)){
                        //付款状态
                        order.setState(0);
                        //goodsService.updateOrder(order);
                        boolean flag =  goodsService.updateOrderandbalance(order,userinfo,balance);
                        if(flag){
                            return "ok";
                        }
                    }
                }
            }
        }
        return null;

    }

    /**
     * 查找是否存在该订单
     * @param orderid
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "checkOrder")
    @ResponseBody
    public String checkOrder(String orderid,HttpServletRequest request, HttpServletResponse response){
        HttpSession session =request.getSession();
        Userinfo userinfo  = (Userinfo) session.getAttribute("userinfo");
        if(StringUtils.isNoneBlank(orderid)){
            Order order = goodsService.findOrder(orderid);
            if(userinfo!=null){
                if(order!=null){
                    if(order.getUid().equals(userinfo.getUid())){
                        return orderid;
                    }
                }
            }
        }
        return null;
    }

    /**
     * 显示订单（查看订单）
     * @param orderid
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "toshowOrders")
    public String toshowOrders(String orderid,HttpServletRequest request, HttpServletResponse response,ModelMap modelMap){
        HttpSession session = request.getSession();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Userinfo userinfo  = (Userinfo) session.getAttribute("userinfo");
        if(StringUtils.isNoneBlank(orderid)){
           Order order =  goodsService.findOrder(orderid);
            if(order!=null){
                if(order.getBuydate()!=null){
                    order.setBuydateStr(sdf.format(order.getBuydate()));
                }
                if(order.getState()==0){
                    order.setStateStr("已付款，等待商家发货");
                }else if(order.getState()==1){
                    order.setStateStr("等待付款");
                }else if(order.getState()==2){
                    order.setStateStr("商家已发货，等待收货");
                }
                modelMap.put("order",order);
                Goods goods = goodsService.findGoodsById(order.getGoodsid());
                if(goods!=null){
                    if(goods.getType()==0){
                        goods.setTypeStr("水果");
                    }else if(goods.getType()==1){
                        goods.setTypeStr("蔬菜");
                        System.out.println();
                    }else if(goods.getType()==2){
                        goods.setTypeStr("农林");
                    }else if(goods.getType()==3){
                        goods.setTypeStr("其他");
                    }
                    modelMap.put("goods",goods);
                    Userinfo userinfo1 = userService.findUserInfo(goods.getUinfoid());
                    if(userinfo1!=null){
                        modelMap.put("goodsuserinfo",userinfo1);
                    }
                }
            }
        }
        if(userinfo!=null){
            //补充userinfo，尽量不适用session,避免查看订单因为session失效
            modelMap.put("uinfo",userinfo);
        }
        return  "modules/ui/showOrders";
    }

    /**
     * 支付前校验用户密码
     * 返回02，session过期，重新登录
     * 返回03 ，密码错误
     * @param pwd
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "checkPWd")
    @ResponseBody
    public String checkPwd(String pwd,HttpServletRequest request, HttpServletResponse response){
        HttpSession session =request.getSession();
        Userinfo userinfo  = (Userinfo) session.getAttribute("userinfo");
        if(StringUtils.isNoneBlank(pwd)){
            if (userinfo!=null){
                 User user = userService.findOne(userinfo.getUid());
                if(user!=null){
                    if(user.getPwd().equals(pwd)){
                        return "ok";
                    }else{
                        return "03";
                    }
                }else{
                    return "02";
                }
            }else{
                return "02";
            }
        }
        return null;
    }

    /**
     * 跳转到新增商品页面
     * @param request
     * @param response
     * @param modelMap
     * @return
     */
    @RequestMapping(value = "toaddGoods")
    public String toaddGoods(HttpServletRequest request, HttpServletResponse response,ModelMap modelMap){
        HttpSession session =request.getSession();
        Userinfo userinfo  = (Userinfo) session.getAttribute("userinfo");
        if (userinfo!=null){
            modelMap.put("userinfo",userinfo);
        }
        return "modules/ui/addGoods";
    }

    /**
     * 保存新增商品
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "saveGoods")
    @ResponseBody
    public String saveGoods(HttpServletRequest request, HttpServletResponse response){
        HttpSession session =request.getSession();
        Userinfo userinfo  = (Userinfo) session.getAttribute("userinfo");
        String photo = request.getParameter("photo");
        String miaoshu = request.getParameter("miaoshu");
        String title = request.getParameter("title");
        String num = request.getParameter("num");
        String type = request.getParameter("type");
        String typeStr = request.getParameter("typeStr");
        String price = request.getParameter("price");
        String address = request.getParameter("address");
        String operate = request.getParameter("operate");
        Goods goods = new Goods();
        if (StringUtils.isNoneBlank(operate)){
            goods = goodsService.findGoodsById(operate);
        }

        if (StringUtils.isNoneBlank(title)){
            goods.setName(title);
        }
        if (StringUtils.isNoneBlank(photo)){
            //兼容图片排版
           photo =  photo.replace("/>","style=\"width:100%;height:100%\" />");
            goods.setPhoto(photo);
        }
        if(StringUtils.isNoneBlank(miaoshu)){
            //设置上传图片最大值（MW:850px MH:600px）
            miaoshu = miaoshu.replace("/>","style=\"max-width:850px;max-height:600px\"/>");

            goods.setMiaoshu(miaoshu);
        }
        if(StringUtils.isNoneBlank(typeStr)){
            goods.setTypeStr(typeStr);
        }
        if (StringUtils.isNoneBlank(type)){
            goods.setType(Integer.parseInt(type));
        }
        if (StringUtils.isNoneBlank(price)){
            goods.setPrice(Double.parseDouble(price));
        }
        if (StringUtils.isNoneBlank(address)){
            goods.setAddress(address);
        }
        if (StringUtils.isNoneBlank(num)){
            goods.setNum(Integer.parseInt(num));
        }
        if(userinfo!=null){
            goods.setUinfoid(userinfo.getUid());
        }

        Goods goods1 = goodsService.getGoods(goods);

        boolean flag = goodsService.saveGoods(goods1);
        if (flag){
            return "ok";
        }
        return null;
    }

    /**
     *
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "tomygoodsIndex")
    public String toMyGoodsIndex(HttpServletRequest request, HttpServletResponse response,ModelMap modelMap){
        HttpSession session =request.getSession();
        Userinfo userinfo  = (Userinfo) session.getAttribute("userinfo");
        if (userinfo!=null){
            modelMap.put("userinfo",userinfo);
        }
        return  "modules/ui/mygoodsIndex";
    }

    /**
     * 返回个人商品
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "findMyGoodsPage")
    @ResponseBody
    public MiniPage findMyGoodsPage(String key,String rankType,HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession();
        Goods goods = new Goods();
        Userinfo userinfo  = (Userinfo) session.getAttribute("userinfo");
        if(userinfo!=null && StringUtils.isNoneBlank(userinfo.getUid())){
            goods.setUinfoid(userinfo.getUid());
        }
        if(StringUtils.isNoneBlank(rankType)){
            if(StringUtils.isNoneBlank(key)){
                if (rankType.equals("1")){
                    key = "%"+key+"%";
                    goods.setId(key);
                }else if(rankType.equals("2")){
                    key = "%"+key+"%";
                    goods.setName(key);
                }else if(rankType.equals("3")){
                    if (key.contains("水果")){
                        goods.setType(0);
                    }else if(key.contains("蔬菜")){
                        goods.setType(1);
                    }else if (key.contains("农林")){
                        goods.setType(2);
                    }else if(key.contains("其他")){
                        goods.setType(3);
                    }
                }else if(rankType.equals("4")){
                    if (key.contains("在售")){
                        goods.setState(0);
                    }else if(key.contains("下架")){
                        goods.setState(1);
                    }else if(key.contains("已售")){
                        goods.setState(2);
                    }
                }
            }

        }

        MiniPage ps = new MiniPage(request, response);
        MiniPage miniPage = goodsService.findMyGoodsPage(ps,goods);
        return miniPage;
    }


    /**
     * 删除个人中心的商品信息，通过id
     * @param id
     * @return
     */
    @RequestMapping("removeGoods")
    @ResponseBody
    public String removeGoods(String id){
        if(StringUtils.isNoneBlank(id)){
            boolean flag = goodsService.removeGoods(id);
            if(flag){
                return "ok";
            }
        }
        return null;
    }

    /**
     * 跳转到修改商品信息页面
     * @param id
     * @param modelMap
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "editGoods")
    public String editGoods(String id ,ModelMap modelMap,HttpServletRequest request, HttpServletResponse response){
        if (StringUtils.isNoneBlank(id)){
            Goods goods = goodsService.findGoodsById(id);
            modelMap.put("goods",goods);
            //操作命令，保存时辨别是新增还是修改
            modelMap.put("operate",goods.getId());
        }
        HttpSession session = request.getSession();
        Userinfo userinfo  = (Userinfo) session.getAttribute("userinfo");
        if (userinfo!=null){
            modelMap.put("userinfo",userinfo);
        }

        return "modules/ui/addGoods";
    }

    /**
     * 确定收货，更改Order的状态，2-->3
     * @param id
     * @param modelMap
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "getGoods")
    @ResponseBody
    public String getGoods(String id,ModelMap modelMap,HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession();
        Userinfo userinfo  = (Userinfo) session.getAttribute("userinfo");
        if(userinfo!=null) {
            if (StringUtils.isNoneBlank(id)) {
                Order order =goodsService.findOrder(id);
                if (order!=null){
                    if (order.getState()==2){
                        order.setState(3);
                        boolean flag = goodsService.updateOrderState(order);
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
     * 跳转到商品评价
     * @param request
     * @param response
     * @param modelMap
     * @return
     */
    @RequestMapping(value = "toEvaluate")
    public String toEvaluate(String orderid ,HttpServletRequest request, HttpServletResponse response,ModelMap modelMap){
        HttpSession session =request.getSession();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date =new Date();
        Userinfo userinfo  = (Userinfo) session.getAttribute("userinfo");
        if (userinfo!=null){
            modelMap.put("userinfo",userinfo);
        }
        if (StringUtils.isNoneBlank(orderid)){
            Order order = goodsService.findOrder(orderid);
            if (order!=null){
                Goods goods = goodsService.findGoodsById(order.getGoodsid());
                if (goods.getType()==0){
                    goods.setTypeStr("水果");
                }else if(goods.getType()==2){
                    goods.setTypeStr("农林");
                }else if(goods.getType()==3){
                    goods.setTypeStr("其他");
                }else if (goods.getType()==1){
                    goods.setTypeStr("蔬菜");
                }
                modelMap.put("goods",goods);
                order.setStateStr("正在评价商品");
                if(order.getBuydate()!=null){
                    order.setBuydateStr(sdf.format(date));
                }
                modelMap.put("order",order);
            }
        }
        return "modules/ui/addevaluate";
    }

    /**
     * 添加商品评价
     * @param pf
     * @param pj
     * @return
     */
    @RequestMapping(value = "addEvaluate")
    @ResponseBody
    public String addEvaluate(String pf,String pj,String goodsid ,String orderid,HttpServletRequest request, HttpServletResponse response){
        Evaluate evaluate = new Evaluate();
        Sysnotice sysnotice = new Sysnotice();
        HttpSession session =request.getSession();
        Userinfo userinfo  = (Userinfo) session.getAttribute("userinfo");
        if (StringUtils.isNoneBlank(pf)){
            evaluate.setLevel(Integer.parseInt(pf));
        }
        if (StringUtils.isNoneBlank(pj)){
            evaluate.setEvaluate(pj);
            goodsService.changeEvaluate(evaluate);
        }
        if (userinfo!=null){
            evaluate.setUid(userinfo.getUid());
            evaluate.setUsername(userinfo.getName());
            if (StringUtils.isNoneBlank(goodsid)){
                evaluate.setGoodsid(goodsid);
                Goods goods = goodsService.findGoodsById(goodsid);
                if (goods!=null){
                     sysnotice = sysnoticeService.getSysnoticeByPj(userinfo,goods);
                }
            }
        }
        evaluate = goodsService.getEvaluate(evaluate);
        if (StringUtils.isNoneBlank(orderid)){
            Order order = goodsService.findOrder(orderid);
            if (order!=null && sysnotice!=null){
                boolean flag = goodsService.saveEvaluateandOrder(evaluate,order,sysnotice);
                if (flag){
                    return "ok";
                }
            }

        }
        return null;
    }


    /************************************以下为管理员模块的商品Controller*****************************************************/
    /**
     * 返回个人商品
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "findAllGoodsPage")
    @ResponseBody
    public MiniPage findAllGoodsPage(String key,String rankType,HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession();
        Goods goods = new Goods();
        if(StringUtils.isNoneBlank(rankType)){
            if(StringUtils.isNoneBlank(key)){
                if (rankType.equals("1")){
                    key = "%"+key+"%";
                    goods.setId(key);
                }else if(rankType.equals("3")){
                    if (key.contains("水果")){
                        goods.setType(0);
                    }else if(key.contains("蔬菜")){
                        goods.setType(1);
                    }else if(key.contains("其他")){
                        goods.setType(3);
                    }else if (key.contains("农林")){
                        goods.setType(2);
                    }
                }else if(rankType.equals("2")){
                    key = "%"+key+"%";
                    goods.setName(key);
                }else if(rankType.equals("4")){
                    if (key.contains("在售")){
                        goods.setState(0);
                    }else if(key.contains("已售")){
                        goods.setState(2);
                    }else if(key.contains("下架")){
                        goods.setState(1);
                    }
                }
            }
        }
        MiniPage ps = new MiniPage(request, response);
        MiniPage miniPage = goodsService.findMyGoodsPage(ps,goods);
        return miniPage;
    }


    /**
     * 管理员账户跳转到管理员商品信息管理页面
     * @param request
     * @param response
     * @param modelMap
     * @return
     */
    @RequestMapping(value = "toadmingoods")
    public String toadmingoodsIndex(HttpServletRequest request, HttpServletResponse response , ModelMap modelMap){
        HttpSession session = request.getSession();
        Admininfo admininfo = (Admininfo) request.getAttribute("admininfo");
        if (admininfo!=null){
            modelMap.put("admininfo",admininfo);
        }
        return "modules/ui/admingoodsIndex";

    }

    /**
     *更新商品信息，添加操作通知
     * @param id
     * @param adminid
     * @param rank
     * @param operate
     * @param yy
     * @return
     */
    @RequestMapping(value = "updateGoodsByAd")
    @ResponseBody
    public String updateGoodsByAd(String id,String adminid,String rank,String operate,String yy){
        if (StringUtils.isNoneBlank(adminid)){
            Admininfo admininfo = userService.findAdminInfo(adminid);
            if (StringUtils.isNoneBlank(id) && StringUtils.isNoneBlank(rank) ){
                Goods goods = goodsService.findGoodsById(id);
                if (goods!=null){
                    if (StringUtils.isNoneBlank(yy) && StringUtils.isNoneBlank(operate)){
                       boolean flag =  goodsService.updateGoodsandSaveSn(admininfo,goods,rank,operate,yy);
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
     * 跳转到管理员订单页面
     * @param request
     * @param response
     * @param modelMap
     * @return
     */
    @RequestMapping(value = "toadminOrderIndex")
    public String toadminOrderIndex(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap){
        HttpSession session = request.getSession();
        Admininfo admininfo = (Admininfo) session.getAttribute("admininfo");
        modelMap.put("admininfo",admininfo);
        return "modules/ui/adminorderIndex";
    }


    /**
     * 管理员删除订单，给用户插入一条信息
     * @param id
     * @param adminid
     * @return
     */
    @RequestMapping("removeOrderByAd")
    @ResponseBody
    public String removeOrderByAd(String id,String adminid){
        if(StringUtils.isNoneBlank(adminid) && StringUtils.isNoneBlank(id)){
            Admininfo admininfo = userService.findAdminInfo(adminid);
            Order order = goodsService.findOrder(id);
            if (order!=null && admininfo !=null){
                boolean flag = goodsService.removeOrderandSaveSn(admininfo,order,id);
                if (flag){
                    return "ok";
                }
            }

        }

        return null;
    }


    /**
     * 跳转到管理员回收站
     * @param request
     * @param response
     * @param modelMap
     * @return
     */
    @RequestMapping(value = "toRecovery")
    public String toRecovery(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap){
        HttpSession session = request.getSession();
        Admininfo admininfo = (Admininfo) session.getAttribute("admininfo");
        modelMap.put("admininfo",admininfo);
        return "modules/ui/adminRecovery";
    }



    /**
     * 返回所有已被删除的商品信息
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "findDeleteGoodsPage")
    @ResponseBody
    public MiniPage findDeleteGoodsPage(String key,String rankType,HttpServletRequest request, HttpServletResponse response){

        Goods goods = new Goods();
        if(StringUtils.isNoneBlank(rankType)){
            if(StringUtils.isNoneBlank(key)){
                if (rankType.equals("1")){
                    key = "%"+key+"%";
                    goods.setId(key);
                }else if(rankType.equals("4")){
                    if(key.contains("下架")){
                        goods.setState(1);
                    }else if(key.contains("已售")){
                        goods.setState(2);
                    }else if (key.contains("在售")){
                        goods.setState(0);
                    }
                }else if(rankType.equals("2")){
                    key = "%"+key+"%";
                    goods.setName(key);
                }else if(rankType.equals("3")){
                    if (key.contains("水果")){
                        goods.setType(0);
                    }else if (key.contains("农林")){
                        goods.setType(2);
                    }else if(key.contains("其他")){
                        goods.setType(3);
                    }else if(key.contains("蔬菜")){
                        goods.setType(1);
                    }
                }
            }

        }
        MiniPage ps = new MiniPage(request, response);
        MiniPage miniPage = goodsService.findDeleteGoodsPage(ps,goods);
        return miniPage;
    }


    /**
     * 返回已删除的订单
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "findDeleteOrders")
    @ResponseBody
    public MiniPage findDeleteOrders(String key,String rankType,HttpServletRequest request, HttpServletResponse response){
        Order order = new Order();
        Userinfo userinfo = new Userinfo();
        if(StringUtils.isNoneBlank(userinfo.getUid())){
            order.setUid(userinfo.getUid());
        }
        if(StringUtils.isNoneBlank(rankType)){
            if("1".equals(rankType)){
                if(StringUtils.isNoneBlank(key)){
                    if(key.contains("已付")){
                        order.setState(0);
                    }else if(key.contains("已收")){
                        order.setState(3);
                    }else if(key.contains("未")){
                        order.setState(1);
                    }else if(key.contains("等待收")){
                        order.setState(2);
                    }else if(key.contains("已完")){
                        order.setState(4);
                    }
                }
            }
            //订单名称模糊查询
            if("3".equals(rankType)){
                if(StringUtils.isNoneBlank(key)){
                    key = "%"+key+"%";
                    System.out.println(key);
                }else{
                    key = null;
                }
                order.setGoodstitle(key);
            }

            if("2".equals(rankType)){
                if(StringUtils.isNoneBlank(key)){
                    key = "%"+key+"%";
                    System.out.println(key);
                }else{
                    key = null;
                }
                order.setId(key);
            }

        }
        MiniPage ps = new MiniPage(request, response);
        MiniPage miniPage = goodsService.findADeleteOrders(ps,order);

        return miniPage ;
    }


    /**
     * 管理员回收被删除的商品信息
     * @param goodsid
     * @return
     */
    @RequestMapping(value = "rebackGoods")
    @ResponseBody
    public String rebackGoods(String goodsid){
        if (StringUtils.isNoneBlank(goodsid)){
            Goods goods = goodsService.findDeleteGoodsById(goodsid);
            if (goods!=null){

                boolean flag = goodsService.rebackGoods(goods);
                if (flag){
                    return "ok";

                }
            }
        }
        return null;
    }

    /**
     * 从回收站删除Goods这条数据
     * @param goodsid
     * @return
     */
    @RequestMapping(value = "deleteGoods")
    @ResponseBody
    public String deleteGoods(String goodsid){
        if (StringUtils.isNoneBlank(goodsid)){
            Goods goods = goodsService.findDeleteGoodsById(goodsid);
            if (goods!=null){
              boolean flag = goodsService.ReadlDeleteGoods(goods);
              if (flag){
                  return "ok";
              }
            }
        }
        return null;
    }

    /**
     * 管理员回收被删除的订单信息
     * @param orderid
     * @return
     */
    @RequestMapping(value = "rebackOrders")
    @ResponseBody
    public String rebackOrders(String orderid){
        if (StringUtils.isNoneBlank(orderid)){
            Order order = goodsService.findDeleteOrder(orderid);
            if (order!=null){
                boolean flag = goodsService.rebackOrders(order);
                if (flag){
                    return "ok";
                }
            }

        }
        return null;
    }

    /**
     * 从回收站删除Order这条数据
     * @param orderid
     * @return
     */
    @RequestMapping(value = "deleteOrders")
    @ResponseBody
    public String deleteOrders(String orderid){
        if (StringUtils.isNoneBlank(orderid)){
            Order order = goodsService.findDeleteOrder(orderid);
            if (order!=null){
                boolean flag = goodsService.RealDeleteOrder(order);
                if (flag){
                    return "ok";
                }
            }
        }
        return null;
    }

}
