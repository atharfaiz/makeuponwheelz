package com.bugfree.testgt.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bugfree.testgt.commons.KrenaiCONSTANTS;
import com.bugfree.testgt.model.User;
import com.bugfree.testgt.model.product.Category;
import com.bugfree.testgt.model.product.PackageDetails;
import com.bugfree.testgt.model.product.PackageProducts;
import com.bugfree.testgt.model.product.Product;
import com.bugfree.testgt.model.product.SubCategory;
import com.bugfree.testgt.model.profile.Artist;
import com.bugfree.testgt.model.profile.Banner;
import com.bugfree.testgt.model.profile.StoreInfo;
import com.bugfree.testgt.model.profile.Testimonial;
import com.bugfree.testgt.model.profile.Working;
import com.bugfree.testgt.repository.UserRepository;
import com.bugfree.testgt.repository.product.CategoryRepository;
import com.bugfree.testgt.repository.product.PackageDetailsRepository;
import com.bugfree.testgt.repository.product.PackageProductsRepository;
import com.bugfree.testgt.repository.product.ProductRepository;
import com.bugfree.testgt.repository.product.SubCategoryRepository;
import com.bugfree.testgt.repository.profile.ArtistRepository;
import com.bugfree.testgt.repository.profile.BannerRepository;
import com.bugfree.testgt.repository.profile.StoreInfoRepository;
import com.bugfree.testgt.repository.profile.TestimonialRepository;
import com.bugfree.testgt.repository.profile.WorkingRepository;
import com.bugfree.testgt.service.commons.MailService;



@Controller
public class HomeController {

	
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
	private ArtistRepository artistRepository;
	@Autowired
	private PackageProductsRepository packageProductsRepo;
	@Autowired
	private BannerRepository bannerRepository;
	
	
	/*@RequestMapping(value = "/", method = { RequestMethod.GET })
	public ModelAndView index() {

		return new ModelAndView("index");
	}*/

	@RequestMapping(value = {"/","","/home"}, method = { RequestMethod.GET })
	public ModelAndView home(Model model) {
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
		/*StoreInfo storeInfo = storeInfoRepository.findLastStore();
		String bannerImage1 = "";
		String bannerImage2 = "";
		String bannerImage3 = "";
		if(storeInfo.getHomeBanner1()!=null){
			bannerImage1 = "http://35.154.27.124/"+storeInfo.getHomeBanner1();
			
		}else{
			bannerImage1 = "/assets/images-slider/wide3.jpg";
			
		}
		if(storeInfo.getHomeBanner2()!=null){
			bannerImage2 = "http://35.154.27.124/"+storeInfo.getHomeBanner2();
			
		}else{
			bannerImage2 = "/assets/images-slider/wide4.jpg";
			
		}
		if(storeInfo.getHomeBanner3()!=null){
			bannerImage3 = "http://35.154.27.124/"+storeInfo.getHomeBanner3();
			
		}else{
			bannerImage3 = "/assets/images-slider/wide3.jpg";
			
		}*/
		List<Banner> bannerList = (List<Banner>) bannerRepository.findByStatus(KrenaiCONSTANTS.activeStatus);
		List<Map<String, String>> bannerData = new ArrayList<Map<String,String>>();
		if(bannerList.size()>0){
			for(Banner banner : bannerList){
				map = new HashMap<String, String>();
				map.put("bannerId", banner.getBannerId()+"");
				if(banner.getBannerUrl()!=null){
					map.put("bannerImage", "http://35.154.27.124/"+banner.getBannerUrl());
				}else{
					map.put("bannerImage", "/assets/images-slider/wide4.jpg");
				}
				map.put("text1", banner.getText());
				map.put("text2", banner.getText2());
				bannerData.add(map);
			}
		}
		
		model.addAttribute("subcatList", subcatList);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("packageList", packageList);
		model.addAttribute("bannerList", bannerData);
		
		return new ModelAndView("home");
		
	}
	
	
	@RequestMapping(value = "/get/subcat/products", method = RequestMethod.POST)
	public @ResponseBody List<Map<String, Object>>  subcatProductList(HttpServletRequest request, Model model) {
	
		Category category = categoryRepository.findByCategoryAlias(request.getParameter("catAlias"));
		SubCategory subCategory = subCategoryRepository.findBySubCategoryAliasAndCategory(request.getParameter("subcatAlias"), category);
		List<Map<String, Object>> listmap = new ArrayList<Map<String,Object>>();
		Map<String, Object> map = null;
		List<Product> productsList = productRepository.findBySubCategory(subCategory);
		for(Product product : productsList){
			map = new HashMap<String, Object>();
			map.put("productName", product.getProductName());
			map.put("sellPrc", product.getSellingPrice()+"");
			map.put("discount", (product.getMrp()-product.getSellingPrice())*100/product.getMrp() );
			map.put("discoutIsPer", true);
			map.put("promrp", product.getMrp());
			listmap.add(map);
		}
		return listmap;
	}
	
