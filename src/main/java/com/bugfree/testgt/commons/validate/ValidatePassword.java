package com.bugfree.testgt.commons.validate;

import org.apache.shiro.crypto.RandomNumberGenerator;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.Sha512Hash;
import org.apache.shiro.util.ByteSource;
import org.apache.shiro.util.SimpleByteSource;
import org.bouncycastle.util.encoders.Hex;

import com.bugfree.testgt.model.User;


public class ValidatePassword {

	private static ByteSource getSaltInByteSource()
    {
        //Always use a SecureRandom generator
    	RandomNumberGenerator randomGenerator = new SecureRandomNumberGenerator();
        //Create array for salt
    	ByteSource salt = randomGenerator.nextBytes();
        //return salt
        return salt;
    }
    
	private static String generateSecurePasswordInHex(String passwordToHash, ByteSource salt, int iterations_of_hashing) 
    {
    	return new Sha512Hash(passwordToHash, salt, iterations_of_hashing).toHex();
    }
    
	
	public static boolean  checkPassword(User user, String oldPassword){
		
	    	String oldPasswordHex = user.getPassword();
	    	ByteSource bs =  new SimpleByteSource(Hex.decode(user.getSalt()));
	    	String password = generateSecurePasswordInHex(oldPassword, bs, 10000);
	    	if(oldPasswordHex.equals(password)){
	    		System.out.println("*****************old passwords matches successfully*********");
				return true;
	   
	}
	    	System.out.println("*****************old passwords bot matches successfully*********"+oldPasswordHex);
	    	return false;
			
}
	
	
	
}
