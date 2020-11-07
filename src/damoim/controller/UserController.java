package damoim.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import damoim.dto.ClientDTO;
import damoim.dto.PostDTO;
import damoim.dto.ReplyDTO;
import damoim.service.UserService;

public class UserController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) {
		return null;
	}

	public ModelAndView userRegister(HttpServletRequest request, HttpServletResponse response) throws SQLException {

		ModelAndView mv = null;

		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("userName");
		String userEmail = request.getParameter("userEmail");
		String phoneNo = request.getParameter("phoneNo");

		ClientDTO clientDTO = new ClientDTO(0, userId, userPwd, userName, userEmail, phoneNo);

		int result = UserService.userRegister(clientDTO);

		if (result == 1) {
			mv = new ModelAndView(request.getContextPath() + "/user/welcomPage.jsp", true);
		}

		return mv;
	}

	public ModelAndView userLogin(HttpServletRequest request, HttpServletResponse response) throws SQLException {

		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		ClientDTO clientDTO =  UserService.userLogin(userId, userPwd);
		HttpSession session =  request.getSession();
		String url = null;
		if(clientDTO != null) {
			
			int userNo = clientDTO.getUserNo();
			session.setAttribute("session_userNo", userNo);
			session.setAttribute("session_userId", userId);
			
			url = request.getContextPath() + "/index.jsp";
		}else {
			url = request.getContextPath() + "/user/failUserSelect.jsp";
		}
		
		ModelAndView mv = new ModelAndView(url, true);
		return mv;
	}
	
	public ModelAndView userSelectId(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		ModelAndView mv = new ModelAndView();
		
		String userName = request.getParameter("name");
		String userEmail = request.getParameter("email");
		String phoneNo= request.getParameter("phone");
		String url = null;
		ClientDTO clientDTO = new ClientDTO(0, null, null, userName, userEmail, phoneNo);
		
		String userId = UserService.userSelectId(clientDTO);
		
		if(userId != null) {
			request.setAttribute("userId", userId);
			url = "/user/sucUserSelId.jsp";
		}else {
			url = "/user/failUserSelect.jsp";
		}
		
		mv.setViewName(url);
		return mv;
	}
	
	public ModelAndView userSelectPwd(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		
		ModelAndView mv = new ModelAndView();
		
		String userId = request.getParameter("id");
		String userName = request.getParameter("name");
		String userEmail = request.getParameter("email");
		String phoneNo= request.getParameter("phone");
		String url = "/user/sucUserSelPwd.jsp";
		ClientDTO clientDTO = new ClientDTO(0, userId, null, userName, userEmail, phoneNo);
		
		String userPwd = UserService.userSelectPwd(clientDTO);
		
		if(userPwd != null) {
			request.setAttribute("userId", userId);
			request.setAttribute("userPwd", userPwd);
			url = "/user/sucUserSelPwd.jsp";
		}else {
			url = "/user/failUserSelect.jsp";
		}

		mv.setViewName(url);
		return mv;
	}
	
	public ModelAndView userSelectBoardList(HttpServletRequest request, HttpServletResponse response)
			throws SQLException {
		
		ModelAndView mv = new ModelAndView();
		String url = "/user/postList.jsp";
		int categoryNum = 0;
		int locationCode = 0;
		int date = 0;
		List<PostDTO> postList = UserService.userSelectBoardList(categoryNum, locationCode, date);
		
		request.setAttribute("postList", postList);
		mv.setViewName(url);
		return mv;
	}
	
	
	public ModelAndView userSelectBoard(HttpServletRequest request, HttpServletResponse response)
			throws SQLException {
		
		ModelAndView mv = new ModelAndView();
		String url = "/user/postDetail.jsp";
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		PostDTO postDTO = UserService.userSelectBoard(postNo);
		String categoryName = postDTO.categoryNoTocategoryName(postDTO.getCategoryCode()); 
		
		int userNo = postDTO.getUserNo();
		ClientDTO clientDTO = UserService.userSelectClient(userNo);
		List<ReplyDTO> replyDTO = UserService.userSelectReplyList(postNo);
		
		
		request.setAttribute("postDTO", postDTO);
		request.setAttribute("clientDTO", clientDTO);
		request.setAttribute("question", replyDTO);
		request.setAttribute("answer", replyDTO);
		request.setAttribute("categoryName", categoryName);
		mv.setViewName(url);
		return mv;
	}
}
