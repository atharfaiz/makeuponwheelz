package com.paytm;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.Random;

/**
 * Created by EEBS-Administrator on 15-05-2018.
 */

public class ProductDetails {
    Random random = new Random(999999999);
    public String key = "QGGZtgP8";
    public String salt = "T8Ml86HMBw";
    public String authHeader = "/WKG9O1srdySRXQ+F35mUQ0ew53I/AROj6jgTlN+sr4=";
    Date date =  new Date();
    public String txnId = random.nextLong()+date.getTime()+"";
    public float amount = 10.00f;
    public String productInfo = "Fine Artifacts";
    public String firstName = "Aakash";
    public String email = "akashnebel@gmail.com";
    public String udf = "Atta Ashirvad 5 kg";



    public ProductDetails(Date txnId) {
		super();
		this.txnId = txnId.getTime()+"";
	}
    public ProductDetails() {
	}

	String hashSequence = key+"|"+txnId+"|"+amount+"|"+productInfo+"|"+firstName+"|"+email+"|"+udf+"|"+salt;

    public  String hashCal(String type) {
        String hashString = this.hashSequence;
        StringBuilder hash = new StringBuilder();
        MessageDigest messageDigest = null;
        try {
            messageDigest = MessageDigest.getInstance(type);
            messageDigest.update(hashString.getBytes());
            byte[] mdbytes = messageDigest.digest();
            for (byte hashByte : mdbytes) {
                hash.append(Integer.toString((hashByte & 0xff) + 0x100, 16).substring(1));
            }
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return hash.toString();
    }


}
