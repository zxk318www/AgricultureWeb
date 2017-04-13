package com.thinkgem.jeesite.modules.agriculture.entity;

import com.thinkgem.jeesite.common.persistence.BaseEntity;

import java.util.Date;

/**
 * Po
 * 
 * @author Silver Howe
 * @version 1.0, 2017/4/5 16:44:22
 */
public class Classes extends BaseEntity {

	/**
	 * 课堂id
	 */
	private String id;

	/**
	 * 课堂标题
	 */
	private String title;

	/**
	 * 课堂文本内容
	 */
	private String content;

	/**
	 * 发布时间
	 */
	private Date postdate;

	/**
	 * 发布人
	 */
	private String poster;

	/**
	 * 课堂视频
	 */
	private String video;

	/**
	 * 删除标记，0--未删除，1--删除
	 */
	private Integer delFlag;

	/**
	 * 取得课堂id
	 * 
	 * @return 课堂id
	 */
	public String getId() {
		return id;
	}

	/**
	 * 设置课堂id
	 * 
	 * @param id
	 *            课堂id
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
	 * 取得课堂标题
	 * 
	 * @return 课堂标题
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * 设置课堂标题
	 * 
	 * @param title
	 *            课堂标题
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * 取得课堂文本内容
	 * 
	 * @return 课堂文本内容
	 */
	public String getContent() {
		return content;
	}

	/**
	 * 设置课堂文本内容
	 * 
	 * @param content
	 *            课堂文本内容
	 */
	public void setContent(String content) {
		this.content = content;
	}

	/**
	 * 取得发布时间
	 * 
	 * @return 发布时间
	 */
	public Date getPostdate() {
		return postdate;
	}

	/**
	 * 设置发布时间
	 * 
	 * @param postdate
	 *            发布时间
	 */
	public void setPostdate(Date postdate) {
		this.postdate = postdate;
	}

	/**
	 * 取得发布人
	 * 
	 * @return 发布人
	 */
	public String getPoster() {
		return poster;
	}

	/**
	 * 设置发布人
	 * 
	 * @param poster
	 *            发布人
	 */
	public void setPoster(String poster) {
		this.poster = poster;
	}

	/**
	 * 取得课堂视频
	 * 
	 * @return 课堂视频
	 */
	public String getVideo() {
		return video;
	}

	/**
	 * 设置课堂视频
	 * 
	 * @param video
	 *            课堂视频
	 */
	public void setVideo(String video) {
		this.video = video;
	}

	/**
	 * 取得删除标记，0--未删除，1--删除
	 * 
	 * @return 删除标记，0--未删除，1--删除
	 */
	public Integer getDelFlag() {
		return delFlag;
	}

	/**
	 * 设置删除标记，0--未删除，1--删除
	 * 
	 * @param delFlag
	 *            删除标记，0--未删除，1--删除
	 */
	public void setDelFlag(Integer delFlag) {
		this.delFlag = delFlag;
	}

}
