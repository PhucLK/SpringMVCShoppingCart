package com.spring.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.spring.entities.Images;
import com.spring.entities.Product;
import com.spring.entities.Size;
import com.spring.repositories.ImageRepository;
import com.spring.repositories.ProductRepository;

@Service
public class ProductService {

	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	ImageRepository imageRepository;

	@Autowired
	SizeService sizeService;

	public void saveP(Product p) {
		productRepository.save(p);
	}

	public List<Product> getList() {
		return (List<Product>) productRepository.findAll();
	}
	
	public List<Product> getProductsWithCategory(int id) {
		return (List<Product>) productRepository.findProductWithCategoty(id);
	}

	public Page<Product> getProductPage(Pageable pageable) {
		return (Page<Product>) productRepository.findAll(pageable);
	}

	public Product findProduct(int id) {
		return productRepository.findOne(id);
	}

	public void delete(int id) {
		productRepository.delete(id);
	}

	public List<Product> findProduct(String code, String code1) {
		return productRepository.findProduct("%" + code + "%", "%" + code1 + "%");
	}

	public Product saveProductS(Product p, List<Size> size, Images images) {

		images = imageRepository.save(images);
		p = productRepository.save(p);
		List<Size> sizes = new ArrayList<Size>();
		List<Product> products = new ArrayList<Product>();
		products.add(p);
		for (int i = 0; i < size.size(); i++) {
			Size si = new Size();
			si.setName(size.get(i).getName());
			si.setProducts(products);
			//save size
			si.setImage(images);
			si = sizeService.save(si);
			sizes.add(si);
		}
		//save product
		p.setSizes(sizes);
		p = productRepository.save(p);
		//save image
		images.setProduct(p);
		images.setSizes(sizes);
		imageRepository.save(images);
		return p;
	}

	public boolean isDelete(int id) {

		productRepository.delete(id);
		return productRepository.exists(id);
	}
}
