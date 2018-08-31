package com.bugfree.testgt.service;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.security.SecureRandom;
import java.util.Date;
import java.util.List;

import org.apache.shiro.crypto.RandomNumberGenerator;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.Sha512Hash;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bugfree.testgt.model.User;
import com.bugfree.testgt.repository.UserRepository;
import com.bugfree.testgt.repository.grouppermission.SecurityGroupRepository;
import com.bugfree.testgt.repository.grouppermission.UserLoginSecurityGroupRepository;


@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private SecurityGroupRepository securityGroupRepository;
    @Autowired
    private UserLoginSecurityGroupRepository userLoginSecurityGroupRepository;
    
    
    public void save(User user)
    {
    	userRepository.save(user);
    }
    public User saveAndReturnUser(User user)
    {
    	return userRepository.save(user);
    }
    public void delete(User user){
    	 userRepository.delete(user);
    }
    public User findByPrimaryKey(String userId){
    	return userRepository.findOne(userId);
    }
    public List<User> getAllUsers(){
    	return (List<User>)userRepository.findAll();
    }
    
    public String getHash(String password) throws NoSuchAlgorithmException {
        MessageDigest digest = MessageDigest.getInstance("SHA-1");
        digest.reset();
        String input;
		try {
			input =digest.digest(password.getBytes("UTF-8")).toString();
		} catch (UnsupportedEncodingException e) {
			input=password;
			e.printStackTrace();
		}
		return input;
  }
    
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
    

    
    public String generateSecurePassword(String passwordToHash) throws NoSuchAlgorithmException, NoSuchProviderException
    {
        String securePassword = getSecurePassword(passwordToHash, getSalt());
        System.out.println(securePassword); //Prints 83ee5baeea20b6c21635e4ea67847f66
        String regeneratedPassowrdToVerify = getSecurePassword(passwordToHash, getSalt());
        System.out.println(regeneratedPassowrdToVerify); //Prints 83ee5baeea20b6c21635e4ea67847f66
		return regeneratedPassowrdToVerify;
    }
    
    private static String getSecurePassword(String passwordToHash, String salt)
    {
        String generatedPassword = null;
        try {
            // Create MessageDigest instance for MD5
            MessageDigest md = MessageDigest.getInstance("MD5");
            //Add password bytes to digest
            md.update(salt.getBytes());
            //Get the hash's bytes
            byte[] bytes = md.digest(passwordToHash.getBytes());
            //This bytes[] has bytes in decimal format;
            //Convert it to hexadecimal format
            StringBuilder sb = new StringBuilder();
            for(int i=0; i< bytes.length ;i++)
            {
                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            //Get complete hashed password in hex format
            generatedPassword = sb.toString();
        }
        catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return generatedPassword;
    }
     
    //Add salt
    private static String getSalt() throws NoSuchAlgorithmException, NoSuchProviderException
    {
        //Always use a SecureRandom generator
        SecureRandom sr = SecureRandom.getInstance("SHA1PRNG", "SUN");
        //Create array for salt
        byte[] salt = new byte[16];
        //Get a random salt
        sr.nextBytes(salt);
        //return salt
        return salt.toString();
    }
	public User findByUserIdAndOtpAndOtpExpiryDateTimeAfterAndStatus(String userId, String otp, Date date,String status) {
		
		return userRepository.findByUserIdAndOtpAndOtpExpiryDateTimeAfterAndStatus(userId,otp,date,status);
	}
	
	
	
}
