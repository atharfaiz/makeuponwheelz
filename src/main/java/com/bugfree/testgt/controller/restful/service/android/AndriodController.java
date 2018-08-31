package com.bugfree.testgt.controller.restful.service.android;

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.util.ByteSource;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bugfree.testgt.commons.GenerateRandomString;
import com.bugfree.testgt.commons.KrenaiCONSTANTS;
import com.bugfree.testgt.commons.SendSms;
import com.bugfree.testgt.commons.validate.ValidatePassword;
import com.bugfree.testgt.model.OnlinePaymentInfo;
import com.bugfree.testgt.model.User;
import com.bugfree.testgt.model.UserWalletRecharge;
import com.bugfree.testgt.model.order.InvoiceSeries;
import com.bugfree.testgt.model.order.OrderDetails;
import com.bugfree.testgt.model.order.OrderProducts;
import com.bugfree.testgt.model.product.Category;
import com.bugfree.testgt.model.product.PackageDetails;
import com.bugfree.testgt.model.product.PackageProducts;
import com.bugfree.testgt.model.product.Product;
import com.bugfree.testgt.model.product.SubCategory;
import com.bugfree.testgt.model.profile.StoreInfo;
import com.bugfree.testgt.model.user.UserLoginSession;
import com.bugfree.testgt.repository.UserRepository;
import com.bugfree.testgt.repository.order.InvoiceSeriesRepository;
import com.bugfree.testgt.repository.order.OrderDetailsRepository;
import com.bugfree.testgt.repository.order.OrderProductsRepository;
import com.bugfree.testgt.repository.product.CategoryRepository;
import com.bugfree.testgt.repository.product.PackageDetailsRepository;
import com.bugfree.testgt.repository.product.PackageProductsRepository;
import com.bugfree.testgt.repository.product.ProductRepository;
import com.bugfree.testgt.repository.product.SubCategoryRepository;
import com.bugfree.testgt.repository.profile.StoreInfoRepository;
import com.bugfree.testgt.repository.user.OnlinePaymentInfoRepository;
import com.bugfree.testgt.repository.user.UserLoginSessionRepository;
import com.bugfree.testgt.repository.user.UserWalletRechargeRepository;
import com.bugfree.testgt.service.EncryptService;
import com.bugfree.testgt.service.commons.MailService;
import com.google.android.gcm.server.Message;
import com.paytm.pg.merchant.CheckSumServiceHelper;

@Controller
public class AndriodController {

	
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private UserLoginSessionRepository userLoginSessionRepository;
	@Autowired
	private EncryptService encryptService;
	@Autowired
	private UserRepository userRepo;
	@Autowired
	private CategoryRepository categoryRepository;
	@Autowired
	private SubCategoryRepository subCategoryRepository;
	@Autowired
	private ProductRepository productRepository;
	@Autowired
	private PackageDetailsRepository packageDetailsRepository;
	@Autowired
	private PackageProductsRepository packageProductsRepository;
	@Autowired
	private OrderDetailsRepository orderDetailsRepo;
	@Autowired
	private OrderProductsRepository orderProductRepo;
	@Autowired
	private InvoiceSeriesRepository invoiceSeriesRepository;
	@Autowired
	private StoreInfoRepository storeInfoRepository;
	
	private DecimalFormat df = new DecimalFormat("#.##");
	

