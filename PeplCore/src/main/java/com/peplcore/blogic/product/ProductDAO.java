package com.peplcore.blogic.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.peplcore.web.dbconnection.MyDBConnection;

public class ProductDAO {

	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	// insert - 상품 번호, 분류, 이름, 수량, 품절여부, 이미지, 사이즈, 기본설명, 원가, 판매가 등록해두기 → 이미지 물어보고
	private String PRODUCT_INSERT = "insert into productDB(pseq, pcategory, pname, pnum, poutStock, psize, pdescription, pcost, pselling)values(null,?,?,?,?,?,?,?,?)";
	// update - 상품 분류, 이름, 수량, 품절여부, 이미지, 사이즈, 기본 설명, 원가, 판매가
	private String PRODUCT_UPDATE = "update productDB set pcategory=?, pname=?, pnum=?, poutStock=?, psize=?, pdescription=?, pcost=?, pselling=? where pseq=?";
	// delete - 삭제는 pseq로 삭제
	private String PRODUCT_DELETE = "delete from productDB where pseq=?";
	// getonelist - 상품 리스트 하나만 가져오는거
	private String PRODUCT_GETONELIST = "select * from productDB where pseq=?";
	// getalllsit - 상품 전부 다 가져오는거
	private String PRODUCT_GETALLLIST = "select * from productDB order by pseq desc";

	// 상품 등록 - product_insert
	public void insertProduct(ProductDTO dto) {

//		pcategory, pname, pnum, poutStock, psize, pdescription, pcost, pselling
		try {

			// 필수 입력 필드에 대한 유효성 검사
			if (dto.getPcategory() == null || dto.getPname() == null || dto.getPoutStock() == null || dto.getPsize() == null || dto.getPdescription() == null) {
				throw new IllegalArgumentException("필수 입력 필드에 null 값이 포함되어 있습니다.");
			}

			con = MyDBConnection.getConnection();

//			String pcategoryValue = String.join(",", pcategory);

			pstmt = con.prepareStatement(PRODUCT_INSERT);

			pstmt.setString(1, dto.getPcategory());
			pstmt.setString(2, dto.getPname());
			pstmt.setInt(3, dto.getPnum());
			pstmt.setString(4, dto.getPoutStock());
			pstmt.setString(5, dto.getPsize());
			pstmt.setString(6, dto.getPdescription());
			pstmt.setInt(7, dto.getPcost());
			pstmt.setInt(8, dto.getPselling());

			pstmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();

		} finally {

			MyDBConnection.close(rs, pstmt, con);

		}
	}// end of 상품 등록

	// 상품 수정
	public void updateProduct(ProductDTO dto) {
		try {

			// 필수 입력 필드에 대한 유효성 검사
			if (dto.getPcategory() == null || dto.getPname() == null || dto.getPoutStock() == null || dto.getPsize() == null || dto.getPdescription() == null) {
				throw new IllegalArgumentException("필수 입력 필드에 null 값이 포함되어 있습니다.");
			}

			// pcategory=?, pname=?, pnum=?, poutStock=?, psize=?, pdescription=?, pcost=?,
			// pselling=?
			con = MyDBConnection.getConnection();
			
			pstmt = con.prepareStatement(PRODUCT_UPDATE);

			pstmt.setString(1, dto.getPcategory());
			pstmt.setString(2, dto.getPname());
			pstmt.setInt(3, dto.getPnum());
			pstmt.setString(4, dto.getPoutStock());
			pstmt.setString(5, dto.getPsize());
			pstmt.setString(6, dto.getPdescription());
			pstmt.setInt(7, dto.getPcost());
			pstmt.setInt(8, dto.getPselling());
			pstmt.setInt(9, dto.getPseq());

			pstmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();

		} finally {

			MyDBConnection.close(rs, pstmt, con);

		}
	}

	// 상품 삭제
	public void deleteProduct(int pseq) {

		try {
			con = MyDBConnection.getConnection();
			pstmt = con.prepareStatement(PRODUCT_DELETE);
			pstmt.setInt(1, pseq);

			pstmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();

		} finally {

			MyDBConnection.close(rs, pstmt, con);

		}
	}

	// 상품 상세 조회
	// 특정 상품 리스트 하나를 식별하고 내가 원하는 번호의 상품리스트를 가져와야 한다.
	// 그래서 해당 메서드의 매개변수를 상품 식별자인 pseq로 받아 해당 상품의 정보를 가져오게 한다.
	public ProductDTO getOneProduct(int pseq) {

		ProductDTO product = null;

		try {

			con = MyDBConnection.getConnection();
			pstmt = con.prepareStatement(PRODUCT_GETONELIST);
			pstmt.setInt(1, pseq);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				product = new ProductDTO();

				product.setPseq(rs.getInt("pseq"));
				product.setPcategory(rs.getString("pcategory"));
				product.setPname(rs.getString("pname"));
				product.setPnum(rs.getInt("pnum"));
				product.setPoutStock(rs.getString("poutStock"));
				product.setPsize(rs.getString("psize"));
				product.setPdescription(rs.getString("pdescription"));
				product.setPcost(rs.getInt("pcost"));
				product.setPselling(rs.getInt("pselling"));
			}

		} catch (SQLException e) {

			e.printStackTrace();

		} finally {

			MyDBConnection.close(rs, pstmt, con);

		}

		return product;
	}

	// 상품 리스트 전부 검색
	public List<ProductDTO> getAllProductList(ProductDTO dto) {

		List<ProductDTO> productList = new ArrayList<>();

		try {

			con = MyDBConnection.getConnection();
			pstmt = con.prepareStatement(PRODUCT_GETALLLIST);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				ProductDTO product = new ProductDTO();

				product.setPseq(rs.getInt("pseq"));
				product.setPcategory(rs.getString("pcategory"));
				product.setPname(rs.getString("pname"));
				product.setPnum(rs.getInt("pnum"));
				product.setPoutStock(rs.getString("poutStock"));
				product.setPsize(rs.getString("psize"));
				product.setPdescription(rs.getString("pdescription"));
				product.setPcost(rs.getInt("pcost"));
				product.setPselling(rs.getInt("pselling"));

				productList.add(product);
			}

		} catch (SQLException e) {

			e.printStackTrace();

		} finally {
			MyDBConnection.close(rs, pstmt, con);
		}

		return productList;

	}

	// 상품 번호 가져오기
	public int getLastProductSeq() {

		int lastSeq = 0;

		try {
			con = MyDBConnection.getConnection();
			pstmt = con.prepareStatement("SELECT MAX(pseq) AS lastSeq FROM productDB");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				lastSeq = rs.getInt("lastSeq");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyDBConnection.close(rs, pstmt, con);
		}
		return lastSeq;
	}

}
