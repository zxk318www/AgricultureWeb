package com.thinkgem.jeesite.modules.agriculture.entity;

import com.thinkgem.jeesite.common.persistence.BaseEntity;

/**
 * Po
 * 
 * @author Silver Howe
 * @version 1.0, 2017/4/22 22:35:38
 */
public class Switchimg extends BaseEntity {

	/**
	 * 图片id
	 */
	private String id;

	/**
	 * 图片路径
	 */
	private String img;

	/**
	 * 上传的管理员id
	 */
	private String adminid;

	/**
	 * 预留字段
	 */
	private String yl;

	/**
	 * 删除标记
	 */
	private Integer delFlag;

	/**
	 * 取得图片id
	 * 
	 * @return 图片id
	 */
	public String getId() {
		return id;
	}

	/**
	 * 设置图片id
	 * 
	 * @param id
	 *            图片id
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
	 * 取得图片路径
	 * 
	 * @return 图片路径
	 */
	public String getImg() {
		return img;
	}

	/**
	 * 设置图片路径
	 * 
	 * @param img
	 *            图片路径
	 */
	public void setImg(String img) {
		this.img = img;
	}

	/**
	 * 取得上传的管理员id
	 * 
	 * @return 上传的管理员id
	 */
	public String getAdminid() {
		return adminid;
	}

	/**
	 * 设置上传的管理员id
	 * 
	 * @param adminid
	 *            上传的管理员id
	 */
	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}

	/**
	 * 取得预留字段
	 * 
	 * @return 预留字段
	 */
	public String getYl() {
		return yl;
	}

	/**
	 * 设置预留字段
	 * 
	 * @param yl
	 *            预留字段
	 */
	public void setYl(String yl) {
		this.yl = yl;
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

}
