package site.metacoding.miniproject1;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {
	
	@GetMapping("/password")
	public String password() {
		return "users/as_password";
	}
	
	@GetMapping("/accountsetting")
	public String accountsetting() {
		return "users/accountsetting";
	}
	
	@GetMapping("/joinForm")
	public String joinForm() {
		return "users/joinForm";
	}
	
	@GetMapping("/delete")
	public String delete () {
		return "users/as_delete";
	}
	
	@GetMapping("/profile")
	public String profile () {
		return "users/as_profile";
	}
	
	@GetMapping("/login")
	public String login () {
		return "users/loginForm";
	}
	
	
}
