package com.bugfree.testgt.commons;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

public class SendSms implements Runnable{

	URL myURL=null;
    BufferedReader reader=null;
    URLConnection myURLConnection = null ;
    HttpURLConnection huc = null;
    String encodedUrl = null;

	
	public SendSms() {
		super();
	}
	public  SendSms(String message, String contact){
		
		
		try {
		    encodedUrl = URLEncoder.encode(message, "UTF-8");
		} catch (UnsupportedEncodingException ignored) {
		    // Can be safely ignored because UTF-8 is always supported
		}
		
	    try{
	    	//myURL = new URL("http://123.63.33.43/blank/sms/user/urlsmstemp.php?username=bhuna1&pass=123456&senderid=SNSKAR&dest_mobileno="+contact+"&message="+encodedUrl+"");
	    	myURL = new URL("https://control.msg91.com/api/sendhttp.php?authkey=147478AygOCf80Ojp58e233d1&mobiles=91"+contact+"&message="+encodedUrl+"&sender=EMPROL&otp=2222&route=4");
	    	System.out.println("*******************message inside send***********************"+message);
	    	
		    run();
	    }catch(Exception e){
	    	
	    }
	    
	}
	public  SendSms(String message, String contact, String workingKey){
		
		
		try {
		    encodedUrl = URLEncoder.encode(message, "UTF-8");
		} catch (UnsupportedEncodingException ignored) {
		    // Can be safely ignored because UTF-8 is always supported
		}
		
	    try{
	    	//myURL = new URL("http://123.63.33.43/blank/sms/user/urlsmstemp.php?username=bhuna1&pass=123456&senderid=SNSKAR&dest_mobileno="+contact+"&message="+encodedUrl+"");
	    	myURL = new URL("https://control.msg91.com/api/sendhttp.php?authkey=147478AygOCf80Ojp58e233d1&mobiles=91"+contact+"&message="+encodedUrl+"&sender=EMPROL&otp=2222&route=4");
	    	System.out.println("*******************message inside send***********************"+message);
	    	
		    run();
	    }catch(Exception e){
	    	
	    }
	    
	}

	public SendSms(String message, String phoneNumber, String workingKey, String sender) {
		// TODO Auto-generated constructor stub
		/*try {
		    encodedUrl = URLEncoder.encode(message, "UTF-8");
		} catch (UnsupportedEncodingException ignored) {
		    // Can be safely ignored because UTF-8 is always supported
		}*/
		try{
	    	//myURL = new URL("http://123.63.33.43/blank/sms/user/urlsmstemp.php?username=bhuna1&pass=123456&senderid=SNSKAR&dest_mobileno="+contact+"&message="+encodedUrl+"");
			//myURL = new URL("http://alerts.sinfini.com/api/web2sms.php?workingkey="+workingKey+"&sender="+sender+"&to="+phoneNumber+"&message="+encodedUrl);
			myURL = new URL("http://alerts.sinfini.com/api/web2sms.php?workingkey="+workingKey+"&sender="+sender+"&to="+phoneNumber+"&message="+URLEncoder.encode(message, "UTF-8"));
			//myURL = new URL("http://alerts.sinfini.com/api/web2sms.php?workingkey="+workingKey+"&sender="+sender+"&to="+phoneNumber+"&message=hello student "+"%0A"+" how r u?");
			/*String messageUrl = "http://alerts.sinfini.com/api/web2sms.php?workingkey="+workingKey+"&sender="+sender+"&to="+phoneNumber+"&message=";
			for(int i=0; i<message.length(); i++){
				System.out.println(message.charAt(i)+"------------"+(int)message.charAt(i));
				if((int)message.charAt(i) == 10){
					messageUrl += "\n";
				}else{
					messageUrl += message.charAt(i);
				}
			}
			myURL = new URL(messageUrl);*/
	    	System.out.println("***********send***********************"+"http://alerts.sinfini.com/api/web2sms.php?workingkey="+workingKey+"&sender="+sender+"&to="+phoneNumber+"&message="+URLEncoder.encode(message, "UTF-8"));
	    	
		    run();
	    }catch(Exception e){
	    	
	    }
	}
	public void sendUserSMS(String message, String phoneNumber) {
		// TODO Auto-generated constructor stub
		
		try{
	    	myURL = new URL("http://alerts.sinfini.com/api/web2sms.php?workingkey=9997k792p91ndcincq3&sender=CSSSOF&to="+phoneNumber+"&message="+URLEncoder.encode(message, "UTF-8"));
			System.out.println("******send******"+"http://alerts.sinfini.com/api/web2sms.php?workingkey=9997k792p91ndcincq3&sender=CSSSOF&to="+phoneNumber+"&message="+URLEncoder.encode(message, "UTF-8"));
	    	
		    run();
	    }catch(Exception e){
	    	
	    }
	}
	public SendSms(String message, String phoneNumber, String workingKey, String sender, String string) {
		// TODO Auto-generated constructor stub
		/*try {
		    encodedUrl = URLEncoder.encode(message, "UTF-8");
		} catch (UnsupportedEncodingException ignored) {
		    // Can be safely ignored because UTF-8 is always supported
		}*/
		try{
	    	//myURL = new URL("http://123.63.33.43/blank/sms/user/urlsmstemp.php?username=bhuna1&pass=123456&senderid=SNSKAR&dest_mobileno="+contact+"&message="+encodedUrl+"");
			//myURL = new URL("http://alerts.sinfini.com/api/web2sms.php?workingkey="+workingKey+"&sender="+sender+"&to="+phoneNumber+"&message="+encodedUrl);
			myURL = new URL("http://alerts.sinfini.com/api/web2sms.php?workingkey="+workingKey+"&method=sms&message="+URLEncoder.encode(message, "UTF-8")+"&to="+phoneNumber+"&sender="+sender+"&unicode=1");
	    	System.out.println("*******************message inside send**********utf*************"+message);
	    	
		    run();
	    }catch(Exception e){
	    	
	    }
	}
	
