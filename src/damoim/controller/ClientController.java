package damoim.controller;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import damoim.dto.ClientDTO;
import damoim.dto.JoinDTO;
import damoim.dto.PostDTO;
import damoim.dto.ReplyDTO;
import damoim.service.ClientService;

public class ClientController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) {
		return null;
	}
	/**
	 * 모임신청하기
	 * */
	public ModelAndView clientJoinMoim(HttpServletRequest request,HttpServletResponse response) throws SQLException{
		System.out.println("clientJoinMoim call..");
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		String postNo = request.getParameter("post_no");
		int userNo = (int)session.getAttribute("session_userNo");
		String category = request.getParameter("category_no");
		if(postNo == null) {
			postNo = "0";
		}
		JoinDTO dto = new JoinDTO(0, Integer.parseInt(postNo), userNo, Integer.parseInt(category) );
		int result= ClientService.clientJoinMoim(dto);
		if(result > 0) {
			mv.setViewName(request.getContextPath()+"/front?key=user&mn=userSelectBoardList");
			mv.setRedirect(true);
		}else throw new SQLException("모임 신청이 실패하였습니다.");
		return mv;
	}
	/**
	 * 댓글달기
	 * */
	public ModelAndView clientInsertReply(HttpServletRequest request,HttpServletResponse response)throws SQLException {
		System.out.println("clientInsertReply call..");
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		String postNo = request.getParameter("post_no");
		String replyContent = request.getParameter("reply_content");
		int userNo = (int)session.getAttribute("session_userNo");
		ReplyDTO dto = new ReplyDTO(0,Integer.parseInt(postNo), replyContent, 0, userNo, null);
		int result = ClientService.clientInsertReply(dto);
		if(result>0) {
		}else throw new SQLException("댓글이 정상적으로 입력되지 않았습니다.");
		return mv;
	}
	
	/**
	 * 댓글삭제하기
	 * */
	public ModelAndView clientDeleteReply (HttpServletRequest request,HttpServletResponse response)throws SQLException {
		System.out.println("clientDeleteReply call..");
		ModelAndView mv = new ModelAndView();
		String questionNo = request.getParameter("question_no");
		int result = ClientService.clientDeleteReply(Integer.parseInt(questionNo));
		if(result>0) {
			
		}else throw new SQLException("댓글이 정상적으로 삭제되지 않았습니다.");
		return mv;
	}
	
	/**
	 * 참여자차트만들기
	 * */
	public ModelAndView clientSelectChart(HttpServletRequest request,HttpServletResponse response)throws Exception {
		System.out.println("clientSelectChart call..");
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		int userNo = (int)session.getAttribute("session_userNo");
		int [] list = ClientService.clientSelectChart(userNo);
		if(list!=null) {
			request.setAttribute("clientchart", list);
			mv.setRedirect(false);
			mv.setViewName(request.getContextPath()+"/client/chart.jsp");
		}else throw new SQLException("신청한 모임이 없습니다");
		return mv;
	}
	
	/**
	 * 개설자차트
	 * */
	public ModelAndView hostSelectChart(HttpServletRequest request, HttpServletResponse response) throws SQLException{
		System.out.println("hostSelectChart call..");
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		int userNo = (int)session.getAttribute("session_userNo");
		int [] list = ClientService.clientSelectChart(userNo);
		if(list!=null) {
			request.setAttribute("hostchart", list);
			mv.setRedirect(false);
			mv.setViewName(request.getContextPath()+"/client/chart.jsp");
		}else throw new SQLException("개설한 모임이 없습니다");
		return mv;
	}
	
	
	/**
	 * 마이페이지에서 내가 참여한 모임보기
	 * */
	public ModelAndView clientSelectMoimByMe(HttpServletRequest request,HttpServletResponse response)throws SQLException {
		System.out.println("clientSelectMoimByMe call..");
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		int userNo = (int)session.getAttribute("session_userNo");
		List<PostDTO> list 	= ClientService.clientSelectMoimByMe(userNo);
		if(list!=null) {
			request.setAttribute("list", list);
			mv.setRedirect(false);
			mv.setViewName(request.getContextPath()+"/client/MyJoinMoim");
		}
		return mv;
	}
	
	/**
	 * 마이페이지에서 내가 개설한 모임보기
	 * */
	public ModelAndView hostSelectMoimByMe(HttpServletRequest request,HttpServletResponse response)throws SQLException{
		System.out.println("hostSelectMoimByMe call..");
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		int userNo = (int)session.getAttribute("session_userNo");
		List<PostDTO> list = ClientService.hostSelectMoimByMe(userNo);
		if(list!=null) {
			request.setAttribute("list", list);
			mv.setRedirect(false);
			mv.setViewName(request.getContextPath()+"/client/MyCreateMoim");
		}
		return mv;
	}
	
	/**
	 * 모임 취소하기
	 * */
	public ModelAndView clientCancleMoim (HttpServletRequest request,HttpServletResponse response) throws SQLException{
		System.out.println("clientCancleMoim call..");
		ModelAndView mv = new ModelAndView();
		String postNo = request.getParameter("post_no");
		System.out.println(postNo);
		HttpSession session = request.getSession();
		int userNo = (int)session.getAttribute("session_userNo");
		System.out.println(userNo);
		int result = ClientService.clientCancleMoim(Integer.parseInt(postNo),userNo);
		if(result >0) {
			mv.setRedirect(true);
			mv.setViewName(request.getContextPath()+"/index.jsp");
		}else throw new SQLException("모임 신청 취소가 실패하였습니다.");
		return mv;
	}
	
	
	/**
	 * 개인정보 수정하기
	 * */
	public ModelAndView clientUpdateClientInform (HttpServletRequest request,HttpServletResponse response) throws SQLException{
		System.out.println("clientUpdateClientInform call..");
		ModelAndView mv = new ModelAndView();
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("userName");
		String userEmail = request.getParameter("userEmail");
		String phoneNo = request.getParameter("phoneNo");
		HttpSession session = request.getSession();
		int userNo = (int)session.getAttribute("session_userNo");
		ClientDTO dto = new ClientDTO(userNo, null, userPwd, userName, userEmail, phoneNo);
		int result = ClientService.clientUpdateClientInform(dto);
		if(result > 0 ) {
			mv.setRedirect(true);
			mv.setViewName(request.getContextPath()+"/client/MyPage_main.jsp");
		}else throw new SQLException("정보가 정상적으로 수정되지 않았습니다.");
		return mv;
	}
}
