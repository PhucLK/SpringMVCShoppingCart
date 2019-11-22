package com.spring.controller;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.entities.Customer;
import com.spring.entities.OrderDetail;
import com.spring.entities.OrderSize;
import com.spring.entities.Orders;
import com.spring.entities.Product;
import com.spring.service.CustomerService;
import com.spring.service.OrderDetailService;
import com.spring.service.OrderSizeService;
import com.spring.service.OrdersService;
import com.spring.service.ProductService;

@Controller
public class HomeController {

	@Autowired
	private ProductService productService;

	@Autowired
	private OrderDetailService orderDetailService;

	@Autowired
	private OrdersService ordersService;

	@Autowired
	private CustomerService customerService;

	@Autowired
	OrderSizeService orderSizeService;

	@Autowired
	private JavaMailSender mailSender;

	private List<OrderDetail> listOrderDetails = new ArrayList<OrderDetail>();

	@GetMapping(value = { ("/"), ("/home") })
	public String home(Model model, @RequestParam(value = "page", defaultValue = "0", required = false) int page,
			@RequestParam(value = "idCategory", defaultValue = "0", required = false) int idCategory) {

		// select product with category
		if (idCategory > 0) {
			List<Product> products = productService.getProductsWithCategory(idCategory);
			model.addAttribute("ListProduct", products);
			return "index";
		}

		// display 3 item on one page
		PageRequest pageRequest = new PageRequest(page, 3);

		Pageable pageable = pageRequest;

		Page<Product> allProducts = (Page<Product>) productService.getProductPage(pageable);
		model.addAttribute("currentPage", page);

		model.addAttribute("ListProduct", allProducts.getContent());
		model.addAttribute("totalPage", allProducts.getTotalPages());
		model.addAttribute("check", "Banner");
		if (listOrderDetails == null) {

		} else {
			model.addAttribute("lenght", listOrderDetails.size());
		}

		return "index";
	}

	@GetMapping("/detail/{id}")
	public String detail(@PathVariable("id") int id, Model model) {
		Product product = productService.findProduct(id);
		model.addAttribute("product", product);
		model.addAttribute("lenght", listOrderDetails.size());

		return "detail";
	}

	@PostMapping("/add")
	public String add(@RequestParam("id") int id, @RequestParam("size") String orderSize,
			@RequestParam("quantity") int quantity, Model model) {

		// find product in database
		Product product = productService.findProduct(id);

		// check product exist
		if (check(product, orderSize)) {

			for (int i = 0; i < listOrderDetails.size(); i++) {
				// if was exist -> quantity ++
				if (listOrderDetails.get(i).getProduct().getId() == product.getId()
						&& listOrderDetails.get(i).getOrderSizeTem().equals(orderSize)) {
					int newQuantity = listOrderDetails.get(i).getQuantity() + quantity;
					listOrderDetails.get(i).setQuantity(newQuantity);
					listOrderDetails.set(i, listOrderDetails.get(i));
					model.addAttribute("message", "Item was exist on your cart");
					break;
				}
			}

		} else {

			// if was not exist -> add
			OrderDetail orderDetail = new OrderDetail(quantity);
			orderDetail.setProduct(product);
			orderDetail.setOrderSizeTem(orderSize);
			listOrderDetails.add(orderDetail);
			model.addAttribute("message", "Item was add to your cart");

		}
		model.addAttribute("product", product);
		model.addAttribute("lenght", listOrderDetails.size());

		return "detail";
	}

	@GetMapping("/cart")
	public String cart(Model model) {

		model.addAttribute("ListOrderDetail", listOrderDetails);
		model.addAttribute("lenght", listOrderDetails.size());
		model.addAttribute("total", ordersService.getTotal(listOrderDetails));
		model.addAttribute("message", "You have no items in your shopping cart !");
		return "cart";
	}

//	@GetMapping("/update")
//	public String update(@RequestParam("size") String orderSize,
//			@RequestParam(value = "subtract",defaultValue = "false", required = false) String subtract,
//			@RequestParam(value = "plus",defaultValue = "false", required = false) String plus, Model model) {
//
//		for (int i = 0; i < listOrderDetails.size(); i++) {
//			if (listOrderDetails.get(i).getOrderSizeTem().equals(orderSize)) {
//				// int newQuantity = 0;
//				if (subtract.equals("true")) {
//					listOrderDetails.get(i).setQuantity(listOrderDetails.get(i).getQuantity() - 1);
//					listOrderDetails.set(i, listOrderDetails.get(i));
//					break;
//				}
//				if (plus.equals("true")) {
//					listOrderDetails.get(i).setQuantity(listOrderDetails.get(i).getQuantity() + 1);
//					listOrderDetails.set(i, listOrderDetails.get(i));
//					break;
//				}
//				// listOrderDetails.get(i).setQuantity(newQuantity);
//
//			}
//		}
//
//		return "redirect:/cart";
//	}
	
	@GetMapping("/subtract")
	public String subtract(@RequestParam("size") String orderSize,@RequestParam("id") int id,Model model) {
 
		for (int i = 0; i < listOrderDetails.size(); i++) {
			if (listOrderDetails.get(i).getOrderSizeTem().equals(orderSize)&&listOrderDetails.get(i).getProduct().getId() == id) {
					listOrderDetails.get(i).setQuantity(listOrderDetails.get(i).getQuantity() - 1);
					if(listOrderDetails.get(i).getQuantity() == 0) {
						listOrderDetails.get(i).setQuantity(1);
					}
					listOrderDetails.set(i, listOrderDetails.get(i));
					break;
			}
		}

		return "redirect:/cart";
	}
	
