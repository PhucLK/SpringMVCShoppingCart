package com.spring.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring.entities.Images;
import com.spring.entities.Product;
import com.spring.entities.Size;
import com.spring.enums.SizeEnums;
import com.spring.service.CategoryService;
import com.spring.service.ProductService;
import com.spring.service.SizeService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private ProductService productService;

	@Autowired
	private HttpServletRequest request;

	@Autowired
	CategoryService categoryService;

	@Autowired
	SizeService sizeService;

	private Product p;

	@RequestMapping(value = { ("/manager"), ("/") })
	public String managerProduct() {

		return "admin/productManager";
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String home(Model model, @RequestParam(value = "status", required = false) String status,
			@RequestParam(value = "message", required = false) String message) {
		model.addAttribute("ListProduct", productService.getList());
		model.addAttribute("status", status);
		model.addAttribute("message", message);
		return "admin/lists";
	}

	@GetMapping("/addProduct")
	public String addProduct(Model model) {
		// Product product = ;
		model.addAttribute("product", new Product());
		model.addAttribute("action", "addProduct");
		model.addAttribute("submit", "Add Product");
		model.addAttribute("categories", categoryService.getAll());
		model.addAttribute("sizes", SizeEnums.values());
		return "admin/product-form";
	}

	@PostMapping("/addProduct")
	public String saveProduct(Model model, @ModelAttribute("product") Product product) {
		p = product;
		model.addAttribute("images", new Images());
		model.addAttribute("action", "addImage");
		return "admin/image-form";
	}

	@PostMapping("/addImage")
	public String addImage(@ModelAttribute("images") Images images, Model model) {

		String[] size = p.getSize();
		List<Size> sizes = new ArrayList<Size>();
		for (String s : size) {
			sizes.add(new Size(s));
		}

		if (images != null && !images.getImage().isEmpty()) {

			String realPathtoUploads = request.getServletContext().getRealPath("/");

			List<MultipartFile> listMultipartFile = images.getImage();
			List<Images> listImage = new ArrayList<Images>();
			for (MultipartFile multipartFile : listMultipartFile) {

				Images image = new Images();
				String fileName = multipartFile.getOriginalFilename();
				image.setName(fileName);
				listImage.add(image);
				p = productService.saveProductS(p, sizes, image);

				String array[] = realPathtoUploads.split("\\.");
//				for (String a : array) {
//					System.out.println(a);
//				}
				String path = array[0] + "MVCupload\\src\\main\\webapp\\resources\\images\\" + fileName;

				File imageFile = new File(path);
				try {
					multipartFile.transferTo(imageFile);
				} catch (IOException e) {
					e.printStackTrace();
				}

			}
			p.setImages(listImage);
			productService.saveP(p);

			return "redirect:/admin/list";
		} else {
			model.addAttribute("image", new Images());
			model.addAttribute("action", "addImage");
			return "admin/image-form";
		}

	}

	@GetMapping("/editProduct/{id}")
	public String editProduct(Model model, @PathVariable("id") int id) {

		Product product = productService.findProduct(id);

		if (product != null) {

			int idP = product.getId();
			productService.delete(id);
			model.addAttribute("product", product);
			model.addAttribute("id", idP);
			model.addAttribute("action", "editProduct");
			model.addAttribute("sizes", SizeEnums.values());
			model.addAttribute("submit", "Edit Product");
			model.addAttribute("categories", categoryService.getAll());
			return "admin/product-form";

		} else {
			model.addAttribute("message", "Not exist data !!!");
			return "redirect:/admin/list";
		}
	}

	@PostMapping("/editProduct")
	public String editProduct(Model model, @RequestParam("id") int id, @ModelAttribute("product") Product product) {
		p = product;
		p.setId(id);
		model.addAttribute("images", new Images());
		model.addAttribute("action", "addImage");
		return "admin/image-form";
	}

	@PostMapping("/search")
	public String search(Model model, @ModelAttribute("searchText") String search) {

		List<Product> products = productService.findProduct(search, search);
		model.addAttribute("ListProduct", products);
		if (products.size() == 0 || products==null) {
			model.addAttribute("message", "Not Found !");
		}
		
		return "admin/lists";

	}

	@GetMapping("/deleteProduct/{id}")
	public String deleteProduct(Model model, @PathVariable("id") int id) {

		Product product = productService.findProduct(id);

		if (product != null) {
			if (!productService.isDelete(id)) {
				return "redirect:/admin/list?status=ok&message=Delete Success !";
			} else {
				return "redirect:/admin/list?status=fail&message=Delete Fail !";
			}
		} else {
			model.addAttribute("message", "Not exist data !!!");
			return "redirect:/admin/list";
		}
	}

}
