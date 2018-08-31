package com.bugfree.testgt.commons.amazon;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.regions.Region;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;


public class AmazonService {

	
	public static  AmazonS3 getAmazonS3(){

		 AmazonS3 s3 = new AmazonS3Client(new AWSCredentials() {
			 public String getAWSSecretKey() {
					// TODO Auto-generated method stub
					return "W/HZkadT9W6FwJElstK0IpqcGlsDdBvB7t9DwNU7";
				}
				
				public String getAWSAccessKeyId() {
					// TODO Auto-generated method stub
					return "AKIAJ7ZZEM74DNPGFG3A";
				}
				
			});
	        
	        /*Region usWest2 = Region.getRegion(Regions.AP_SOUTHEAST_1);
	        s3.setRegion(usWest2);
	       */
	        return s3;
	}
	
	
}