	@GetMapping("/plus")
	public String plus(@RequestParam("size") String orderSize,@RequestParam("id") int id,Model model) {

		for (int i = 0; i < listOrderDetails.size(); i++) {
			if (listOrderDetails.get(i).getOrderSizeTem().equals(orderSize)&&listOrderDetails.get(i).getProduct().getId() == id) {
					listOrderDetails.get(i).setQuantity(listOrderDetails.get(i).getQuantity() + 1);
					listOrderDetails.set(i, listOrderDetails.get(i));
					break;
			}
		}

		return "redirect:/cart";
	}

//	@GetMapping("/loginUser")
//	public String login(Model model) {
//		model.addAttribute("user", new User());
//		return "loginUser";
//	}

	@GetMapping("/newCollection")
	public String newCollection() {

		return "new";
	}

	@GetMapping("/login")
	public String login(Model model, @RequestParam(value = "error", required = false) boolean error) {

		if (error) {
			model.addAttribute("message", "Username or password not right !");
		}
		return "login";
	}

//	@PostMapping("/loginValidate")
//	public String loginValidate(@ModelAttribute("user") User user, Model model) throws NoSuchAlgorithmException {
//
//		String password = encoding(user.getPassword());
//		if (userService.findUser(user.getUserName(), password)) {
//			return "wellcomeAd";
//		} else {
//			model.addAttribute("message", "Username or password not right !!!");
//			return "loginUser";
//		}
//	}

	@GetMapping("/checkout")
	public String checkOut(Model model) {

		model.addAttribute("customer", new Customer());
		model.addAttribute("lenght", listOrderDetails.size());
		model.addAttribute("ListOrderDetail", listOrderDetails);
		model.addAttribute("total", ordersService.getTotal(listOrderDetails));
		return "checkout";
	}

	@PostMapping("/thanks")
	public String thanks(Model model, @Valid @ModelAttribute("customer") Customer customer, BindingResult result) {

		if (result.hasErrors()) {
			model.addAttribute("customer", customer);
			model.addAttribute("lenght", listOrderDetails.size());
			model.addAttribute("ListOrderDetail", listOrderDetails);
			model.addAttribute("total", ordersService.getTotal(listOrderDetails));
			return "checkout";
		} else {
			if (listOrderDetails.size() != 0) {
				Orders orders = ordersService.saveOrders(listOrderDetails);
				customer.setOrders(orders);
				customerService.save(customer);
				for (int i = 0; i < listOrderDetails.size(); i++) {
					OrderDetail o = new OrderDetail();
					o = listOrderDetails.get(i);
					o.setOrders(orders);
					o = orderDetailService.save(o);
					OrderSize orderSize = new OrderSize();
					orderSize.setSizeOrder(o.getOrderSizeTem());
					orderSize.setOrderDetail(o);
					orderSizeService.save(orderSize);

				}
				listOrderDetails.clear();
			}
			doSendEmail(customer.getEmail());
			return ("redirect:/success");
		}
	}
	
	@GetMapping("/success")
	public String success() {
		return "thanks";
	}

	@GetMapping(value = "/delete/{orderSizeTem}")
	public String delete(Model model, @PathVariable("orderSizeTem") String orderSizeTem) {

		for (int i = 0; i < listOrderDetails.size(); i++) {
			if (listOrderDetails.get(i).getOrderSizeTem().equals(orderSizeTem)) {
				listOrderDetails.remove(i);
			}
		}
		return "redirect:/cart";

	}



	@PostMapping("/search")
	public String search(Model model, @RequestParam("search") String search) {

		List<Product> listP = productService.findProduct(search, search);
		model.addAttribute("lenght", listOrderDetails.size());
		model.addAttribute("ListProduct", listP);
		if (listP.size() == 0 || listP == null) {
			model.addAttribute("message", "Not Found !!!");

		}
		return "index";

	}

	public boolean check(Product product, String orderSize) {
		for (OrderDetail o : listOrderDetails) {
			if (o.getOrderSizeTem() != null) {
				if (o.getProduct().getId() == product.getId() && o.getOrderSizeTem().equals(orderSize)) {
					return true;
				}
			}
		}
		return false;

	}

	public String encoding(String password) throws NoSuchAlgorithmException {
		MessageDigest md = MessageDigest.getInstance("MD5");
		byte[] hashInBytes = md.digest(password.getBytes(StandardCharsets.UTF_8));

		StringBuilder sb = new StringBuilder();
		for (byte b : hashInBytes) {
			sb.append(String.format("%02x", b));
		}
		return sb.toString();
	}

	// sent mail
	public void doSendEmail(String emailCustomer) {
		// takes input from e-mail form
		String recipientAddress = emailCustomer;
		String subject = "Thank You !";
		String message = "Thanks you ordered our shopping\r\n" + 
						"If you have any question about product please feed back for us!\r\n" + 
						"We hope you will happy when you shopping here! Thanks a lot !";
		// creates a simple e-mail object
		SimpleMailMessage email = new SimpleMailMessage();
		email.setTo(recipientAddress);
		email.setSubject(subject);
		email.setText(message);

		// sends the e-mail
		mailSender.send(email);

	}

}
