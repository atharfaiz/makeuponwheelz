package com.bugfree.testgt.commons.validate;

public class ValidateImage {

	
	public static boolean validateImageExtension(String ext){
		if(ext.equals("jpg")||ext=="jpg")
			 return true;
		 else if(ext.equals("png")||ext=="png")
			 return true;
		 else if(ext.equals("jpeg")||ext=="jpeg")
			 return true;
		 else if(ext.equals("pdf")||ext=="pdf")
			 return true;
		 else if(ext.equals("docx")||ext=="docx")
			 return true;
		 else if(ext.equals("xls")||ext=="xls")
			 return true;
		 else
			 return false;
	}
}
