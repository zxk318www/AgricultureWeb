package com.thinkgem.jeesite.modules.sys.service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.agriculture.entity.*;
import com.thinkgem.jeesite.modules.sys.dao.*;
import com.thinkgem.jeesite.modules.sys.web.MiniPage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by Zhangsnke on 2017/3/7.
 */
@Service
@Transactional(readOnly = true)
public class GoodsService {

    @Autowired
    UserService userService;

    @Autowired
    GoodsMapper goodsMapper;

    @Autowired
    UserinfoMapper userinfoMapper;

    @Autowired
    EvaluateMapper evaluateMapper;

    @Autowired
    UserMapper userMapper;

    @Autowired
    ShoppingcartMapper shoppingcartMapper;

    @Autowired
    OrderMapper orderMapper;

    @Autowired
    NoticeMapper noticeMapper;

    @Autowired
    SysnoticeService sysnoticeService;


    /**
     * 获取所有商品（商品列表）
     * @return
     */
    public List<Goods> findAllGoods(){
        List<Goods> list= goodsMapper.find(null);
        if(list.size()>0){
            return list;
        }
        return null;
    }

    /**
     * 按发布时间点获取前4条商品信息
     * @return
     */
    public List<Goods> findLastGoods(Goods goods){
        List<Goods> list = goodsMapper.findLastGoods(goods);
        if (list!=null && list.size()>0){
            return list;
        }
        return null;
    }

    /**
     * 获取所有订单
     * @return
     */
    public List<Order> findAllOrder(){
        List<Order> list = orderMapper.find(null);
        if (list.size()>0){
            return list;
        }
        return null;
    }

    /**
     * 对商品进行分页处理
     * @param mp
     * @param goods
     * @param modelMap
     * @return
     */
    public MiniPage findGoodsByPage(MiniPage mp,Goods goods,ModelMap modelMap){
        Page<Goods> page = new Page<Goods>();
        page.setPageNo(mp.getPageNo() + 1);
        page.setPageSize(mp.getPageSize());

        if("num".equals(mp.getSortField())){
            page.setOrderBy("t."+mp.getSortField()+" "+mp.getSortOrder());
        }else if("postdate".equals(mp.getSortField())){
            page.setOrderBy("t."+mp.getSortField()+" "+mp.getSortOrder());
        }
        goods.setPage(page);
        List<Goods> list = goodsMapper.findG(goods);
        if(list.size()!=0){
            for (Goods goods1 :list){
                System.out.println(goods1.toString());
            }
            mp.setData(list);
            mp.setTotal(list.size());
        }
        //求取总页数
        BigDecimal b1 = new BigDecimal(page.getCount());
        BigDecimal b2 = new BigDecimal(page.getPageSize());
        BigDecimal b3 = b1.divide(b2, 3, BigDecimal.ROUND_HALF_EVEN);
        b3 = b3.setScale(0, BigDecimal.ROUND_UP);
        System.out.println("总页数："+b3);
        modelMap.put("totalpages",b3);
        modelMap.put("totalgoods",page.getCount());
        return mp;
    }

    /**
     * 根据商品名称（title/name）查找商品信息
     * @param name
     * @return
     */
    public Goods findGoodsByTitle(String name){
        Goods goods = goodsMapper.findByTitle(name);
        if(goods!=null){
            return goods;
        }
        return  null;
    }

    /**
     * 根据商品id返回商品信息
     * @param id
     * @return
     */
    public Goods findGoodsById(String id){
        Goods goods = goodsMapper.findOne(id);
        if(goods!=null){
            return goods;
        }
        return null;
    }