	public void sendSmsScheduleUnicode(String message, String phoneNumber, String workingKey, String sender, String string, String date) {
		try{
	    	myURL = new URL("http://alerts.solutionsinfini.com/api/v3/?api_key="+workingKey+"&method=sms&method=sms&message="+URLEncoder.encode(message, "UTF-8")+"&to="+phoneNumber+"&sender="+sender+"&unicode=1&time="+date);
	    	System.out.println("*******************message inside send**********utf*************"+message);
	    	
		    run();
	    }catch(Exception e){
	    	
	    }
		
	}
	
	public void sendSmsSchedule(String message, String phoneNumber, String workingKey, String sender, String date) {
		try{
			String data = date;
					
			myURL = new URL("http://alerts.solutionsinfini.com/api/v3/?api_key="+workingKey+"&method=sms&method=sms&message="+URLEncoder.encode(message, "UTF-8")+"&to="+phoneNumber+"&sender="+sender+"&time="+date);
	    	System.out.println("******************sendSmsSchedule*******************"+"http://alerts.solutionsinfini.com/api/v3/?api_key="+workingKey+"&method=sms&method=sms&message="+message+"&to="+phoneNumber+"&sender="+sender+"&time="+date);
	    	System.out.println("*******************message inside send**********utf*************"+message);
	    	
		    run();
	    }catch(Exception e){
	    	
	    }
		
	}
	
	
	@Override
	public void run() {
		
		try{
		 	myURLConnection = myURL.openConnection();
		    myURLConnection.connect();
	    	reader= new BufferedReader(new InputStreamReader(myURLConnection.getInputStream()));
		    //reading response
		    
		    String response;
		    while ((response = reader.readLine()) != null){
		    	System.out.println("======="+response);
		    }
		    	
		    reader.close();
			
			/*huc = (HttpURLConnection) myURL.openConnection();
		    huc.connect();
		    System.out.println(huc.getResponseMessage());
		    
	    	reader= new BufferedReader(new InputStreamReader(huc.getInputStream()));
		    //reading response
		    
		    String response;
		    while ((response = reader.readLine()) != null){
		    	System.out.println("======="+response);
		    }
		    	
		    reader.close();*/
		    	
	    }catch(Exception e){
	    	e.printStackTrace();
		}
	}



}
