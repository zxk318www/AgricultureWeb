package com.thinkgem.jeesite.modules.agriculture.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * Po
 * 
 * @author Silver Howe
 * @version 1.0, 2017/2/10 15:59:50
 */
public class User implements Serializable {

	/**
	 * 账户id
	 */
	private String id;

	/**
	 * 账户登录名
	 */
	private String uname;

	/**
	 * 账户头像
	 */
	private String img;

	/**
	 * 账户密码
	 */
	private String pwd;

	/**
	 * 账户类型  0--普通用户 1--高级用户 2--管理员
	 */
	private Integer state;

	/**
	 * 删除标记  0--未删除，1--删除
	 */
	private Integer del_flag;

	/**
	 * 创建时间
	 */
	private Date updatedate;

	/**
	 * 删除时间
	 */
	private Date deletedate;

	/**
	 * 取得账户id
	 * 
	 * @return 账户id
	 */
	public String getId() {
		return id;
	}

	/**
	 * 设置账户id
	 * 
	 * @param id
	 *            账户id
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * 取得账户登录名
	 * 
	 * @return 账户登录名
	 */
	public String getUname() {
		return uname;
	}

	/**
	 * 设置账户登录名
	 * 
	 * @param uname
	 *            账户登录名
	 */
	public void setUname(String uname) {
		this.uname = uname;
	}

	/**
	 * 取得账户密码
	 * 
	 * @return 账户密码
	 */
	public String getPwd() {
		return pwd;
	}

	/**
	 * 设置账户密码
	 * 
	 * @param pwd
	 *            账户密码
	 */
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	/**
	 * 取得账户类型  0--普通用户 1--高级用户 2--管理员
	 * 
	 * @return 账户类型  0--普通用户 1--高级用户 2--管理员
	 */
	public Integer getState() {
		return state;
	}

	/**
	 * 设置账户类型  0--普通用户 1--高级用户 2--管理员
	 * 
	 * @param state
	 *            账户类型  0--普通用户 1--高级用户 2--管理员
	 */
	public void setState(Integer state) {
		this.state = state;
	}

	/**
	 * 取得删除标记  0--未删除，1--删除
	 * 
	 * @return 删除标记  0--未删除，1--删除
	 */
	public Integer getDel_flag() {
		return del_flag;
	}

	public void setDel_flag(Integer del_flag) {
		this.del_flag = del_flag;
	}

	/**
	 * 取得创建时间
	 * 
	 * @return 创建时间
	 */
	public Date getUpdatedate() {
		return updatedate;
	}

	/**
	 * 设置创建时间
	 * 
	 * @param updatedate
	 *            创建时间
	 */
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}

	/**
	 * 取得删除时间
	 * 
	 * @return 删除时间
	 */
	public Date getDeletedate() {
		return deletedate;
	}

	/**
	 * 设置删除时间
	 * 
	 * @param deletedate
	 *            删除时间
	 */
	public void setDeletedate(Date deletedate) {
		this.deletedate = deletedate;
	}


	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
}
