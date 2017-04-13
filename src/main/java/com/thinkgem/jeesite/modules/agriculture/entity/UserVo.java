package com.thinkgem.jeesite.modules.agriculture.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.BaseEntity;

import java.util.Date;

/**
 * Created by Zhangsnke on 2017/2/23.
 */
public class UserVo extends BaseEntity {


    /**
     * 账户信息id(userid)
     */
    private String id;


    /**
     * 账户登录名
     */
    private String username;

    /**
     * 账户头像
     */
    private String img;

    /**
     * 账户密码
     */
    private String password;

    /**
     * 账户类型  0--普通用户 1--高级用户 2--管理员
     */
    private Integer Userlevel;

    private String ulStr;

    /**
     * 删除标记  0--未删除，1--删除
     */
    private Integer delFlag;

    /**
     * 创建时间
     */
    private Date updatedate;


    /**
     * 删除时间
     */
    private Date deletedate;

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
     * 用户座机电话
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

    private String stateStr;

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

    @Override
    public void preInsert() {

    }

    @Override
    public void preUpdate() {

    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Integer getUserlevel() {
        return Userlevel;
    }

    public void setUserlevel(Integer userlevel) {
        Userlevel = userlevel;
    }

    public Integer getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(Integer delFlag) {
        this.delFlag = delFlag;
    }

    public Date getUpdatedate() {
        return updatedate;
    }

    public void setUpdatedate(Date updatedate) {
        this.updatedate = updatedate;
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

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public Double getBalance() {
        return balance;
    }

    public void setBalance(Double balance) {
        this.balance = balance;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm")
    public Date getLlogindate() {
        return llogindate;
    }

    public void setLlogindate(Date llogindate) {
        this.llogindate = llogindate;
    }

    public String getMoblie() {
        return moblie;
    }

    public void setMoblie(String moblie) {
        this.moblie = moblie;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm")
    public Date getDeletedate() {
        return deletedate;
    }

    public void setDeletedate(Date deletedate) {
        this.deletedate = deletedate;
    }

    public String getStateStr() {
        return stateStr;
    }

    public void setStateStr(String stateStr) {
        this.stateStr = stateStr;
    }

    public String getUlStr() {
        return ulStr;
    }

    public void setUlStr(String ulStr) {
        this.ulStr = ulStr;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
}
