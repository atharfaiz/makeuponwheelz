package com.bugfree.testgt.controller.order;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bugfree.testgt.commons.KrenaiCONSTANTS;
import com.bugfree.testgt.commons.SendSms;
import com.bugfree.testgt.model.User;
import com.bugfree.testgt.model.order.InvoiceSeries;
import com.bugfree.testgt.model.order.OrderDetails;
import com.bugfree.testgt.model.order.OrderProducts;
import com.bugfree.testgt.model.product.Category;
import com.bugfree.testgt.model.product.PackageDetails;
import com.bugfree.testgt.model.product.Product;
import com.bugfree.testgt.model.product.SubCategory;
import com.bugfree.testgt.repository.UserRepository;
import com.bugfree.testgt.repository.order.InvoiceSeriesRepository;
import com.bugfree.testgt.repository.order.OrderDetailsRepository;
import com.bugfree.testgt.repository.order.OrderProductsRepository;
import com.bugfree.testgt.repository.product.CategoryRepository;
import com.bugfree.testgt.repository.product.PackageDetailsRepository;
import com.bugfree.testgt.repository.product.ProductRepository;
import com.bugfree.testgt.repository.product.SubCategoryRepository;
import com.bugfree.testgt.repository.profile.StoreInfoRepository;
import com.bugfree.testgt.repository.profile.WorkingRepository;
import com.bugfree.testgt.service.commons.MailService;

@Controller
public class OrderController {

	@Autowired
	private UserRepository userRepo;
	@Autowired
	private CategoryRepository categoryRepository;
	@Autowired
	private SubCategoryRepository subCategoryRepository;
	@Autowired
	private ProductRepository productRepository;
	@Autowired
	private PackageDetailsRepository packageDetailsRepo;
	@Autowired
	private WorkingRepository workingRepository;
	@Autowired
	private StoreInfoRepository storeInfoRepository;
	@Autowired
	private MailService javaMailService;
	@Autowired
	private InvoiceSeriesRepository invoiceSeriesRepository;
	@Autowired
	private OrderDetailsRepository orderDetailsRepository;
	@Autowired
	private OrderProductsRepository orderProductsRepository;
	private DecimalFormat df = new DecimalFormat("#.##");
	@RequestMapping(value = {"/appointment"}, method = { RequestMethod.GET })
	public ModelAndView getOrderPage(Model model) {
		List<Category> catList = (List<Category>) categoryRepository.findByStatus(KrenaiCONSTANTS.activeStatus);
		List<SubCategory> subList = (List<SubCategory>) subCategoryRepository.findByStatusAndCategoryIn(KrenaiCONSTANTS.activeStatus, catList);
		List<Map<String, String>> categoryList = new ArrayList<Map<String,String>>();
		List<Map<String, String>> subcatList = new ArrayList<Map<String,String>>();
		
		Map<String, String> map = new HashMap<String, String>();
		
		for(Category category : catList){
			map = new HashMap<String, String>();
			map.put("categoryName", category.getCategoryName());
			map.put("id", category.getCategoryId()+"");
			categoryList.add(map);
		}
		for(SubCategory subCategory :  subList){
			map = new HashMap<String, String>();
			map.put("subcatName", subCategory.getSubCategoryName());
			map.put("id", subCategory.getCategory().getCategoryId()+"");
			map.put("url", "/"+subCategory.getCategory().getCategoryAlias().toLowerCase()+"/"
					+subCategory.getSubCategoryAlias().toLowerCase());
			subcatList.add(map);
		}
		List<PackageDetails> packList = (List<PackageDetails>) packageDetailsRepo.findByStatus(KrenaiCONSTANTS.activeStatus);
		List<Map<String, String>> packageList = new ArrayList<Map<String,String>>();
		for(PackageDetails packageDetails: packList){
			map = new HashMap<String, String>();
			map.put("packageName", packageDetails.getPackageName());
			map.put("id", packageDetails.getCategory().getCategoryId()+"");
			map.put("url", "/"+packageDetails.getCategory().getCategoryAlias().toLowerCase()+"/"
					+packageDetails.getPackageName().toLowerCase());
			packageList.add(map);
		}
		User user = userRepo.findByUserId((String)SecurityUtils.getSubject().getPrincipal());
		if(user!=null){
			model.addAttribute("username", user.getName());
		}
		model.addAttribute("subcatList", subcatList);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("packageList", packageList);
		
		return new ModelAndView("order-page");
		
	}
	
