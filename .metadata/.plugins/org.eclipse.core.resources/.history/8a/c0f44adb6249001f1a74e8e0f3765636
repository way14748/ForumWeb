package com.example.demo;

import java.util.HashMap;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")    // http://localhost:8090/api
public class TestRestController {

	// http://localhost:8090/api/hello?msg=메시지내용
	@GetMapping("/hello")
	public String hello(@RequestParam(value="msg", required=false) String msg ) {
		return msg;
	}
	
	// http://localhost:8090/api/hello2
	@GetMapping("/hello2")
	public HashMap<String, String> hello2() {
		HashMap<String, String> map = new HashMap<>() {
			{
				put("이름", "홍길동");
				put("나이", "30");
				put("국적", "서울");
			}
		};
		
		return map;
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
