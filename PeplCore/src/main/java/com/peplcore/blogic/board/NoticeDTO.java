package com.peplcore.blogic.board;

import java.util.Date;

public class NoticeDTO { //bseq, btitle, bcontent, bid, bdate
	
	private int bseq;
	private String btitle;
	private String bcontent;
	private String bid;
	//private String bdate;
	//private Timestamp bdate;
	private Date bdate;
	
	public NoticeDTO() {}
	
	public NoticeDTO(int bseq, String btitle, String bcontent, String bid, Date bdate) {
		super();
		this.bseq = bseq;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bid = bid;
		this.bdate = bdate;
	}

	public int getBseq() {
		return bseq;
	}

	public void setBseq(int bseq) {
		this.bseq = bseq;
	}

	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public String getBcontent() {
		return bcontent;
	}

	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}

	public String getBid() {
		return bid;
	}

	public void setBid(String bid) {
		this.bid = bid;
	}

	public Date getBdate() {
		return bdate;
	}

	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}

	
	
	
	

}
