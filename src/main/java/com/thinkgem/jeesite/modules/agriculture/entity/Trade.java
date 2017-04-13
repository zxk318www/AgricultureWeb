package com.thinkgem.jeesite.modules.agriculture.entity;

import java.util.Date;

/**
 * Po
 * 
 * @author Silver Howe
 * @version 1.0, 2017/2/10 15:59:50
 */
public class Trade {

	/**
	 * 交易id
	 */
	private String id;

	/**
	 * 交易关联UserInfo的id
	 */
	private String fromuinfoid;

	/**
	 * 交易关联的UserInfo的id
	 */
	private String touinfoid;

	/**
	 * 交易时间
	 */
	private Date tradedate;

	/**
	 * 交易状态 0--关闭，1--成功，2--待定
	 */
	private Integer state;

	/**
	 * 交易商品的id
	 */
	private String goodsid;

	/**
	 * 取得交易id
	 * 
	 * @return 交易id
	 */
	public String getId() {
		return id;
	}

	/**
	 * 设置交易id
	 * 
	 * @param id
	 *            交易id
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * 取得交易关联UserInfo的id
	 * 
	 * @return 交易关联UserInfo的id
	 */
	public String getFromuinfoid() {
		return fromuinfoid;
	}

	/**
	 * 设置交易关联UserInfo的id
	 * 
	 * @param fromuinfoid
	 *            交易关联UserInfo的id
	 */
	public void setFromuinfoid(String fromuinfoid) {
		this.fromuinfoid = fromuinfoid;
	}

	/**
	 * 取得交易关联的UserInfo的id
	 * 
	 * @return 交易关联的UserInfo的id
	 */
	public String getTouinfoid() {
		return touinfoid;
	}

	/**
	 * 设置交易关联的UserInfo的id
	 * 
	 * @param touinfoid
	 *            交易关联的UserInfo的id
	 */
	public void setTouinfoid(String touinfoid) {
		this.touinfoid = touinfoid;
	}

	/**
	 * 取得交易时间
	 * 
	 * @return 交易时间
	 */
	public Date getTradedate() {
		return tradedate;
	}

	/**
	 * 设置交易时间
	 * 
	 * @param tradedate
	 *            交易时间
	 */
	public void setTradedate(Date tradedate) {
		this.tradedate = tradedate;
	}

	/**
	 * 取得交易状态 0--关闭，1--成功，2--待定
	 * 
	 * @return 交易状态 0--关闭，1--成功，2--待定
	 */
	public Integer getState() {
		return state;
	}

	/**
	 * 设置交易状态 0--关闭，1--成功，2--待定
	 * 
	 * @param state
	 *            交易状态 0--关闭，1--成功，2--待定
	 */
	public void setState(Integer state) {
		this.state = state;
	}

	/**
	 * 取得交易商品的id
	 * 
	 * @return 交易商品的id
	 */
	public String getGoodsid() {
		return goodsid;
	}

	/**
	 * 设置交易商品的id
	 * 
	 * @param goodsid
	 *            交易商品的id
	 */
	public void setGoodsid(String goodsid) {
		this.goodsid = goodsid;
	}

}
