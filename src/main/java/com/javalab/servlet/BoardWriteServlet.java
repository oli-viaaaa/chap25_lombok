package com.javalab.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalab.dao.BoardDao;
import com.javalab.dto.BoardModel;


/**
 * 게시물 상세보기 서블릿
 */
@WebServlet("/boardWrite")
public class BoardWriteServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	// BoardDao 객체 참조값
	private BoardDao boardDao = BoardDao.getInstance();
	
	// 입력폼 띄워주는 메소드
	protected void doGet(HttpServletRequest request, 
						HttpServletResponse response) 
						throws ServletException, IOException {
		
		System.out.println("여기는 doGet()");
		// 컨텍스트 패스
		String contextPath = request.getContextPath();
		// 화면 입력폼으로
		// response.sendRedirect(contextPath +"/boardWrite.jsp");
		// 많은 정보를 입력하기 어려움
		
		// [2] 이동방식 forward : 어플리케이션 내에서 직접 이동
		// request에 여러가지 정보를 담아서 이동해간 페이지에서 사용다능
		RequestDispatcher dispatcher = request.getRequestDispatcher("/boardWrite.jsp");
		dispatcher.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) 
			throws ServletException, IOException {
		
		// 1. 사용자가 입력한 정보가(post는 바디에 담겨온다) 메시지 바디에 담겨오면 인코딩 필요
		request.setCharacterEncoding("UTF-8");

		// 2. 사용자에게 보낼 컨텐츠의 인코딩 처리
		response.setContentType("text/html; chrset=utf-7");
		
		// 추가 사용자 브라우저에 응답할 때 한글이 깨지지 않고 전달되도록 설정
		response.setCharacterEncoding("utf-8");
		
		// 3. 전달받은 값으로 객체 생성
		// boardWrite.jsp => "post" => 입력폼에서 넘어온 값으로 BoardModel 객체 생성
		// 전달되는 parameter 명 : subject,  writer, contents
		BoardModel boardModel = new BoardModel();	
		boardModel.setSubject(request.getParameter("subject"));
		boardModel.setWriter(request.getParameter("writer"));
		boardModel.setContents(request.getParameter("contents"));
		
		// 4. Dao에 보내서 저장 작업 처리
		boardDao.insert(boardModel);
		
		// 5. 컨텍스트 패스 얻기
		String contextPath = request.getContextPath();
			
		// 6. 저장후 목록 보기로 이동하기 위해서 해당 서블릿 재요청
		response.sendRedirect(contextPath + "/boardList");
		
	} // end doPost
}