	@RequestMapping(value = "/get/active/packages", method = RequestMethod.POST)
	public @ResponseBody List<Map<String, Object>>  getActivePackageList(HttpServletRequest request, Model model) {
	
		List<PackageDetails> activePackageList = packageDetailsRepo.findByStatus( KrenaiCONSTANTS.activeStatus);
		List<Map<String, Object>> listmap = new ArrayList<Map<String,Object>>();
		Map<String, Object> map = null;
		Map<String, Object> map1 = null;
		List<PackageProducts> packageProductList = null;
		List<Map<String, Object>> packageProduct = null;
		float discount = 0.0f;
		float discountPer = 0.0f;
		int i = 0;
		for(PackageDetails packageDetails : activePackageList){
			map = new HashMap<String, Object>();
			map.put("id", packageDetails.getPackageDetailsId());
			map.put("name", packageDetails.getPackageName());
			map.put("mrp", packageDetails.getMrp());
			map.put("sellPrc", packageDetails.getAmount());
			map.put("gst", packageDetails.getTax());
			map.put("qty", 0);
			if(i==0)
				map.put("catActive", true);
			else
				map.put("catActive", false);
			
			i++;
			map.put("imageUrl", "http://35.154.27.124/"+packageDetails.getImagePath());
			packageProductList = packageProductsRepo.findByPackageDetails(packageDetails);
			packageProduct = new ArrayList<Map<String,Object>>();
			
			for(PackageProducts packageProducts : packageProductList){
				map1 = new HashMap<String, Object>();
				discount= 0.0f;
				discountPer = 0.0f;
				
				map1.put("packProductId", packageProducts.getPackageProductId());
				map1.put("productId", packageProducts.getProduct().getProductId());
				map1.put("productName", packageProducts.getProduct().getProductName());
				map1.put("productMrp", packageProducts.getProduct().getMrp());
				map1.put("productSell", packageProducts.getProduct().getSellingPrice());
				discount = packageProducts.getProduct().getMrp()-packageProducts.getProduct().getSellingPrice();
				discountPer = discount*100/packageProducts.getProduct().getMrp();
				
				map1.put("productDiscount", discount);
				map1.put("discountPer", discountPer);
				packageProduct.add(map1);
			}
			map.put("packageProduct", packageProduct);
			listmap.add(map);
		}
		return listmap;
	}
	
