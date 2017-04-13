package com.thinkgem.jeesite.modules.agriculture.entity;


import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Po
 * 
 * @author Silver Howe
 * @version 1.0, 2017/3/10 10:21:06
 */
public class Evaluate {

	/**
	 * 商品评价id
	 */
	private String id;

	/**
	 * 商品id
	 */
	private String goodsid;

	/**
	 * userinfo表id
	 */
	private String uid;
	private String username;

	/**
	 * 评价描述
	 */
	private String evaluate;

	/**
	 * 评价等级
	 */
	private Integer level;

	/**
	 * 预存字段
	 */
	private String yc;

	/**
	 * 删除标记 0--不删除，1--删除
	 */
	private Integer del_flag;

	/**
	 * 评价日期
	 */
	private Date postdate;

	private String postdateStr;
	/**
	 * 取得商品评价id
	 * 
	 * @return 商品评价id
	 */
	public String getId() {
		return id;
	}

	/**
	 * 设置商品评价id
	 * 
	 * @param id
	 *            商品评价id
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * 取得商品id
	 * 
	 * @return 商品id
	 */
	public String getGoodsid() {
		return goodsid;
	}

	/**
	 * 设置商品id
	 * 
	 * @param goodsid
	 *            商品id
	 */
	public void setGoodsid(String goodsid) {
		this.goodsid = goodsid;
	}

	/**
	 * 取得userinfo表id
	 * 
	 * @return userinfo表id
	 */
	public String getUid() {
		return uid;
	}

	/**
	 * 设置userinfo表id
	 * 
	 * @param uid
	 *            userinfo表id
	 */
	public void setUid(String uid) {
		this.uid = uid;
	}

	/**
	 * 取得评价描述
	 * 
	 * @return 评价描述
	 */
	public String getEvaluate() {
		return evaluate;
	}

	/**
	 * 设置评价描述
	 * 
	 * @param 
evaluate
	 *            评价描述
	 */
	public void setEvaluate(String evaluate) {
		this.evaluate = evaluate;
	}

	/**
	 * 取得评价等级
	 * 
	 * @return 评价等级
	 */
	public Integer getLevel() {
		return level;
	}

	/**
	 * 设置评价等级
	 * 
	 * @param level
	 *            评价等级
	 */
	public void setLevel(Integer level) {
		this.level = level;
	}

	/**
	 * 取得预存字段
	 * 
	 * @return 预存字段
	 */
	public String getYc() {
		return yc;
	}

	/**
	 * 设置预存字段
	 * 
	 * @param yc
	 *            预存字段
	 */
	public void setYc(String yc) {
		this.yc = yc;
	}

	/**
	 * 取得删除标记 0--不删除，1--删除
	 * 
	 * @return 删除标记 0--不删除，1--删除
	 */
	public Integer getDel_flag() {
		return del_flag;
	}

	/**
	 * 设置删除标记 0--不删除，1--删除
	 * 
	 * @param del_flag
	 *            删除标记 0--不删除，1--删除
	 */
	public void setDelFlag(Integer del_flag) {
		this.del_flag = del_flag;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setDel_flag(Integer del_flag) {
		this.del_flag = del_flag;
	}

	public Date getPostdate() {
		return postdate;
	}

	public void setPostdate(Date postdate) {
		this.postdate = postdate;
	}

	public String getPostdateStr() {
		return postdateStr;
	}

	public void setPostdateStr(Date date) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String str = simpleDateFormat.format(date);
		this.postdateStr = str;
	}

	@Override
	public String toString() {
		return "[Entity->evaluate]id:"+id+";goodsid:"+goodsid+";uid:"+uid+";username:"+username+";evaluate:"+evaluate+";postdate:"+postdate;
	}
}
