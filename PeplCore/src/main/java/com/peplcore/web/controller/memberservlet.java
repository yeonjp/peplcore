package com.peplcore.web.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.peplcore.blogic.member.MemberDAO;
import com.peplcore.blogic.member.MemberDTO;

@WebServlet("*.mc")
public class memberservlet extends HttpServlet {
	// 직렬화 JVM(Java Virtual Machine 이하 JVM)의 메모리에 상주(힙 또는 스택)되어
	// 있는 객체 데이터를 바이트 형태로 변환하는 기술과 직렬화된 바이트 형태의 데이터를 객체로
	// 변환해서 JVM으로 상주시키는 형태를 같이 이야기합니다.
	/*
	 * 이 코드는 자바에서 직렬화(serialization)를 위해 사용되는 것으로, 'serialVersionUID'라는 정적(static)
	 * 상수를 선언하고 있습니다. serialVersionUID는 직렬화된 객체의 버전을 식별하는 데 사용됩니다. 여기서 "1L"은
	 * serialVersionUID의 값으로, 이 값은 개발자가 수동으로 설정할 수 있습니다.
	 */
	private static final long serialVersionUID = 1L;

	// constructor
	public memberservlet() {
		super();
	}// end of constructor

	public void init(ServletConfig config) throws ServletException {
	}

	// service method
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		// 사용자 요청이 들어오면 경로를 추출
		final String URI = request.getRequestURI();
		final String PATH = URI.substring(URI.lastIndexOf("/"));

