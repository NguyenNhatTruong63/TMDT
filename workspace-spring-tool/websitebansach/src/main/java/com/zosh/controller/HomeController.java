package com.zosh.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.zosh.response.ApiResponse;

@RestController
public class HomeController {
	
	@GetMapping("/")
	public ResponseEntity<ApiResponse> homeController(){
		
		ApiResponse res = new ApiResponse();
		res.setMessage("Welcome to ecommerce backend system");
		res.setStatus(true);
		return new ResponseEntity<>(res, HttpStatus.OK);
	}
}
