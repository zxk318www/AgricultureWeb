package com.thinkgem.jeesite.modules.agriculture.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.BaseEntity;

import java.io.Serializable;
import java.util.Date;

/**
 * Po
 * 
 * @author Silver Howe
 * @version 1.0, 2017/2/10 15:59:50
 */
public class Goods extends BaseEntity<Goods> implements Serializable {

	/**
	 * 商品id
	 */
	private String id;

	/**
	 * 用户id
	 */
	private String uinfoid;

	/**
	 * 商品名称
	 */
	private String name;

	/**
	 * 商品类型，0--水果，1--蔬菜，2--农林，3--其他
	 */
	private Integer type;

	private String typeStr;

	/**
	 * 商品单价
	 */
	private Double price;

	/**
	 * 商品展示图片
	 */
	private String photo;

	/**
	 * 商品的产地
	 */
	private String address;

	/**
	 * 商品状态 0--上架，1--下架，2--已出售
	 */
	private Integer state;
	private String stateStr;

	/**
	 * 更新或上架时间
	 */
	private Date postdate;

	private String postDateStr;

	/**
	 * 商品描述
	 */
	private String miaoshu;

	/**
	 * 商品的浏览数
	 */
	private Integer num;

	/**
	 * 删除标记
	 */
	private Integer del_flag;

	/**
	 * 判断是否展示购买按钮，0--显示，1--不显示
	 * 当卖家==买家，不显示购买按钮
	 */
	private String show;

	/**
	 * 取得商品id
	 * 
	 * @return 商品id
	 */
	public String getId() {
		return id;
	}

	/**
	 * 设置商品id
	 * 
	 * @param id
	 *            商品id
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
	 * 取得用户id
	 * 
	 * @return 用户id
	 */
	public String getUinfoid() {
		return uinfoid;
	}

	/**
	 * 设置用户id
	 * 
	 * @param uinfoid
	 *            用户id
	 */
	public void setUinfoid(String uinfoid) {
		this.uinfoid = uinfoid;
	}

	/**
	 * 取得商品名称
	 * 
	 * @return 商品名称
	 */
	public String getName() {
		return name;
	}

	/**
	 * 设置商品名称
	 * 
	 * @param name
	 *            商品名称
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * 取得商品单价
	 * 
	 * @return 商品单价
	 */
	public Double getPrice() {
		return price;
	}

	/**
	 * 设置商品单价
	 * 
	 * @param price
	 *            商品单价
	 */
	public void setPrice(Double price) {
		this.price = price;
	}

	/**
	 * 取得商品的产地
	 * 
	 * @return 商品的产地
	 */
	public String getAddress() {
		return address;
	}

	/**
	 * 设置商品的产地
	 * 
	 * @param address
	 *            商品的产地
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 * 取得商品状态 0--上架，1--下架，2--已出售
	 * 
	 * @return 商品状态 0--上架，1--下架，2--已出售
	 */
	public Integer getState() {
		return state;
	}

	/**
	 * 设置商品状态 0--上架，1--下架，2--已出售
	 * 
	 * @param state
	 *            商品状态 0--上架，1--下架，2--已出售
	 */
	public void setState(Integer state) {
		this.state = state;
	}

	public String getStateStr() {
		return stateStr;
	}

	public void setStateStr(String stateStr) {
		this.stateStr = stateStr;
	}

	/**
	 * 取得商品描述
	 * 
	 * @return 商品描述
	 */
	public String getMiaoshu() {
		return miaoshu;
	}

	/**
	 * 设置商品描述
	 * 
	 * @param miaoshu
	 *            商品描述
	 */
	public void setMiaoshu(String miaoshu) {
		this.miaoshu = miaoshu;
	}

	/**
	 * 取得商品的浏览数
	 * 
	 * @return 商品的浏览数
	 */
	public Integer getNum() {
		return num;
	}

	/**
	 * 设置商品的浏览数
	 * 
	 * @param num
	 *            商品的浏览数
	 */
	public void setNum(Integer num) {
		this.num = num;
	}


	public Integer getDel_flag() {
		return del_flag;
	}

	public void setDel_flag(Integer del_flag) {
		this.del_flag = del_flag;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm")
	public Date getPostdate() {
		return postdate;
	}

	public void setPostdate(Date postdate) {
		this.postdate = postdate;
	}

	public String getPostDateStr() {
		return postDateStr;
	}

	public void setPostDateStr(String postDateStr) {
		this.postDateStr = postDateStr;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getTypeStr() {
		return typeStr;
	}

	public void setTypeStr(String typerStr) {
		this.typeStr = typerStr;
	}

	public String getShow() {
		return show;
	}

	public void setShow(String show) {
		this.show = show;
	}

	@Override
	public String toString() {
		return "id:"+id+";uinfoid:"+uinfoid+";name:"+name+";price:"+price+";address:"+address+";postdate:"+postDateStr+";miaoshu:"+miaoshu+";type:"+type;
	}
}
