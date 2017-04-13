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
public class Note extends BaseEntity<Note> implements Serializable {

	/**
	 * 帖子id
	 */
	private String id;

	/**
	 *帖子类型
	 */
	private String type;

	/**
	 * 帖子关联回复贴
	 */
	private String msgid;

	/**
	 * 关联User的id
	 */
	private String uid;

	/**
	 * 帖子的标题
	 */
	private String title;

	/**
	 * 帖子的正文
	 */
	private String content;

	/**
	 * 帖子状态 0--展示，1--下线整改，2--驳回
	 */
	private Integer state;

	private String stateStr;

	/**
	 * 发帖时间
	 */
	private Date postdate;

	private String postdateStr;

	/**
	 * 关联AdminInfo的id
	 */
	private String admininfoid;

	/**
	 * 帖子的浏览数
	 */
	private Integer num;


	/**
	 * 删除标记 0-未删除，1-删除
	 */
	private Integer del_flag;

	/**
	 * 取得帖子id
	 * 
	 * @return 帖子id
	 */
	public String getId() {
		return id;
	}

	/**
	 * 设置帖子id
	 * 
	 * @param id
	 *            帖子id
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
	 * 取得关联User的id
	 * 
	 * @return 关联User的id
	 */
	public String getUid() {
		return uid;
	}

	/**
	 * 设置关联User的id
	 * 
	 * @param uid
	 *            关联User的id
	 */
	public void setUid(String uid) {
		this.uid = uid;
	}

	/**
	 * 取得帖子的标题
	 * 
	 * @return 帖子的标题
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * 设置帖子的标题
	 * 
	 * @param title
	 *            帖子的标题
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * 取得帖子的正文
	 * 
	 * @return 帖子的正文
	 */
	public String getContent() {
		return content;
	}

	/**
	 * 设置帖子的正文
	 * 
	 * @param content
	 *            帖子的正文
	 */
	public void setContent(String content) {
		this.content = content;
	}

	/**
	 * 取得帖子状态 0--展示，1--删除，2--强制下线
	 * 
	 * @return 帖子状态 0--展示，1--删除，2--强制下线
	 */
	public Integer getState() {
		return state;
	}

	/**
	 * 设置帖子状态 0--展示，1--删除，2--强制下线
	 * 
	 * @param state
	 *            帖子状态 0--展示，1--删除，2--强制下线
	 */
	public void setState(Integer state) {
		this.state = state;
	}

	/**
	 * 取得发帖时间
	 * 
	 * @return 发帖时间
	 */
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm")
	public Date getPostdate() {
		return postdate;
	}

	/**
	 * 设置发帖时间
	 * 
	 * @param postdate
	 *            发帖时间
	 */
	public void setPostdate(Date postdate) {
		this.postdate = postdate;
	}

	/**
	 * 取得关联AdminInfo的id
	 * 
	 * @return 关联AdminInfo的id
	 */
	public String getAdmininfoid() {
		return admininfoid;
	}

	/**
	 * 设置关联AdminInfo的id
	 * 
	 * @param admininfoid
	 *            关联AdminInfo的id
	 */
	public void setAdmininfoid(String admininfoid) {
		this.admininfoid = admininfoid;
	}

	/**
	 * 取得帖子的浏览数
	 * 
	 * @return 帖子的浏览数
	 */
	public Integer getNum() {
		return num;
	}

	/**
	 * 设置帖子的浏览数
	 * 
	 * @param num
	 *            帖子的浏览数
	 */
	public void setNum(Integer num) {
		this.num = num;
	}


	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}


	public Integer getDel_flag() {
		return del_flag;
	}

	public void setDel_flag(Integer del_flag) {
		this.del_flag = del_flag;
	}

	public String getMsgid() {
		return msgid;
	}

	public void setMsgid(String msgid) {
		this.msgid = msgid;
	}

	public String getStateStr() {
		return stateStr;
	}

	public void setStateStr(String stateStr) {
		this.stateStr = stateStr;
	}

	public String getPostdateStr() {
		return postdateStr;
	}

	public void setPostdateStr(String postdateStr) {
		this.postdateStr = postdateStr;
	}

	@Override
	public String toString() {
		return "[Entity->Note:]title:"+title+";content:"+content+";type:"+type+";postTime:"+postdate+";uid="+uid;
	}
}
