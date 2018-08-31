package com.bugfree.testgt.commons.firebase;

import com.bugfree.testgt.commons.KrenaiCONSTANTS;
import com.google.android.gcm.server.Message;
import com.google.android.gcm.server.Result;
import com.google.android.gcm.server.Sender;

public class SendNotification extends Thread {

	//String msg ;
	String deviceKey;
	Message message = null;
	Message message1 = null;
	String sender = null;
	@Override
	public void run(){

        try {
        	//Sender sender = new FCMSender(KrenaiCONSTANTS.firebaseServerKey);
        	 System.out.println("*************sender*************"+KrenaiCONSTANTS.firebaseServerKey);
             System.out.println("*************device***************"+this.deviceKey);
             
            Sender sender1 = new FCMSender(KrenaiCONSTANTS.firebaseServerKey);
            Result result1 = sender1.send(this.message1, deviceKey, 1);
            System.out.println("*************message**************"+this.message1);
            System.out.println("****************android notification********" + result1.toString());
            System.out.println("****************android notification********" + result1.getErrorCodeName());
            System.out.println("****************android notification********" + result1.getCanonicalRegistrationId());
            
            System.out.println("*************message**************"+this.message);
        	Sender sender = new FCMSender(KrenaiCONSTANTS.firebaseServerKey);
            Result result = sender.send(this.message, deviceKey, 1);
            System.out.println("****************android notification********" + result.toString());
            
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
	
	
	public SendNotification(String msg, String deviceKey, String sender, String sessionId){
		this.message = new Message.Builder()
                .collapseKey("message")
                .timeToLive(3)
                .delayWhileIdle(true)
                .addData("imageUrl", "\""+"https://www.w3schools.com/css/paris.jpg"+"\"")
                .addData("timestamp",  "\""+KrenaiCONSTANTS.getCurrentDate()+ "\"")
                .addData("title", "\""+"School Notification"+"\"")
                .addData("message", "\""+msg+"\"")
                .addData("sessionId", "\""+sessionId+"\"")
                .build();  
		
		
		this.message1 = new Message.Builder()
                .collapseKey("data")
                .timeToLive(3)
                .delayWhileIdle(true)
                .addData("imageUrl", "\""+"https://www.w3schools.com/css/paris.jpg"+"\"")
                .addData("timestamp",  "\""+KrenaiCONSTANTS.getCurrentDate()+ "\"")
                .addData("title", "\""+"School Notification"+"\"")
                .addData("message", "\""+msg+"\"")
                .addData("sessionId", "\""+sessionId+"\"")
                .build();
		
		
		this.deviceKey=deviceKey;
		
		run();
		    
	}
	//krenai 
	/*public SendNotification(String msg, String deviceKey){
		this.sender = "AAAA4HRtFb4:APA91bH8XhJZ6P8BaEPUpVd39G6WR61zlnV3oPlTMqOjmVtueqQ-O0pZ50g0ZY8WED5jNlO-vuCAWSZTeqqmN4achahY4atiXhDLFDrZsZpZCzjQV_fP8ScPTjozuPhZ27ZASYhvxE31rRJD6zaLyO75sS1JX0lFjA";
		
		this.deviceKey = "fzZP-0U8FNc:APA91bF0xYSte_znnLJKgMku_bvTMjpph1sMo24eW2RA3O3GAlOIZAimm5e51UFC1PDQLLGjeRumbGzqlOFr_3pPaoOZZW2WedRdgdtsp4FjI1ZUhBC2OH5a6jT907oNGvIXHinbrSkn";
		message = new Message.Builder()
                .collapseKey("data")
                .timeToLive(3)	
                .delayWhileIdle(true)              
                .addData("message",  "Your order from  is successfully cancelled.")
                .build(); 
		
		run();
		    
	}*/
	
	


}
