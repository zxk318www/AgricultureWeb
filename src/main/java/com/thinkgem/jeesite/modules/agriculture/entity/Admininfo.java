package com.thinkgem.jeesite.modules.agriculture.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * Po
 * 
 * @author Silver Howe
 * @version 1.0, 2017/2/10 15:59:50
 */
public class Admininfo implements Serializable {

	/**
	 * 管理员id
	 */
	private String id;

	/**
	 * 用户编号id
	 */
	private String uid;

	/**
	 * 管理员姓名
	 */
	private String name;

	/**
	 * 管理员联系电话
	 */
	private String phone;

	/**
	 * 管理员地址
	 */
	private String address;

	/**
	 * 管理员状态 0--在线，1--下线
	 */
	private Integer state;

	/**
	 * 最近在线时间
	 */
	private Date llogindate;

	private Integer del_flag;

	/**
	 * 取得管理员id
	 * 
	 * @return 管理员id
	 */
	public String getId() {
		return id;
	}

	/**
	 * 设置管理员id
	 * 
	 * @param id
	 *            管理员id
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * 取得用户编号id
	 * 
	 * @return 用户编号id
	 */
	public String getUid() {
		return uid;
	}

	/**
	 * 设置用户编号id
	 * 
	 * @param uid
	 *            用户编号id
	 */
	public void setUid(String uid) {
		this.uid = uid;
	}

	/**
	 * 取得管理员姓名
	 * 
	 * @return 管理员姓名
	 */
	public String getName() {
		return name;
	}

	/**
	 * 设置管理员姓名
	 * 
	 * @param name
	 *            管理员姓名
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * 取得管理员联系电话
	 * 
	 * @return 管理员联系电话
	 */
	public String getPhone() {
		return phone;
	}

	/**
	 * 设置管理员联系电话
	 * 
	 * @param phone
	 *            管理员联系电话
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}

	/**
	 * 取得管理员地址
	 * 
	 * @return 管理员地址
	 */
	public String getAddress() {
		return address;
	}

	/**
	 * 设置管理员地址
	 * 
	 * @param address
	 *            管理员地址
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 * 取得管理员状态 0--在线，1--下线
	 * 
	 * @return 管理员状态 0--在线，1--下线
	 */
	public Integer getState() {
		return state;
	}

	/**
	 * 设置管理员状态 0--在线，1--下线
	 * 
	 * @param state
	 *            管理员状态 0--在线，1--下线
	 */
	public void setState(Integer state) {
		this.state = state;
	}

	/**
	 * 取得最近在线时间
	 * 
	 * @return 最近在线时间
	 */
	public Date getLlogindate() {
		return llogindate;
	}

	/**
	 * 设置最近在线时间
	 * 
	 * @param llogindate
	 *            最近在线时间
	 */
	public void setLlogindate(Date llogindate) {
		this.llogindate = llogindate;
	}

	public Integer getDel_flag() {
		return del_flag;
	}

	public void setDel_flag(Integer del_flag) {
		this.del_flag = del_flag;
	}
}