    /**
     * 根据type获取对应类型str
     * @param goods
     * @return
     */
    public Goods getTypeansState(Goods goods){
        if(goods.getType()!=null){
            if(goods.getType()==0){
                goods.setTypeStr("水果");
            }
            if(goods.getType()==1){
                goods.setTypeStr("蔬菜");
            }
            if(goods.getType()==2){
                goods.setTypeStr("农林");
            }
            if(goods.getType()==3){
                goods.setTypeStr("其他");
            }
        }
        if(goods.getState()!=null){
            if(goods.getState()==0){
                goods.setStateStr("在售");
            }
            if(goods.getState()==1){
                goods.setStateStr("下架");
            }
            if(goods.getState()==2){
                goods.setStateStr("已售");
            }

        }
        return goods;
    }

    /**
     * 根据商品uinfoid获取Userinfo表信息
     * @param goods
     * @return
     */
    public Userinfo getUserinfoByGoods(Goods goods){
        if(StringUtils.isNoneBlank(goods.getUinfoid())){
          Userinfo userinfo =  userinfoMapper.findOne(goods.getUinfoid());
            if(userinfo!=null){
                return  userinfo;
            }
        }
        return null;
    }

    /**
     * 根据商品信息获得对应的evaluate（评价信息）
     * goods.id == evaluate.goodsid
     * @param goods
     * @return
     */
    public List<Evaluate> getEvaluate(Goods goods){
        Evaluate evaluate = new Evaluate();
        evaluate.setGoodsid(goods.getId());
        List<Evaluate> list = evaluateMapper.find(evaluate);
        if(list.size()>0){
            return list;
        }
        return null;
    }

    /**
     * 根据Evaluate获取user表信息
     * @param evaluate
     * @return
     */
    public User getUserByEvaluate(Evaluate evaluate){
        if(StringUtils.isNoneBlank(evaluate.getUid())){
            User user = userMapper.findOne(evaluate.getUid());
            if(user!=null){
                return  user;
            }
        }
        return null;
    }

    /**
     * 查询所有用户购物车
     * @return
     */
    public MiniPage findAllShoppingcart(MiniPage mp,Shoppingcart shoppingcart){
        Page<Shoppingcart> page = new Page<Shoppingcart>();
        page.setPageNo(mp.getPageNo() + 1);
        page.setPageSize(mp.getPageSize());

        if("num".equals(mp.getSortField())){
            page.setOrderBy("t."+mp.getSortField()+" "+mp.getSortOrder());
        }else if("addcardate".equals(mp.getSortField())){
            page.setOrderBy("t."+mp.getSortField()+" "+mp.getSortOrder());
        }
        System.out.println("t."+mp.getSortField()+" "+mp.getSortOrder());
        shoppingcart.setPage(page);
        List<Shoppingcart> list = shoppingcartMapper.find(shoppingcart);
        if(list.size()!=0){
            for (Shoppingcart car :list){
                    if(car.getState() ==0){
                        car.setStateStr("未结算");
                    }else if (car.getState() == 1){
                        car.setStateStr("已结算");
                    }
                    if(car.getType() == 0 ){
                        car.setTypeStr("水果");
                    }else if(car.getType() == 1){
                        car.setTypeStr("蔬菜");
                    }
                    else if(car.getType() == 2){
                        car.setTypeStr("农林");
                    }else if(car.getType() == 3){
                        car.setTypeStr("其他");
                    }

                System.out.println(car.toString());

            }
            mp.setTotal(page.getCount());
            mp.setData(list);
        }
        return mp;
    }

    /**
     * 保存购物车
     * @param shoppingcart
     * @return
     */
    @Transactional(readOnly = false)
    public boolean SaveShoppingcart(Shoppingcart shoppingcart){
        if(shoppingcart!=null){
            shoppingcartMapper.insert(shoppingcart);
            Shoppingcart shoppingcart1 = shoppingcartMapper.findOne(shoppingcart.getId());
            if(shoppingcart1!=null){
                return  true;
            }

        }
        return false;
    }

    /**
     * 根据shoppingcart id查找shoppingcart
     * @param id
     * @return
     */
    public Shoppingcart findShopCart(String id){
        Shoppingcart shoppingcart =shoppingcartMapper.findOne(id);
        if(shoppingcart!=null){
            return shoppingcart;
        }
        return null;
    }