	@RequestMapping(value = "/get/active/featured/packages", method = RequestMethod.POST)
	public @ResponseBody List<Map<String, Object>>  getActiveFeaturedPackageList(HttpServletRequest request, Model model) {
	
		List<PackageDetails> activePackageList = packageDetailsRepo.findByFeaturedAndStatus(true, KrenaiCONSTANTS.activeStatus);
		List<Map<String, Object>> listmap = new ArrayList<Map<String,Object>>();
		Map<String, Object> map = null;
		Map<String, Object> map1 = null;
		List<PackageProducts> packageProductList = null;
		List<Map<String, Object>> packageProduct = null;
		float discount = 0.0f;
		float discountPer = 0.0f;
		int i = 0;
		for(PackageDetails packageDetails : activePackageList){
			map = new HashMap<String, Object>();
			map.put("id", packageDetails.getPackageDetailsId());
			map.put("name", packageDetails.getPackageName());
			map.put("mrp", packageDetails.getMrp());
			map.put("sellPrc", packageDetails.getAmount());
			map.put("gst", packageDetails.getTax());
			if(i==0)
				map.put("catActive", true);
			else
				map.put("catActive", false);
			
			i++;
			map.put("qty", 0);
			map.put("imageUrl", "http://35.154.27.124/"+packageDetails.getImagePath());
			packageProductList = packageProductsRepo.findByPackageDetails(packageDetails);
			packageProduct = new ArrayList<Map<String,Object>>();
			
			for(PackageProducts packageProducts : packageProductList){
				map1 = new HashMap<String, Object>();
				discount= 0.0f;
				discountPer = 0.0f;
				
				map1.put("packProductId", packageProducts.getPackageProductId());
				map1.put("productId", packageProducts.getProduct().getProductId());
				map1.put("productName", packageProducts.getProduct().getProductName());
				map1.put("productMrp", packageProducts.getProduct().getMrp());
				map1.put("productSell", packageProducts.getProduct().getSellingPrice());
				discount = packageProducts.getProduct().getMrp()-packageProducts.getProduct().getSellingPrice();
				discountPer = discount*100/packageProducts.getProduct().getMrp();
				
				map1.put("productDiscount", discount);
				map1.put("discountPer", discountPer);
				packageProduct.add(map1);
			}
			map.put("packageProduct", packageProduct);
			listmap.add(map);
		}
		return listmap;
	}
	
	@RequestMapping(value="/get/banner/images")
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
	
	@RequestMapping(value = "/packages", method = RequestMethod.GET)
	public ModelAndView  getPackagePage(HttpServletRequest request, Model model) {
	
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
		/*List<PackageDetails> packList = (List<PackageDetails>) packageDetailsRepo.findByStatus(KrenaiCONSTANTS.activeStatus);
		List<Map<String, String>> packageList = new ArrayList<Map<String,String>>();
		for(PackageDetails packageDetails: packList){
			map = new HashMap<String, String>();
			map.put("packageName", packageDetails.getPackageName());
			map.put("id", packageDetails.getCategory().getCategoryId()+"");
			map.put("url", "/"+packageDetails.getCategory().getCategoryAlias().toLowerCase()+"/"
					+packageDetails.getPackageName().toLowerCase());
			packageList.add(map);
		}*/
		User user = userRepo.findByUserId((String)SecurityUtils.getSubject().getPrincipal());
		if(user!=null){
			model.addAttribute("username", user.getName());
		}
		List<PackageDetails> activePackageList = packageDetailsRepo.findByStatus( KrenaiCONSTANTS.activeStatus);
		List<PackageProducts> packageProductList = packageProductsRepo.findByPackageDetailsIn(activePackageList);
		/*List<Map<String, Object>> listmap = new ArrayList<Map<String,Object>>();
		Map<String, Object> mapData = null;
		Map<String, Object> map1 = null;
		List<PackageProducts> packageProductList = null;
		List<Map<String, Object>> packageProduct = null;
		float discount = 0.0f;
		float discountPer = 0.0f;
		int i = 0;
		for(PackageDetails packageDetails : activePackageList){
			mapData = new HashMap<String, Object>();
			mapData.put("id", packageDetails.getPackageDetailsId());
			mapData.put("name", packageDetails.getPackageName());
			mapData.put("mrp", packageDetails.getMrp());
			mapData.put("sellPrc", packageDetails.getAmount());
			mapData.put("gst", packageDetails.getTax());
			mapData.put("qty", 0);
			if(i==0)
				mapData.put("catActive", true);
			else
				mapData.put("catActive", false);
			
			i++;
			mapData.put("imageUrl", "http://35.154.27.124/"+packageDetails.getImagePath());
			packageProductList = packageProductsRepo.findByPackageDetails(packageDetails);
			packageProduct = new ArrayList<Map<String,Object>>();
			
			for(PackageProducts packageProducts : packageProductList){
				map1 = new HashMap<String, Object>();
				discount= 0.0f;
				discountPer = 0.0f;
				
				map1.put("packProductId", packageProducts.getPackageProductId());
				map1.put("productId", packageProducts.getProduct().getProductId());
				map1.put("productName", packageProducts.getProduct().getProductName());
				map1.put("productMrp", packageProducts.getProduct().getMrp());
				map1.put("productSell", packageProducts.getProduct().getSellingPrice());
				discount = packageProducts.getProduct().getMrp()-packageProducts.getProduct().getSellingPrice();
				discountPer = discount*100/packageProducts.getProduct().getMrp();
				
				map1.put("productDiscount", discount);
				map1.put("discountPer", discountPer);
				packageProduct.add(map1);
			}
			mapData.put("packageProduct", packageProduct);
			listmap.add(mapData);
		}*/
		//model.addAttribute("packageList", packageProductList);
		model.addAttribute("subcatList", subcatList);
		model.addAttribute("categoryList", categoryList);
		//model.addAttribute("packageList", packageList);
		return new ModelAndView("package-page");
	}
	
