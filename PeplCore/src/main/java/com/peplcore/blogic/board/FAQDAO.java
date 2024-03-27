package com.peplcore.blogic.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbconnection.MyDBConnection;

public class FAQDAO {
	private Connection con; //db연결
	private PreparedStatement pstmt; //sql준비,전달
	private ResultSet rs; //sql저장,처리
	
	private String FAQ_INSERT = "insert into faq(bseq,btitle,bcontent,bid) values(null,?,?,?)"; //등록
	private String FAQ_UPDATE = "update faq set btitle=?, bcontent=?, bid=? where bseq=?"; //수정
	private String FAQ_DELETE = "delete from faq where bseq=?"; //삭제
	private String FAQ_GETONE = "select * from faq where bseq=?"; //상세조회
	private String FAQ_GETALL = "select * from faq order by bseq desc"; //전체리스트조회
	private String FAQ_MAXSEQ = "select MAX(bseq) as maxbseq from faq"; //마지막시퀀스값
			
	//1.FAQ 등록
	public void insertFAQ(FAQDTO dto) {
		System.out.println("insertFAQ()메소드 실행");
		try {
			con = MyDBConnection.getConnection();
			pstmt = con.prepareStatement(FAQ_INSERT);
			//null값을 받아오기때문에 seq값은 자동으로 들어감
			//pstmt.setInt(1, dto.getBseq());
			pstmt.setString(1, dto.getBtitle());
			pstmt.setString(2, dto.getBcontent());
			pstmt.setString(3, dto.getBid());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("예외발생");
			e.printStackTrace(); //추후삭제예정
		}finally {
			MyDBConnection.close(rs, pstmt, con);
		}		
	}
	
	//2.FAQ 수정
	public void updateFAQ(FAQDTO dto) {
		
		try {
			
			con = MyDBConnection.getConnection();
			pstmt = con.prepareStatement(FAQ_UPDATE);
			
			pstmt.setString(1, dto.getBtitle());
			pstmt.setString(2, dto.getBcontent());
			pstmt.setString(3, dto.getBid());
			pstmt.setInt(4, dto.getBseq());
			
			pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			System.out.println("예외발생");
			e.printStackTrace(); //추후삭제예정
		}finally {
			System.out.println("수정완료");
			MyDBConnection.close(rs, pstmt, con);
		}		
	}
	
	
	//3.FAQ 삭제
	public void deleteFAQ(FAQDTO dto) {
		
		try {
			con = MyDBConnection.getConnection();
			pstmt = con.prepareStatement(FAQ_DELETE);
			pstmt.setInt(1, dto.getBseq());
		
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace(); //추후삭제
		}finally {
			MyDBConnection.close(rs, pstmt, con);
		}	
	}
	
	//4.FAQ 상세조회
	public FAQDTO getOneFAQList(FAQDTO dto) {
		FAQDTO faq = null;
		
		try {
			con = MyDBConnection.getConnection();
			pstmt = con.prepareStatement(FAQ_GETONE);
			pstmt.setInt(1, dto.getBseq());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				faq = new FAQDTO();
				faq.setBseq(rs.getInt("bseq"));
				faq.setBtitle(rs.getString("btitle"));
				faq.setBcontent(rs.getString("bcontent"));
				faq.setBid(rs.getString("bid"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace(); //추후삭제
		}finally {
			MyDBConnection.close(rs, pstmt, con);
		}	
		
		return faq;
	}
	
	//5.FAQ 전체리스트조회
	public List<FAQDTO> getAllFAQList(FAQDTO dto){
		List<FAQDTO> faqList = new ArrayList<>();
		
		try {
			con = MyDBConnection.getConnection();
			pstmt = con.prepareStatement(FAQ_GETALL);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				FAQDTO faq = new FAQDTO();
				
				faq.setBseq(rs.getInt("Bseq"));
				faq.setBtitle(rs.getString("Btitle"));
				faq.setBcontent(rs.getString("Bcontent"));
				faq.setBid(rs.getString("Bid"));
				
				faqList.add(faq);
			}
			
		} catch (SQLException e) {
			e.printStackTrace(); //추후삭제
		} finally {
			MyDBConnection.close(rs, pstmt, con);
		}
		
		return faqList;
	}
	
	//6. FAQ 마지막 시퀀스값+1 -> 자동으로 불러올 seq번호
	public int maxSeq() {
		
		int maxSeq = 0;
		
		try {
			con = MyDBConnection.getConnection();
			pstmt = con.prepareStatement(FAQ_MAXSEQ);
			
			rs = pstmt.executeQuery();

			if (rs.next()) {
				//마지막값에서 +1을 해주기
				maxSeq = rs.getInt("maxbseq")+1;
			}
				
		} catch (SQLException e) {
			System.out.println("예외발생");
			e.printStackTrace();
		}finally {
			MyDBConnection.close(rs, pstmt, con);
		}
		
		return maxSeq;
	}
	

}
