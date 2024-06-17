package com.zosh.controller;

import java.util.List;

import com.zosh.exception.ProductException;
import com.zosh.model.*;
import com.zosh.service.ProductService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class ProductController {
	
	@Autowired
	private ProductService productService;

	//baseurl/api/products?category=cate&color=value&size=
	@GetMapping("/products")
	public ResponseEntity<Page<Product>> findProductByCategoryHandler(@RequestParam String category,
			@RequestParam List<String> color, @RequestParam List<String> size, @RequestParam Integer minPrice,
			@RequestParam Integer maxPrice, @RequestParam Integer minDiscount, @RequestParam String sort,
			@RequestParam String stock, @RequestParam Integer pageNumber, @RequestParam Integer pageSize) {

		Page<Product> res = productService.getAllProduct(category, color, size, minPrice, maxPrice, minDiscount, sort,
				stock, pageNumber, pageSize);

		System.out.println("Sản phẩm hoàn chỉnh");
		return new ResponseEntity<>(res, HttpStatus.ACCEPTED);
	}

	@GetMapping("/products/id/{productId}")
	public ResponseEntity<Product> findProductByIdHandler(@PathVariable Long productId) throws ProductException {
		Product product = productService.findProductById(productId);
		return new ResponseEntity<Product>(product, HttpStatus.ACCEPTED);
	}

	
}