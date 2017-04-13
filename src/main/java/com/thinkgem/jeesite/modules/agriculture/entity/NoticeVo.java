package com.thinkgem.jeesite.modules.agriculture.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.BaseEntity;

import java.util.Date;

/**
 * Created by Zhangsnke on 2017/3/17.
 */
public class NoticeVo extends BaseEntity {

    /**
     * 通知id
     */
    private String id;

    /**
     * 通知用户id(关联商品卖家userinfo)
     */
    private String uid;

    /**
     * 订单orderid
     */
    private String orderid;

    /**
     * 删除标记
     */
    private Integer delFlag;

    //主体业务属性

    /**
     * 买家userinfo id
     */
    private String userinfoid;

    /**
     * 买家name
     */
    private String uname;

    /**
     * 买家座机号
     */
    private String phone;

    /**
     * 买家手机号
     */
    private String moblie;

    /**
     * 买家地址
     */
    private String address;

    /**
     * 关联商品id
     */
    private String goodsid;

    /**
     *商品名称
     */
    private String goodstitle;

    /**
     * 关联订单状态
     * 0--已付款，1--未付款
     */
    private Integer state;

    private String stateStr;

    /**
     * 买家购买的商品数量
     */
    private Integer num;

    /**
     * 买家购买时间
     */
    private Date buydate;

    /**
     * 订单总价
     */
    private Double total;

    /**
     * 预留字段
     */
    private String yl;


    public String getYl() {
        return yl;
    }

    public void setYl(String yl) {
        this.yl = yl;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm")
    public Date getBuydate() {
        return buydate;
    }

    public void setBuydate(Date buydate) {
        this.buydate = buydate;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getGoodstitle() {
        return goodstitle;
    }

    public void setGoodstitle(String goodstitle) {
        this.goodstitle = goodstitle;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Override
    public void preInsert() {

    }

    @Override
    public void preUpdate() {

    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getOrderid() {
        return orderid;
    }

    public void setOrderid(String orderid) {
        this.orderid = orderid;
    }

    public Integer getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(Integer delFlag) {
        this.delFlag = delFlag;
    }

    public String getUserinfoid() {
        return userinfoid;
    }

    public void setUserinfoid(String userinfoid) {
        this.userinfoid = userinfoid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getMoblie() {
        return moblie;
    }

    public void setMoblie(String moblie) {
        this.moblie = moblie;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getGoodsid() {
        return goodsid;
    }

    public void setGoodsid(String goodsid) {
        this.goodsid = goodsid;
    }

    public String getStateStr() {
        return stateStr;
    }

    public void setStateStr(String stateStr) {
        this.stateStr = stateStr;
    }
}
