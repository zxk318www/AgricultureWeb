package com.thinkgem.jeesite.modules.sys.utils;


import org.apache.poi.ss.formula.functions.T;

import java.util.List;

/**
 * Created by Zhangsnke on 2017/3/7.
 */
public class pagesQuery {

        /**
         * 当前页面
         */
        private int page = 1;

        /**
         * 显示多少行
         */
        private int rows = 6;

        /**
         * 总记录条数
         */
        private int total;

        /**
         * @return the page
         */
        public int getPage() {
            return page;
        }

        /**
         * @param page the page to set
         */
        public void setPage(int page) {
            this.page = page;
        }

        /**
         * @return the rows
         */
        public int getRows() {
            return rows;
        }

        /**
         * @param rows the rows to set
         */
        public void setRows(int rows) {
            this.rows = rows;
        }

        /**
         * @return the total
         */
        public int getTotal() {
            return total;
        }

        /**
         * @param total the total to set
         */
        public void setTotal(int total) {
            this.total = total;
        }

        /**
         * 对list集合进行分页处理
         *
         * @return
         */
        public List<T> ListSplit(List<T> list) {
            List<T> newList=null;
            total=list.size();
            newList=list.subList(rows*(page-1), ((rows*page)>total?total:(rows*page)));
            return newList;
        }


}