	@RequestMapping(value="/application-json/android/user/login")
	public @ResponseBody Map<String, Map<String, String>> userLogin(HttpServletRequest request,
			@RequestParam(value="emailId",required=true) String parentId,
			@RequestParam(value="password",required=true) String password,
			@RequestParam(value="deviceToken",required=true) String deviceToken
			){
		
		System.out.println("***********************************into parent login***********************************");
		
		System.out.println("**********************parentId*************************************"+parentId);
		System.out.println("***********************password*************************************"+password);
		System.out.println("**********************deviceToken***********************************"+deviceToken);
		 
		Map<String, String> loginMap = null;
		String sessionId = "";
		User user = userRepository.findByUserId(parentId);
		if((user!=null) && ValidatePassword.checkPassword(user, password) && 
			(user.getStatus().equals(KrenaiCONSTANTS.activeStatus))){
			System.out.println("=========into session creation====");
			
			
			/*UserLoginSession userLoginSession = userLoginSessionRepository.findByUserAndStatus(userParent, userParent.getStatus());
			
			if(userLoginSession!=null){
				userLoginSession.setStatus(KrenaiCONSTANTS.inactiveStatus);
				userLoginSessionRepository.save(userLoginSession);
			}*/
			
			UserLoginSession userLoginSession = new UserLoginSession();
			userLoginSession.setDeviceToken(deviceToken);
			userLoginSession.setStatus(KrenaiCONSTANTS.activeStatus);
			sessionId = GenerateRandomString.generateHexString(32);
			userLoginSession.setSessionId(sessionId);
			userLoginSession.setUser(user);
			userLoginSession = userLoginSessionRepository.save(userLoginSession);
			sessionId = userLoginSession.getSessionId();
			
			String parentPrincipal = userLoginSession.getUser().getUserId();
			System.out.println("**********************parent user******************"+parentPrincipal);
			String parentDetail[] = parentPrincipal.split("-");
			
			
			loginMap = new HashMap<String, String>();
			loginMap.put("sessionId", sessionId);
			loginMap.put("name", user.getName());
			loginMap.put("image", user.getUserProfileImage());
			loginMap.put("contact", user.getContact());
			
		}else{
			loginMap = new HashMap<String, String>();
			loginMap.put("status", "Id doesn't exist or password wrong.");
			
		}
		System.out.println("******************session id***************************"+sessionId);
		Map<String , Map<String, String>> loginData = new HashMap<String, Map<String,String>>();
		loginData.put("loginMap", loginMap);
		return loginData;
	}
	

	@RequestMapping(value="/application-json/android/categories")
	public @ResponseBody Map<String, Object> getCate(HttpServletRequest request
			){
//		UserLoginSession userSession = userLoginSessionRepository.findBySessionIdAndStatus(sessionId, KrenaiCONSTANTS.activeStatus);
		Map<String, Object> map = new HashMap<String, Object>();
//		if(userSession!=null){
			List<Category> categoryList = (List<Category>) categoryRepository.findAll();
			map.put("data", categoryList);
			map.put("result", "success");
			return map;
		/*}
		
		map.put("result", "failed");
		return map;*/
	}
		
	@RequestMapping(value="/application-json/android/subcategories")
	public @ResponseBody Map<String, Object> getSubCateg(HttpServletRequest request,
			@RequestParam(value="categoryId",required=true) int id
			
			){
//		UserLoginSession userSession = userLoginSessionRepository.findBySessionIdAndStatus(sessionId, KrenaiCONSTANTS.activeStatus);
		Map<String, Object> map = new HashMap<String, Object>();
//		if(userSession!=null){
			Category cat = new Category();
			cat.setCategoryId(id);
			List<SubCategory> categoryList = (List<SubCategory>) subCategoryRepository.findByCategoryAndStatus(cat, KrenaiCONSTANTS.activeStatus);
			map.put("data", categoryList);
			map.put("result", "success");
			return map;
//		}
//		
//		map.put("result", "failed");
//		return map;
	}
		
	@RequestMapping(value="/application-json/android/products")
	public @ResponseBody Map<String, Object> getSubCateg(HttpServletRequest request,
			@RequestParam(value="categoryId",required=true) int id,
			@RequestParam(value="subcategoryId",required=true) int subid
			
			){
//		UserLoginSession userSession = userLoginSessionRepository.findBySessionIdAndStatus(sessionId, KrenaiCONSTANTS.activeStatus);
		Map<String, Object> map = new HashMap<String, Object>();
//		if(userSession!=null){
			Category cat = new Category();
			cat.setCategoryId(id);
			SubCategory sc = new SubCategory();
			sc.setSubCategoryId(subid);
			List<Product> categoryList = (List<Product>) productRepository.findBySubCategoryAndCategory(sc, cat);
			map.put("data", categoryList);
			map.put("result", "success");
			return map;
//		}
//		
//		map.put("result", "failed");
//		return map;
	}
	
	@RequestMapping(value="/application-json/android/packages")
	public @ResponseBody Map<String, Object> packages(HttpServletRequest request
			){
//		UserLoginSession userSession = userLoginSessionRepository.findBySessionIdAndStatus(sessionId, KrenaiCONSTANTS.activeStatus);
		Map<String, Object> map = new HashMap<String, Object>();
//		if(userSession!=null){
			List<PackageDetails> packageDetailsList = (List<PackageDetails>) packageDetailsRepository.findAll();
			map.put("data", packageDetailsList);
			map.put("result", "success");
			return map;
//		}
//		
//		map.put("result", "failed");
//		return map;
	}
	
