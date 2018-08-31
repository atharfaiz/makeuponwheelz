package com.bugfree.testgt.service;

import org.apache.shiro.crypto.RandomNumberGenerator;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.Sha512Hash;
import org.apache.shiro.util.ByteSource;
import org.apache.shiro.util.SimpleByteSource;
import org.bouncycastle.util.encoders.Hex;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bugfree.testgt.commons.EmployRollCommon;
import com.bugfree.testgt.model.User;
import com.bugfree.testgt.model.user.UserLoginSession;
import com.bugfree.testgt.repository.UserRepository;
import com.bugfree.testgt.repository.user.UserLoginSessionRepository;

@Service
public class EncryptService {

	@Autowired
	private UserRepository userRepo;
	@Autowired
	private UserLoginSessionRepository userLoginSessionRepo;
	
	
	//Get Salt in ByteSource Type
    public static ByteSource getSaltInByteSource()
    {
        //Always use a SecureRandom generator
    	RandomNumberGenerator randomGenerator = new SecureRandomNumberGenerator();
        //Create array for salt
    	ByteSource salt = randomGenerator.nextBytes();
        //return salt
        return salt;
    }
    
    public String generateSecurePasswordInHex(String passwordToHash, ByteSource salt, int iterations_of_hashing) 
    {
    	return new Sha512Hash(passwordToHash, salt, iterations_of_hashing).toHex();
    }
    

    public boolean addPassword (User user, String newPassword){
    	

    	if(user.getStatus().equals(EmployRollCommon.userAccountStatus_AwaitedFirstLogin)){
    		ByteSource salt = getSaltInByteSource();
        	String password = generateSecurePasswordInHex(newPassword, salt, 10000);
        	System.out.println("newPassword is: "+newPassword);
        	user.setPassword(password);
        	user.setSalt(salt.toHex());
        	userRepo.save(user);
    		
    		return true;
    	}
    	else{
    		return false;
    	}
    	
    }
    
public boolean addForgotPassword (User user, String newPassword){
    	

    	if(user.getStatus().equals(EmployRollCommon.userAccountStatus_ACTIVE)){
    		ByteSource salt = getSaltInByteSource();
        	String password = generateSecurePasswordInHex(newPassword, salt, 10000);
        	System.out.println("newPassword is: "+newPassword);
        	user.setPassword(password);
        	user.setSalt(salt.toHex());
        	userRepo.save(user);
    		
    		return true;
    	}
    	else{
    		return false;
    	}
    	
    }

public boolean verifyOldPassword (User user, String oldPassword, String newPassword){
	

	String oldPasswordHex = user.getPassword();
	ByteSource bs =  new SimpleByteSource(Hex.decode(user.getSalt()));
	String password = generateSecurePasswordInHex(oldPassword, bs, 10000);
	if(oldPasswordHex.equals(password)){
		ByteSource salt = getSaltInByteSource();
    	password = generateSecurePasswordInHex(newPassword, salt, 10000);
    	user.setPassword(password);
    	user.setSalt(salt.toHex());
		userRepo.save(user);
		return true;
	}
	else{
		return false;
	}
	
}

public boolean updatePassword (User user, String newPassword){
	

	ByteSource bs =  new SimpleByteSource(Hex.decode(user.getSalt()));
	//String password = generateSecurePasswordInHex(oldPassword, bs, 10000);
	//if(oldPasswordHex.equals(password)){
		ByteSource salt = getSaltInByteSource();
		String password = generateSecurePasswordInHex(newPassword, salt, 10000);
    	user.setPassword(password);
    	user.setSalt(salt.toHex());
		userRepo.save(user);
		return true;
	//}
	
	
}

public boolean verifyOldPassword (User user, String oldPassword){
	

	String oldPasswordHex = user.getPassword();
	ByteSource bs =  new SimpleByteSource(Hex.decode(user.getSalt()));
	String password = generateSecurePasswordInHex(oldPassword, bs, 10000);
	if(oldPasswordHex.equals(password)){
		return true;
	}
	else{
		return false;
	}
	
}









public  User verifyUser(String sessionId){
	UserLoginSession loginSession = userLoginSessionRepo.findBySessionIdAndStatus(sessionId, EmployRollCommon.restACTIVE_status);
	if(loginSession!=null)
		return loginSession.getUser();
	else
		return null;
}



    
}