    /**
     * 补全shoppingcart，通过shoppingcart和goodsid
     * @param shoppingcart
     * @param goodsid
     * @return
     */
    public Shoppingcart getShopCart(Shoppingcart shoppingcart,String goodsid){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        if(StringUtils.isNoneBlank(goodsid)){
            Goods goods = this.findGoodsById(goodsid);
            //购物车goodsid
            if(StringUtils.isNoneBlank(goods.getId())){
                shoppingcart.setGoodsid(goods.getId());
            }
            //购物车goodsTitle
            if(StringUtils.isNoneBlank(goods.getName())){
                shoppingcart.setGoodstitle(goods.getName());
            }
            //购物车type
            if(goods.getType()!=null){
                shoppingcart.setType(goods.getType());
            }
            //自动产生id
            Date date = new Date();
            SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMddHHms");
            String datestr = sdf1.format(date);
            int num = (int) (Math.random()*10000);
            String str = String.valueOf(num);
            int sub = (int) (Math.random()*8);
            str = datestr+str;
            str = str.substring(sub);
            String str1 = "sc00"+str;
            shoppingcart.setId(str1);
            Date date1 = new Date();
            String datestrs = sdf.format(date1);
            try {
                date1 = sdf.parse(datestrs);
                shoppingcart.setAddcardate(date1);
            } catch (ParseException e) {
                e.printStackTrace();
            }

        }
        return shoppingcart;
    }

    /**
     * 删除购物车信息通过id
     * @param id
     * @return
     */
    @Transactional(readOnly = false)
    public boolean removeShopcart(String id){
        shoppingcartMapper.deleteOne(id);
        Shoppingcart shoppingcart = shoppingcartMapper.findOne(id);
        if(shoppingcart==null){
            return true;
        }
        return false;
    }

    /**
     * 更新购物车的num
     * @param shoppingcart
     */
    @Transactional(readOnly = false)
    public void UpdateShopCart(Shoppingcart shoppingcart){
        if(shoppingcart!=null){
            shoppingcartMapper.update(shoppingcart);
        }
    }

    /**
     * 查找order编号
     * @param id
     * @return order
     */
    public Order findOrder(String id){
        if(StringUtils.isNoneBlank(id)){
           Order order = orderMapper.findOne(id);
            return order;
        }
        return null;
    }

    /**
     * 根据商品进行查找orders
     * @param goods
     * @return
     */
    public List<Order> findOrdersByGoods(Goods goods,String uid){
        Order order = new Order();
        if(goods!=null){
            if(StringUtils.isNoneBlank(goods.getId())){
                order.setGoodsid(goods.getId());
                if (StringUtils.isNoneBlank(uid)){
                    order.setUid(uid);
                }
               List<Order> list = orderMapper.find(order);
                if(list!=null){
                    return list;
                }
            }
        }
        return null;
    }

    /**
     * 查询用户所有订单
     * @return
     */
    public MiniPage findAllOrders(MiniPage mp,Order order){
        Page<Order> page = new Page<Order>();
        page.setPageNo(mp.getPageNo() + 1);
        page.setPageSize(mp.getPageSize());

        if("num".equals(mp.getSortField())){
            page.setOrderBy("t."+mp.getSortField()+" "+mp.getSortOrder());
        }else if("buydate".equals(mp.getSortField())){
            page.setOrderBy("t."+mp.getSortField()+" "+mp.getSortOrder());
        }else if("total".equals(mp.getSortField())){
            page.setOrderBy("t."+mp.getSortField()+" "+mp.getSortOrder());
        }

        System.out.println("t."+mp.getSortField()+" "+mp.getSortOrder());
        order.setPage(page);
        List<Order> list = orderMapper.find(order);
        if(list.size()!=0){
            for (Order order1 :list){
                if(order1.getState()!=null){
                    if(order1.getState()==0 || order1.getState()==2){
                        order1.setStateStr("已付款,等待商家发货");
                    }
                    if(order1.getState()==1){
                        order1.setStateStr("未付款");
                    }
                    if(order1.getState()==2){
                        order1.setStateStr("商家已发货，等待收货");
                    }
                    if(order1.getState()==3){
                        order1.setStateStr("已收货，等待评价");
                    }
                    if (order1.getState()==4){
                        order1.setStateStr("已完成评价");
                    }
                }
            }
            mp.setTotal(page.getCount());
            mp.setData(list);


        }
        return mp;
    }

