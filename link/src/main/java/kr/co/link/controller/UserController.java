package kr.co.link.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.link.service.BlogService;
import kr.co.link.service.UserService;
import kr.co.link.vo.User;

@Controller 
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private BlogService blogService;
	
	@RequestMapping("/loginform.do")
	public String loginform(HttpSession session, HttpServletRequest request,
		@RequestParam (value="returnUrl", required = false, defaultValue = "") String returnUrl,
		@RequestParam (value="queryString", required = false, defaultValue = "")	String queryString) {
		if(!returnUrl.equals("")) {
			session.setAttribute("returnUrl", returnUrl.replace("/link", ""));
		}
		if(!queryString.equals("")) {
			session.setAttribute("queryString", queryString.replace(",", "&"));
		}
		return "user/loginform";
	}
	
	@RequestMapping(value="/loginform.do", method = RequestMethod.POST)
	public String login(String userId, String password, HttpSession session) throws Exception {
		User user = userService.login(userId, password);
		session.setAttribute("LOGIN_USER", user);
		session.setAttribute("isLogined", true);
		
		String returnUrl = (String) session.getAttribute("returnUrl");
		String queryString = (String) session.getAttribute("queryString");
		session.removeAttribute("returnUrl");
		session.removeAttribute("queryString");
		String path ="redirect:/home.do";
		if(returnUrl != null) {
			if(returnUrl.equals("/blog/mydetail.do")) {
				return path;
			} else {
				path = "redirect:" + returnUrl; 
		  
				if(queryString != null) {
					path += "?" + queryString; 
				}
			}
		}
		return path;
	}
	@RequestMapping("/logout.do")
	public String logout(HttpSession session,String password,
			@RequestParam (value="returnUrl", required = false, defaultValue = "") String returnUrl,
			@RequestParam (value="queryString", required = false, defaultValue = "")	String queryString) {
		session.invalidate();
		returnUrl = returnUrl.replace("/link", "");
		System.out.println(returnUrl);
		queryString = queryString.replace(",", "&");
		
		String path ="redirect:/home.do";
		if(returnUrl != null) {
			if(returnUrl.equals("/blog/mydetail.do") || returnUrl.equals("/blog/eachNeighbor.do")) {
				return path;
			} else {
				path = "redirect:" + returnUrl; 
		  
				if(queryString != null) {
					path += "?" + queryString; 
				}
			}
		}
		return path;
	}
	
	@RequestMapping("/registerAgree.do")
	public String registerAgree() {
		return "user/registerAgree";
	}
	
	@RequestMapping("/register.do")
	public String register() {
		return "user/register";
	}
	
	@RequestMapping(value="/confirmid.do")
	public @ResponseBody User confirmid(String id){
		return userService.getUserById(id);
	}
	
	@RequestMapping(value= "/addUser.do", method = RequestMethod.POST)
	public String addUser(User user, MultipartFile mainImg)throws IOException {
		String profileImageSaveDirectory = userService.profileImageSaveDirectory();
		
		if (!mainImg.isEmpty()) {
			String filename = mainImg.getOriginalFilename();
			FileCopyUtils.copy(mainImg.getBytes(), new File(profileImageSaveDirectory, filename));
			user.setImg(filename);
		}
		
		userService.addUser(user);
		return "redirect:/home.do";
	}
}