	@RequestMapping(value = "/about-us", method = RequestMethod.GET)
	public ModelAndView  getAboutUsPage(HttpServletRequest request, Model model) {
	
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
		return new ModelAndView("about-page");
	}
	
	@RequestMapping(value = "/contact-us", method = RequestMethod.GET)
	public ModelAndView  getContactPage(HttpServletRequest request, Model model) {
	
		List<Category> catList = (List<Category>) categoryRepository.findByStatus(KrenaiCONSTANTS.activeStatus);
		List<SubCategory> subList = (List<SubCategory>) subCategoryRepository.findByStatusAndCategoryIn(KrenaiCONSTANTS.activeStatus, catList);
		List<Map<String, String>> categoryList = new ArrayList<Map<String,String>>();
		List<Map<String, String>> subcatList = new ArrayList<Map<String,String>>();
		
		Map<String, String> map =null;
		
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
		return new ModelAndView("contact-page");
	}
	
	@RequestMapping(value = "/get/working/hour", method = RequestMethod.POST)
	public @ResponseBody List<Map<String, String>> getWorkingHour(Model model) {
		
		Map<String, String> map = null;
		List<Map<String, String>> workingList = new ArrayList<Map<String,String>>();
		//System.out.println("=================into working hour=================");
		List<Working> workingHours = (List<Working>) workingRepository.findByOpen(true);
		//System.out.println("=================into working hour=================222");
		for(Working working : workingHours){
			map = new HashMap<String, String>();
			map.put("day", working.getDay());
			map.put("closeTime", working.getClosingTime());
			map.put("openTime", working.getOpeningTime());
			if(working.isOpen())
				map.put("isOpen", "open");
			else
				map.put("isOpen", "close");
			
			workingList.add(map);
		}
		
		
		return workingList;
		
	}
	