    /**
     * 补全Order
     * @param order
     * @return
     */
    public Order getOrder(Order order){
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
        String str1 = "or00"+str;
        try {
            date = sdf.parse(dateStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        if(order != null){
            order.setBuydate(date);
            order.setId(str1);
            //默认订单下单为已付款
            order.setDelFlag(0);
            return order;
        }
        return null;
    }

    /**
     * 保存订单
     * @param order
     * @return
     */
    @Transactional(readOnly = false)
    public boolean saveOrder(Order order){
        if(order!=null){
            orderMapper.insert(order);
            if(StringUtils.isNoneBlank(order.getId())){
                Order order1 = orderMapper.findOne(order.getId());
                if(order1!=null){
                    return true;
                }
            }
        }
        return false;
    }

    /**
     * 删除订单信息通过id（只是更新del_flag）
     * 方便以后管理员进行操作
     * @param id
     * @return
     */
    @Transactional(readOnly = false)
    public boolean removeOrder(String id){
        Order order = orderMapper.findOne(id);
        if(order!=null){
            if(order.getDelFlag()!=null){
                order.setDelFlag(1);
                orderMapper.update(order);
            }
            Order order1 = orderMapper.findOne(id);
            if(order1==null){
                return true;
            }
        }
        return false;
    }

    /**
     * 更新Order
     * @param order
     */
    @Transactional(readOnly = false)
    public void updateOrder(Order order){
        if(order!=null){
            orderMapper.update(order);
        }
    }

    /**
     * 只更新order的状态
     * @param order
     * @return
     */
    @Transactional(readOnly = false)
    public boolean updateOrderState(Order order){
        if (order!=null){
            Order o =orderMapper.findOne(order.getId());
            if (o!=null){
                int a = o.getState();
                orderMapper.update(order);
                Order order1 = orderMapper.findOne(order.getId());
                if (order1.getState()!=a){
                    return true;
                }
            }
        }
        return false;
    }

    /**
     * 交易中心支付更新order，并插入notice数据,并且更新用户balance
     * @param order
     * @return
     */
    @Transactional(readOnly = false)
    public boolean updateOrderandbalance(Order order,Userinfo userinfo,String balance){
        int a = order.getState();
        this.updateOrder(order);
        Order order1 = orderMapper.findOne(order.getId());
        if(order1!=null){
            if(a==order1.getState()){
            if(StringUtils.isNoneBlank(balance)){
                //更新用户信息
                userinfo.setBalance(Double.parseDouble(balance));
                userService.UpdateUserinfo(userinfo);
            }
            return true;

            }
        }
        return false;
    }

    /**
     * 保存通知信息（传递给卖家）
     * @param notice
     * @return
     */
    @Transactional(readOnly = false)
    public boolean saveNotice(Notice notice){
        if(notice!=null){
            noticeMapper.insert(notice);
            Notice notice1 = noticeMapper.findNotice(notice.getId());
            if(notice1!=null){
                return  true;
            }
        }
        return false;
    }

    /**
     * 补全Notice,自动生成id
     * @param notice
     * @return
     */
    public Notice getNotice(Notice notice,Order order){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHmmss");
        Date date = new Date();
        String dateStr = sdf.format(date);
        int num = (int) (Math.random()*10000);
        String str = String.valueOf(num);
        int sub = (int) (Math.random()*8);
        str = dateStr+str;
        str = str.substring(sub);
        String str1 = "not00"+str;
        //设置id
        notice.setId(str1);
        notice.setDelFlag(0);
        //获取orderid
        if(order!=null){
            if(StringUtils.isNoneBlank(order.getId())){
                notice.setOrderid(order.getId());
            }
            if(StringUtils.isNoneBlank(order.getGoodsid())){
               Goods goods =  goodsMapper.findOne(order.getGoodsid());
                if(goods!=null){
                    if(StringUtils.isNoneBlank(goods.getUinfoid())){
                        //设置uid,根据orderid->goodsid->uid
                        notice.setUid(goods.getUinfoid());
                    }
                }
            }
        }
        return notice;
    }

    /**
     * 保存Order、notice
     * @param order
     * @param notice
     * @return
     */
    @Transactional(readOnly = false)
    public boolean saveOrderandNotice(Order order,Notice notice){
        if(order!=null && notice!=null){
            boolean flag = this.saveOrder(order);
            if(flag){
                boolean flag2 = this.saveNotice(notice);
                if (flag2){
                    return true;
                }
            }
        }
        return false;
    }

    /**
     * 自动补全id
     * @param goods
     * @return
     */
    public Goods getGoods(Goods goods){
        Date date = new Date();
        String dateStr = null;
        if (StringUtils.isBlank(goods.getId())){
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHmmss");
            dateStr = sdf.format(date);
            int num = (int) (Math.random()*10000);
            String str = String.valueOf(num);
            int sub = (int) (Math.random()*8);
            str = dateStr+str;
            str = str.substring(sub);
            String str1 = "g00"+str;
            goods.setId(str1);
        }
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String datestr = sdf1.format(date);
        goods.setPostDateStr(dateStr);
        try {
            date = sdf1.parse(datestr);
            goods.setPostdate(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        goods.setDel_flag(0);

        //暂定state 为0 ，后改为由管理员操作
        goods.setState(0);

        if(StringUtils.isBlank(goods.getPhoto())){
            String photostr = "<img src=\"/upload/image/20170320/20170320231055_506.jpg\" alt=\"\" style=\"width:100%;height:100%\" />";
            goods.setPhoto(photostr);
        }

        return goods;
    }


    /**
     * 保存goods(若已存在则更新，若无，则新增)
     * @param goods
     * @return
     */
    @Transactional(readOnly = false)
    public boolean saveGoods(Goods goods){
        if (goods!=null){
            Goods goods1 = goodsMapper.findOne(goods.getId());
            if(goods1!=null){
                goodsMapper.update(goods);
                return true;
            }else{
                goodsMapper.insert(goods);
                Goods goods2 = goodsMapper.findOne(goods.getId());
                    if (goods2!=null){
                        return  true;
                    }
                }
            }
        return false;
    }


    /**
     * 查询用户所有商品
     * @return
     */
    public MiniPage findMyGoodsPage(MiniPage mp,Goods goods) {
        Page<Goods> page = new Page<Goods>();
        page.setPageNo(mp.getPageNo() + 1);
        page.setPageSize(mp.getPageSize());

        if ("price".equals(mp.getSortField())) {
            page.setOrderBy("t." + mp.getSortField() + " " + mp.getSortOrder());
        } else if ("postdate".equals(mp.getSortField())) {
            page.setOrderBy("t." + mp.getSortField() + " " + mp.getSortOrder());
        }
        System.out.println("t." + mp.getSortField() + " " + mp.getSortOrder());
        goods.setPage(page);
        List<Goods> list = goodsMapper.find(goods);
        if (list.size() != 0) {
            for (Goods goods1 : list) {
                if (goods1.getState() != null) {
                    if (goods1.getState() == 0 ) {
                        goods1.setStateStr("上架");
                    }else if(goods1.getState()==1){
                        goods1.setStateStr("下架");
                    }else if(goods1.getState()==2){
                        goods1.setStateStr("已出售");
                    }
                }
                if(goods1.getType()!=null){
                    if (goods1.getType()==0){
                        goods1.setTypeStr("水果");
                    }else if(goods1.getType()==1){
                        goods1.setTypeStr("蔬菜");
                    }else if(goods1.getType()==3){
                        goods1.setTypeStr("其他");
                    }else if (goods1.getType()==2){
                        goods1.setTypeStr("农林");
                    }
                }
                mp.setTotal(page.getCount());
                mp.setData(list);
            }
            return mp;
        }
        return null;
    }


    /**
     * 删除商品信息通过id（只是更新del_flag）
     * 方便以后管理员进行操作
     * @param id
     * @return
     */
    @Transactional(readOnly = false)
    public boolean removeGoods(String id){
        Goods goods = goodsMapper.findOne(id);
        if(goods!=null){
            goods.setDel_flag(1);
            goodsMapper.update(goods);
            Goods goods1 = goodsMapper.findOne(id);
            if(goods1==null){
                return true;
            }
        }
        return false;
    }

    /**
     * 替换保存数据html
     * @param evaluate
     * @return
     */
    public Evaluate changeEvaluate(Evaluate evaluate){
        if(StringUtils.isNoneBlank(evaluate.getEvaluate())){
            String str = evaluate.getEvaluate();
            str = str.replace("&lt;","<");
            str = str.replace("&quot;","\"");
            str = str.replace("&qpos;","\'");
            str = str.replace("&gt;",""+'>');
            str = str.replace("&amp;","&");
            str = str.replace("/>","style=\"max-width:120px; max-height:90px\"/>");
            str = str.replace(".gif\" border=\"0\" alt=\"\" style=\"width:120px;height:90px\"/>",".gif\" border=\"0\" alt=\"\" />");
            evaluate.setEvaluate(str);

            System.out.println(str);
        }
        return evaluate;
    }

    /**
     * 补全Evaluate
     * @param evaluate
     * @return
     */
    public Evaluate getEvaluate(Evaluate evaluate){
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
        String str1 = "e00"+str;
        evaluate.setId(str1);
        try {
            date = sdf.parse(dateStr);
            evaluate.setPostdate(date);
            evaluate.setPostdateStr(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        evaluate.setDel_flag(0);
        evaluate.setDelFlag(0);
       return evaluate;
    }


    /**
     * 保存评价，若无则新增，若有，怎走更新
     * @param evaluate
     * @return
     */
    @Transactional(readOnly = false)
    public boolean saveEvaluate(Evaluate evaluate){
        if (evaluate!=null){
            Evaluate evaluate1 = evaluateMapper.findOne(evaluate.getId());
            if (evaluate1!=null){
                evaluateMapper.update(evaluate);
                return  true;
            }else{
                evaluateMapper.insert(evaluate);
                Evaluate evaluate2 =evaluateMapper.findOne(evaluate.getId());
                if (evaluate2!=null){
                    return  true;
                }
            }
        }
        return  false;
    }

    /**
     * 保存评价信息Evaluate,并且更新order订单状态
     * @param evaluate
     * @param order
     * @return
     */
    @Transactional(readOnly = false)
    public boolean saveEvaluateandOrder(Evaluate evaluate,Order order,Sysnotice sysnotice){
        if (evaluate!=null && order !=null){
            boolean flag = this.saveEvaluate(evaluate);
            if (flag){
                order.setState(4);
                orderMapper.update(order);
                boolean flag2 = sysnoticeService.saveSysnotice(sysnotice);
                if (flag2){
                    return true;
                }
            }
        }
        return false;
    }



    /********************************************以下为管理员Sercive*******************************************************/

    /**
     * 根据管理员对商品操作，进行商品信息更新，并且Sysnotice插入新的数据
     * @param admininfo
     * @param goods
     * @param rank
     * @param op
     * @param yy
     * @return
     */
    @Transactional(readOnly = false)
    public boolean updateGoodsandSaveSn(Admininfo admininfo,Goods goods,String rank,String op,String yy){
        if (goods!=null){
            if (StringUtils.isNoneBlank(op) && admininfo!=null &&StringUtils.isNoneBlank(yy)){
                if (StringUtils.isNoneBlank(rank)){
                    if ("1".equals(rank) || "2".equals(rank)){
                        goods.setState(1);
                    }else if("3".equals(rank)){
                        goods.setDel_flag(1);
                    }else if("4".equals(rank)){
                        goods.setState(0);
                    }
                    goodsMapper.update(goods);
                    Sysnotice sysnotice = sysnoticeService.getSysnoticeByAdmin(admininfo,goods,op,yy);
                    if (sysnotice!=null){
                       boolean flag = sysnoticeService.saveSysnotice(sysnotice);
                        if (flag){
                            return true;
                        }
                    }
                }
            }
        }
        return  false;
    }


    /**
     * 管理员删除订单，并且给用户插入一条信息
     * @param admininfo
     * @param order
     * @return
     */
    @Transactional(readOnly = false)
    public boolean removeOrderandSaveSn(Admininfo admininfo ,Order order,String orderid){
        Sysnotice sysnotice = new Sysnotice();
        if (order!=null){
            sysnotice.setTouid(order.getUid());
        }
        if (admininfo!=null){
            if(StringUtils.isNoneBlank(orderid)){
                boolean flag = this.removeOrder(orderid);
                if(flag){
                    sysnotice.setFromuid(admininfo.getUid());
                    sysnotice.setTitle("订单通知");
                    sysnotice.setContent("工号:["+admininfo.getUid()+"]管理员已将你的订单【"+order.getId()+"】删除！");
                    sysnotice = sysnoticeService.getSysId(sysnotice);
                    boolean flag2 = sysnoticeService.saveSysnotice(sysnotice);
                    if (flag2){
                        return  true;
                    }

                }
            }
        }
        return  false;
    }


    /**
     * 查询用户所有商品
     * @return
     */
    public MiniPage findDeleteGoodsPage(MiniPage mp,Goods goods) {
        Page<Goods> page = new Page<Goods>();
        page.setPageNo(mp.getPageNo() + 1);
        page.setPageSize(mp.getPageSize());

        if ("price".equals(mp.getSortField())) {
            page.setOrderBy("t." + mp.getSortField() + " " + mp.getSortOrder());
        } else if ("postdate".equals(mp.getSortField())) {
            page.setOrderBy("t." + mp.getSortField() + " " + mp.getSortOrder());
        }
        goods.setPage(page);
        List<Goods> list = goodsMapper.findDelete(goods);
        if (list.size() != 0) {
            for (Goods goods1 : list) {
                if (goods1.getState() != null) {
                    if (goods1.getState() == 0 ) {
                        goods1.setStateStr("上架");
                    }else if(goods1.getState()==2){
                        goods1.setStateStr("已出售");
                    }else if(goods1.getState()==1){
                        goods1.setStateStr("下架");
                    }
                }
                if(goods1.getType()!=null){
                    if (goods1.getType()==0){
                        goods1.setTypeStr("水果");
                    }else if (goods1.getType()==2){
                        goods1.setTypeStr("农林");
                    }else if(goods1.getType()==3){
                        goods1.setTypeStr("其他");
                    }else if(goods1.getType()==1){
                        goods1.setTypeStr("蔬菜");
                    }
                }
                mp.setTotal(page.getCount());
                mp.setData(list);
            }
            return mp;
        }
        return null;
    }

    /**
     * 查询用户所有订单
     * @return
     */
    public MiniPage findADeleteOrders(MiniPage mp,Order order){
        Page<Order> page = new Page<Order>();
        page.setPageNo(mp.getPageNo() + 1);
        page.setPageSize(mp.getPageSize());

        if("num".equals(mp.getSortField())){
            page.setOrderBy("t."+mp.getSortField()+" "+mp.getSortOrder());
        }else if("buydate".equals(mp.getSortField())){
            page.setOrderBy("t."+mp.getSortField()+" "+mp.getSortOrder());
        }else if("total".equals(mp.getSortField())){
            page.setOrderBy("t."+mp.getSortField()+" "+mp.getSortOrder());
        }

        System.out.println("t."+mp.getSortField()+" "+mp.getSortOrder());
        order.setPage(page);
        List<Order> list = orderMapper.findDelete(order);
        if(list.size()!=0){
            for (Order order1 :list){
                if(order1.getState()!=null){
                    if(order1.getState()==0 || order1.getState()==2){
                        order1.setStateStr("已付款,等待商家发货");
                    }
                    if(order1.getState()==1){
                        order1.setStateStr("未付款");
                    }
                    if(order1.getState()==2){
                        order1.setStateStr("商家已发货，等待收货");
                    }
                    if(order1.getState()==3){
                        order1.setStateStr("已收货，等待评价");
                    }
                    if (order1.getState()==4){
                        order1.setStateStr("已完成评价");
                    }
                }
            }
            mp.setTotal(page.getCount());
            mp.setData(list);


        }
        return mp;
    }


    /**
     * 根据商品id返回已被删除的商品信息
     * @param id
     * @return
     */
    public Goods findDeleteGoodsById(String id){
        Goods goods = goodsMapper.findDeleteOne(id);
        if(goods!=null){
            return goods;
        }
        return null;
    }

    /**
     * 回收被删除的goods(del_flag->0)
     * @param goods
     * @return
     */
    @Transactional(readOnly = false)
    public boolean rebackGoods(Goods goods){
        if (goods!=null){
            goods.setDel_flag(0);
            goodsMapper.update(goods);
            return  true;
        }
        return false;
    }


    /**
     * 从数据库中删除Goods这条数据
     * @param goods
     * @return
     */
    @Transactional(readOnly = false)
    public boolean ReadlDeleteGoods(Goods goods){
        if (goods!=null){
            Goods goods1 = this.findDeleteGoodsById(goods.getId());
            if (goods1!=null){
                goodsMapper.delete(goods);
                Goods goods2 = this.findDeleteGoodsById(goods.getId());
                if (goods2!=null){
                    return  false;
                }else{
                    return true;
                }
            }
        }
        return  false;
    }


    /**
     * 根据id查找被删除的订单信息
     * @param orderid
     * @return
     */
    public Order findDeleteOrder(String orderid){
        if (StringUtils.isNoneBlank(orderid)){
            Order order = orderMapper.findDeleteOne(orderid);
            if (order!=null){
                return order;
            }
        }
        return null;
    }


    /**
     * 回收被删除的Order(del_flag->0)
     * @param order
     * @return
     */
    @Transactional(readOnly = false)
    public boolean rebackOrders(Order order){
        if (order!=null){
            order.setDelFlag(0);
            orderMapper.update(order);
            return  true;
        }
        return false;
    }

    /**
     * 从数据库中删除这条Order数据
     * @param order
     * @return
     */
    @Transactional(readOnly = false)
    public boolean RealDeleteOrder(Order order){
        if (order!=null){
            Order order1 = this.findDeleteOrder(order.getId());
            if (order1!=null){
                orderMapper.delete(order);
                Order order2 = this.findDeleteOrder(order.getId());
                if (order2!=null){
                    return false;
                }else{
                    return true;
                }
            }
        }
        return  false;
    }


    /**
     * 获取成交的订单数量
     * @return
     */
    public Integer getCompleteOrder(){
        List<Order> list = orderMapper.findComplete();
        if (list.size()>=0){
            return list.size();
        }
        return null;
    }

}