	@RequestMapping(value="/application-json/android/packages/products")
	public @ResponseBody Map<String, Object> packagesProducts(HttpServletRequest request
			, @RequestParam(value="packageId",required=true) int id
			){

		Map<String, Object> map = new HashMap<String, Object>();

			PackageDetails packageDetails =  packageDetailsRepository.findOne(id);
			List<PackageProducts> pProductList = packageProductsRepository.findByPackageDetails(packageDetails);
			
			map.put("data", pProductList);
			map.put("result", "success");
			return map;

	}
		
		
	@RequestMapping(value="/application-json/android/order/available/slots")
	public @ResponseBody Map<String, Object> orderSlots(HttpServletRequest request
			, @RequestParam(value="selectedDate",required=true) String sdate
			){
		String sessionId =request.getParameter("sessionId");
		UserLoginSession userSession = userLoginSessionRepository.findBySessionIdAndStatus(sessionId, KrenaiCONSTANTS.activeStatus);
		Map<String, Object> map = new HashMap<String, Object>();
		Date selectedDate = null;
		try {
			selectedDate = new SimpleDateFormat("dd-MM-yyyy").parse(sdate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<String> slots = new ArrayList<String>();
		if(userSession!=null){
			Set<Integer> timeSlot = new HashSet<Integer>();
			System.out.println("=================="+sdate);
			List<OrderDetails> orderDetailList = orderDetailsRepo.findByScheduleDateAndUser(selectedDate, userSession.getUser());
			for(OrderDetails orderDetails : orderDetailList){
				System.out.println(orderDetails.getScheduledTime().toString().replaceAll(":00", ""));
				if(orderDetails.getScheduledTime().toString().replaceAll(":00", "") == "00"){
					timeSlot.add(12);
				}else{
					timeSlot.add(Integer.parseInt(orderDetails.getScheduledTime().toString().replaceAll(":00", "")));
				}
				
			}
			for(int i=8; i<21; i++){
				
				//System.out.println((!timeSlot.contains(i))+"======in time========"+timeSlot.contains(i));
				if(!timeSlot.contains(i)){
					if(i<10){
						slots.add("0"+i+":00");
					}
					else{
						slots.add(i+":00");
					}
					
				}
			}
			
			
		}else{
			for(int i=8; i<21; i++){
				if(i<10){
					slots.add("0"+i+":00");
				}
				else{
					slots.add(i+":00");
				}
				
			}
			
		}
		map.put("data", slots);
		map.put("result", "success");
		return map;

	}
	
	@RequestMapping(value="/application-json/android/get/banner/images")
	public @ResponseBody Map<String, Map<String, String>> getBanerImage(HttpServletRequest request
			){

		Map<String, String> map = new HashMap<String, String>();
		System.out.println("============into hone banner======");
		StoreInfo storeInfo = storeInfoRepository.findLastStore();
		if(storeInfo.getHomeBanner1()!=null){
			map.put("homeBanner1", "http://35.154.27.124/"+storeInfo.getHomeBanner1());
		}else{
			map.put("homeBanner1", "/assets/images-slider/wide3.jpg");
		}
		if(storeInfo.getHomeBanner2()!=null){
			map.put("homeBanner2", "http://35.154.27.124/"+storeInfo.getHomeBanner2());
		}else{
			map.put("homeBanner2", "/assets/images-slider/wide4.jpg");
		}
		if(storeInfo.getHomeBanner3()!=null){
			map.put("homeBanner3", "http://35.154.27.124/"+storeInfo.getHomeBanner3());
		}else{
			map.put("homeBanner3", "/assets/images-slider/wide3.jpg");
		}
		Map<String, Map<String, String>> mapBanner = new HashMap<String, Map<String,String>>();
		mapBanner.put("bannerImages", map);
		return mapBanner;
	}
	
	@RequestMapping(value="/application-json/android/user/registration")
	public @ResponseBody Map<String, String> getUserRegistration(HttpServletRequest request, @RequestParam(value="name") String name,
			@RequestParam(value="password") String password, @RequestParam(value="mail") String usermail,
			@RequestParam(value="phone") String phone, @RequestParam(value="address") String address
			){

		Map<String, String> map = new HashMap<String, String>();
		System.out.println("============into user registration======");
		User user = userRepository.findByUserId(usermail);
    	if(user!=null){
    		map.put("status", "already");
    		return map;
    	}else{
    		user = new User();
    		user.setContact(phone);
    		user.setName(name);
    		user.setStatus(KrenaiCONSTANTS.inactiveStatus);
    		user.setUserId(usermail);
    		user.setAddress(address);
    		
    		Random random = new Random();
    		String otp= (1000 + random.nextInt(8999))+"";
    		user.setOtp(otp);
    		ByteSource salt = EncryptService.getSaltInByteSource();
    		user.setPassword(encryptService.generateSecurePasswordInHex(password, salt, 10000));
    		user.setSalt(salt.toHex());
    		userRepository.save(user);
    		map.put("status", "success");
    		map.put("userMail", usermail);
    		map.put("userName", name);
    		//map.put("otp", otp);
    		String msg = "Hi "+name+",\n"+"Your otp is "+otp+".\n"+"Thankyou for register at Make on Wheels.";
    		SendSms sendSms = new SendSms();
    		try {
				sendSms.sendUserSMS(msg, user.getContact());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("exception in otp sms========================");
			}
    	}
    	
		return map;
    	
	}
	
	@RequestMapping(value="/application-json/android/user/regitration/otp/verify")
	public @ResponseBody Map<String, String> getUserOtpVerify(HttpServletRequest request, @RequestParam(value="mail") String usermail,
			@RequestParam(value="otp") String otp/*, @RequestParam(value="continueSingIn") boolean signIn*/
			){

		Map<String, String> map = new HashMap<String, String>();
		System.out.println("============into user registration otp verify======");
		User user = userRepository.findByUserId(usermail);
    	if(user!=null){
    		if(user.getOtp() == otp || user.getOtp().equals(otp)){
    			user.setStatus(KrenaiCONSTANTS.activeStatus);
    			userRepository.save(user);
    			map.put("status", "success");
    			map.put("userMail", usermail);
        		map.put("userName", user.getName());
    		}else{
    			map.put("status", "otp not matched");
    		}
    		
    		return map;
    	}else{
    		map.put("status", "failed");
    		return map;
    	}
		
	}
	
	@RequestMapping(value="/application-json/android/user/forget/password")
	public @ResponseBody Map<String, String> forgetPasswordOtp(HttpServletRequest request, @RequestParam(value="mail") String usermail
			){

		Map<String, String> map = new HashMap<String, String>();
		System.out.println("============into user registration otp verify======");
		User user = userRepository.findByUserId(usermail);
    	if(user!=null){
    		Random random = new Random();
    		String otp= (1000 + random.nextInt(8999))+"";
    		user.setOtp(otp);
    		userRepository.save(user);
    		String msg = "Hi "+user.getName()+",\n"+"Your otp is "+otp+".\n"+"Thankyou for using Make on Wheels.";
    		SendSms sendSms = new SendSms();
    		try {
				sendSms.sendUserSMS(msg, user.getContact());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("exception in otp sms========================");
			}
    		map.put("status", "otp sent");
    		return map;
    	}else{
    		map.put("status", "user not found");
    		return map;
    	}
		
	}
	
	@RequestMapping(value="/application-json/android/user/forget/password/reset")
	public @ResponseBody Map<String, String> forgetPasswordChange(HttpServletRequest request, @RequestParam(value="mail") String usermail,
			@RequestParam(value="otp") String otp, @RequestParam(value="password") String password
			){

		Map<String, String> map = new HashMap<String, String>();
		System.out.println("============into user registration otp verify======");
		User user = userRepository.findByUserId(usermail);
    	if(user!=null){
    		if(user.getOtp() == otp || user.getOtp().equals(otp)){
    			ByteSource salt = EncryptService.getSaltInByteSource();
        		user.setPassword(encryptService.generateSecurePasswordInHex(password, salt, 10000));
        		user.setSalt(salt.toHex());
        		userRepository.save(user);
        		map.put("status", "password successfully reset.");
    		}else{
    			map.put("status", "wrong otp");
    		}
    		
    		return map;
    	}else{
    		map.put("status", "user not found");
    		return map;
    	}
		
	}
	
	@Autowired
	private MailService javaMailService;
	
	@RequestMapping(value="/application-json/android/user/order/finish")
	public @ResponseBody Map<String, Object> userOrderFinish(HttpServletRequest request
			, @RequestParam(value="sessionId",required=true) String sessionId
			){
		UserLoginSession userSession = userLoginSessionRepository.findBySessionIdAndStatus(sessionId, KrenaiCONSTANTS.activeStatus);
		Map<String, Object> map = new HashMap<String, Object>();
		String familyMember = request.getParameter("familyMember");
		String selectedPackage = request.getParameter("selectedPackage");
		String selectedProduct = request.getParameter("selectedProduct");
		String selectedDate = request.getParameter("selectedDate");
		String selectedTime = request.getParameter("selectedTime");
		String serviceTakenBy = request.getParameter("serviceTakenBy");
		String userAddress = request.getParameter("userAddress");
		String personMessage = request.getParameter("personMessage");
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
		float totalAmount = 0.0f;
		float totalTax = 0.0f;
		float totalAmountWithoutTax = 0.0f;
		float totalDiscoutnt = 0.0f;
		float taxPercent = 0.0f;
		
		float taxPercentSum = 0.0f;
		int taxQtySum = 0;
		
		System.out.println(jsonPackage);
		System.out.println(jsonProduct);
		JSONObject jsonObject = null;
		if(userSession!=null){
			User user = userSession.getUser();
			if(user!=null){
				invoiceSeries.setSeriesString(invoiceArray[0]+"-"+(Integer.parseInt(invoiceArray[1])+1));
				invoiceSeries.setStartDate(KrenaiCONSTANTS.getCurrentDate());
				invoiceSeries.setEndDate(KrenaiCONSTANTS.getCurrentDate());
				invoiceSeries = invoiceSeriesRepository.save(invoiceSeries);
				
				orderDetails.setAddress(userAddress);
				//orderDetails.setAlternateNo(userPhoneAlter);
				orderDetails.setFamilyMember(Integer.parseInt(familyMember));
				orderDetails.setUser(user);
				orderDetails.setServiceTakenBy(serviceTakenBy);
				orderDetails.setInvoiceSeries(invoiceSeries);
				orderDetails.setInvoiceNo(invoiceSeries.getSeriesString());
				orderDetails.setScheduledTime(sTime);
				orderDetails.setScheduleDate(sDate);
				orderDetails.setPersonalMessage(personMessage);
				orderDetails = orderDetailsRepo.save(orderDetails);
				orderProductList = new ArrayList<OrderProducts>();
				for(int i=0; i<jsonProduct.length(); i++){
					jsonObject = jsonProduct.getJSONObject(i);
					System.out.println(jsonObject);
					Product product = productRepository.findOne(Long.parseLong(jsonObject.getInt("productId")+""));
					orderProducts = new OrderProducts();
					orderProducts.setProduct(product);
					orderProducts.setOrderDetails(orderDetails);
					orderProducts.setQty(jsonObject.getInt("qty"));
					orderProducts.setMrp(product.getMrp());
					orderProducts.setSellingPrice(product.getSellingPrice());
//					orderProducts.setMrp(product.getMrp()*jsonObject.getInt("qty"));
//					orderProducts.setSellingPrice(product.getSellingPrice()*jsonObject.getInt("qty"));
					orderProducts.setDiscount((product.getMrp()*jsonObject.getInt("qty"))-(product.getSellingPrice()*jsonObject.getInt("qty")));
//					orderProducts.setGstTax(product.getGstTax()*jsonObject.getInt("qty")*product.getSellingPrice()/100);
					orderProducts.setGstTaxAmount(product.getGstTax()*jsonObject.getInt("qty")*product.getSellingPrice()/100);
					orderProducts.setGstTaxPercent(product.getGstTax());
					orderProductList.add(orderProducts);
					totalAmountWithoutTax += product.getSellingPrice()*jsonObject.getInt("qty");
					totalDiscoutnt += (product.getMrp()*jsonObject.getInt("qty"))-(product.getSellingPrice()*jsonObject.getInt("qty"));
					totalAmount += product.getSellingPrice()*jsonObject.getInt("qty")+ (product.getGstTax()*jsonObject.getInt("qty")*product.getSellingPrice()/100);
					totalTax += product.getGstTax()*jsonObject.getInt("qty")*product.getSellingPrice()/100;
					
					taxPercentSum += product.getGstTax()*jsonObject.getInt("qty");
					taxQtySum+=jsonObject.getInt("qty");
				}
				if(orderProductList.size()>0){
					orderProductRepo.save(orderProductList);
				}
				orderProductList = new ArrayList<OrderProducts>();
				for(int i=0; i<jsonPackage.length(); i++){
					jsonObject = jsonPackage.getJSONObject(i);
					System.out.println(jsonObject);
					PackageDetails packageDetails = packageDetailsRepository.findOne(jsonObject.getInt("packageId"));
					orderProducts = new OrderProducts();
					orderProducts.setPackageDetails(packageDetails);
					orderProducts.setOrderDetails(orderDetails);
					orderProducts.setDiscount((packageDetails.getMrp()*jsonObject.getInt("qty"))-(packageDetails.getAmount()*jsonObject.getInt("qty")));
//					orderProducts.setGstTax(packageDetails.getTax()*jsonObject.getInt("qty")*packageDetails.getAmount()/100);
					orderProducts.setGstTaxAmount(packageDetails.getTax()*jsonObject.getInt("qty")*packageDetails.getAmount()/100);
					orderProducts.setGstTaxPercent(packageDetails.getTax());
					orderProducts.setMrp(packageDetails.getMrp());
					orderProducts.setSellingPrice(packageDetails.getAmount());
//					orderProducts.setMrp(packageDetails.getMrp()*jsonObject.getInt("qty"));
//					orderProducts.setSellingPrice(packageDetails.getAmount()*jsonObject.getInt("qty"));
					orderProductList.add(orderProducts);
					totalAmountWithoutTax += packageDetails.getAmount()*jsonObject.getInt("qty");
					totalDiscoutnt += (packageDetails.getMrp()*jsonObject.getInt("qty"))-(packageDetails.getAmount()*jsonObject.getInt("qty"));
					totalAmount += packageDetails.getAmount()*jsonObject.getInt("qty")+ (packageDetails.getTax()*jsonObject.getInt("qty")*packageDetails.getAmount()/100);
					totalTax += packageDetails.getTax()*jsonObject.getInt("qty")*packageDetails.getAmount()/100;
					
					taxPercentSum += packageDetails.getTax()*jsonObject.getInt("qty");
					taxQtySum+=jsonObject.getInt("qty");
				}
				if(orderProductList.size()>0){
					orderProductRepo.save(orderProductList);
				}
				/*taxPercent = totalTax*100/totalAmount;
				orderDetails.setTaxableAmount(totalTax);
				orderDetails.setTotalAmount(totalAmount);
				orderDetails.setAmountWithoutTax(totalAmountWithoutTax);
				orderDetails.setTotalDiscount(totalDiscoutnt);
				orderDetails.setTaxPercentage(taxPercent);
				orderDetails.setOrderStatus(KrenaiCONSTANTS.status_order_booked);
				orderDetails.setPaymentStatus("UNPAID");
				
				orderDetails = orderDetailsRepo.save(orderDetails);*/
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
				orderDetailsRepo.save(orderDetails);
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
				String body = "Hello "+user.getName()+",\n\n"+"We have successfylly received your order."+
						"\nWe will contact you soon.\n\n Regars Team..";
				
				try {
					javaMailService.newQueryMailUser(user.getUserId(), subject, body);
					status = "success"; 
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				map.put("totalTax", totalTax);
				map.put("totalAmount", totalAmount);
				map.put("totalAmountWithoutTax", totalAmountWithoutTax);
				map.put("totalDiscoutnt", totalDiscoutnt);
				map.put("taxPercent", orderDetails.getTaxPercentage());
				map.put("invoiceNo", orderDetails.getInvoiceNo());
				map.put("orderNo", orderDetails.getOrderDetailsId());
				
				status = "success";
			}else{
				status = "failed";
			}
		}
		map.put("status", status);
		return map;
	}
	@Autowired
	private UserWalletRechargeRepository userWalletRechargeRepo;
	@Autowired
	private OnlinePaymentInfoRepository onlinePaymentInfoRepository;
		
	@RequestMapping(value="/application-json/android/user/wallet/payment/checksum")
	public @ResponseBody Map<String, Map<String, String>> walletRechargeChecksum(HttpServletRequest request,
			@RequestParam(value="sessionId",required=true) String sessionId,
			@RequestParam(value="amount",required=true) float amount
			
			){
		UserLoginSession userSession = userLoginSessionRepository.findBySessionIdAndStatus(sessionId, KrenaiCONSTANTS.activeStatus);
		
		User user = userSession.getUser();
		Map<String, Map<String, String>> mapData = new HashMap<String, Map<String,String>>();
		

		if(user!=null && user.getStatus().equals(KrenaiCONSTANTS.activeStatus)){
			System.out.println("*****************user**************"+user.getUserId());
			try {
				
				Map<String, String> paytmRequirement = new HashMap<String, String>();
				
				String MID = "";
				String ORDER_ID = "";
				String CUST_ID = "";
				String INDUSTRY_TYPE_ID = "";
				String CHANNEL_ID = "";
				float TXN_AMOUNT = amount;
				String WEBSITE = "";
				String PAYTM_PAYMENT_URL ="";
				String EMAIL = "";
				String MOBILE_NO ="";
				String CHECKSUMHASH = "";
				String CALLBACK_URL = "";
				System.out.println("-----------------txt amount-------------------"+TXN_AMOUNT);
				//int amount = 0;
				String status = KrenaiCONSTANTS.paymentStatusUnpaid;
				
				List<UserWalletRecharge> rechargeList = userWalletRechargeRepo.findByUserAndRechargeStatus(user, status);
				UserWalletRecharge recharge = null;
				if(rechargeList.size()>0){
					recharge = rechargeList.get(0);
					userWalletRechargeRepo.delete(recharge);
					recharge = new UserWalletRecharge();
				}
				else{
					recharge = new UserWalletRecharge();
				}
				recharge.setUser(user);
				recharge.setRechargeStatus(status);
				recharge.setAmount(amount);
				recharge  = userWalletRechargeRepo.save(recharge);
				
				MID = KrenaiCONSTANTS.MID;
				ORDER_ID = String.valueOf(recharge.getUserWalletRechargeId());
				CUST_ID = String.valueOf(user.getUserId());
				INDUSTRY_TYPE_ID = KrenaiCONSTANTS.INDUSTRY_TYPE_ID;
				CHANNEL_ID = KrenaiCONSTANTS.CHANNEL_ID_APP;
				WEBSITE = KrenaiCONSTANTS.WEBSITE;
				EMAIL = user.getUserId();
				MOBILE_NO = user.getContact();
				CALLBACK_URL = KrenaiCONSTANTS.PAYTM_CALLBACK_URL_APP+"?ORDER_ID="+recharge.getUserWalletRechargeId();
				
				TreeMap<String,String> parameters = new TreeMap<String,String>();
				
				parameters.put("MID",MID);
				parameters.put("ORDER_ID", ORDER_ID);
				parameters.put("CUST_ID", CUST_ID);
				parameters.put("INDUSTRY_TYPE_ID", INDUSTRY_TYPE_ID);
				parameters.put("CHANNEL_ID",CHANNEL_ID);
				parameters.put("TXN_AMOUNT", String.valueOf(TXN_AMOUNT));
				parameters.put("WEBSITE", WEBSITE);
				parameters.put("CALLBACK_URL", CALLBACK_URL);
				CHECKSUMHASH = CheckSumServiceHelper.getCheckSumServiceHelper().genrateCheckSum(KrenaiCONSTANTS.MERCHANT_KEY, parameters);
				System.out.println("---------------------------checksumhash----------"+CHECKSUMHASH);
				paytmRequirement.put("MID", MID);
				paytmRequirement.put("ORDER_ID", ORDER_ID);
				paytmRequirement.put("CUST_ID", CUST_ID);
				paytmRequirement.put("INDUSTRY_TYPE_ID", INDUSTRY_TYPE_ID);
				paytmRequirement.put("CHANNEL_ID", CHANNEL_ID);
				paytmRequirement.put("WEBSITE", WEBSITE);
				paytmRequirement.put("CALLBACK_URL", CALLBACK_URL);
				//paytmRequirement.put("EMAIL", cart.getUser().getEmailId());
				//paytmRequirement.put("MOBILE_NO", );
				paytmRequirement.put("CHECKSUMHASH", CHECKSUMHASH);
				paytmRequirement.put("TXN_AMOUNT", String.valueOf(TXN_AMOUNT));
				paytmRequirement.put("RECHARGE_ID", String.valueOf(recharge.getUserWalletRechargeId()));
				
				mapData.put("paytmRequirement", paytmRequirement);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return mapData;
	}
	

	@RequestMapping(value="/application-json/android/user/wallet/payment/paytm")
	public @ResponseBody   String walletRechargeSuccess(HttpServletRequest request,
			@RequestParam(value="sessionId",required=true) String sessionId,
			@RequestParam(value="rechargeId",required=true) long rechargeId
			
			){
		UserLoginSession userSession = userLoginSessionRepository.findBySessionIdAndStatus(sessionId, KrenaiCONSTANTS.activeStatus);
		
		User user = userSession.getUser();
		
		String response = "failed";
		
		if(user!=null && user.getStatus().equals(KrenaiCONSTANTS.activeStatus)){
			System.out.println("*****************user**************"+user.getUserId());
			try {
				
				UserWalletRecharge userRecharge=userWalletRechargeRepo.findOne(rechargeId);
				
				Date txnDate = KrenaiCONSTANTS.getCurrentDate();
				DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:SS");
				
				String MID = KrenaiCONSTANTS.MID;
				
				String ORDERID = request.getParameter("ORDERID");
				
				
				OnlinePaymentInfo onlinePaymentInfo = new OnlinePaymentInfo();
				if(request.getParameter("BANKNAME")!=null)
					onlinePaymentInfo.setBankName(request.getParameter("BANKNAME"));
				
				onlinePaymentInfo.setBankTxnId(request.getParameter("BANKTXNID"));
				onlinePaymentInfo.setUserWalletRecharge(userRecharge);
				onlinePaymentInfo.setCurrency(request.getParameter("CURRENCY"));
				onlinePaymentInfo.setGateWayName(request.getParameter("GATEWAYNAME"));
				onlinePaymentInfo.setOrderId(request.getParameter("ORDERID"));
				onlinePaymentInfo.setPaymentMode(request.getParameter("PAYMENTMODE"));
				onlinePaymentInfo.setRespCode(request.getParameter("RESPCODE"));
				onlinePaymentInfo.setRespMsg(request.getParameter("RESPMSG"));
				onlinePaymentInfo.setStatus(request.getParameter("STATUS"));
				onlinePaymentInfo.setTxnAmount(Float.parseFloat(request.getParameter("TXNAMOUNT")));
				onlinePaymentInfo.setTxnDate(KrenaiCONSTANTS.getCurrentDate());
				onlinePaymentInfo.setCheckSumHash(request.getParameter("CHECKSUMHASH"));
				onlinePaymentInfo.setTxnId(request.getParameter("TXNID"));
				onlinePaymentInfo.setUserWalletRecharge(userRecharge);
				onlinePaymentInfo = onlinePaymentInfoRepository.save(onlinePaymentInfo);
				
				userRecharge.setCreatedDate(txnDate);
				
				
				//LocalDate localDate = LocalDate.now();
			
				Message message = new Message.Builder()
                        .collapseKey("data")
                        .timeToLive(3)
                        .delayWhileIdle(true)
                        .addData("timestamp",  "\""+userRecharge.getCreatedDate()+ "\"")
                        .addData("title", "\""+"Recharge Success"+"\"")
                        .addData("click_action", "call")
                        .addData("message",  "\""+"Your Money is successfully added.\"")
                        .build();  
//				new com.bugfree.testgt.commons.firebase.SendNotification(message , user);
				
			
				//emailService.sendMailOnTemplateForPasswordAndUsername(user.getEmailId(),"Order Placed", "Your Order is Successfully Placed. Your Order Id is - ("+orderId+") ", user.getFirstName()+" "+user.getLastName(), "orderToKrenai.vm");
				String messageSms = "Recharge success";
//				new DeliverMessage(messageSms, user.getContact());
				response = "success";
				
			} catch (Exception e) {
				e.printStackTrace();
				response = "failed";
			}
		
		}
		return response;
	}


	@RequestMapping(value="/application-json/android/user/order/list")
	public @ResponseBody Map<String, List<OrderDetails>> userOrders(HttpServletRequest request
			, @RequestParam(value="sessionId",required=true) String sessionId
			){
		UserLoginSession userSession = userLoginSessionRepository.findBySessionIdAndStatus(sessionId, KrenaiCONSTANTS.activeStatus);
		
		List<OrderDetails> orderList = (List<OrderDetails>) orderDetailsRepo.findByUser(userSession.getUser());
		Map<String, List<OrderDetails>> map = new HashMap<String, List<OrderDetails>>();
		map.put("data", orderList);
		return map;
	}
	
	@RequestMapping(value="/application-json/android/user/order/details")
	public @ResponseBody Map<String, Object> userOrdersDetails(HttpServletRequest request
			, @RequestParam(value="id",required=true) long id
			){
		
		OrderDetails order =  orderDetailsRepo.findOne(id);
		Map<String, Object> map = new HashMap<String,Object>();
		List<OrderProducts> orderProducts = orderProductRepo.findByOrderDetails(order);
//		map.put("data", order);
		for(OrderProducts op: orderProducts){
			op.setOrderDetails(null);
		}
		map.put("orderProductsList", orderProducts);
		return map;
	}
	
		
}