	@RequestMapping(value = {"/category/data"}, method = { RequestMethod.POST })
	public @ResponseBody Map<String, Object> getProductAndPackage(Model model) {
		
		Map<String, Object> map = null;
		Map<String, Object> mapData = null;
		List<Category> categoriesList = categoryRepository.findByStatus(KrenaiCONSTANTS.activeStatus);
		List<Product> productsList = null;
		List<Map<String, Object>> listmap = null;
		List<Map<String, Object>> mapListData = new ArrayList<Map<String,Object>>();
		int i = 0;
		for(Category category : categoriesList){
			mapData = new HashMap<String, Object>();
			mapData.put("catId", category.getCategoryId());
			mapData.put("catName", category.getCategoryName());
			mapData.put("catAlias", category.getCategoryAlias());
			
			if(i==0)
				mapData.put("catActive", true);
			else
				mapData.put("catActive", false);
			
			i++;
			productsList = productRepository.findByCategory(category);
			listmap = new ArrayList<Map<String,Object>>();
			for(Product product : productsList){
				map = new HashMap<String, Object>();
				map.put("productId", product.getProductId());
				map.put("productName", product.getProductName());
				map.put("productMrp", product.getMrp());
				map.put("productSellPrc", product.getSellingPrice());
				map.put("discount", product.getDiscount());
				map.put("gst", product.getGstTax());
				//map.put("imageUrl", product.getImageUrl());
				map.put("qty", 0);
				map.put("imageUrl", "http://35.154.27.124/"+product.getImageUrl());
				listmap.add(map);
			}
			mapData.put("catProductList", listmap);
			mapListData.add(mapData);
		}
		
		Map<String, Object> mapList = new HashMap<String, Object>();
		mapList.put("catProdcut", mapListData);
		mapListData = new ArrayList<Map<String,Object>>();
		
		List<PackageDetails> packageDetailList = null;
		i=0;
		for(Category category : categoriesList){
			mapData = new HashMap<String, Object>();
			mapData.put("catId", category.getCategoryId());
			mapData.put("catName", category.getCategoryName());
			mapData.put("catAlias", category.getCategoryAlias());
			if(i==0)
				mapData.put("catActive", true);
			else
				mapData.put("catActive", false);
			i++;
			packageDetailList = packageDetailsRepo.findByStatusAndCategory(KrenaiCONSTANTS.activeStatus, category);
			listmap = new ArrayList<Map<String,Object>>();
			for(PackageDetails packageDetails : packageDetailList){
				map = new HashMap<String, Object>();
				map.put("id", packageDetails.getPackageDetailsId());
				map.put("name", packageDetails.getPackageName());
				map.put("mrp", packageDetails.getMrp());
				map.put("sellPrc", packageDetails.getAmount());
				map.put("gst", packageDetails.getTax());
				//map.put("imageUrl", packageDetails.getImagePath());
				map.put("qty", 0);
				map.put("imageUrl", "http://35.154.27.124/"+packageDetails.getImagePath());
				listmap.add(map);
			}
			mapData.put("catPackageList", listmap);
			mapListData.add(mapData);
		}
		mapList.put("catPackage", mapListData);
		
		
		return mapList;
	}
	@RequestMapping(value = {"/get/user/authentication/data"}, method = { RequestMethod.POST })
	public @ResponseBody Map<String, String> getUserAuthenData(Model model) {
		User user = null;
		Map<String, String> map = new HashMap<String, String>();
		if(SecurityUtils.getSubject().getPrincipal()!=null){
			user = userRepo.findByUserId((String)SecurityUtils.getSubject().getPrincipal());
			if(user!=null){
				map.put("userName", user.getName());
				map.put("userPhone", user.getContact());
				map.put("userMail", user.getUserId());
				map.put("userAddress", user.getAddress());
				map.put("authen", "authen");
			}else{
				map.put("userName", "");
				map.put("userPhone", "");
				map.put("userMail", "");
				map.put("userAddress", "");
				map.put("authen", "guest");
			}
		}else{
			map.put("userName", "");
			map.put("userPhone", "");
			map.put("userMail", "");
			map.put("userAddress", "");
			map.put("authen", "guest");
		}
		
		return map;
	}
	
