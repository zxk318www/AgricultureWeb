package com.thinkgem.jeesite.modules.sys.web;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.thinkgem.jeesite.common.config.Global;
import org.apache.commons.lang3.StringUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Zhangsnke on 2017/3/1.
 */
public class MiniPage {

    private int pageNo = 1; // 当前页码
    private int pageSize = Integer.valueOf(Global.getConfig("page.pageSize")); // 页面大小，设置为“-1”表示不进行分页（分页无效）

    private String sortField;//排序字段
    private String sortOrder;//排序类型

    private long total;// 总记录数，设置为“-1”表示不查询总数

    @SuppressWarnings("rawtypes")
    private List data = new ArrayList();

    public MiniPage() {
        this.pageSize = -1;
    }

    /**
     * 构造方法
     *
     */
    public MiniPage(HttpServletRequest request, HttpServletResponse response) {
        // 设置页码参数（传递repage参数，来记住页码）
        String no = request.getParameter("pageIndex");
        if (StringUtils.isNumeric(no)) {
            this.setPageNo(Integer.parseInt(no));
        }
        // 设置页面大小参数（传递repage参数，来记住页码大小）
        String size = request.getParameter("pageSize");
        if (StringUtils.isNumeric(size)) {
            this.setPageSize(Integer.parseInt(size));
        }

        this.setSortField(request.getParameter("sortField"));
        this.setSortOrder(request.getParameter("sortOrder"));
    }

    /**
     * 构造方法
     *
     * @param pageNo
     *            当前页码
     * @param pageSize
     *            分页大小
     */
    public MiniPage(int pageNo, int pageSize) {
        this(pageNo, pageSize, 0);
    }

    /**
     * 构造方法
     *
     * @param pageNo
     *            当前页码
     * @param pageSize
     *            分页大小
     * @param total
     *            数据条数
     */
    @SuppressWarnings("rawtypes")
    public MiniPage(int pageNo, int pageSize, long total) {
        this(pageNo, pageSize, total, new ArrayList());
    }

    /**
     * 构造方法
     *
     * @param pageNo
     *            当前页码
     * @param pageSize
     *            分页大小
     * @param total
     *            数据条数
     * @param list
     *            本页数据对象列表
     */
    public MiniPage(int pageNo, int pageSize, long total, @SuppressWarnings("rawtypes") List list) {
        this.setTotal(total);
        this.setPageNo(pageNo);
        this.pageSize = pageSize;
        this.setData(list);
    }

    /**
     * 获取设置总数
     *
     * @return
     */
    public long getTotal() {
        return total;
    }

    /**
     * 设置数据总数
     *
     * @param total
     */
    public void setTotal(long total) {
        this.total = total;
        if (pageSize >= total) {
            pageNo = 1;
        }
    }

    /**
     * 获取当前页码
     *
     * @return
     */
    @JsonIgnore
    public int getPageNo() {
        return pageNo;
    }

    /**
     * 设置当前页码
     *
     * @param pageNo
     */
    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    /**
     * 获取页面大小
     *
     * @return
     */
    @JsonIgnore
    public int getPageSize() {
        return pageSize;
    }

    /**
     * 设置页面大小（最大500）
     *
     * @param pageSize
     */
    public void setPageSize(int pageSize) {
        this.pageSize = pageSize <= 0 ? 10 : pageSize;// > 500 ? 500 : pageSize;
    }

    /**
     * 获取本页数据对象列表
     *
     * @return List<T>
     */
    @SuppressWarnings("rawtypes")
    public List getData() {
        return data;
    }

    /**
     * 设置本页数据对象列表
     *
     * @param data
     */
    public MiniPage setData(@SuppressWarnings("rawtypes") List data) {
        this.data = data;
        return this;
    }

    /**
     * 获取 Hibernate FirstResult
     */
    @JsonIgnore
    public int getFirstResult() {
        int firstResult = (getPageNo()) * getPageSize();
        if (firstResult >= getTotal()) {
            firstResult = 0;
        }
        return firstResult;
    }

    @JsonIgnore
    public int getLastResult() {
        int lastResult = getFirstResult() + getMaxResults();
        if (lastResult > getTotal()) {
            lastResult = (int) getTotal();
        }
        return lastResult;
    }

    /**
     * 获取 Hibernate MaxResults
     */
    @JsonIgnore
    public int getMaxResults() {
        return getPageSize();
    }

    /**
     * 获取排序字段
     * @return
     */
    @JsonIgnore
    public String getSortField() {
        return sortField;
    }

    public void setSortField(String sortField) {
        this.sortField = sortField;
    }

    /**
     * 获取排序类型
     * @return
     */
    @JsonIgnore
    public String getSortOrder() {
        return sortOrder;
    }

    public void setSortOrder(String sortOrder) {
        this.sortOrder = sortOrder;
    }

}
