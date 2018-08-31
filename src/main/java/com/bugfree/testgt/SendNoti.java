package com.bugfree.testgt;

import com.bugfree.testgt.commons.KrenaiCONSTANTS;
import com.bugfree.testgt.commons.firebase.FCMSender;
import com.google.android.gcm.server.Message;
import com.google.android.gcm.server.Result;
import com.google.android.gcm.server.Sender;

public class SendNoti extends Thread{

	
	public void run(){
		
		 
		String sender1 = "AAAA4HRtFb4:APA91bH8XhJZ6P8BaEPUpVd39G6WR61zlnV3oPlTMqOjmVtueqQ-O0pZ50g0ZY8WED5jNlO-vuCAWSZTeqqmN4achahY4atiXhDLFDrZsZpZCzjQV_fP8ScPTjozuPhZ27ZASYhvxE31rRJD6zaLyO75sS1JX0lFjA";
		
		String deviceKey = "fzZP-0U8FNc:APA91bF0xYSte_znnLJKgMku_bvTMjpph1sMo24eW2RA3O3GAlOIZAimm5e51UFC1PDQLLGjeRumbGzqlOFr_3pPaoOZZW2WedRdgdtsp4FjI1ZUhBC2OH5a6jT907oNGvIXHinbrSkn";
		Message message = new Message.Builder()
                .collapseKey("message")
                .timeToLive(3)	
                .delayWhileIdle(true)              
                .addData("message",  "Hello, What's your name.")
                .build(); 
		
		
		try {
        	//Sender sender = new FCMSender(KrenaiCONSTANTS.firebaseServerKey);
        	Sender sender = new Sender(sender1);
        	
            Result result = sender.send(message, deviceKey, 1);
           
            System.out.println("*************sender*************"+sender);
            System.out.println("*************device***************"+deviceKey);
            System.out.println("*************message**************"+message);
            
            System.out.println("****************android notification********" + result.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
	
	public void run1(){
		
		 
		String sender1 = "AIzaSyD7gIqygJ_oA_vALNgKI4U7bEhL6Z7DRo8";
		
		String deviceKey = "cE52gf6VyMw:APA91bFCWC3wYjwue4ElGgIBd8ZcQQ1vE3uXxSr4fdrotrafesDIcwpFyxG3ANWF1GlLNlGKyCH4lYj_MONGinYfpcgxlMgtra01Tno_Jxuvs0o_sHHZnGJ7noHlQTdW8zQBj0O-Bu5T";
		Message message = new Message.Builder()
                .collapseKey("data")
                .timeToLive(3)	
                .delayWhileIdle(true)              
                .addData("message",  "Hello, How are you.")
                .build(); 
		
		
		try {
        	//Sender sender = new FCMSender(KrenaiCONSTANTS.firebaseServerKey);
        	Sender sender = new Sender(sender1);
        	
            Result result = sender.send(message, deviceKey, 1);
           
            System.out.println("*************sender*************"+sender1);
            System.out.println("*************device***************"+deviceKey);
            System.out.println("*************message**************"+message);
            
            System.out.println("****************android notification********" + result.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
	public static void main(String args[]){
		
		SendNoti sendNoti = new SendNoti();
		sendNoti.run();
		sendNoti.run1();
		
	}
}
