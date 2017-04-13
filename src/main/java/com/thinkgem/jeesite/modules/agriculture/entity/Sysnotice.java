package com.thinkgem.jeesite.modules.agriculture.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.BaseEntity;

import java.util.Date;

/**
 * Po
 * 
 * @author Silver Howe
 * @version 1.0, 2017/3/20 9:43:12
 */
public class Sysnotice extends BaseEntity{

	/**
	 * 系统通知id
	 */
	private String id;

	/**
	 * 关联通知消息的用户（接收用户）
	 */
	private String touid;

	/**
	 * 关联通知消息的用户2（发送用户）
	 */
	private String fromuid;

	/**
	 * 关联其他id
	 */
	private String qtid;

	/**
	 * 通知消息标题
	 */
	private String title;

	/**
	 * 系统通知消息正文
	 */
	private String content;

	/**
	 * 消息生成时间
	 */
	private Date postdate;

	private String postdateStr;

	private Integer del_flag;

	/**
	 * 取得系统通知id
	 * 
	 * @return 系统通知id
	 */
	public String getId() {
		return id;
	}

	/**
	 * 设置系统通知id
	 * 
	 * @param id
	 *            系统通知id
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
	 * 取得关联通知消息的用户（接收用户）
	 * 
	 * @return 关联通知消息的用户（接收用户）
	 */
	public String getTouid() {
		return touid;
	}

	/**
	 * 设置关联通知消息的用户（接收用户）
	 * 
	 * @param touid
	 *            关联通知消息的用户（接收用户）
	 */
	public void setTouid(String touid) {
		this.touid = touid;
	}

	/**
	 * 取得关联通知消息的用户2（发送用户）
	 * 
	 * @return 关联通知消息的用户2（发送用户）
	 */
	public String getFromuid() {
		return fromuid;
	}

	/**
	 * 设置关联通知消息的用户2（发送用户）
	 * 
	 * @param fromuid
	 *            关联通知消息的用户2（发送用户）
	 */
	public void setFromuid(String fromuid) {
		this.fromuid = fromuid;
	}

	/**
	 * 取得关联其他id
	 * 
	 * @return 关联其他id
	 */
	public String getQtid() {
		return qtid;
	}

	/**
	 * 设置关联其他id
	 * 
	 * @param qtid
	 *            关联其他id
	 */
	public void setQtid(String qtid) {
		this.qtid = qtid;
	}

	/**
	 * 取得通知消息标题
	 * 
	 * @return 通知消息标题
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * 设置通知消息标题
	 * 
	 * @param title
	 *            通知消息标题
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * 取得系统通知消息正文
	 * 
	 * @return 系统通知消息正文
	 */
	public String getContent() {
		return content;
	}

	/**
	 * 设置系统通知消息正文
	 * 
	 * @param content
	 *            系统通知消息正文
	 */
	public void setContent(String content) {
		this.content = content;
	}

	/**
	 * 取得消息生成时间
	 * 
	 * @return 消息生成时间
	 */
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm")
	public Date getPostdate() {
		return postdate;
	}

	/**
	 * 设置消息生成时间
	 * 
	 * @param postdate
	 *            消息生成时间
	 */
	public void setPostdate(Date postdate) {
		this.postdate = postdate;
	}


	public String getPostdateStr() {
		return postdateStr;
	}

	public void setPostdateStr(String postdateStr) {
		this.postdateStr = postdateStr;
	}

	public Integer getDel_flag() {
		return del_flag;
	}

	public void setDel_flag(Integer del_flag) {
		this.del_flag = del_flag;
	}
}
