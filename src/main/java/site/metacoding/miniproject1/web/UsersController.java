package site.metacoding.miniproject1.web;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import site.metacoding.miniproject1.domain.users.Users;
import site.metacoding.miniproject1.service.UsersService;
import site.metacoding.miniproject1.web.dto.request.users.UsersLoginReqDto;
import site.metacoding.miniproject1.web.dto.request.users.UsersUpdateReqDto;
import site.metacoding.miniproject1.web.dto.response.CMRespDto;


@RequiredArgsConstructor
@Controller
public class UsersController {

	private final UsersService usersService;
	private final HttpSession session;

	@GetMapping("/loginForm")
	public String loginForm(Model model, HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		for(Cookie cookie : cookies) {
			if(cookie.getName().equals("userId")) {
				model.addAttribute(cookie.getName(), cookie.getValue());
			}
			System.out.println("============");
			System.out.println(cookie.getName());
			System.out.println(cookie.getValue());
			System.out.println("============");
		}
		return "users/loginForm";
	}

	@PostMapping("/api/login")
	public @ResponseBody CMRespDto<?> login(@RequestBody UsersLoginReqDto loginDto, HttpServletResponse response) {
		System.out.println("===========");
		System.out.println(loginDto.isRemember());
		System.out.println("===========");
		
		if(loginDto.isRemember()) {
			Cookie cookie = new Cookie("userId", loginDto.getUserId());
			cookie.setMaxAge(60*60*24);
			response.addCookie(cookie);
		}else {
			Cookie cookie = new Cookie("userId", null);
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		
		Users principal = usersService.로그인(loginDto);
		if(principal == null) {
			return new CMRespDto<>(-1, "로그인실패", null);
		}
		session.setAttribute("principal", principal);
		return new CMRespDto<>(1, "로그인성공", null);
	}

	
	@GetMapping("/s/users/{id}")
	public String updateForm(@PathVariable Integer id, Model model) {
		Users usersPS = usersService.기본정보보기(id);
		model.addAttribute("users", usersPS);
		return "users/accountsetting";
	}
	
	@PutMapping("/s/api/users/{id}")
	public @ResponseBody CMRespDto<?> update(@PathVariable Integer id, @RequestBody UsersUpdateReqDto updateReqDto) {
		Users usersPS = usersService.기본정보수정(id, updateReqDto);
		session.setAttribute("principal", usersPS); // 세션 동기화
		return new CMRespDto<>(1, "기본정보수정 성공", null);
	}
}
