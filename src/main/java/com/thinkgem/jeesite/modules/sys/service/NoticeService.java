package com.thinkgem.jeesite.modules.sys.service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StreamUtils;
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
 * 发货订单信息通知
 * Created by Zhangsnke on 2017/3/17.
 */
@Service
@Transactional(readOnly = true)
public class NoticeService {
    @Autowired
    UserinfoMapper userinfoMapper;

    @Autowired
    UserMapper userMapper;

    @Autowired
    NoticeMapper noticeMapper;

    @Autowired
    GoodsMapper goodsMapper;

    @Autowired
    OrderMapper orderMapper;

    @Autowired
    ExpressMapper expressMapper;

    @Autowired
    SysnoticeService sysnoticeService;

    /**
     * 查询所有卖家订单
     * @return
     */
    public MiniPage findNoticeByPage(MiniPage mp,NoticeVo noticeVo){
        Page<NoticeVo> page = new Page<NoticeVo>();
        page.setPageNo(mp.getPageNo() + 1);
        page.setPageSize(mp.getPageSize());
        if("num".equals(mp.getSortField())){
            page.setOrderBy("o."+mp.getSortField()+" "+mp.getSortOrder());
        }else if("buydate".equals(mp.getSortField())){
            page.setOrderBy("o."+mp.getSortField()+" "+mp.getSortOrder());
        }

        System.out.println("t."+mp.getSortField()+" "+mp.getSortOrder());
        noticeVo.setPage(page);
        List<NoticeVo> list = noticeMapper.find(noticeVo);
        if(list.size()!=0){
            for (NoticeVo noticeVo1 :list){
                if (noticeVo1.getState()==0){
                    noticeVo1.setStateStr("已付款");
                }else if(noticeVo1.getState()==1){
                    noticeVo1.setStateStr("未付款");
                }else if(noticeVo1.getState()==2){
                    noticeVo1.setStateStr("已付款，商家也已发货");
                }else if(noticeVo1.getState()==3){
                    noticeVo1.setStateStr("买家已经收货，等待评价");
                }else if(noticeVo1.getState()==4){
                    noticeVo1.setStateStr("买家已经评价，交易结束");
                }
            }
            mp.setTotal(page.getCount());
            mp.setData(list);
        }
        return mp;
    }

    /**
     * 根noticeid查询noticeVO
     * @param noticeid
     * @return
     */
    public NoticeVo findNoticeVObyId(String noticeid){
        if (StringUtils.isNoneBlank(noticeid)){
            NoticeVo noticeVo = noticeMapper.findOne(noticeid);
            if (noticeVo!=null){
                return noticeVo;
            }
        }
        return  null;
    }

    /**
     * 更新订单信息，特指商家发货后，更改order订单里的state,
     * 当state=0,买家付款，商家未发货
     * 当state=1,买家未付款
     * 当state=2，买家付款，商家已发货
     * @param noticeVo
     * @return
     */
    @Transactional(readOnly = false)
    public boolean updateNoticeVo(NoticeVo noticeVo){
        if(noticeVo!=null){
            if(StringUtils.isNoneBlank(noticeVo.getOrderid())){
                Order order = orderMapper.findOne(noticeVo.getOrderid());
                if(order!=null){
                    //商家发货，更改订单，新增系统提示信息
                    order.setState(2);
                    noticeVo.setState(2);
                    orderMapper.update(order);
                }
                Order order1 = orderMapper.findOne(order.getId());
                if(2 == order1.getState()){
                    return  true;
                }
            }
        }
        return false;
    }


    /**
     * 获取快递单号，自动补全id
     * @param express
     * @param noticeVo
     * @return
     */
    public Express getExpress(Express express,NoticeVo noticeVo){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHmmss");
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();
        String dateStr = sdf.format(date);
        String datestr = sdf1.format(date);
        try {
            //postDate
            express.setPostdate(sdf1.parse(datestr));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        int num = (int) (Math.random()*10000);
        String str = String.valueOf(num);
        int sub = (int) (Math.random()*8);
        str = dateStr+str;
        str = str.substring(sub);
        String str1 = "ex00"+str;
        //自动补全id ex00+*
        express.setId(str1);
        if (noticeVo!=null){
            if (StringUtils.isNoneBlank(noticeVo.getOrderid())){
                Order order = orderMapper.findOne(noticeVo.getOrderid());
                if (order!=null){
                   express.setOrderid(order.getId());
                }
            }
        }
        if(express.getGetdate()!=null){
            express.setState(1);
        }else{
            express.setState(0);
        }
        express.setDelFlag(0);
        express.setMsg("暂无物流信息");
        return  express;
    }


    /**
     * 保存快递表，若已存在则更新，若无，则新增
     * @param express
     * @return
     */
    @Transactional(readOnly = false)
    public boolean saveExpress(Express express){
       Express express1 = expressMapper.findOne(express.getId());
        if(express1!=null){
            expressMapper.update(express);

            return  true;
        }else{
            if (express!=null){
                expressMapper.insert(express);
                Express express2 = expressMapper.findOne(express.getId());
                if (express2!=null){
                    return true;
                }
            }
        }
        return false;
    }

    /**
     * 商家发货，更新noticeVo,新增系统通知sysnotice，新增快递express
     * @param noticeVo
     * @param sysnotice
     * @param express
     * @return
     */
    @Transactional(readOnly = false)
    public boolean saveNoticeVoandExpressandSysn(NoticeVo noticeVo ,Sysnotice sysnotice ,Express express){
        if (noticeVo!=null){
            boolean flag = this.updateNoticeVo(noticeVo);
            if(flag){
                if (sysnotice!=null){
                    boolean flag2 = sysnoticeService.saveSysnotice(sysnotice);
                    if (flag2){
                        if(express!=null){
                            boolean flag3 = this.saveExpress(express);
                            if (flag3){
                                return true;
                            }
                        }
                    }
                }
            }
        }
        return false;
    }

    /**
     * 根据orderid获取快递信息，进行快递表express查询
     * @param orderid
     * @return
     */
    public Express findExpress(String orderid){
        if (StringUtils.isNoneBlank(orderid)){
           Express express = expressMapper.findByOrder(orderid);
            if (express!=null){
                return express;
            }
        }
        return null;
    }

    /**
     * 根据noticeid获取notice
     * @param noticeid
     * @return
     */
    public Notice findNotice(String noticeid){
        if (StringUtils.isNoneBlank(noticeid)){
            Notice notice = noticeMapper.findNotice(noticeid);
            if (notice!=null){
                return notice;
            }
        }
        return null;
    }

    /**
     * 保存notice（若已存在则更新，若无则新增一个）
     * @param notice
     * @return
     */
    @Transactional(readOnly = false)
    public boolean saveNotice(Notice notice){
        if (notice!=null){
            Notice notice1 = noticeMapper.findNotice(notice.getId());
            if (notice1!=null){
                noticeMapper.update(notice);
                return true;
            }else{
                noticeMapper.insert(notice);
                return true;
            }
        }
        return  false;
    }

    /**
     * 根据orderid获取order
     * @param id
     * @return
     */
    public Order findOrder(String id){
        if (StringUtils.isNoneBlank(id)){
            Order order =orderMapper.findOne(id);
            if (order!=null){
                return order;
            }
        }
        return null;
    }

}