	@RequestMapping(value = {"/get/user/available/time/slot"}, method = { RequestMethod.POST })
	public @ResponseBody List<Map<String, String>> getBookedOrderSlot(HttpServletRequest request) {
		User user = null;
		List<Map<String, String>> bookedTimeSlot = new ArrayList<Map<String,String>>();
		
		Map<String, String> map = new HashMap<String, String>();
		if(SecurityUtils.getSubject().getPrincipal()!=null){
			user = userRepo.findByUserId((String)SecurityUtils.getSubject().getPrincipal());
			String sdate = request.getParameter("selectedDate");
			Date selectedDate = null;
			try {
				selectedDate = new SimpleDateFormat("dd-MM-yyyy").parse(sdate);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Set<Integer> timeSlot = new HashSet<Integer>();
			if(user!=null){
				List<OrderDetails> orderDetailList = orderDetailsRepository.findByScheduleDateAndUser(selectedDate, user);
				for(OrderDetails orderDetails : orderDetailList){
					map = new HashMap<String, String>();
					System.out.println(orderDetails.getScheduledTime().toString().replaceAll(":00", ""));
					if(orderDetails.getScheduledTime().toString().replaceAll(":00", "") == "00" ||
							orderDetails.getScheduledTime().toString().replaceAll(":00", "").equals("00")){
						/*map.put("time", "12:00");
						map.put("booked", "yes");
						map.put("timealias", "12");
						map.put("status", "occupied");*/
						System.out.println("========into this");
						timeSlot.add(12);
					}else{
						/*map.put("time", orderDetails.getScheduledTime().toString().replaceAll(":00", "")+":00");
						map.put("booked", "yes");
						map.put("timealias", orderDetails.getScheduledTime().toString().replaceAll(":00", ""));
						map.put("status", "occupied");*/
						timeSlot.add(Integer.parseInt(orderDetails.getScheduledTime().toString().replaceAll(":00", "")));
					}
					//bookedTimeSlot.add(map);
				}
				//System.out.println("======in time========"+timeSlot);
				for(int i=8; i<20; i++){
					
					//System.out.println((!timeSlot.contains(i))+"======in time========"+timeSlot.contains(i));
					System.out.println(timeSlot.contains(12));
					if(!timeSlot.contains(i)){
						map = new HashMap<String, String>();
						if(i<10){
							map.put("time", "0"+i+":00");
							map.put("timealias", "0"+i);
							if(i<9)
								map.put("timeend", "0"+(i+1)+":00");
							else
								map.put("timeend", (i+1)+":00");
						}
						else{
							map.put("time", i+":00");
							map.put("timealias", ""+i);
							map.put("timeend", (i+1)+":00");
						}
						
						map.put("booked", "no");
						map.put("status", "");
						
						bookedTimeSlot.add(map);
					}
				}
			}else{
				for(int i=8; i<20; i++){
					
					map = new HashMap<String, String>();
					if(i<10){
						map.put("time", "0"+i+":00");
						map.put("timealias", "0"+i);
						if(i<9)
							map.put("timeend", "0"+(i+1)+":00");
						else
							map.put("timeend", (i+1)+":00");
					}
					else{
						map.put("time", i+":00");
						map.put("timealias", ""+i);
						map.put("timeend", (i+1)+":00");
					}
					
					map.put("booked", "no");
					map.put("status", "");
					bookedTimeSlot.add(map);
				}
			}
		}else{
			for(int i=8; i<20; i++){
				
				map = new HashMap<String, String>();
				if(i<10){
					map.put("time", "0"+i+":00");
					map.put("timealias", "0"+i);
					if(i<9)
						map.put("timeend", "0"+(i+1)+":00");
					else
						map.put("timeend", (i+1)+":00");
				}
				else{
					map.put("time", i+":00");
					map.put("timealias", ""+i);
					map.put("timeend", (i+1)+":00");
				}
				map.put("status", "");
				map.put("booked", "no");
				bookedTimeSlot.add(map);
			
			}
		}
		
		return bookedTimeSlot;
	}
	
	
	@RequestMapping(value = {"/user/order/finish"}, method = { RequestMethod.POST })
	public @ResponseBody Map<String, String> userOrderFinish(HttpServletRequest request, Model model) {
		User user = null;
		String familyMember = request.getParameter("familyMember");
		String selectedPackage = request.getParameter("selectedPackage");
		String selectedProduct = request.getParameter("selectedProduct");
		String selectedDate = request.getParameter("selectedDate");
		String selectedTime = request.getParameter("selectedTime");
		String serviceTakenBy = request.getParameter("serviceTakenBy");
		String userAddress = request.getParameter("userAddress");
		String personMessage = request.getParameter("personMessage");
		String userMail = request.getParameter("userMail");
		String userName = request.getParameter("userName");
		String userPhone = request.getParameter("userPhone");
		String userPhoneAlter = request.getParameter("userPhoneAlter");
		OrderDetails orderDetails = new OrderDetails();
		InvoiceSeries invoiceSeries = new InvoiceSeries();
		InvoiceSeries lastInvoice = invoiceSeriesRepository.findByLastInvoice();
		System.out.println("====invoice==="+lastInvoice.getSeriesString());
		String status = "failed";
		Date sDate = null;
		Date sTime = null;
		OrderProducts orderProducts = null;
		List<OrderProducts> orderProductList = new ArrayList<OrderProducts>();
		//List<Long> productList = null;
		//List<Integer> packageList = null;
		try {
			sDate = new SimpleDateFormat("dd-MM-yyyy").parse(selectedDate);
			sTime = new SimpleDateFormat("hh:mm").parse(selectedTime);
			System.out.println("======selected date==========="+sDate+"========selecte time==========="+sTime);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		float totalAmount = 0.0f;
		float totalTax = 0.0f;
		float totalAmountWithoutTax = 0.0f;
		float totalDiscoutnt = 0.0f;
		float taxPercent = 0.0f;
		
		
		float taxPercentSum = 0.0f;
		int taxQtySum = 0;
		
		
		String [] invoiceArray = lastInvoice.getSeriesString().split("-");
		JSONArray jsonPackage = new JSONArray();
		JSONArray jsonProduct = new JSONArray();
		if(selectedProduct.length()>0){
			try {
				jsonProduct = new JSONArray(selectedProduct);
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(selectedPackage.length()>0){
			try {
				jsonPackage = new JSONArray(selectedPackage);
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		System.out.println(jsonPackage);
		System.out.println(jsonProduct);
		JSONObject jsonObject = null;
		Map<String, String> map = new HashMap<String, String>();
		if(SecurityUtils.getSubject().getPrincipal()!=null){
			user = userRepo.findByUserId((String)SecurityUtils.getSubject().getPrincipal());
			if(user!=null){
				invoiceSeries.setSeriesString(invoiceArray[0]+"-"+(Integer.parseInt(invoiceArray[1])+1));
				invoiceSeries.setStartDate(KrenaiCONSTANTS.getCurrentDate());
				invoiceSeries.setEndDate(KrenaiCONSTANTS.getCurrentDate());
				invoiceSeries = invoiceSeriesRepository.save(invoiceSeries);
				
				orderDetails.setAddress(userAddress);
				orderDetails.setAlternateNo(userPhoneAlter);
				orderDetails.setFamilyMember(Integer.parseInt(familyMember));
				orderDetails.setUser(user);
				orderDetails.setServiceTakenBy(serviceTakenBy);
				orderDetails.setInvoiceSeries(invoiceSeries);
				orderDetails.setInvoiceNo(invoiceSeries.getSeriesString());
				orderDetails.setScheduledTime(sTime);
				orderDetails.setScheduleDate(sDate);
				orderDetails.setPersonalMessage(personMessage);
				orderDetails = orderDetailsRepository.save(orderDetails);
				orderProductList = new ArrayList<OrderProducts>();
				for(int i=0; i<jsonProduct.length(); i++){
					jsonObject = jsonProduct.getJSONObject(i);
					System.out.println(jsonObject);
					Product product = productRepository.findOne(Long.parseLong(jsonObject.getInt("productId")+""));
					orderProducts = new OrderProducts();
					orderProducts.setProduct(product);
					orderProducts.setOrderDetails(orderDetails);
					orderProducts.setMrp(product.getMrp());
					orderProducts.setSellingPrice(product.getSellingPrice());
//					orderProducts.setMrp(product.getMrp()*jsonObject.getInt("qty"));
//					orderProducts.setSellingPrice(product.getSellingPrice()*jsonObject.getInt("qty"));
					orderProducts.setDiscount((product.getMrp()*jsonObject.getInt("qty"))-(product.getSellingPrice()*jsonObject.getInt("qty")));
//					orderProducts.setGstTax(product.getGstTax()*jsonObject.getInt("qty")*product.getSellingPrice()/100);
					orderProducts.setGstTaxAmount(product.getGstTax()*jsonObject.getInt("qty")*product.getSellingPrice()/100);
					orderProducts.setGstTaxPercent(product.getGstTax());
					orderProducts.setQty(jsonObject.getInt("qty"));
					orderProductList.add(orderProducts);
					totalAmountWithoutTax += product.getSellingPrice()*jsonObject.getInt("qty");
					totalDiscoutnt += (product.getMrp()*jsonObject.getInt("qty"))-(product.getSellingPrice()*jsonObject.getInt("qty"));
					totalAmount += product.getSellingPrice()*jsonObject.getInt("qty")+ (product.getGstTax()*jsonObject.getInt("qty")*product.getSellingPrice()/100);
					totalTax += product.getGstTax()*jsonObject.getInt("qty")*product.getSellingPrice()/100;
					taxPercentSum += product.getGstTax()*jsonObject.getInt("qty");
					taxQtySum+=jsonObject.getInt("qty");
				}
				if(orderProductList.size()>0){
					orderProductsRepository.save(orderProductList);
				}
				orderProductList = new ArrayList<OrderProducts>();
				for(int i=0; i<jsonPackage.length(); i++){
					jsonObject = jsonPackage.getJSONObject(i);
					System.out.println(jsonObject);
					PackageDetails packageDetails = packageDetailsRepo.findOne(jsonObject.getInt("packageId"));
					orderProducts = new OrderProducts();
					orderProducts.setPackageDetails(packageDetails);
					orderProducts.setOrderDetails(orderDetails);
					orderProducts.setMrp(packageDetails.getMrp());
					orderProducts.setSellingPrice(packageDetails.getAmount());
//					orderProducts.setMrp(packageDetails.getMrp()*jsonObject.getInt("qty"));
//					orderProducts.setSellingPrice(packageDetails.getAmount()*jsonObject.getInt("qty"));
					orderProducts.setQty(jsonObject.getInt("qty"));
					orderProducts.setDiscount((packageDetails.getMrp()*jsonObject.getInt("qty"))-(packageDetails.getAmount()*jsonObject.getInt("qty")));
					
//					orderProducts.setGstTax(packageDetails.getTax()*jsonObject.getInt("qty")*packageDetails.getAmount()/100);
					orderProducts.setGstTaxAmount(packageDetails.getTax()*jsonObject.getInt("qty")*packageDetails.getAmount()/100);
					orderProducts.setGstTaxPercent(packageDetails.getTax());
					orderProductList.add(orderProducts);
					totalAmountWithoutTax += packageDetails.getAmount()*jsonObject.getInt("qty");
					totalDiscoutnt += (packageDetails.getMrp()*jsonObject.getInt("qty"))-(packageDetails.getAmount()*jsonObject.getInt("qty"));
					totalAmount += packageDetails.getAmount()*jsonObject.getInt("qty")+ (packageDetails.getTax()*jsonObject.getInt("qty")*packageDetails.getAmount()/100);
					totalTax += packageDetails.getTax()*jsonObject.getInt("qty")*packageDetails.getAmount()/100;
					
					taxPercentSum += packageDetails.getTax()*jsonObject.getInt("qty");
					taxQtySum+=jsonObject.getInt("qty");
				}
				if(orderProductList.size()>0){
					orderProductsRepository.save(orderProductList);
				}
				System.out.println("===taxPercentSum======="+taxPercentSum);
				System.out.println("===taxQtySum======="+taxQtySum);
				orderDetails.setTaxPercentage(Float.parseFloat(df.format(taxPercentSum/taxQtySum)));
				
				taxPercent = totalTax*100/totalAmount;
				orderDetails.setTaxableAmount(Float.parseFloat(df.format(totalTax)));
				orderDetails.setTotalAmount(Float.parseFloat(df.format(totalAmount)));
				orderDetails.setAmountWithoutTax(Float.parseFloat(df.format(totalAmountWithoutTax)));
				orderDetails.setTotalDiscount(Float.parseFloat(df.format(totalDiscoutnt)));
//				orderDetails.setTaxPercentage(Float.parseFloat(df.format(taxPercent)));
				orderDetails.setOrderStatus(KrenaiCONSTANTS.status_order_booked);
				orderDetails.setPaymentStatus(KrenaiCONSTANTS.status_payment_unpaid);
				orderDetails.setTotalDiscountPercentage(Float.parseFloat(df.format((totalDiscoutnt/totalAmountWithoutTax)*100)));
				orderDetailsRepository.save(orderDetails);
//				emailService.sendMailViaInfo(user.getUserId(), user.getOtp(), link);
				String subject = "Your order has been successfully received.";
				SendSms sendSms = new SendSms();
	    		try {
					sendSms.sendUserSMS(subject, user.getContact());
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					System.out.println("exception in otp sms========================");
				}
				String body = "Hello "+userName+",\n\n"+"We have successfylly received your order."+
						"\nWe will contact you soon.\n\n Regars Team..";
				
				try {
					javaMailService.newQueryMailUser(userMail, subject, body);
					status = "success"; 
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				status = "success";
			}else{
				status = "failed";
			}
		}else{
			status = "failed";
		}
		map.put("totalAmount", totalAmount+"");
		map.put("status", status);
		return map;
	}
		
	
}
