package damoim.controller;

import java.io.File;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import damoim.dto.ClientDTO;
import damoim.dto.PostDTO;
import damoim.service.HostService;

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
		
		ModelAndView mv = new ModelAndView();
		int maxSize = 1024*1024*100; // 100mb
		String encoding = "UTF-8";
		
		MultipartRequest mr = new MultipartRequest(request, request.getServletContext().getRealPath("/img"), maxSize, encoding, new DefaultFileRenamePolicy());
		
		
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
		System.out.println(deadline);
		PostDTO post = new PostDTO(0, 0, postTitle, postDescr, postContent, categoryCode, locationCode, locationDetail, null, deadline, meetingDate, totalPeople, 0, thumbnailFile, bannerFile); 
				
		int result = HostService.insert(post);
		// ClientService占쎌벥 currentPeople 筌앹빓占쏙옙�뻻占쎄텕占쎈뮉 筌롫뗄�꺖占쎈굡 占쎌깈�빊�뮉釉룟칰占� 	
		
		
		if(result > 0) {
			request.setAttribute("msg", "asdasdasdasdasdasdasd");
			mv.setViewName("/test_index.jsp");
			mv.setRedirect(false);
		} else throw new Exception("asdasd");
		return mv;
		
	}
	
	public ModelAndView hostPostUpdate(HttpServletRequest request, HttpServletResponse response) throws Exception{
		System.out.println("HostController update called");
		ModelAndView mv = new ModelAndView();
		int maxSize = 1024*1024*100; // 100mb
		String encoding = "UTF-8";
		MultipartRequest mr = new MultipartRequest(request, request.getServletContext().getRealPath("/img"), maxSize, encoding, new DefaultFileRenamePolicy());
		String postNum = mr.getParameter("post_no");
		if(postNum == null) {
			postNum = "1";
		}
		int postNo = Integer.parseInt(postNum);
		String postDescr = mr.getParameter("postDescr");
		String postContent =mr.getParameter("editordata");
		int locationCode = Integer.parseInt(mr.getParameter("location"));
		String locationDetail = mr.getParameter("locationDetail");
		String deadline = mr.getParameter("deadline");
		String meetingDate = mr.getParameter("meetingDate");
		int totalPeople = Integer.parseInt(mr.getParameter("totalPeople"));
		
		PostDTO post = new PostDTO(postNo, 0, null, postDescr, postContent, 0, locationCode, locationDetail, 
				deadline, meetingDate, totalPeople, 1, null, null);
		int result = HostService.update(post);
		
		if(result > 0) {
			request.setAttribute("msg", "asdasdasdasdasdasdasd");
			mv.setViewName("/test_index.jsp");
			mv.setRedirect(false);
		} else throw new Exception("asdasd");
		return mv;
	}
	
	public ModelAndView hostPostDelete(HttpServletRequest request, HttpServletResponse response) throws Exception{
		System.out.println("HostController delete called");
		ModelAndView mv = new ModelAndView();
		int postNum = Integer.parseInt(request.getParameter("post_no"));
		int result = HostService.delete(postNum);
		if(result > 0) {
			request.setAttribute("msg", "占쎄텣占쎌젫 占쎄쉐�⑨옙");
			mv.setViewName("/test_index.jsp");
			mv.setRedirect(false);
		} else throw new Exception("占쎄텣占쎌젫 占쎈뼄占쎈솭");		
		return mv;
	}

}
