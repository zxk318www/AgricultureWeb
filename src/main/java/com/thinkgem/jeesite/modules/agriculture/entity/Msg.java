package com.thinkgem.jeesite.modules.agriculture.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.BaseEntity;

import java.io.Serializable;
import java.util.Date;

/**
 * Po
 * 
 * @author Silver Howe
 * @version 1.0, 2017/3/2 11:33:36
 */
public class Msg extends BaseEntity implements Serializable {

	/**
	 * 回复帖子的id
	 */
	private String id;

	/**
	 * 回复帖子的userid
	 */
	private String uid;

	/**
	 * 回复帖子的楼层
	 */
	private Integer lou;

	private String loustr;

	/**
	 * 回复帖子的用户名
	 */
	private String uname;

	/**
	 * 帖子的id
	 */
	private  String noteid;

	private String noteName;
	/**
	 * 回复贴消息
	 */
	private String msg;

	/**
	 * 回复贴图片
	 */
	private String msgphoto;

	/**
	 * 回复贴创建日期
	 */
	private Date createDate;

	/**
	 * 回复贴创建时间str
	 */
	private String createDateStr;

	/**
	 * 删除标记
	 */
	private Integer delFlag;

	/**
	 * 取得回复帖子的id
	 * 
	 * @return 回复帖子的id
	 */
	public String getId() {
		return id;
	}

	/**
	 * 设置回复帖子的id
	 * 
	 * @param id
	 *            回复帖子的id
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
	 * 取得回复帖子的userid
	 * 
	 * @return 回复帖子的userid
	 */
	public String getUid() {
		return uid;
	}

	/**
	 * 设置回复帖子的userid
	 * 
	 * @param uid
	 *            回复帖子的userid
	 */
	public void setUid(String uid) {
		this.uid = uid;
	}

	/**
	 * 取得回复贴消息
	 * 
	 * @return 回复贴消息
	 */
	public String getMsg() {
		return msg;
	}

	/**
	 * 设置回复贴消息
	 * 
	 * @param msg
	 *            回复贴消息
	 */
	public void setMsg(String msg) {
		this.msg = msg;
	}

	/**
	 * 取得回复贴图片
	 * 
	 * @return 回复贴图片
	 */
	public String getMsgphoto() {
		return msgphoto;
	}

	/**
	 * 设置回复贴图片
	 * 
	 * @param msgphoto
	 *            回复贴图片
	 */
	public void setMsgphoto(String msgphoto) {
		this.msgphoto = msgphoto;
	}

	/**
	 * 取得回复贴创建日期
	 * 
	 * @return 回复贴创建日期
	 */
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm")
	public Date getCreateDate() {
		return createDate;
	}

	/**
	 * 设置回复贴创建日期
	 * 
	 * @param createDate
	 *            回复贴创建日期
	 */
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
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

	public String getNoteid() {
		return noteid;
	}

	public void setNoteid(String noteid) {
		this.noteid = noteid;
	}

	public String getCreateDateStr() {
		return createDateStr;
	}

	public void setCreateDateStr(String createDateStr) {
		this.createDateStr = createDateStr;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public Integer getLou() {
		return lou;
	}

	public void setLou(Integer lou) {
		this.lou = lou;
	}

	public String getLoustr() {
		return loustr;
	}

	public void setLoustr(String loustr) {
		this.loustr = loustr;
	}

	public String getNoteName() {
		return noteName;
	}

	public void setNoteName(String noteName) {
		this.noteName = noteName;
	}

	@Override
	public String toString() {
		return "[Entity->Msg:]回复帖子的id:"+id+";回复帖子的userid:"+uid+";回复帖子的uname:"+uname+";msg:"+msg+";msgphoto:"+msgphoto+";CreateDate:"
				+createDate+";CreateDateStr:"+createDateStr+";回复帖子的楼层:"+lou;
	}
}
