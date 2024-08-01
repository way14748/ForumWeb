package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/test")    // http://localhost:8090/test
public class TestWebController {
	
	// http://localhost:8090/test/hello  
	@GetMapping("/hello")
	public String hello() {
		return "hello";  // /WEB-INF/views/hello.jsp  hello.jsp 이동
	}
	
	// http://localhost:8090/test/hello2?msg=안녕하세요? 
	// 매우중요
	@GetMapping("/hello2")
	@ResponseBody
	public String hello2(@RequestParam(value="msg", required=false) String msg) {
		return msg;
	}
	
	// http://localhost:8090/test/hello3/안녕하세요
	@GetMapping("/hello3/{msg}")
	public String hello3(@PathVariable String msg, Model m) {
		m.addAttribute("msg", msg);  // 정보 전달
		return "hello";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
