package com.bugfree.testgt.commons;

import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Random;

import com.google.common.io.BaseEncoding;

public class GenerateRandomString {

	public static String generateHexString(int requiredLength){

		Random randomService = new Random();
		StringBuilder sb = new StringBuilder();
		while (sb.length() < requiredLength) {
		    sb.append(Integer.toHexString(randomService.nextInt()));
		}
		sb.setLength(requiredLength);
		return sb.toString();
		
	}
	
	public static int randomOTP(int size) {

        StringBuilder generatedToken = new StringBuilder();
        try {
            SecureRandom number = SecureRandom.getInstance("SHA1PRNG");
            // Generate 20 integers 0..20
            for (int i = 0; i < size; i++) {
                generatedToken.append(number.nextInt(9));
            }
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        System.out.println("********generatedOTP*******"+generatedToken);
    	if(Integer.parseInt(generatedToken.toString())<1000){
        	randomOTP(4);
        }

        return Integer.parseInt(generatedToken.toString());
    }
	
	private static final String CODES = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";

    public static String urlDecode(String input) throws IllegalArgumentException   {
        if (input.length() % 4 != 0)    {
            throw new IllegalArgumentException("*******************Invalid base64 input");
        }
        byte decoded[] = new byte[((input.length() * 3) / 4) - (input.indexOf('=') > 0 ? (input.length() - input.indexOf('=')) : 0)];
        char[] inChars = input.toCharArray();
        int j = 0;
        int b[] = new int[4];
        for (int i = 0; i < inChars.length; i += 4)     {
            // This could be made faster (but more complicated) by precomputing these index locations.
            b[0] = CODES.indexOf(inChars[i]);
            b[1] = CODES.indexOf(inChars[i + 1]);
            b[2] = CODES.indexOf(inChars[i + 2]);
            b[3] = CODES.indexOf(inChars[i + 3]);
            decoded[j++] = (byte) ((b[0] << 2) | (b[1] >> 4));
            if (b[2] < 64)      {
                decoded[j++] = (byte) ((b[1] << 4) | (b[2] >> 2));
                if (b[3] < 64)  {
                    decoded[j++] = (byte) ((b[2] << 6) | b[3]);
                }
            }
        }
        input = new String(decoded);
        return input;
    }

    
    public static String urlEncode(String input) throws Exception   {
        
        return BaseEncoding.base64().encode(input.getBytes("UTF-8"));
    }

}
