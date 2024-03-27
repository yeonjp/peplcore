package com.peplcore.blogic.board;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbconnection.MyDBConnection;

public class NoticeDAO {
	
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private String NOTICE_INSERT = "insert into notice(bseq, btitle, bcontent, bid) values (null,?,?,?)";
	private String NOTICE_UPDATE = "update notice set btitle=?, bcontent=?, bid=? where bseq=?"; 
	private String NOTICE_DELETE = "delete from notice where bseq=?";
	private String NOTICE_ONE = "select * from notice where bseq=?";
	private String NOTICE_All = "select * from notice order by bseq desc";
	private String NOTICE_MAXSEQ = "select MAX(bseq) as maxbseq from faq"; 
	
	//1. 공지사항 등록
	public void insertNotice(NoticeDTO dto) {
		System.out.println("등록");
		
		try {
			//DB연결
			con = MyDBConnection.getConnection();
			
			pstmt = con.prepareStatement(NOTICE_INSERT);
			
			pstmt.setString(1, dto.getBtitle());
			pstmt.setString(2, dto.getBcontent());
			pstmt.setString(3, dto.getBid());
//			pstmt.setDate(4, (Date)dto.getBdate());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("예외발생");
			e.printStackTrace(); //추후삭제
		}finally {
			MyDBConnection.close(rs, pstmt, con);
		}
		
	}
	
	//2. 공지사항 수정
	public void updateNotice(NoticeDTO dto) {
		
		try {
			con = MyDBConnection.getConnection();
			pstmt = con.prepareStatement(NOTICE_UPDATE);
			
			pstmt.setString(1, dto.getBtitle());
			pstmt.setString(2, dto.getBcontent());
			pstmt.setString(3, dto.getBid());
//			pstmt.setDate(4, (Date) dto.getBdate());
			pstmt.setInt(4, dto.getBseq());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("예외");
			e.printStackTrace();
			
		}finally {
			MyDBConnection.close(rs, pstmt, con);
		}
		
		
		
	}
	
	//3. 공지사항 삭제
	public void deleteNotice(NoticeDTO dto) {
		
		try {
			con = MyDBConnection.getConnection();
			pstmt = con.prepareStatement(NOTICE_DELETE);
			pstmt.setInt(1, dto.getBseq());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("예외발생");
			e.printStackTrace();
		}finally {
			MyDBConnection.close(rs, pstmt, con);
		}
		
		
	}
	
	
	
	//4. 공지사항 상세조회
	public NoticeDTO getOneNoticeList(NoticeDTO dto) {
		NoticeDTO notice = null;
		
		try {
			con = MyDBConnection.getConnection();
			pstmt = con.prepareStatement(NOTICE_ONE);
			pstmt.setInt(1, dto.getBseq());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				notice = new NoticeDTO();
				
				notice.setBseq(rs.getInt("bseq"));
				notice.setBtitle(rs.getString("btitle"));
				notice.setBcontent(rs.getString("bcontent"));
				notice.setBid(rs.getString("bid"));
				notice.setBdate(rs.getDate("bdate"));
			}
			
		} catch (SQLException e) {
			System.out.println("예외발생");
			e.printStackTrace();
		}finally {
			MyDBConnection.close(rs, pstmt, con);
		}
		
		return notice;
	}
	
	
	//5. 공지사항 전체조회 
	public List<NoticeDTO> getAllNoticeList(NoticeDTO dto){
		
		List<NoticeDTO> noticeList = new ArrayList<>();
		
		try {
			con = MyDBConnection.getConnection();
			pstmt = con.prepareStatement(NOTICE_All);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				NoticeDTO notice = new NoticeDTO();
				
				notice.setBseq(rs.getInt("bseq"));
				notice.setBtitle(rs.getString("btitle"));
				notice.setBcontent(rs.getString("bcontent"));
				notice.setBid(rs.getString("bid"));
				notice.setBdate(rs.getDate("bdate"));
				
				noticeList.add(notice);
			}
			
		} catch (SQLException e) {
			System.out.println("예외");
			e.printStackTrace();//추후 삭제
		}finally {
			MyDBConnection.close(rs, pstmt, con);
		}
		
		return noticeList;
	}

	//6. FAQ 마지막 시퀀스값+1 -> 자동으로 불러올 seq번호
	public int maxSeq() {
		
		int maxSeq = 0;
		
		try {
			con = MyDBConnection.getConnection();
			pstmt = con.prepareStatement(NOTICE_MAXSEQ);
			
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
