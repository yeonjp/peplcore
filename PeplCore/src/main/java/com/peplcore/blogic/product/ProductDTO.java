package com.peplcore.blogic.product;

public class ProductDTO {

	private int pseq;
	private String pcategory;
	private String pname;
	private int pnum;
	private String poutStock;
	private String psize;
	private String pdescription;
	private int pcost;
	private int pselling;
	
	//검색용 - 일단...미리 작성해둠.
	// 상품 검색 조건
	private String searchPCondition;
	// 상품 검색 키워드
	private String searchPKeyword;
	
	public ProductDTO() {
		super();
	}

	public int getPseq() {
		return pseq;
	}

	public void setPseq(int pseq) {
		this.pseq = pseq;
	}

	public String getPcategory() {
		return pcategory;
	}

	public void setPcategory(String pcategory) {
		this.pcategory = pcategory;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getPnum() {
		return pnum;
	}

	public void setPnum(int pnum) {
		this.pnum = pnum;
	}

	public String getPoutStock() {
		return poutStock;
	}

	public void setPoutStock(String poutStock) {
		this.poutStock = poutStock;
	}

	public String getPsize() {
		return psize;
	}

	public void setPsize(String psize) {
		this.psize = psize;
	}

	public String getPdescription() {
		return pdescription;
	}

	public void setPdescription(String pdescription) {
		this.pdescription = pdescription;
	}

	public int getPcost() {
		return pcost;
	}

	public void setPcost(int pcost) {
		this.pcost = pcost;
	}

	public int getPselling() {
		return pselling;
	}

	public void setPselling(int pselling) {
		this.pselling = pselling;
	}

	public String getSearchPCondition() {
		return searchPCondition;
	}

	public void setSearchPCondition(String searchPCondition) {
		this.searchPCondition = searchPCondition;
	}

	public String getSearchPKeyword() {
		return searchPKeyword;
	}

	public void setSearchPKeyword(String searchPKeyword) {
		this.searchPKeyword = searchPKeyword;
	}

	@Override
	public String toString() {
		return "ProductDTO [pseq=" + pseq + ", pcategory=" + pcategory + ", pname=" + pname + ", pnum=" + pnum
				+ ", poutStock=" + poutStock + ", psize=" + psize + ", pdescription=" + pdescription + ", pcost="
				+ pcost + ", pselling=" + pselling + ", searchPCondition=" + searchPCondition + ", searchPKeyword="
				+ searchPKeyword + "]";
	}

}
