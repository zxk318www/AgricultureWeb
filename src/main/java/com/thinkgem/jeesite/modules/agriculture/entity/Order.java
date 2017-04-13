package com.thinkgem.jeesite.modules.agriculture.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.BaseEntity;

import java.util.Date;

/**
 * Po
 * 
 * @author Silver Howe
 * @version 1.0, 2017/3/14 9:55:18
 */
public class Order  extends BaseEntity{

	/**
	 * 订单id
	 */
	private String id;

	/**
	 * 订单user的id
	 */
	private String uid;

	/**
	 * 订单user姓名
	 */
	private String uname;

	/**
	 * 订单user手机号码
	 */
	private String moblie;

	/**
	 * 添加字段：座机号码
	 */
	private String phone;

	/**
	 * 订单user地址
	 */
	private String address;

	/**
	 * 订单goods的id
	 */
	private String goodsid;


	private String goodstitle;

	/**
	 * 下单时间
	 */
	private Date buydate;

	private String buydateStr;

	/**
	 * 预留字段
	 */
	private String yl;

	/**
	 * 订单状态 0--付款未发货，1--未付款 2--付款并发货 3-收货等待评价 4--评价结束（删除订单）
	 */
	private Integer state;

	private String stateStr;

	/**
	 * 订单删除标记，0--未删除，1--删除
	 */
	private Integer delFlag;

	/**
	 * 商品数量
	 */
	private Integer num;

	/**
	 * 商品总价
	 */
	private Double total;
	/**
	 * 取得订单id
	 * 
	 * @return 订单id
	 */
	public String getId() {
		return id;
	}


	/**
	 * 设置订单id
	 * 
	 * @param id
	 *            订单id
	 */
	public void setId(String id) {
		this.id = id;
	}

	@Override
	public void preInsert() {

	}

	@Override
	public void preUpdate() {

	}

	/**
	 * 取得订单user的id
	 * 
	 * @return 订单user的id
	 */
	public String getUid() {
		return uid;
	}

	/**
	 * 设置订单user的id
	 * 
	 * @param uid
	 *            订单user的id
	 */
	public void setUid(String uid) {
		this.uid = uid;
	}

	/**
	 * 取得订单goods的id
	 * 
	 * @return 订单goods的id
	 */
	public String getGoodsid() {
		return goodsid;
	}

	/**
	 * 设置订单goods的id
	 * 
	 * @param goodsid
	 *            订单goods的id
	 */
	public void setGoodsid(String goodsid) {
		this.goodsid = goodsid;
	}

	/**
	 * 取得下单时间
	 * 
	 * @return 下单时间
	 */
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm")
	public Date getBuydate() {
		return buydate;
	}

	/**
	 * 设置下单时间
	 * 
	 * @param buydate
	 *            下单时间
	 */
	public void setBuydate(Date buydate) {
		this.buydate = buydate;
	}

	/**
	 * 取得预留字段
	 * 
	 * @return 预留字段
	 */
	public String getYl() {
		return yl;
	}

	/**
	 * 设置预留字段
	 * 
	 * @param yl
	 *            预留字段
	 */
	public void setYl(String yl) {
		this.yl = yl;
	}

	/**
	 * 取得订单删除标记，0--未删除，1--删除
	 * 
	 * @return 订单删除标记，0--未删除，1--删除
	 */
	public Integer getDelFlag() {
		return delFlag;
	}

	/**
	 * 设置订单删除标记，0--未删除，1--删除
	 * 
	 * @param delFlag
	 *            订单删除标记，0--未删除，1--删除
	 */
	public void setDelFlag(Integer delFlag) {
		this.delFlag = delFlag;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public String getStateStr() {
		return stateStr;
	}

	public void setStateStr(String stateStr) {
		this.stateStr = stateStr;
	}


	public String getGoodstitle() {
		return goodstitle;
	}

	public void setGoodstitle(String goodstitle) {
		this.goodstitle = goodstitle;
	}

	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMoblie() {
		return moblie;
	}

	public void setMoblie(String moblie) {
		this.moblie = moblie;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getBuydateStr() {
		return buydateStr;
	}

	public void setBuydateStr(String buydateStr) {
		this.buydateStr = buydateStr;
	}
}
