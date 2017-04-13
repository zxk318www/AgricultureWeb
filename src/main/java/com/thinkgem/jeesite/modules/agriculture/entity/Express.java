package com.thinkgem.jeesite.modules.agriculture.entity;

import java.util.Date;

/**
 * Po
 * 
 * @author Silver Howe
 * @version 1.0, 2017/3/20 14:22:09
 */
public class Express {

	/**
	 * 快递单号id
	 */
	private String id;

	/**
	 * 快递名称
	 */
	private String name;

	/**
	 * 快递派送人员
	 */
	private String personname;

	/**
	 * 关联订单号
	 */
	private String orderid;

	/**
	 * 订单信息
	 */
	private String msg;

	/**
	 * 快递单号
	 */
	private String kddh;

	/**
	 * 发货日期
	 */
	private Date postdate;

	/**
	 * 收货日期
	 */
	private Date getdate;

	/**
	 * 快递状态，0--已签收，1--未签收
	 */
	private Integer state;

	/**
	 * 
	 */
	private Integer delFlag;

	/**
	 * 取得快递单号id
	 * 
	 * @return 快递单号id
	 */
	public String getId() {
		return id;
	}

	/**
	 * 设置快递单号id
	 * 
	 * @param id
	 *            快递单号id
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * 取得快递名称
	 * 
	 * @return 快递名称
	 */
	public String getName() {
		return name;
	}

	/**
	 * 设置快递名称
	 * 
	 * @param name
	 *            快递名称
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * 取得快递派送人员
	 * 
	 * @return 快递派送人员
	 */
	public String getPersonname() {
		return personname;
	}

	/**
	 * 设置快递派送人员
	 * 
	 * @param personname
	 *            快递派送人员
	 */
	public void setPersonname(String personname) {
		this.personname = personname;
	}

	/**
	 * 取得关联订单号
	 * 
	 * @return 关联订单号
	 */
	public String getOrderid() {
		return orderid;
	}

	/**
	 * 设置关联订单号
	 * 
	 * @param orderid
	 *            关联订单号
	 */
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

	/**
	 * 取得订单信息
	 * 
	 * @return 订单信息
	 */
	public String getMsg() {
		return msg;
	}

	/**
	 * 设置订单信息
	 * 
	 * @param msg
	 *            订单信息
	 */
	public void setMsg(String msg) {
		this.msg = msg;
	}

	/**
	 * 取得快递单号
	 * 
	 * @return 快递单号
	 */
	public String getKddh() {
		return kddh;
	}

	/**
	 * 设置快递单号
	 * 
	 * @param kddh
	 *            快递单号
	 */
	public void setKddh(String kddh) {
		this.kddh = kddh;
	}

	/**
	 * 取得发货日期
	 * 
	 * @return 发货日期
	 */
	public Date getPostdate() {
		return postdate;
	}

	/**
	 * 设置发货日期
	 * 
	 * @param postdate
	 *            发货日期
	 */
	public void setPostdate(Date postdate) {
		this.postdate = postdate;
	}

	/**
	 * 取得收货日期
	 * 
	 * @return 收货日期
	 */
	public Date getGetdate() {
		return getdate;
	}

	/**
	 * 设置收货日期
	 * 
	 * @param getdate
	 *            收货日期
	 */
	public void setGetdate(Date getdate) {
		this.getdate = getdate;
	}

	/**
	 * 取得快递状态，0--已签收，1--未签收
	 * 
	 * @return 快递状态，0--已签收，1--未签收
	 */
	public Integer getState() {
		return state;
	}

	/**
	 * 设置快递状态，0--已签收，1--未签收
	 * 
	 * @param state
	 *            快递状态，0--已签收，1--未签收
	 */
	public void setState(Integer state) {
		this.state = state;
	}

	/**
	 * 取得
	 * 
	 * @return 
	 */
	public Integer getDelFlag() {
		return delFlag;
	}

	/**
	 * 设置
	 * 
	 * @param delFlag
	 *            
	 */
	public void setDelFlag(Integer delFlag) {
		this.delFlag = delFlag;
	}

}
