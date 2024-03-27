package com.peplcore.blogic.board;


public class FAQDTO { //게시글번호, 제목, 내용, 글쓴이(id)
	private int bseq; //게시글번호
	private String btitle; //제목
	private String bcontent; //내용
	private String bid; //글쓴이
	
	public FAQDTO() { }

	public FAQDTO(int bseq, String btitle, String bcontent, String bid) {
		super();
		this.bseq = bseq;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bid = bid;
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



	@Override
	public String toString() {
		return "FAQDTO [bseq=" + bseq + ", btitle=" + btitle + ", bcontent=" + bcontent + ", bid=" + bid + "]";
	}
	
	
	
}
