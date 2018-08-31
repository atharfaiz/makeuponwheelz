package com.bugfree.testgt.service.commons;



import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class MailService extends Thread{

	
	@Autowired
    private JavaMailSender mailSender;
	
	
	Properties properties=System.getProperties();
	Session session=Session.getDefaultInstance(properties);
	
	MimeMessage mimeMsg;
	
	public void run(){
		mailSender.send(mimeMsg);
	}
	
	public void newQueryMailUser(String emailId, String subject, String body) {
		// TODO Auto-generated method stub
		try
		{  
			/*System.out.println("*****************sending mail******************");
			Properties properties=System.getProperties();
			Session session=Session.getDefaultInstance(properties);
			MimeMessage msgMail = new MimeMessage(session);
			msgMail.addRecipients(Message.RecipientType.TO, InternetAddress.parse(emailId));
			msgMail.setSubject(subject);
			msgMail.setSender(new Address() {
				
				@Override
				public String getType() {
					// TODO Auto-generated method stub
					return "String";
				}
				
				@Override
				public boolean equals(Object arg0) {
					// TODO Auto-generated method stub
					String arg = (String)arg0;
					return this.equals(arg);
				}

				@Override
				public String toString() {
					// TODO Auto-generated method stub
					return "Keshav Kumar";
				}
			});
			
			msgMail.setText(body);
			this.mimeMsg=msgMail;*/
			//mailSender.send(this.mimeMsg);
			//run();
			
			MimeMessage mimeMsg = new MimeMessage(this.session);;
			mimeMsg.addRecipients(Message.RecipientType.TO, InternetAddress.parse(emailId)); 
			mimeMsg.setSubject(subject);
			mimeMsg.setText(body);
			this.mimeMsg = mimeMsg;
			run();
			//mailSender.send(mimeMsg);
			
	    }
	    catch(Exception ex)
		{
	    	ex.printStackTrace();
	    	
	    }
	}	
	
	
	
}
