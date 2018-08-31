package com.bugfree.testgt.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bugfree.testgt.commons.KrenaiCONSTANTS;
import com.bugfree.testgt.commons.SendSms;
import com.bugfree.testgt.commons.validate.ValidatePassword;
import com.bugfree.testgt.model.User;
import com.bugfree.testgt.model.product.Category;
import com.bugfree.testgt.model.product.PackageDetails;
import com.bugfree.testgt.model.product.SubCategory;
import com.bugfree.testgt.repository.UserRepository;
import com.bugfree.testgt.repository.product.CategoryRepository;
import com.bugfree.testgt.repository.product.PackageDetailsRepository;
import com.bugfree.testgt.repository.product.SubCategoryRepository;
import com.bugfree.testgt.service.EncryptService;


@Controller
public class LoginController {
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private EncryptService encryptService;
	@Autowired 
	private CategoryRepository categoryRepository;
	@Autowired
	private SubCategoryRepository subCategoryRepository;
	@Autowired
	private PackageDetailsRepository packageDetailsRepo;

    @RequestMapping(value= "/login", method = {RequestMethod.GET})
    public ModelAndView doGet(Model model) {
    	System.out.println("*******************************in login***************************");
    	if(SecurityUtils.getSubject().getSession()!=null){
    		SecurityUtils.getSubject().logout();
    	}
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
		model.addAttribute("subcatList", subcatList);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("packageList", packageList);
    	User user = userRepository.findByUserId((String)SecurityUtils.getSubject().getPrincipal());
		if(user!=null){
			model.addAttribute("username", user.getName());
		}
        return new ModelAndView("login-page");
    }
    @RequestMapping(value= "/logout", method = {RequestMethod.GET})
    public ModelAndView doLogout(Model model) {
    	System.out.println("*******************************logout***************************");
    	if(SecurityUtils.getSubject().getSession()!=null){
    		SecurityUtils.getSubject().logout();
    	}
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
		model.addAttribute("subcatList", subcatList);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("packageList", packageList);
        return new ModelAndView("login");
    }

    @RequestMapping(value= "/register", method = {RequestMethod.GET})
    public ModelAndView registerPage(Model model) {
    	//System.out.println("*******************************in registration***************************");
    	if(SecurityUtils.getSubject().getSession()!=null){
    		SecurityUtils.getSubject().logout();
    	}
    	User user = userRepository.findByUserId((String)SecurityUtils.getSubject().getPrincipal());
		if(user!=null){
			model.addAttribute("username", user.getName());
		}
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
		model.addAttribute("subcatList", subcatList);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("packageList", packageList);
        return new ModelAndView("register-page");
    }

    @RequestMapping(value= "/user/registration", method = {RequestMethod.POST})
    public @ResponseBody Map<String, String> register( @RequestParam(value="name") String name,
			@RequestParam(value="password") String password, @RequestParam(value="mail") String usermail,
			@RequestParam(value="phone") String phone, @RequestParam(value="address") String address) {
    	System.out.println("*******************************in registration***************************");
    	Map<String, String> map =new HashMap<String, String>();
    	
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
    
    @RequestMapping(value= "/user/registration/booking", method = {RequestMethod.POST})
    public @ResponseBody Map<String, String> register( @RequestParam(value="name") String name,
			@RequestParam(value="mail") String usermail,
			@RequestParam(value="phone") String phone, @RequestParam(value="address") String address) {
    	System.out.println("*******************************in registration***************************");
    	Map<String, String> map =new HashMap<String, String>();
    	Random rnd = new Random();
    	String password = rnd.nextInt(999999)+"abc"; 
    	User user = userRepository.findByUserIdAndStatus(usermail, KrenaiCONSTANTS.activeStatus);
    	if(user!=null){
    		map.put("status", "already");
    		return map;
    	}else{
    		user = userRepository.findByUserId(usermail);
    		if(user!=null){
    			
    		}else{
    			user = new User();
    		}
    			
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
    		map.put("pwd", password);
    		//map.put("otp", otp);
    		String msg = "Hi "+name+",\n"+"Your otp is "+otp+"and system generated password is"+ password+".\n"+"Thankyou for register at Make on Wheels.";
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
    
    @RequestMapping(value= "/user/otp/verify", method = {RequestMethod.POST})
    public @ResponseBody Map<String, String> register( @RequestParam(value="mail") String usermail,
			@RequestParam(value="otp") String otp) {
    	System.out.println("*******************************in verify otp***************************");
    	Map<String, String> map =new HashMap<String, String>();
    	
    	User user = userRepository.findByUserId(usermail);
    	if(user!=null){
    		if(user.getOtp() == otp || user.getOtp().equals(otp)){
    			user.setStatus(KrenaiCONSTANTS.activeStatus);
    			userRepository.save(user);
    			map.put("status", "success");
    		}else{
    			map.put("status", "otp not matched");
    		}
    		
    		return map;
    	}else{
    		map.put("status", "failed");
    		return map;
    	}
    	
    }
    
    @RequestMapping(value="/user/forget/password")
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
    		map.put("status", "success");
    		return map;
    	}else{
    		map.put("status", "user not found");
    		return map;
    	}
		
	}
    
    @RequestMapping(value="/user/forget/password/reset")
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
        		map.put("status", "success");
    		}else{
    			map.put("status", "wrong otp");
    		}
    		