		switch (PATH) {
		case "/signInView.mc":// 로그인 화면으로 이동
			toSignIn(request, response);
			break;
		case "/signUpView.mc":// 회원가입 화면으로 이동
			toSignUp(request, response);
			break;
		case "/insertMember.mc":
			insertMember(request, response);
			break;
		case "/signIn.mc":
			signIn(request, response);
			break;
		case "/reset.mc":
			goIndex(request, response);
			break;
		case "/memberInfo.mc":
			memberInfo(request, response);
			break;
		case "/memberEdit.mc":
			memberEdit(request, response);
			break;
		case "/memberEditView.mc":
			memberEditView(request, response);
			break;

		case "/memberDelete.mc":
			memberDelete(request, response);
			break;
		case "/memberDuplicateCheck.mc":
			memberDuplicateCheck(request, response);
			break;

		case "/logout.mc":
			logout(request, response);
			break;

		case "/black.mc":
			black(request, response);
			break;
		case "/admin.mc":
			admin(request, response);
			break;
		}// end of switch

	}// end of service

	// 메인화면으로 이동하느 메소드
	private void goIndex(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/");
		dispatcher.forward(request, response);
		System.out.println("메인 페이지로 이동완료");
	}// end of goIndex

	// 로그인 화면으로 이동하는 메소드
	private void toSignIn(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/signIn.jsp");
		dispatcher.forward(request, response);
		System.out.println("로그인 화면으로 이동완료");
	}// end of toSignIn

	// 회원가입 화면으로 이동하는 메소드
	private void toSignUp(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/signUp.jsp");
		dispatcher.forward(request, response);
		System.out.println("회원가입 화면으로 이동완료");
	}// end of toSignUp

	// 회원가입하는 메소드
	private void insertMember(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// MemberDTO 객체 생성
		MemberDTO member = new MemberDTO();

		// 주소 받아서 저장
		String address1 = request.getParameter("address1");
		// 상세주소 받아서 저장
		String address2 = request.getParameter("address2");

		String address = address1 + address2;
		String id = request.getParameter("id");
		String pass1 = request.getParameter("pass1");
		String pass2 = request.getParameter("pass2");
		String pass = pass1 + pass2;
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String ssn = request.getParameter("ssn");
		String zipCode = request.getParameter("zipcode");
		String newsAgency = request.getParameter("newsAgency");
		String gender = request.getParameter("gender");
		String countrySelect = request.getParameter("countrySelect");

		// 유효성 체크
		if (id == null || id.equals("") || pass1 == null || pass1.equals("") || pass2 == null || pass2.equals("")
				|| name == null || name.equals("") || phone == null || phone.equals("") || address == null
				|| address.equals("") || zipCode == null || zipCode.equals("") || ssn == null || ssn.equals("")) {

			request.getSession().setAttribute("messageType", "오류 메세지");
			request.getSession().setAttribute("messageContent", "정보를 올바르게 입력해 주세요");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/signUpView.mc");
			dispatcher.forward(request, response);
			return;
		} // end of if

		// 비밀번호 체크
		if (!pass1.equals(pass2)) {
			request.getSession().setAttribute("messageType", "오류 메세지");
			request.getSession().setAttribute("messageContent", "비밀번호가 일치하지 않습니다.");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/signUpView.mc");
			dispatcher.forward(request, response);
			return;
		} // end of if

		member.setId(id);
		member.setPassword(pass);
		member.setName(name);
		member.setPhone(phone);
		member.setSsn(ssn);
		member.setEmail(email);
		member.setZipCode(zipCode);
		member.setAddress(address);// 주소와 상세주소 합침
		member.setNewsAgency(newsAgency);
		member.setGender(gender);
		member.setCountrySelect(countrySelect);

		MemberDAO dao = new MemberDAO();

		int result = dao.insertMember(member);

		// 회원가입 완료
		if (result == 1) {
			request.getSession().setAttribute("messageType", "입력 성공 메세지");
			request.getSession().setAttribute("messageContent", "회원가입 완료");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/");
			dispatcher.forward(request, response);
		}
		// 회원가입 실패
		else {
			request.getSession().setAttribute("messageType", "입력 오류 메세지");
			request.getSession().setAttribute("messageContent", "이미 존재하는 회원입니다.");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/");
			dispatcher.forward(request, response);
		} // end of if

	}// end of insertMember

	// 로그인하는 메소드
	public void signIn(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String saveId = request.getParameter("saveId");

		MemberDAO dao = new MemberDAO();
		MemberDTO member = dao.getOneMemberList(id);
		List<MemberDTO> newMemberList = dao.newMemberList();

		
		if (member != null && password.equals(member.getPassword())) {

			if (saveId != null) {
				Cookie cookie = new Cookie("id", id);
				response.addCookie(cookie);
			} // end of if-in

			HttpSession session = request.getSession();
			session.setAttribute("member", member);

			if (member.getRole().equals("관리자")) {
				session.setAttribute("role", member.getRole());
				request.setAttribute("newMemberList", newMemberList);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/admin.jsp");
				dispatcher.forward(request, response);
			} else if (member.getRole().equals("블랙회원")) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/black.jsp");
				dispatcher.forward(request, response);
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/");
				dispatcher.forward(request, response);
			} // end of if-in

		} else {
			String signInCheck = " 아이디(로그인 전용 아이디) 또는 비밀번호를 잘못 입력했습니다.\r\n" + "입력하신 내용을 다시 확인해주세요.";
			request.setAttribute("signInCheck", signInCheck);
			RequestDispatcher dispatcher = request.getRequestDispatcher("signInView.mc");
			dispatcher.forward(request, response);
		} // end of if

	}// end of signIn

	// 로그아웃하는 메소드
	public void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		RequestDispatcher dispatcher = request.getRequestDispatcher("/");
		dispatcher.forward(request, response);
	}// end of logout

	// 회원관리 페이지로 가는 메소드
	public void memberInfo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<MemberDTO> memberList = new ArrayList<MemberDTO>();
		MemberDAO dao = new MemberDAO();

		memberList = dao.getAllMemberList();

		int newUserCount = dao.newUserCount();
		int blackUserCount = dao.blackUserCount();
		int allUserCount = dao.allUserCount();

		HttpSession session = request.getSession();
		session.setAttribute("memberList", memberList);
		session.setAttribute("newUserCount", newUserCount);
		session.setAttribute("blackUserCount", blackUserCount);
		session.setAttribute("allUserCount", allUserCount);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/memberInfo.jsp");
		dispatcher.forward(request, response);
	}// end of memberInfo

	// 관리자 페이지로 가는 메소드
	public void admin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		List<MemberDTO> newMemberList = dao.newMemberList();

		request.setAttribute("newMemberList", newMemberList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/admin.jsp");
		dispatcher.forward(request, response);
	}// end of admin

	// 회원 정보 수정하는 페이지로 가는 메소드
	public void memberEditView(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		MemberDAO dao = new MemberDAO();
		MemberDTO member = dao.getOneMemberList(id);

		request.setAttribute("member", member);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/memberEdit.jsp");
		dispatcher.forward(request, response);
	}// end of memberEditView

	// 회원 정보 수정하는 메소드
	public void memberEdit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("id");
		String grade = request.getParameter("grade");
		String role = request.getParameter("role");

		MemberDTO member = new MemberDTO();
		member.setId(id);
		member.setGrade(grade);
		member.setRole(role);

		MemberDAO dao = new MemberDAO();
		dao.memberEdit(member);

		RequestDispatcher dispatcher = request.getRequestDispatcher("memberInfo.mc");
		dispatcher.forward(request, response);

	}// end of memberEdit

	// 회원 정보 삭제하는 메소드
	public void memberDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("id");

		MemberDAO dao = new MemberDAO();
		dao.memberDelete(id);

		RequestDispatcher dispatcher = request.getRequestDispatcher("memberInfo.mc");
		dispatcher.forward(request, response);
//		String contextPath = request.getContextPath();
//		response.sendRedirect(contextPath+"/view/memberInfo.jsp");

	}// end of memberDelete

	// 블랙회원 메소드
	public void black(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		RequestDispatcher dispatcher = request.getRequestDispatcher("/");
		dispatcher.forward(request, response);
	}// end of logout

	// 아이디 중복체크 메소드
	public void memberDuplicateCheck(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("아이디 중복 체크");
		String id = request.getParameter("id");
		MemberDAO member = new MemberDAO();

		response.getWriter().write(String.valueOf(member.duplicateCheck(id)));// 정수형으로 받아온 값을 문자형으로 변환

	}// end of memberDuplicateCheck

}// end of class
