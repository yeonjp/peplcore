package com.peplcore.web.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.peplcore.blogic.board.FAQDAO;
import com.peplcore.blogic.board.FAQDTO;
import com.peplcore.blogic.board.NoticeDAO;
import com.peplcore.blogic.board.NoticeDTO;

@WebServlet("*.bc")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BoardController() {
		super();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

//		request.setCharacterEncoding("utf-8");
//		response.setContentType("text/html; charset=uft-8");

		final String URI = request.getRequestURI();
		final String PATH = URI.substring(URI.lastIndexOf("/"));
		// URI의 /뒤의 주소

		// 1.보드의 메인
		if (PATH.equals("/board.bc")) {
			// 공지사항
			System.out.println("보드 메인");

			NoticeDTO dto = new NoticeDTO();
			NoticeDAO dao = new NoticeDAO();

			List<NoticeDTO> noticeList = dao.getAllNoticeList(dto);

			request.setAttribute("noticeList", noticeList);

			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/board/board.jsp");
			dispatcher.forward(request, response);

			// 최근 FAQ근황

			// 최근 Review근황

		}

		// 1. FAQ 등록
		// getAllFAQList.jsp->등록insertFAQView.bc->등록insertFAQ.jsp->getAllFAQList.jsp
		// getAllFAQList.jsp->등록insertFAQView.bc->목록 getAllFAQList.jsp..?bc?
		if (PATH.equals("/insertFAQ.bc")) {
			System.out.println("FAQ 등록 처리");

			request.setCharacterEncoding("utf-8");

			// jsp에서 입력된 값 받아오기
			int seq = Integer.parseInt(request.getParameter("bseq"));
//			String seq = request.getParameter("bseq");
			String title = request.getParameter("btitle");
			String id = request.getParameter("bid");
			String content = request.getParameter("bcontent");

			// dto객체 생성해서 받아온 값 넣어주기
			FAQDTO dto = new FAQDTO();
//			dto.setBseq(seq);
//			dto.setBseq(Integer.parseInt(seq));
			dto.setBtitle(title);
			dto.setBcontent(content);
			dto.setBid(id);

			// DAO객체 생성해서 sql문으로 DB에 넣어주기
			FAQDAO dao = new FAQDAO();
			dao.insertFAQ(dto);

			// 주소로의 전달을 위한 RequestDispatcher객체를 생성
			// 요청, 응답 객체를 해당 주소로 전달해서 처리해라
//			RequestDispatcher dispatcher = request.getRequestDispatcher("getAllFAQList.bc");
//			dispatcher.forward(request, response);
			response.sendRedirect("/peplcorePractice/getAllFAQList.bc");

			// 2. FAQ 수정
		} else if (PATH.equals("/updateFAQ.bc")) {
			System.out.println("FAQ 수정 처리");

			request.setCharacterEncoding("utf-8");

			int seq = Integer.parseInt(request.getParameter("bseq"));
			String title = request.getParameter("btitle");
			String content = request.getParameter("bcontent");
			String id = request.getParameter("bid");

			FAQDTO dto = new FAQDTO();
			dto.setBseq(seq);
			dto.setBtitle(title);
			dto.setBcontent(content);
			dto.setBid(id);

			FAQDAO dao = new FAQDAO();
			dao.updateFAQ(dto);

			RequestDispatcher dispatcher = request.getRequestDispatcher("/getAllFAQList.bc");
			dispatcher.forward(request, response);

			// 3. FAQ 삭제
		} else if (PATH.equals("/deleteFAQ.bc")) {
			System.out.println("FAQ 삭제 처리");

			String seq = request.getParameter("seq");

			FAQDTO dto = new FAQDTO();
			dto.setBseq(Integer.parseInt(seq));

			FAQDAO dao = new FAQDAO();
			dao.deleteFAQ(dto);

			RequestDispatcher dispatcher = request.getRequestDispatcher("/getAllFAQList.bc");
			dispatcher.forward(request, response);

			// 4. FAQ 상세보기
		} else if (PATH.equals("/getOneFAQList.bc")) {
			System.out.println("FAQ 상세 조회");

			String seq = request.getParameter("seq");

			// DTO객체생성 //dto의 setBseq에 받은 값 넣어주기
			FAQDTO dto = new FAQDTO();
			dto.setBseq(Integer.parseInt(seq));

			// DAO객체 생성 //dto의 값을 dao.getOneFAQList()메소드로 전달
			FAQDAO dao = new FAQDAO();
			FAQDTO faq = dao.getOneFAQList(dto);

			// faq라는 이름으로 dto faq의 값담기 ???????
			request.setAttribute("faq", faq);

			// 그리고 여기로가라
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/board/FAQ/getOneFAQList.jsp");
			dispatcher.forward(request, response);
//			response.sendRedirect("/WEB-INF/board/FAQ/getOneFAQList.jsp");

			// 5. FAQ 전체리스트보기
		} else if (PATH.equals("/getAllFAQList.bc")) {

			System.out.println("FAQ 전체 리스트 조회");

			// dto 객체 만들기
			FAQDTO dto = new FAQDTO();
			// dao 객체 만들기
			FAQDAO dao = new FAQDAO();

			// dao객체의 getAllFAQList()메소드에 dto를 값으로 넣어 배열만들기
			// getAllFAQList의 return값이 배열임
			List<FAQDTO> faqList = dao.getAllFAQList(dto);

			// faqList에 배열 faqList 값 담기
			request.setAttribute("faqList", faqList);

			// getAllFAQList.jsp에 값보내기
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/board/FAQ/getAllFAQList.jsp"); ///
			dispatcher.forward(request, response);

//			response.sendRedirect("/WEB-INF/board/FAQ/getAllFAQList.jsp");

			// getAllFAQList.jsp->등록을 눌렀을때
		} else if (PATH.equals("/insertFAQView.bc")) {
			System.out.println("FAQ 등록화면으로 이동");

			// dto의 getBseq,getBid 가져와야함
			// 상세조회의 다음생성값,,, dto, dao객체 생성->dao.상세조회()메소드에 dto객체 마지막값에서 +1?
			// 로그인된 아이디값,,

			// 로그인 확인
			// 세션 객체 생성
//			HttpSession session = request.getSession();

//			if(session != null) {
//				//맥스값과 함께 가야할곳 지정.
//			}else {
//				response.sendRedirect("getAllListFAQ.bc");
//			}

			FAQDAO dao = new FAQDAO();
			int maxSeq = dao.maxSeq();

			request.setAttribute("maxSeq", maxSeq);

			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/board/FAQ/insertFAQ.jsp");
			dispatcher.forward(request, response);

			// getAllFAQList.jsp->수정을 눌렀을때
		} else if (PATH.equals("/updateFAQView.bc")) {
			System.out.println("updateFAQView");

			// 클릭한 게시판의 값 가져와서 화면에 뿌려주기
			String seq = request.getParameter("seq");

			FAQDTO dto = new FAQDTO();
			dto.setBseq(Integer.parseInt(seq));

			FAQDAO dao = new FAQDAO();

			FAQDTO faq = dao.getOneFAQList(dto);
			request.setAttribute("faq", faq);

			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/board/FAQ/updateFAQ.jsp");
			dispatcher.forward(request, response);
		}

		// ---------------------------------------------------------------------------

		// 1.공지사항 등록

		if (PATH.equals("/insertNotice.bc")) {
			System.out.println("공지사항 등록");

			request.setCharacterEncoding("utf-8");

			int seq = Integer.parseInt(request.getParameter("bseq"));
			String title = request.getParameter("btitle");
			String content = request.getParameter("bcontent");
			String id = request.getParameter("bid");

			NoticeDTO dto = new NoticeDTO();
			dto.setBseq(seq);
			dto.setBtitle(title);
			dto.setBcontent(content);
			dto.setBid(id);

			NoticeDAO dao = new NoticeDAO();
			dao.insertNotice(dto);

			RequestDispatcher dispatcher = request.getRequestDispatcher("/getAllNotice.bc");
			dispatcher.forward(request, response);

			// 2. 공지사항 전체리스트
		} else if (PATH.equals("/getAllNotice.bc")) {
			System.out.println("공지사항 전체리스트 조회");

			NoticeDTO dto = new NoticeDTO();
			NoticeDAO dao = new NoticeDAO();

			List<NoticeDTO> noticeList = dao.getAllNoticeList(dto);

			request.setAttribute("noticeList", noticeList);

			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/board/notice/getAllNotice.jsp");
			dispatcher.forward(request, response);

			// 3. 공지사항 상세보기
		} else if (PATH.equals("/getOneNotice.bc")) {
			System.out.println("공지사항 상세 조회");

			String seq = request.getParameter("seq");

			NoticeDTO dto = new NoticeDTO();
			dto.setBseq(Integer.parseInt(seq));

			NoticeDAO dao = new NoticeDAO();
			NoticeDTO notice = dao.getOneNoticeList(dto);

			request.setAttribute("notice", notice);

			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/board/notice/getOneNotice.jsp");
			dispatcher.forward(request, response);

			// 4. 공지사항 수정
		} else if (PATH.equals("/updateNotice.bc")) {
			System.out.println("공지사항 수정 처리");
			request.setCharacterEncoding("utf-8");

			String title = request.getParameter("btitle");
			String content = request.getParameter("bcontent");
			String id = request.getParameter("bid");
//			String date = request.getParameter("bdate");
			int seq = Integer.parseInt(request.getParameter("bseq"));

			NoticeDTO dto = new NoticeDTO();
			dto.setBseq(seq);
			dto.setBtitle(title);
			dto.setBcontent(content);
			dto.setBid(id);
//			dto.setBid(date);

			NoticeDAO dao = new NoticeDAO();
			dao.updateNotice(dto);

			RequestDispatcher dispatcher = request.getRequestDispatcher("/getAllNotice.bc");
			dispatcher.forward(request, response);

			// 5. 공지사항 삭제
		} else if (PATH.equals("/deleteNotice.bc")) {
			System.out.println("공지사항 삭제");
			String seq = request.getParameter("seq");

			NoticeDTO dto = new NoticeDTO();
			dto.setBseq(Integer.parseInt(seq));

			NoticeDAO dao = new NoticeDAO();
			dao.deleteNotice(dto);

			RequestDispatcher dispatcher = request.getRequestDispatcher("/getAllNotice.bc");
			dispatcher.forward(request, response);

			// 등록화면으로 이동
		} else if (PATH.equals("/insertNoticeView.bc")) {
			System.out.println("등록화면으로 이동");

			NoticeDAO dao = new NoticeDAO();
			int maxSeq = dao.maxSeq();

			request.setAttribute("maxSeq", maxSeq);

			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/board/notice/insertNotice.jsp");
			dispatcher.forward(request, response);

			// 수정화면으로 이동
		} else if (PATH.equals("/updateNoticeView.bc")) {

			String seq = request.getParameter("seq");

			NoticeDTO dto = new NoticeDTO();
			dto.setBseq(Integer.parseInt(seq));

			NoticeDAO dao = new NoticeDAO();

			NoticeDTO notice = dao.getOneNoticeList(dto);
			request.setAttribute("notice", notice);

			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/board/notice/updateNotice.jsp");
			dispatcher.forward(request, response);

		}

	}

}