    		return map;
    	}else{
    		map.put("status", "user not found");
    		return map;
    	}
		
	}
    
    /*@RequestMapping(value= "/login", method = {RequestMethod.GET, RequestMethod.POST, RequestMethod.DELETE, RequestMethod.PUT}, produces = "application/json")
    public ResponseEntity<?> doGetAjax() {
    	System.out.println("******************************login******************************");
        return new ResponseEntity<Object>(HttpStatus.FORBIDDEN);
    }*/
    
    @RequestMapping(value="/loginVerify", method=RequestMethod.POST)
	public @ResponseBody Map<String, String> usermailverifyPassword(Model model, HttpServletRequest request,
			@RequestParam(value="username") String email,
			@RequestParam(value="password") String password
			){
    	Map<String, String> map =new HashMap<String, String>();
		User user = userRepository.findByUserId(email);
		String message="failed";
		System.out.println("**************************log*******************"+email);
			if(user!=null && 
					ValidatePassword.checkPassword(user, password)){
				System.out.println("=============");
				if(user.getStatus().equals(KrenaiCONSTANTS.activeStatus)){
					
					UsernamePasswordToken token = new UsernamePasswordToken(user.getUserId(), password);
					Subject currentUser = SecurityUtils.getSubject();
					currentUser.login(token);
					
					message = "success";
					
				}else{
					message = "inactive";
				}
				
			}
			System.out.println("-------------");
		//message = "failed";
		map.put("message", message);
		return map;
	}
    
    @RequestMapping(value="/dashboard/attendance", method = {RequestMethod.GET})
    public ModelAndView das(Model model) {
    	
    	
    	/*
    	 * String server = "54.124.42.97";
        int port = 21;
        String user = "Administrator";
        String pass = "#3hd73a$!jsa";
 
        FTPClient ftpClient = new FTPClient();
        try {
 
            ftpClient.connect(server, port);
            ftpClient.login(user, pass);
            ftpClient.enterLocalPassiveMode();
            ftpClient.setFileType(FTP.BINARY_FILE_TYPE);
 
            String remoteFile1 = "/test/test.jpg";
            File downloadFile1 = new File("D:/Downloads/test.jpg");
            OutputStream outputStream1 = new BufferedOutputStream(new FileOutputStream(downloadFile1));
            boolean success = ftpClient.retrieveFile(remoteFile1, outputStream1);
            outputStream1.close();
 
            if (success) {
                System.out.println("File #1 has been downloaded successfully.");
            }
 
            String remoteFile2 = "/test/test1.mp3";
            File downloadFile2 = new File("D:/Downloads/test1.mp3");
            OutputStream outputStream2 = new BufferedOutputStream(new FileOutputStream(downloadFile2));
            InputStream inputStream = ftpClient.retrieveFileStream(remoteFile2);
            byte[] bytesArray = new byte[4096];
            int bytesRead = -1;
            while ((bytesRead = inputStream.read(bytesArray)) != -1) {
                outputStream2.write(bytesArray, 0, bytesRead);
            }
 
            success = ftpClient.completePendingCommand();
            if (success) {
                System.out.println("File #2 has been downloaded successfully.");
            }
            outputStream2.close();
            inputStream.close();
 
        } catch (IOException ex) {
            System.out.println("Error: " + ex.getMessage());
            ex.printStackTrace();
        } finally {
            try {
                if (ftpClient.isConnected()) {
                    ftpClient.logout();
                    ftpClient.disconnect();
                }
            } catch (IOException ex) {
                ex.printStackTrace();
            }
     
    	 */
    	
    	try{
			Connection conn=DriverManager.getConnection("jdbc:ucanaccess:///home/sm-it/Downloads/datEnrollDat.mdb");
			Statement s = conn.createStatement();
			ResultSet rs = s.executeQuery("SELECT * from tblEnroll");
			System.out.println("========rs==========="+rs.getRow());
			List<Map<String,String>> mapList = new ArrayList<Map<String,String>>();
			Map<String, String> map = null;
			while (rs.next()) {
				map = new HashMap<String, String>();
				map.put("machineId", rs.getString(1));
				map.put("enrollNo", rs.getString(2));
				map.put("fingerNo", rs.getString(3));
				map.put("privilege", rs.getString(4));
				map.put("enrollName", rs.getString(7));
				mapList.add(map);
			    System.out.println("==="+rs.getString(1));
			}
			model.addAttribute("list", mapList);
		}catch(Exception e){
			e.printStackTrace();
		}
        return new ModelAndView("dashboard");
    }
   
}