package com.github.grizz.supplier.model;

import java.util.List;
/**
 * 分页功能的实体类
 */
public class PageBean<T> {
	private int pc;//当前页码page code
	private int tr;//总记录数total record
	private int ps;//每页记录数page size
	private int endNumber;//结束数
	private int beginNumber;//开始数
	private List<T> beanList;//当前页的记录
	private String nameSearch;//按姓名查询时的传递参数
	private String codeSearch;//按源代码查询时的传递参数
	private String listName;//按源代码查询时的传递参数
	public int getPc() {
		return pc;
	}
	public void setPc(int pc) {
		this.pc = pc;
	}
	
	public int getBeginNumber() {
		beginNumber = (pc-1)*ps;
		return beginNumber;
	}
	
	public int getEndNumber() {
		endNumber = pc*ps;
		return endNumber;
	}
	
	/**
	 * 计算总页数
	 * @return
	 */
	public int getTp() {
		int tp = tr / ps;
		return tr%ps==0 ? tp : tp+1 ;
	}
	 
	public int getTr() {
		return tr;
	}
	public void setTr(int tr) {
		this.tr = tr;
	}
	public int getPs() {
		return ps;
	}
	public void setPs(int ps) {
		this.ps = ps;
	}
	public List<T> getBeanList() {
		return beanList;
	}
	public void setBeanList(List<T> beanList) {
		this.beanList = beanList;
	}

	public String getNameSearch() {
		return nameSearch;
	}
	public void setNameSearch(String nameSearch) {
		this.nameSearch = nameSearch;
	}
	public String getCodeSearch() {
		return codeSearch;
	}
	public void setCodeSearch(String codeSearch) {
		this.codeSearch = codeSearch;
	}
	public String getListName() {
		return listName;
	}
	public void setListName(String listName) {
		this.listName = listName;
	}

}
