package damoim.controller;

import java.io.File;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import damoim.dto.ClientDTO;
import damoim.dto.JoinDTO;
import damoim.dto.PostDTO;
import damoim.service.ClientService;
import damoim.service.HostService;
import damoim.service.UserService;

public class HostController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("HostController execute");
		return null;
	}
	
	public ModelAndView hostUserList(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		System.out.println("HostController list called");
		
		int boardNum = Integer.parseInt(request.getParameter("post_no"));
		ModelAndView mv = new ModelAndView("/host/list.jsp", false);
		
		List<ClientDTO> list = HostService.list(boardNum);
		request.setAttribute("list", list);
		
		return mv;
	}
	
	public ModelAndView hostPostInsert(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		int userNo = (int)session.getAttribute("session_userNo");
		ModelAndView mv = new ModelAndView();
		int maxSize = 1024*1024*100; // 100mb
		String encoding = "UTF-8";
		String saveDir = request.getServletContext().getRealPath("/")+"img/uploadImg";
		//MultipartRequest mr = new MultipartRequest(request, request.getServletContext().getRealPath("/img"), maxSize, encoding, new DefaultFileRenamePolicy());
		MultipartRequest mr = new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());
		System.out.println("HostController insert called...........");
		String postTitle = mr.getParameter("postTitle");
		String postDescr = mr.getParameter("postDescr");
		String postContent =mr.getParameter("editordata");
		String thumbnailFile = mr.getParameter("thumbnailFile");
		String bannerFile = mr.getParameter("bannerFile");
		int categoryCode = Integer.parseInt(mr.getParameter("category"));
		int locationCode = Integer.parseInt(mr.getParameter("location"));
		String locationDetail = mr.getParameter("locationDetail");
		String deadline = mr.getParameter("deadline");
		String meetingDate = mr.getParameter("meetingDate");
		
		int totalPeople = Integer.parseInt(mr.getParameter("totalPeople"));
		String bannerName = "";
		File thumbnail = mr.getFile("thumbnailFile");
		File banner = mr.getFile("bannerFile");
		if(banner != null) {
			bannerName = banner.getName();
		}
		String thumbnailName = thumbnail.getName();
		PostDTO post = new PostDTO(0, userNo, postTitle, postDescr, postContent, categoryCode, locationCode, locationDetail, null, deadline, meetingDate, totalPeople, 0, thumbnailName, bannerName); 
			
		int result = HostService.insert(post);
		
		JoinDTO dto = new JoinDTO(0, 0, userNo,categoryCode);
		ClientService.clientJoinMoim(dto);
		
		if(result > 0) {
			mv.setViewName(request.getContextPath()+"/start.jsp");
			mv.setRedirect(true);
		} else throw new Exception("asdasd");
		return mv;
		
	}
	
	public ModelAndView hostPostUpdate(HttpServletRequest request, HttpServletResponse response) throws Exception{
		System.out.println("HostController update called");
		ModelAndView mv = new ModelAndView();
		int maxSize = 1024*1024*100; // 100mb
		String encoding = "UTF-8";
		HttpSession session = request.getSession();
		int userNo = (int)session.getAttribute("session_userNo");
		MultipartRequest mr = new MultipartRequest(request, request.getServletContext().getRealPath("/img"), maxSize, encoding, new DefaultFileRenamePolicy());
		int postNo = Integer.parseInt(mr.getParameter("post_no"));
		String postDescr = mr.getParameter("postDescr");
		String postContent =mr.getParameter("editordata");
		int locationCode = Integer.parseInt(mr.getParameter("location"));
		String locationDetail = mr.getParameter("locationDetail");
		String deadline = mr.getParameter("deadline");
		String meetingDate = mr.getParameter("meetingDate");
		int totalPeople = Integer.parseInt(mr.getParameter("totalPeople"));
		
		PostDTO post = new PostDTO(postNo, userNo, null, postDescr, postContent, 0, locationCode, locationDetail, null, deadline, meetingDate, totalPeople, 1, null, null);
		
		int result = HostService.update(post);
		
		if(result > 0) {
			request.setAttribute("msg", "asdasdasdasdasdasdasd");
			mv.setViewName(request.getContextPath()+"/start.jsp");
			mv.setRedirect(true);
		} else throw new Exception();
		return mv;
	}
	
	public ModelAndView hostPostDelete(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		System.out.println("HostController delete called");
		ModelAndView mv = new ModelAndView();
		int postNum = Integer.parseInt(request.getParameter("post_no"));
		int result = HostService.delete(postNum);
		if(result > 0) {
			request.setAttribute("msg", "");
			//mv.setViewName(request.getContextPath()+"/front?key=user&mn=userSelectBoardList");
			
			mv.setViewName(request.getContextPath()+"/urlchange.jsp");
			mv.setRedirect(true);
		} else throw new Exception("모임을 삭제하는데 실패하였습니다");		
		return mv;
	}
	
	public ModelAndView hostMoimUpdateData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView("/host/UpdateMoimForm.jsp", false);
		int postNo = Integer.parseInt(request.getParameter("post_no"));
		PostDTO dto = UserService.userSelectBoard(postNo);
		request.setAttribute("post", dto);
		return mv;
	}

}
