package com.thinkgem.jeesite.modules.agriculture.entity;

import com.thinkgem.jeesite.common.persistence.BaseEntity;

/**
 * Po
 * 
 * @author Silver Howe
 * @version 1.0, 2017/3/17 9:51:34
 */
public class Notice extends BaseEntity {

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

	/**
	 * 取得通知id
	 * 
	 * @return 通知id
	 */
	public String getId() {
		return id;
	}

	/**
	 * 设置通知id
	 * 
	 * @param id
	 *            通知id
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
	 * 取得通知用户id(关联商品卖家userinfo)
	 * 
	 * @return 通知用户id(关联商品卖家userinfo)
	 */
	public String getUid() {
		return uid;
	}

	/**
	 * 设置通知用户id(关联商品卖家userinfo)
	 * 
	 * @param uid
	 *            通知用户id(关联商品卖家userinfo)
	 */
	public void setUid(String uid) {
		this.uid = uid;
	}

	/**
	 * 取得订单orderid
	 * 
	 * @return 订单orderid
	 */
	public String getOrderid() {
		return orderid;
	}

	/**
	 * 设置订单orderid
	 * 
	 * @param orderid
	 *            订单orderid
	 */
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

	/**
	 * 取得删除标记
	 * 
	 * @return 删除标记
	 */
	public Integer getDelFlag() {
		return delFlag;
	}

	/**
	 * 设置删除标记
	 * 
	 * @param delFlag
	 *            删除标记
	 */
	public void setDelFlag(Integer delFlag) {
		this.delFlag = delFlag;
	}

}
