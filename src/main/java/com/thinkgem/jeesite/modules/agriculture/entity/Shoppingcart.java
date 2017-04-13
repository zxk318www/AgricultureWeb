package com.thinkgem.jeesite.modules.agriculture.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.BaseEntity;

import java.util.Date;

/**
 * Po
 * 
 * @author Silver Howe
 * @version 1.0, 2017/2/10 15:59:50
 */
public class Shoppingcart  extends BaseEntity{

	/**
	 * 购物车id
	 */
	private String id;

	/**
	 * 关联UserInfo的id
	 */
	private String uinfoid;

	/**
	 * 购物车状态 0--收藏,1--结算
	 */
	private Integer state;

	private String stateStr;

	/**
	 * 购物车类型
	 * 0--水果，1--蔬菜，2--农林，3--其他
	 */
	private Integer type;

	private String typeStr;

	/**
	 * 加入购物车时间
	 */
	private Date addcardate;

	/**
	 * 加入购物车数量
	 */
	private Integer num;

	/**
	 * 关联商品Goods的id
	 */
	private String goodsid;

	private String goodstitle;

	private Integer del_flag;

	/**
	 * 取得购物车id
	 * 
	 * @return 购物车id
	 */
	public String getId() {
		return id;
	}

	/**
	 * 设置购物车id
	 * 
	 * @param id
	 *            购物车id
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
	 * 取得关联UserInfo的id
	 * 
	 * @return 关联UserInfo的id
	 */
	public String getUinfoid() {
		return uinfoid;
	}

	/**
	 * 设置关联UserInfo的id
	 * 
	 * @param uinfoid
	 *            关联UserInfo的id
	 */
	public void setUinfoid(String uinfoid) {
		this.uinfoid = uinfoid;
	}

	/**
	 * 取得购物车状态 0--收藏,1--结算
	 * 
	 * @return 购物车状态 0--收藏,1--结算
	 */
	public Integer getState() {
		return state;
	}

	/**
	 * 设置购物车状态 0--收藏,1--结算
	 * 
	 * @param state
	 *            购物车状态 0--收藏,1--结算
	 */
	public void setState(Integer state) {
		this.state = state;
	}

	/**
	 * 取得加入购物车时间
	 * 
	 * @return 加入购物车时间
	 */
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm")
	public Date getAddcardate() {
		return addcardate;
	}

	/**
	 * 设置加入购物车时间
	 * 
	 * @param addcardate
	 *            加入购物车时间
	 */
	public void setAddcardate(Date addcardate) {
		this.addcardate = addcardate;
	}

	/**
	 * 取得加入购物车数量
	 * 
	 * @return 加入购物车数量
	 */
	public Integer getNum() {
		return num;
	}

	/**
	 * 设置加入购物车数量
	 * 
	 * @param num
	 *            加入购物车数量
	 */
	public void setNum(Integer num) {
		this.num = num;
	}

	/**
	 * 取得关联商品Goods的id
	 * 
	 * @return 关联商品Goods的id
	 */
	public String getGoodsid() {
		return goodsid;
	}

	/**
	 * 设置关联商品Goods的id
	 * 
	 * @param goodsid
	 *            关联商品Goods的id
	 */
	public void setGoodsid(String goodsid) {
		this.goodsid = goodsid;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getDel_flag() {
		return del_flag;
	}

	public void setDel_flag(Integer del_flag) {
		this.del_flag = del_flag;
	}

	public String getTypeStr() {
		return typeStr;
	}

	public void setTypeStr(String typeStr) {
		this.typeStr = typeStr;
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

	@Override
	public String toString() {
		return "[Entity->shoppingcart]:id:"+id+";uinfoid:"+uinfoid+";state:"+state+";type:"+type+";addcardate:"+addcardate+";num:"+num+
				";goodsid:"+goodsid+";goodstitle:"+goodstitle;
	}
}
