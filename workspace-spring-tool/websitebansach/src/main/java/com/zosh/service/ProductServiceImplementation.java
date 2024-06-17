package com.zosh.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.zosh.exception.ProductException;
import com.zosh.model.Category;
import com.zosh.model.Product;
import com.zosh.repository.CategoryRepository;
import com.zosh.repository.ProductRepository;
import com.zosh.request.CreateProductRequest;

@Service
public class ProductServiceImplementation implements ProductService {

	private ProductRepository productRepository;
	private UserSevice userSevice;
	private CategoryRepository categoryRepository;

	public ProductServiceImplementation(ProductRepository productRepository, UserSevice userSevice,
			CategoryRepository categoryRepository) {

		this.productRepository = productRepository;
		this.userSevice = userSevice;
		this.categoryRepository = categoryRepository;
	}

	@Override
	public Product createProduct(CreateProductRequest req) {
		Category topLevel = categoryRepository.findByName(req.getTopLavelCategory());

		if (topLevel == null) {
			Category topLavelCategory = new Category();
			topLavelCategory.setName(req.getTopLavelCategory());
			topLavelCategory.setLevel(1);

			topLevel = categoryRepository.save(topLavelCategory);

		}

		Category secondLevel = categoryRepository.findByNameAndParant(req.getSecondLavelCategory(), topLevel.getName());

		if (secondLevel == null) {
			Category secondLavelCategory = new Category();
			secondLavelCategory.setName(req.getSecondLavelCategory());
			secondLavelCategory.setParentCategory(topLevel);
			secondLavelCategory.setLevel(2);

			secondLevel = categoryRepository.save(secondLavelCategory);

		}

		Category thirdLevel = categoryRepository.findByNameAndParant(req.getThirdLavelCategory(),
				secondLevel.getName());

		if (thirdLevel == null) {
			Category thirdLavelCategory = new Category();
			thirdLavelCategory.setName(req.getThirdLavelCategory());
			thirdLavelCategory.setParentCategory(secondLevel);
			thirdLavelCategory.setLevel(3);

			thirdLevel = categoryRepository.save(thirdLavelCategory);

		}

		Product product = new Product();
		product.setTitle(req.getTitle());
		product.setColor(req.getColor());
		product.setDesciption(req.getDescription());
		product.setDiscountedPrice(req.getDiscountedPrice());
		product.setDiscountPersent(req.getDiscountPersent());
		product.setImageUrl(req.getImageUrl());
		product.setBrand(req.getBrand());
		product.setPrice(req.getPrice());
		product.setSizes(req.getSize());
		product.setQuantity(req.getQuantity());
		product.setCategory(thirdLevel);
		product.setCreateAt(LocalDateTime.now());

		Product saveProduct = productRepository.save(product);

		return saveProduct;

	}

	@Override
	public String deleteProduct(Long productId) throws ProductException {

		Product product = findProductById(productId);
		product.getSizes().clear();
		productRepository.delete(product);
		return "Sản phẩm đã được xóa thành công";
	}

	@Override
	public Product updateProduct(Long productId, Product req) throws ProductException {
		Product product = findProductById(productId);

		if (req.getQuantity() != 0) {
			product.setQuantity(req.getQuantity());

		}
		return productRepository.save(product);
	}

	@Override
	public Product findProductById(Long id) throws ProductException {
		Optional<Product> opt = productRepository.findById(id);

		if (opt.isPresent()) {
			return opt.get();
		}
		throw new ProductException("Không tìm thấy sản phẩm có id-" + id);

	}

	@Override
	public List<Product> findProductByCategory(String category) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public Page<Product> getAllProduct(String category, List<String> colors, List<String> sizes, Integer minPrice,
	        Integer maxPrice, Integer minDiscount, String sort, String stock, Integer pageNumber, Integer pageSize) {

	    Pageable pageable = PageRequest.of(pageNumber, pageSize);

	    List<Product> products = productRepository.filterProducts(category, minPrice, maxPrice, minDiscount, sort);

	    System.out.println("Initial Products Size: " + products.size());

	    if (products == null || products.isEmpty()) {
	        return new PageImpl<>(List.of(), pageable, 0);
	    }

	    if (!colors.isEmpty()) {
	        products = products.stream()
	                .filter(p -> colors.stream().anyMatch(c -> c.equalsIgnoreCase(p.getColor())))
	                .collect(Collectors.toList());
	    }

	    if (stock != null) {
	        if (stock.equals("in_stock")) {
	            products = products.stream().filter(p -> p.getQuantity() > 0).collect(Collectors.toList());
	        } else if (stock.equals("out_of_stock")) {
	            products = products.stream().filter(p -> p.getQuantity() < 1).collect(Collectors.toList());
	        }
	    }

	    int startIndex = (int) pageable.getOffset();
	    int endIndex = Math.min(startIndex + pageable.getPageSize(), products.size());

	    List<Product> pageContent = products.subList(startIndex, endIndex);

	    System.out.println("Page Content Size: " + pageContent.size());

	    Page<Product> filteredProducts = new PageImpl<>(pageContent, pageable, products.size());

	    return filteredProducts;
	}


	@Override
	public List<Product> findAllProducts() {
		return productRepository.findAll();
	}

}