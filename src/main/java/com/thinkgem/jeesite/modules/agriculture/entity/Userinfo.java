package com.thinkgem.jeesite.modules.agriculture.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * Po
 * 
 * @author Silver Howe
 * @version 1.0, 2017/2/10 15:59:50
 */
public class Userinfo  implements Serializable {

	/**
	 * 用户id
	 */
	private String id;

	/**
	 * 账户id
	 */
	private String uid;

	/**
	 * 用户姓名
	 */
	private String name;

	/**
	 * 用户年龄
	 */
	private String age;

	/**
	 * 用户证件号码
	 */
	private String idCard;

	/**
	 * 用户电话
	 */
	private String phone;

	/**
	 * 用户手机
	 */
	private String moblie;

	/**
	 * 用户性别
	 */
	private String sex;

	/**
	 * 用户居住地址
	 */
	private String address;

	/**
	 * 用户等级  1-5级，5级最高
	 */
	private Integer level;

	/**
	 * 用户余额
	 */
	private Double balance;

	/**
	 * 用户状态 0--在线 ，1--下线
	 */
	private Integer state;

	/**
	 * 最近在线时间
	 */
	private Date llogindate;

	/**
	 * 删除标记  0--未删除，1--删除
	 */
	private Integer del_flag;

	/**
	 * 取得用户id
	 * 
	 * @return 用户id
	 */
	public String getId() {
		return id;
	}

	/**
	 * 设置用户id
	 * 
	 * @param id
	 *            用户id
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * 取得账户id
	 * 
	 * @return 账户id
	 */
	public String getUid() {
		return uid;
	}

	/**
	 * 设置账户id
	 * 
	 * @param uid
	 *            账户id
	 */
	public void setUid(String uid) {
		this.uid = uid;
	}

	/**
	 * 取得用户姓名
	 * 
	 * @return 用户姓名
	 */
	public String getName() {
		return name;
	}

	/**
	 * 设置用户姓名
	 * 
	 * @param name
	 *            用户姓名
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * 取得用户年龄
	 * 
	 * @return 用户年龄
	 */
	public String getAge() {
		return age;
	}

	/**
	 * 设置用户年龄
	 * 
	 * @param age
	 *            用户年龄
	 */
	public void setAge(String age) {
		this.age = age;
	}

	/**
	 * 取得用户证件号码
	 * 
	 * @return 用户证件号码
	 */
	public String getIdCard() {
		return idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	/**
	 * 取得用户电话
	 * 
	 * @return 用户电话
	 */
	public String getPhone() {
		return phone;
	}

	/**
	 * 设置用户电话
	 * 
	 * @param phone
	 *            用户电话
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}

	/**
	 * 取得用户性别
	 * 
	 * @return 用户性别
	 */
	public String getSex() {
		return sex;
	}

	/**
	 * 设置用户性别
	 * 
	 * @param sex
	 *            用户性别
	 */
	public void setSex(String sex) {
		this.sex = sex;
	}

	/**
	 * 取得用户居住地址
	 * 
	 * @return 用户居住地址
	 */
	public String getAddress() {
		return address;
	}

	/**
	 * 设置用户居住地址
	 * 
	 * @param address
	 *            用户居住地址
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 * 取得用户等级  1-5级，5级最高
	 * 
	 * @return 用户等级  1-5级，5级最高
	 */
	public Integer getLevel() {
		return level;
	}

	/**
	 * 设置用户等级  1-5级，5级最高
	 * 
	 * @param level
	 *            用户等级  1-5级，5级最高
	 */
	public void setLevel(Integer level) {
		this.level = level;
	}

	/**
	 * 取得用户余额
	 * 
	 * @return 用户余额
	 */
	public Double getBalance() {
		return balance;
	}

	/**
	 * 设置用户余额
	 * 
	 * @param balance
	 *            用户余额
	 */
	public void setBalance(Double balance) {
		this.balance = balance;
	}

	/**
	 * 取得用户状态 0--在线 ，1--下线
	 * 
	 * @return 用户状态 0--在线 ，1--下线
	 */
	public Integer getState() {
		return state;
	}

	/**
	 * 设置用户状态 0--在线 ，1--下线
	 * 
	 * @param state
	 *            用户状态 0--在线 ，1--下线
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

	public String getMoblie() {
		return moblie;
	}

	public void setMoblie(String moblie) {
		this.moblie = moblie;
	}

	public Integer getDel_flag() {
		return del_flag;
	}

	public void setDel_flag(Integer del_flag) {
		this.del_flag = del_flag;
	}
}