	@RequestMapping(value = "/get/contact/info", method = RequestMethod.POST)
	public @ResponseBody Map<String, String> getContactInfo(Model model) {
		
		Map<String, String> map = null;
		List<StoreInfo> storeInfoList = (List<StoreInfo>) storeInfoRepository.findAll();
		for(StoreInfo storeInfo : storeInfoList){
			map = new HashMap<String, String>();
			map.put("storeAddress", storeInfo.getAddress());
			map.put("phone", storeInfo.getStoreContact());
			map.put("storeAlterNo", storeInfo.getAlternateContact());
			map.put("storeMail", storeInfo.getEmailId());
			map.put("storeAbout", storeInfo.getAboutUs());
			if(storeInfo.getAboutUs().length()>300){
				map.put("storeAboutSub", storeInfo.getAboutUs().substring(0, 300));
			}else{
				map.put("storeAboutSub", storeInfo.getAboutUs());
			}
		}
		return map;
		
	}
	@Autowired
	private TestimonialRepository testimonialRepo;
	@RequestMapping(value = "/get/testimonial", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> getTestimonial(Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		Date date = KrenaiCONSTANTS.getCurrentDate();
		List<Testimonial> testimonialList = (List<Testimonial>) testimonialRepo.findAll();
		map.put("data", testimonialList);
		return map;
		
	}
	@RequestMapping(value = "/get/today/working/hour", method = RequestMethod.POST)
	public @ResponseBody Map<String, String> getTodayWorkingHour(Model model) {
		
		Map<String, String> map = new HashMap<String, String>();
		
		Date date = KrenaiCONSTANTS.getCurrentDate();
		System.out.println("===========day======="+date.getDay());
		Working workingDay = workingRepository.findByDayInt(date.getDay());
		if(workingDay.isOpen()){
			map.put("today", "open");
			map.put("opoenTime", workingDay.getOpeningTime());
			map.put("closeTime", workingDay.getClosingTime());
		}else{
			map.put("today", "close");
			map.put("opoenTime", "");
			map.put("closeTime", "");
		}
		return map;
		
	}
	
	@RequestMapping(value = "/send/user/mail/query", method = RequestMethod.POST)
	public @ResponseBody Map<String, String> sendUserMail(HttpServletRequest request, Model model) {
		
		String userName = request.getParameter("userName");
		String userMobile = request.getParameter("userMobile");
		String userMail = request.getParameter("userMail");
		String userMessage = request.getParameter("userMessage");
		
		String subject = "Your query has been successfully received.";
		String body = "Hello "+userName+",\n\n"+"We have successfylly received your query."+
				"\nWe will contact you soon.\n\n Regards Makeuponwheelz Team..";
		
		String status = "failed";
		try {
			javaMailService.newQueryMailUser(userMail, subject, body);
			status = "success"; 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			status = "failed";
			e.printStackTrace();
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("status", status);
		
		return map;
		
	}
	
	@RequestMapping(value = "/get/stylist/artist/data", method = RequestMethod.POST)
	public @ResponseBody List<Map<String, String>> getStylistData(HttpServletRequest request, Model model) {
		
		List<Artist> artistsList = artistRepository.findByStatus(KrenaiCONSTANTS.activeStatus);
		Map<String, String> map = null;
		List<Map<String, String>> listmap = new ArrayList<Map<String,String>>();
		for(Artist artist : artistsList){
			map = new HashMap<String, String>();
			map.put("artistName", artist.getArtistName());
			map.put("artistImage", "http://35.154.27.124/"+artist.getImageUrl());
			map.put("artistAbout", artist.getDescription());
			listmap.add(map);
		}
		return listmap;
		
	}
	

	@RequestMapping(value = "/{cat}/{subcat}", method = RequestMethod.GET)
	public ModelAndView categoryList(@PathVariable(value="cat") String cat,
			@PathVariable(value="subcat") String subcat, Model model) {
		Category categ = categoryRepository.findByCategoryAlias(cat); 
		System.out.println("===========subcat======="+subcat);
		
		SubCategory subcate = subCategoryRepository.findBySubCategoryAliasAndCategory(subcat, categ); 
		List<Category> catList = (List<Category>) categoryRepository.findByStatus(KrenaiCONSTANTS.activeStatus);
		List<SubCategory> subList = (List<SubCategory>) subCategoryRepository.findByStatusAndCategoryIn(KrenaiCONSTANTS.activeStatus, catList);
		List<PackageDetails> packList = (List<PackageDetails>) packageDetailsRepo.findByStatus(KrenaiCONSTANTS.activeStatus);
		List<Map<String, String>> categoryList = new ArrayList<Map<String,String>>();
		List<Map<String, String>> subcatList = new ArrayList<Map<String,String>>();
		List<Map<String, String>> packageList = new ArrayList<Map<String,String>>();
		System.out.println("========1===name======="+subcate);
		model.addAttribute("name", subcate.getSubCategoryName());
		System.out.println("===========name======="+subcate.getSubCategoryName());
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
		if(subcate!=null)
			model.addAttribute("subcatImage",subcate.getImageUrl());
		return new ModelAndView("subcat");
		
	}

	@RequestMapping(value = "/admin/api/category", method = RequestMethod.PUT)
	public @ResponseBody Map<String, List<Category>> categoryListPut(HttpServletRequest request) {
		String categoryName = request.getParameter("name");
		System.out.println("============"+categoryName);
		Category category = new Category();
		category.setCategoryName(categoryName);
		try{
			category.setCategoryId(Integer.parseInt(request.getParameter("id")));
		}catch(Exception e){}
		category.setCategoryAlias(categoryName.replaceAll(" ", "_").trim());
		categoryRepository.save(category);
		
		List<Category> categoryList = (List<Category>) categoryRepository.findAll();
		Map<String, List<Category>> map = new HashMap<String, List<Category>>();
		map.put("data", categoryList);
		return map;
		
	}


	@RequestMapping(value = "/admin/api/subcategory", method = RequestMethod.GET)
	public @ResponseBody Map<String, List<SubCategory>> subcategoryList(Model model) {
		
		List<SubCategory> categoryList = (List<SubCategory>) subCategoryRepository.findAll();
		Map<String, List<SubCategory>> map = new HashMap<String, List<SubCategory>>();
		map.put("data", categoryList);
		return map;
		
	}

	@RequestMapping(value = "/admin/api/subcategory", method = RequestMethod.PUT)
	public @ResponseBody Map<String, List<SubCategory>> subcategoryListPut(HttpServletRequest request) {
		String categoryName = request.getParameter("name");
		System.out.println("============"+categoryName);
		SubCategory category = new SubCategory();
		category.setSubCategoryName(categoryName);
		try{
			category.setSubCategoryId(Integer.parseInt(request.getParameter("subcategoryid")));
		}catch(Exception e){}
		try{
			Category cat = new Category();
			cat.setCategoryId(Integer.parseInt(request.getParameter("categoryid")));
			category.setCategory(cat);
		}catch(Exception e){}
		category.setSubCategoryAlias(categoryName.replaceAll(" ", "_").trim());
		subCategoryRepository.save(category);
		
		List<SubCategory> categoryList = (List<SubCategory>) subCategoryRepository.findAll();
		Map<String, List<SubCategory>> map = new HashMap<String, List<SubCategory>>();
		map.put("data", categoryList);
		return map;
		
	}

	@RequestMapping(value = "/product", method = { RequestMethod.GET })
	public ModelAndView subproduct(Model model) {
		
		return new ModelAndView("product");
		
	}

	@RequestMapping(value = "/admin/api/product", method = RequestMethod.GET)
	public @ResponseBody Map<String, List<Product>> product(Model model) {
		
		List<Product> categoryList = (List<Product>) productRepository.findAll();
		Map<String, List<Product>> map = new HashMap<String, List<Product>>();
		map.put("data", categoryList);
		return map;
		
	}

	@RequestMapping(value = "/admin/api/product", method = RequestMethod.PUT)
	public @ResponseBody Map<String, List<Product>> productPut(HttpServletRequest request) {
		String productName = request.getParameter("name");
		System.out.println("============"+productName);
		Product product = new Product();
		product.setProductName(productName);
		try{
			product.setProductId(Integer.parseInt(request.getParameter("productid")));
		}catch(Exception e){}
		try{
			Category cat = new Category();
			cat.setCategoryId(Integer.parseInt(request.getParameter("categoryid")));
			product.setCategory(cat);
		}catch(Exception e){}
		try{
			SubCategory cat = new SubCategory();
			cat.setSubCategoryId(Integer.parseInt(request.getParameter("subcategoryid")));
			product.setSubCategory(cat);
		}catch(Exception e){}
		product.setProductNameAlias(productName.replaceAll(" ", "_").trim());
		productRepository.save(product);
		
		List<Product> categoryList = (List<Product>) productRepository.findAll();
		Map<String, List<Product>> map = new HashMap<String, List<Product>>();
		map.put("data", categoryList);
		return map;
		
	}

	/*@RequestMapping(value = "/password/update", method = { RequestMethod.GET })
	public ModelAndView passwordUpdate() {

		SendSms sms = null;

		EmployeeGeneralDetails empdet = new EmployeeGeneralDetails();
		OrganisationDetails orgdet = new OrganisationDetails();
		Sales sales = new Sales();
		SalesForce salesForce = new SalesForce();
		String msg = "Your Password update request is successfull please enter the OTP in the field OTP:-";
		Subject subject = SecurityUtils.getSubject();
		User user = userRepository
				.findByUserId((String) subject.getPrincipal());
		Session session = subject.getSession();
		session.setAttribute("loginnedUser", user);
		Random rand = new Random();
		Integer rd = rand.nextInt(100000);
		String OTP = String.valueOf(rd);
		if (OTP != null) {
			msg = msg + " " + rd;
		}
		// otp and exp time setting
		user.setOtp(OTP);
		Calendar cal = Calendar.getInstance();
		user.setOtpExpiryDateTime(new Date(cal.get(Calendar.HOUR_OF_DAY) + 1));
		userRepository.save(user);
		// finding employee type
		empdet = empDetRepo.findByUserNameId(user.getUserId());
		sales = salesRepo.findByUserNameId(user.getUserId());
		salesForce = salesForceRepo.findByUserNameid(user.getUserId());
		orgdet = orgDetailsRepo.findByUserNameId(user.getUserId());
		if (empdet != null) {
			sms = new SendSms(msg, empdet.getContact());
		} else if (orgdet != null) {
			sms = new SendSms(msg, orgdet.getOrganisationContact());
		} else if (sales != null) {
			sms = new SendSms(msg, sales.getContact());
		} else {
			sms = new SendSms(msg, sales.getContact());
		}

		// emailService.sendMailViaInfo("smitbaranwal@gmail.com");
		System.out.println("-------------------" + user.getUserId());
		// emailService.sendMailViaZoho("smitbaranwal@gmail.com");

		return new ModelAndView("passwordUpdate");
	}

	@RequestMapping(value = "/profile/settings/password", method = { RequestMethod.POST })
	public @ResponseBody
	Map<String, String> changePassword(HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {

		String oldPassword = request.getParameter("curr");
		String newPassword = request.getParameter("newpass");
		User user = userRepository.findByUserId((String) SecurityUtils
				.getSubject().getPrincipal());
		Map<String, String> map = new java.util.HashMap<String, String>();
		String OTP = request.getParameter("jspotp");
		System.out.println("**********update method*********");
		// int dbotp = Integer.parseInt(user.getOtp());
		// System.out.println("******db otp****" + dbotp);
		// int jsOtp = Integer.parseInt(request.getParameter("jspotp"));
		Calendar cal = Calendar.getInstance();
		// System.out.println("****jsotp****" + jsOtp);

		if (OTP.equals(user.getOtp())
				&& new Date().after(user.getOtpExpiryDateTime())) {
			boolean isPasswordChanged = encryptService.verifyOldPassword(user,
					oldPassword, newPassword);
			if (isPasswordChanged) {
				map.put("result", "success");
			} else {
				map.put("result", "failed");
			}
		}

		else if (new Date().after(user.getOtpExpiryDateTime()) == false) {
			map.put("result1", "failed");
		} else if (OTP.equals("")) {
			map.put("result", "failed");
		} else {

			map.put("result2", "failed");
		}
		return map;
	}
	
	*/
	
	
	
	
	/*@RequestMapping(value = "/resend/otp", method = { RequestMethod.GET })
	public ModelAndView resendOtp() {
		SendSms sms = null;
		EmployeeGeneralDetails empdet = new EmployeeGeneralDetails();
		OrganisationDetails orgdet = new OrganisationDetails();
		Sales sales = new Sales();
		SalesForce salesForce = new SalesForce();
		String msg = "Your Password update request is successfull please enter the OTP in the field OTP:-";
		Subject subject = SecurityUtils.getSubject();
		User user = userRepository
				.findByUserId((String) subject.getPrincipal());
		Session session = subject.getSession();
		session.setAttribute("loginnedUser", user);
		Random rand = new Random();
		Integer rd = rand.nextInt(10000);
		String OTP = String.valueOf(rd);
		if (OTP != null) {
			msg = msg + " " + rd;
		}
		// otp and exp time setting
		user.setOtp(OTP);
		Calendar cal = Calendar.getInstance();
		user.setOtpExpiryDateTime(new Date(cal.get(Calendar.HOUR_OF_DAY) + 1));
		userRepository.save(user);
		// finding employee type
		empdet = empDetRepo.findByUserNameId(user.getUserId());
		sales = salesRepo.findByUserNameId(user.getUserId());
		salesForce = salesForceRepo.findByUserNameid(user.getUserId());
		orgdet = orgDetailsRepo.findByUserNameId(user.getUserId());
		if (empdet != null) {
			sms = new SendSms(msg, empdet.getContact());
		} else if (orgdet != null) {
			sms = new SendSms(msg, orgdet.getOrganisationContact());
		} else if (sales != null) {
			sms = new SendSms(msg, sales.getContact());
		} else {
			sms = new SendSms(msg, sales.getContact());
		}

		return new ModelAndView("passwordUpdate");
	}
	
	*/
/*	@RequestMapping(value = "/password/forget", method = { RequestMethod.GET })
	public ModelAndView forgetPass() {
		System.out.println("*****************forget password page*******************");
		return new ModelAndView("passwordForget");
	}
	
	@RequestMapping(value = "/send/password/forget/otp", method = { RequestMethod.POST })
	public @ResponseBody Map<String, Object> forgetPassotp(HttpServletRequest request) {
		Map<String,Object> map = new HashMap<String, Object>();
		User user = userRepository.findByUserId(request.getParameter("email"));
		String link = "http://admin.employroll.com/password/reset?_h="+user.getUserId();
		Random random = new Random();
		String code= String.valueOf(100000 + random.nextInt(900000));
		System.out.println("*****************code********************"+code);
		user.setOtp(code);
		userRepository.save(user);
		emailService.sendMailViaInfo(user.getUserId(), user.getOtp(), link);
		System.out.println("****************sending mail*********************");
		map.put("result", "success");
		return map;
	}
	
	@RequestMapping(value="/password/reset", method = {RequestMethod.GET})
	public ModelAndView registrationVerify(Model model, 
			HttpServletRequest request, @RequestParam(value="_h") String emailId){
			
		User user = userRepository.findByUserId(emailId);
		if(user.getStatus().equals(EmployRollCommon.userAccountStatus_ACTIVE)){
			model.addAttribute("user", user);
			return new ModelAndView("forgetpassOtp");
		}
		
		return new ModelAndView("login");
	}
	
	@RequestMapping(value="/forgot/password/verifyotp", method = {RequestMethod.POST})
	public @ResponseBody Map<String, Object> verpassOTP(Model model,
			@RequestParam(value="email") String email,
			@RequestParam(value="otp") String otp){
			System.out.println("**********************verifying otp*************************");
		Map<String, Object> map = new HashMap<String, Object>();
		User user = userRepository.findByUserId(email);
		
		if(user.getStatus().equals(EmployRollCommon.userAccountStatus_ACTIVE) 
				&& user.getOtp().equals(otp)){
			map.put("result", "success");
			return map;
		}
		map.put("result", "failed");
		return map;
	} 
	
	@RequestMapping(value="/forgot/password/updatepwd", method = {RequestMethod.POST})
	public @ResponseBody Map<String, Object> updforgotPwd(Model model,
			@RequestParam(value="email") String email,
			@RequestParam(value="pw") String pw){
			
		Map<String, Object> map = new HashMap<String, Object>();
		User user = userRepository.findByUserId(email);
		System.out.println("***********************user email id*******************"+user.getUserId());
		System.out.println("/*********************password**********************"+pw);
		if(user.getStatus().equals(EmployRollCommon.userAccountStatus_ACTIVE) ){
			boolean ver = encService.addForgotPassword(user, pw);
			System.out.println("*********************ver*********************"+ver);
			if(ver){
				user.setStatus(EmployRollCommon.userAccountStatus_ACTIVE);
				user.setFirstLoginDate(EmployRollCommon.getCurrentDate());
				userRepository.save(user);
				map.put("result", "success");
					emailService.sendMailViaInfo(user.getUserId()); 
				return map;
			}
		}
		map.put("result", "failed");
		return map;
	} */
}