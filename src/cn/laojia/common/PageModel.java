package cn.laojia.common;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;

public class PageModel extends BaseEntity{
	
	private static final int PAGE_SIZE = 10;
	
	/** 当前的页数 */
	private int currPage;
	/** 一页显示的数量 */
	private int pageSize;
	/** 总记录条数 */
	private int recordCount;
	/**保存结果集*/
	private List datas;
	
	public void setCurrPageNumberFormRequest(HttpServletRequest request){
		String sPage = request.getParameter("page");	
		if(StringUtils.isNotEmpty(sPage)){
			currPage=Integer.parseInt(sPage);
		}
		
	}
	
	private int pagetag;
	/** setter and getter method */
	
	public int getCurrPage() {
		return currPage < 1 ? 1 : this.currPage;
	}
	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}
	
	public int getPageSize() {
		return pageSize < 1 ? PAGE_SIZE : pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getRecordCount() {
		return recordCount;
	}
	public void setRecordCount(int recordCount) {
		this.recordCount = recordCount;
	}
	//页数
	public int getPageCount(){
		return this.getRecordCount() % this.getPageSize() == 0
					? this.getRecordCount() / this.getPageSize() 
					: (this.getRecordCount() / this.getPageSize()) + 1;
	}
	
	public int getPagetag() {
		double tag=recordCount/(double)pageSize;
		tag=Math.ceil(tag);
		return (int)tag;
	}
	public void setPagetag(int pagetag) {
		this.pagetag = pagetag;
	}
	/** 分页时获取开始的行数 */
	public int getStartRow() {
		// SELECT * FROM hrm_notice LIMIT 2,1 3-1 * 1: 每一页显示的记录条数
		// 3 : 当前页数： pageIndex
		
		this.currPage = this.getCurrPage() > this.getPageCount() ? this.getPageCount() : this.getCurrPage();
		int start  =(currPage - 1) * this.getPageSize();
		if(start<0){
			return 0;
		}else{
			return start;
		}
	}
	
	public List getDatas() {
		return datas;
	}
	public void setDatas(List datas) {
		this.datas = datas;
	}
	
}
