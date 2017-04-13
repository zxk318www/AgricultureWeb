package com.thinkgem.jeesite.modules.agriculture.entity;

import java.util.Date;

/**
 * 管理员信息视图
 * Created by Zhangsnke on 2017/2/24.
 */
public class AdminVo {

    /**
     * 账户id
     */
    private String id;

    /**
     * 账户登录名
     */
    private String uname;

    /**
     * 账户密码
     */
    private String pwd;

    /**
     * 账户类型  0--普通用户 1--高级用户 2--管理员
     */
    private Integer Userstate;

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

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public Integer getUserstate() {
        return Userstate;
    }

    public void setUserstate(Integer userstate) {
        Userstate = userstate;
    }

    public Integer getDel_flag() {
        return del_flag;
    }

    public void setDel_flag(Integer del_flag) {
        this.del_flag = del_flag;
    }

    public Date getUpdatedate() {
        return updatedate;
    }

    public void setUpdatedate(Date updatedate) {
        this.updatedate = updatedate;
    }

    public Date getDeletedate() {
        return deletedate;
    }

    public void setDeletedate(Date deletedate) {
        this.deletedate = deletedate;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Date getLlogindate() {
        return llogindate;
    }

    public void setLlogindate(Date llogindate) {
        this.llogindate = llogindate;
    }
}
