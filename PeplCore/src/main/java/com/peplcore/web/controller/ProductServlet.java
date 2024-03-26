package com.peplcore.web.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.peplcore.blogic.product.ProductDAO;
import com.peplcore.blogic.product.ProductDTO;

@WebServlet("*.pc")
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProductServlet() {
		super();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 1. 사용자 요청 경로 추출
		final String URI = request.getRequestURI();
		final String PATH = URI.substring(URI.lastIndexOf("/"));

		switch (PATH) {
		case "/insertProduct.pc":
			insertProduct(request, response);
			break;
		case "/updateProduct.pc":
			updateProduct(request, response);
			break;
		case "/deleteProduct.pc":
			deleteProduct(request, response);
			break;
		case "/getOneProduct.pc":
			getOneProduct(request, response);
			break;
		case "/getAllProduct.pc":
			getAllProduct(request, response);
			break;
		case "/insertProductView.pc":
			insertProductView(request, response);
			break;
		case "/updateProductView.pc":
			updateProductView(request, response);
			break;
		case "/productManagement.pc":
			productManagement(request, response);
			break;
		}

	}

	// 메소드
	public void insertProduct(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("상품 등록 처리");

		// 혹시 몰라서 한번더 작성
		request.setCharacterEncoding("utf-8");

		int pnum = Integer.parseInt(request.getParameter("pnum"));
		int pcost = Integer.parseInt(request.getParameter("pcost"));
		int pselling = Integer.parseInt(request.getParameter("pselling"));
		String pcategory = request.getParameter("pcategory");
		String pname = request.getParameter("pname");
		String poutStock = request.getParameter("poutStock");

		String psize = request.getParameter("psize");
		String pdescription = request.getParameter("pdescription");

		ProductDTO dto = new ProductDTO();

		dto.setPcategory(pcategory);
		dto.setPname(pname);
		dto.setPnum(pnum);
		dto.setPoutStock(poutStock);
		dto.setPsize(psize);
		dto.setPdescription(pdescription);
		dto.setPcost(pcost);
		dto.setPselling(pselling);

		ProductDAO dao = new ProductDAO();
		dao.insertProduct(dto);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/getAllProduct.pc");
		dispatcher.forward(request, response);
	}

	public void updateProduct(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 2-2. 상품 수정 페이지
		System.out.println("상품 수정 처리");

		request.setCharacterEncoding("utf-8");

		int pseq = Integer.parseInt(request.getParameter("pseq"));
		String pcategory = request.getParameter("pcategory");
		String pname = request.getParameter("pname");
		int pnum = Integer.parseInt(request.getParameter("pnum"));
		String poutStock = request.getParameter("poutStock");
		String psize = request.getParameter("psize");
		String pdescription = request.getParameter("pdescription");
		int pcost = Integer.parseInt(request.getParameter("pcost"));
		int pselling = Integer.parseInt(request.getParameter("pselling"));

		ProductDTO dto = new ProductDTO();

		dto.setPseq(pseq);
		dto.setPcategory(pcategory);
		dto.setPname(pname);
		dto.setPnum(pnum);
		dto.setPoutStock(poutStock);
		dto.setPsize(psize);
		dto.setPdescription(pdescription);
		dto.setPcost(pcost);
		dto.setPselling(pselling);

		ProductDAO dao = new ProductDAO();

		dao.updateProduct(dto);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/productManagement.pc");
		dispatcher.forward(request, response);
	}

	public void deleteProduct(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 2-4. 상품 삭제 페이지
		System.out.println("상품 삭제 처리");
		/*
		 * int pseq = 0; String pseq1 = request.getParameter("pseq"); if(pseq1 != null
		 * && pseq1.equals("")) { pseq = Integer.parseInt(pseq1); }else {
		 * System.out.println("젠장"); System.out.println(pseq1); }
		 */
		int pseq = Integer.parseInt(request.getParameter("pseq"));
		/*
		 * ProductDTO dto = new ProductDTO(); dto.setPseq(pseq);
		 */

		ProductDAO dao = new ProductDAO();
		dao.deleteProduct(pseq);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/productManagement.pc");
		/*
		 * RequestDispatcher dispatcher =
		 * request.getRequestDispatcher("/product/getAllProductList.jsp");
		 */
		dispatcher.forward(request, response);

	}

	public void getOneProduct(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 2-5. 글 상세 조회 처리
		System.out.println("글 하나 상세 조회 처리");

		int pseq = Integer.parseInt(request.getParameter("pseq"));

		ProductDTO dto = new ProductDTO();

		dto.setPseq(pseq);

		ProductDAO dao = new ProductDAO();
		ProductDTO product = dao.getOneProduct(pseq);// 다시 확인하기

		request.setAttribute("product", product);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/product/getOneProduct.jsp");
		dispatcher.forward(request, response);
	}

	public void getAllProduct(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 2-6. 상품 보기 페이지
		System.out.println("글 목록 전체 조회 처리");

		// 2. DB 연동 처리
		ProductDTO dto = new ProductDTO();
		ProductDAO dao = new ProductDAO();

		List<ProductDTO> productList = dao.getAllProductList(dto);

		// 3. 화면 이동
		request.setAttribute("productList", productList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/product/getAllProductList.jsp");
		dispatcher.forward(request, response);

	}

	public void insertProductView(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("상품 등록 화면으로 이동");

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/product/insertProduct.jsp");
		dispatcher.forward(request, response);
	}

	public void updateProductView(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 수정화면으로 띄워줌
		System.out.println("상품 수정 화면으로 이동");

		// 상품을 수정할 기준인 pseq를 불러오고
		int pseq = Integer.parseInt(request.getParameter("pseq"));

		ProductDTO product = new ProductDTO();

		// getOneProduct()를 사용하기 위해 dao를 불러온다.
		ProductDAO dao = new ProductDAO();

		product = dao.getOneProduct(pseq);

		request.setAttribute("product", product);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/product/updateProduct.jsp");
		dispatcher.forward(request, response);
	}

	public void productManagement(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("상품 관리 목록");

		// 상품들을 받아서 진열해줘야 함!!!!!!!!!!!!!!!!
		List<ProductDTO> productList = new ArrayList<>();

		ProductDAO dao = new ProductDAO();
		ProductDTO dto = new ProductDTO();

		productList = dao.getAllProductList(dto);

		request.setAttribute("productList", productList);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/product/productManagement.jsp");
		dispatcher.forward(request, response);

	}

}
