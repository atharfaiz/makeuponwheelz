package com.paytm.pg.merchant;

import com.paytm.pg.crypto.CryptoUtils;
import com.paytm.pg.crypto.Encryption;
import com.paytm.pg.crypto.EncryptionFactory;
import com.paytm.pg.crypto.EncryptionGAE;
import com.paytm.pg.crypto.EncryptionIBMJCE;
import java.io.PrintStream;
import java.util.Map.Entry;
import java.util.Set;
import java.util.TreeMap;
import java.util.TreeSet;







public class CheckSumServiceHelper
{
  private static final CheckSumServiceHelper checkSumServiceHelper = new CheckSumServiceHelper();
  

  private CheckSumServiceHelper() {}
  
  public static String getVersion()
  {
    return "2.0";
  }
  

  public static CheckSumServiceHelper getCheckSumServiceHelper()
  {
    return checkSumServiceHelper;
  }
  
  public String genrateRefundCheckSum(String Key, TreeMap<String, String> paramap) throws Exception
  {
    StringBuilder response = checkSumServiceHelper.getRefundCheckSumString(paramap);
    String checkSumValue = null;
    try {
      Encryption encryption = EncryptionFactory.getEncryptionInstance("AES");
      
      String randomNo = CryptoUtils.generateRandomString(4);
      response.append(randomNo);
      
      String checkSumHash = CryptoUtils.getSHA256(response.toString());
      checkSumHash = checkSumHash.concat(randomNo);
      




      checkSumValue = encryption.encrypt(checkSumHash, Key);
      
      if (checkSumValue != null)
      {
        checkSumValue = checkSumValue.replaceAll("\r\n", "");
        checkSumValue = checkSumValue.replaceAll("\r", "");
        checkSumValue = checkSumValue.replaceAll("\n", "");
      }
    }
    catch (SecurityException e) {
      e.printStackTrace();
    }
    
    return checkSumValue;
  }
  
  public String genrateCheckSum(String Key, TreeMap<String, String> paramap) throws Exception
  {
    StringBuilder response = checkSumServiceHelper.getCheckSumString(paramap);
    String checkSumValue = null;
    try {
      Encryption encryption = EncryptionFactory.getEncryptionInstance("AES");
      
      String randomNo = CryptoUtils.generateRandomString(4);
      response.append(randomNo);
      
      String checkSumHash = CryptoUtils.getSHA256(response.toString());
      checkSumHash = checkSumHash.concat(randomNo);
      




      checkSumValue = encryption.encrypt(checkSumHash, Key);
      
      if (checkSumValue != null)
      {
        checkSumValue = checkSumValue.replaceAll("\r\n", "");
        checkSumValue = checkSumValue.replaceAll("\r", "");
        checkSumValue = checkSumValue.replaceAll("\n", "");
      }
    }
    catch (SecurityException e) {
      e.printStackTrace();
    }
    
    return checkSumValue;
  }
  
  public String genrateCheckSumGAE(String Key, TreeMap<String, String> paramap) throws Exception
  {
    StringBuilder response = checkSumServiceHelper.getCheckSumString(paramap);
    String checkSumValue = null;
    try {
      EncryptionGAE encryption = EncryptionFactory.getEncryptionInstanceGAE("AES");
      
      String randomNo = CryptoUtils.generateRandomString(4);
      response.append(randomNo);
      
      String checkSumHash = CryptoUtils.getSHA256(response.toString());
      checkSumHash = checkSumHash.concat(randomNo);
      



      checkSumValue = encryption.encryptGAE(checkSumHash, Key);
      
      if (checkSumValue != null)
      {
        checkSumValue = checkSumValue.replaceAll("\r\n", "");
        checkSumValue = checkSumValue.replaceAll("\r", "");
        checkSumValue = checkSumValue.replaceAll("\n", "");
      }
    } catch (SecurityException e) {
      e.printStackTrace();
    }
    return checkSumValue;
  }
  
  public String genrateRefundCheckSumGAE(String Key, TreeMap<String, String> paramap) throws Exception
  {
    StringBuilder response = checkSumServiceHelper.getRefundCheckSumString(paramap);
    String checkSumValue = null;
    try {
      EncryptionGAE encryption = EncryptionFactory.getEncryptionInstanceGAE("AES");
      
      String randomNo = CryptoUtils.generateRandomString(4);
      response.append(randomNo);
      
      String checkSumHash = CryptoUtils.getSHA256(response.toString());
      checkSumHash = checkSumHash.concat(randomNo);
      



      checkSumValue = encryption.encryptGAE(checkSumHash, Key);
      
      if (checkSumValue != null)
      {
        checkSumValue = checkSumValue.replaceAll("\r\n", "");
        checkSumValue = checkSumValue.replaceAll("\r", "");
        checkSumValue = checkSumValue.replaceAll("\n", "");
      }
    } catch (SecurityException e) {
      e.printStackTrace();
    }
    return checkSumValue;
  }
  
  public String genrateCheckSumIBMJCE(String Key, TreeMap<String, String> paramap) throws Exception
  {
    StringBuilder response = checkSumServiceHelper.getCheckSumString(paramap);
    String checkSumValue = null;
    try {
      EncryptionIBMJCE encryption = EncryptionFactory.getEncryptionInstanceIBMJCE("AES");
      
      String randomNo = CryptoUtils.generateRandomString(4);
      response.append(randomNo);
      
      String checkSumHash = CryptoUtils.getSHA256(response.toString());
      checkSumHash = checkSumHash.concat(randomNo);
      



      checkSumValue = encryption.encryptIBMJCE(checkSumHash, Key);
      
      if (checkSumValue != null)
      {
        checkSumValue = checkSumValue.replaceAll("\r\n", "");
        checkSumValue = checkSumValue.replaceAll("\r", "");
        checkSumValue = checkSumValue.replaceAll("\n", "");
      }
    } catch (SecurityException e) {
      e.printStackTrace();
    }
    return checkSumValue;
  }
  
  public String genrateRefundCheckSumIBMJCE(String Key, TreeMap<String, String> paramap) throws Exception
  {
    StringBuilder response = checkSumServiceHelper.getRefundCheckSumString(paramap);
    String checkSumValue = null;
    try {
      EncryptionIBMJCE encryption = EncryptionFactory.getEncryptionInstanceIBMJCE("AES");
      
      String randomNo = CryptoUtils.generateRandomString(4);
      response.append(randomNo);
      
      String checkSumHash = CryptoUtils.getSHA256(response.toString());
      checkSumHash = checkSumHash.concat(randomNo);
      



      checkSumValue = encryption.encryptIBMJCE(checkSumHash, Key);
      
      if (checkSumValue != null)
      {
        checkSumValue = checkSumValue.replaceAll("\r\n", "");
        checkSumValue = checkSumValue.replaceAll("\r", "");
        checkSumValue = checkSumValue.replaceAll("\n", "");
      }
    } catch (SecurityException e) {
      e.printStackTrace();
    }
    return checkSumValue;
  }
  
  /*public String genrateCheckSumIBMJCEQueryStr(String Key, String paramap) throws Exception
  {
    StringBuilder response = checkSumServiceHelper.getCheckSumStringByQueryString(paramap);
    
    String checkSumValue = null;
    try {
      EncryptionIBMJCE encryption = EncryptionFactory.getEncryptionInstanceIBMJCE("AES");
      
      String randomNo = CryptoUtils.generateRandomString(4);
      response.append(randomNo);
      
      String checkSumHash = CryptoUtils.getSHA256(response.toString());
      checkSumHash = checkSumHash.concat(randomNo);
      



      checkSumValue = encryption.encryptIBMJCE(checkSumHash, Key);
      
      if (checkSumValue != null)
      {
        checkSumValue = checkSumValue.replaceAll("\r\n", "");
        checkSumValue = checkSumValue.replaceAll("\r", "");
        checkSumValue = checkSumValue.replaceAll("\n", "");
      }
    } catch (SecurityException e) {
      e.printStackTrace();
    }
    return checkSumValue;
  }
  */






  public StringBuilder getCheckSumString(TreeMap<String, String> paramMap)
    throws Exception
  {
    Set<String> keys = paramMap.keySet();
    
    StringBuilder checkSumStringBuffer = new StringBuilder("");
    
    TreeSet<String> parameterSet = new TreeSet();
    for (String key : keys)
    {
      if (!"CHECKSUMHASH".equalsIgnoreCase(key)) {
        parameterSet.add(key);
      }
    }
    
    for (String paramName : parameterSet)
    {
      String value = (String)paramMap.get(paramName);
      if ((!value.toLowerCase().contains("|")) && (!value.toLowerCase().contains("refund")))
      {


        if ((value == null) || (value.trim().equalsIgnoreCase("NULL"))) {
          value = "";
        }
        checkSumStringBuffer.append(value).append("|");
      }
    }
    return checkSumStringBuffer;
  }
  
  public StringBuilder getRefundCheckSumString(TreeMap<String, String> paramMap) throws Exception
  {
    Set<String> keys = paramMap.keySet();
    
    StringBuilder checkSumStringBuffer = new StringBuilder("");
    
    TreeSet<String> parameterSet = new TreeSet();
    for (String key : keys)
    {
      if (!"CHECKSUMHASH".equalsIgnoreCase(key)) {
        parameterSet.add(key);
      }
    }
    
    for (String paramName : parameterSet)
    {
      String value = (String)paramMap.get(paramName);
      if (!value.toLowerCase().contains("|"))
      {


        if ((value == null) || (value.trim().equalsIgnoreCase("NULL"))) {
          value = "";
        }
        checkSumStringBuffer.append(value).append("|");
      }
    }
    return checkSumStringBuffer;
  }
  
  /*public StringBuilder getCheckSumStringByQueryString(String paramString) throws Exception
  {
    TreeMap<String, String> paramMap = new TreeMap();
    String[] params = paramString.split("&");
    String[] keyValue; if ((params != null) && (params.length > 0)) {
      for (String param : params) {
        keyValue = param.split("=");
        if (keyValue != null) {
          if (keyValue.length == 2) {
            paramMap.put(keyValue[0], keyValue[1]);
          }
          else if (keyValue.length == 1) {
            paramMap.put(keyValue[0], "");
          }
        }
      }
    }
    
    Set<String> keys = paramMap.keySet();
    StringBuilder checkSumStringBuffer = new StringBuilder("");
    Object parameterSet = new TreeSet();
    for (String key : keys) {
      if (!"CHECKSUMHASH".equalsIgnoreCase(key)) {
        ((TreeSet)parameterSet).add(key);
      }
    }
    for (String paramName : (TreeSet)parameterSet) {
      String value = (String)paramMap.get(paramName);
      if ((!value.toLowerCase().contains("|")) && (!value.toLowerCase().contains("refund")))
      {

        if ((value == null) || (value.trim().equalsIgnoreCase("NULL"))) {
          value = "";
        }
        checkSumStringBuffer.append(value).append("|");
      } }
    return checkSumStringBuffer;
  }*/
  
  public String genrateCheckSum(String Key, String paramap) throws Exception
  {
    StringBuilder response = new StringBuilder(paramap);
    response.append("|");
    String checkSumValue = null;
    try {
      Encryption encryption = EncryptionFactory.getEncryptionInstance("AES");
      
      String randomNo = CryptoUtils.generateRandomString(4);
      response.append(randomNo);
      
      String checkSumHash = CryptoUtils.getSHA256(response.toString());
      checkSumHash = checkSumHash.concat(randomNo);
      



      checkSumValue = encryption.encrypt(checkSumHash, Key);
      
      if (checkSumValue != null)
      {
        checkSumValue = checkSumValue.replaceAll("\r\n", "");
        checkSumValue = checkSumValue.replaceAll("\r", "");
        checkSumValue = checkSumValue.replaceAll("\n", "");
      }
    }
    catch (SecurityException e) {
      e.printStackTrace();
    }
    
    return checkSumValue;
  }
  





  public TreeMap<String, String> getParamsMapFromEncParam(String masterKey, String encParam)
  {
    try
    {
      if ((masterKey != null) && (encParam != null)) {
        Encryption encryption = EncryptionFactory.getEncryptionInstance("AES");
        String paramsString = encryption.decrypt(encParam, masterKey);
        if (paramsString != null) {
          return getMapForRawData(paramsString);
        }
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    return null;
  }
  




  public String getDecryptedValue(String masterKey, String decryptTo)
  {
    try
    {
      Encryption encryption = EncryptionFactory.getEncryptionInstance("AES");
      return encryption.decrypt(decryptTo, masterKey);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return null;
  }
  
  private TreeMap<String, String> getMapForRawData(String rawdata) {
    if (rawdata != null) {
      TreeMap<String, String> resp = new TreeMap();
      String[] params = rawdata.split("\\|");
      if ((params != null) && (params.length > 0)) {
        for (String param : params) {
          String[] keyValue = param.split("=");
          if (keyValue != null) {
            if (keyValue.length == 2) {
              resp.put(keyValue[0], keyValue[1]);
            } else if (keyValue.length == 1) {
              resp.put(keyValue[0], "");
            }
          }
        }
        return resp;
      }
    }
    return null;
  }
  





/*  public String getEncryptedParam(String masterKey, TreeMap<String, String> paramMap)
  {
    StringBuilder params = new StringBuilder();
    try {
      if ((paramMap != null) && (paramMap.size() > 0)) {
        for (Map.Entry<String, String> entry : paramMap.entrySet()) {
          params.append(((String)entry.getKey()).trim()).append("=").append(((String)entry.getValue()).trim()).append("|");
        }
      }
      Encryption encryption = EncryptionFactory.getEncryptionInstance("AES");
      return encryption.encrypt(params.toString(), masterKey);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return null;
  }*/
  








  public boolean verifycheckSum(String masterKey, TreeMap<String, String> paramap, String responseCheckSumString)
    throws Exception
  {
    boolean isValidChecksum = false;
    StringBuilder response = checkSumServiceHelper.getCheckSumString(paramap);
    Encryption encryption = EncryptionFactory.getEncryptionInstance("AES");
    
    String responseCheckSumHash = encryption.decrypt(responseCheckSumString, masterKey);
    
    String randomStr = getLastNChars(responseCheckSumHash, 4);
    String payTmCheckSumHash = calculateRequestCheckSum(randomStr, response.toString());
    
    if ((responseCheckSumHash != null) && (payTmCheckSumHash != null) && 
      (responseCheckSumHash.equals(payTmCheckSumHash))) {
      isValidChecksum = true;
    }
    

    return isValidChecksum;
  }
  
/*  public boolean verifycheckSumQueryStr(String masterKey, String paramap, String responseCheckSumString) throws Exception
  {
    boolean isValidChecksum = false;
    StringBuilder response = checkSumServiceHelper.getCheckSumStringByQueryString(paramap);
    Encryption encryption = EncryptionFactory.getEncryptionInstance("AES");
    
    String responseCheckSumHash = encryption.decrypt(responseCheckSumString, masterKey);
    
    String randomStr = getLastNChars(responseCheckSumHash, 4);
    String payTmCheckSumHash = calculateRequestCheckSum(randomStr, response.toString());
    
    if ((responseCheckSumHash != null) && (payTmCheckSumHash != null) && 
      (responseCheckSumHash.equals(payTmCheckSumHash))) {
      isValidChecksum = true;
    }
    

    return isValidChecksum;
  }*/
  
  public boolean verifycheckSumGAE(String masterKey, TreeMap<String, String> paramap, String responseCheckSumString) throws Exception
  {
    boolean isValidChecksum = false;
    StringBuilder response = checkSumServiceHelper.getCheckSumString(paramap);
    
    EncryptionGAE encryption = EncryptionFactory.getEncryptionInstanceGAE("AES");
    
    String responseCheckSumHash = encryption.decryptGAE(responseCheckSumString, masterKey);
    
    String randomStr = getLastNChars(responseCheckSumHash, 4);
    String payTmCheckSumHash = calculateRequestCheckSum(randomStr, response.toString());
    
    if ((responseCheckSumHash != null) && (payTmCheckSumHash != null) && 
      (responseCheckSumHash.equals(payTmCheckSumHash))) {
      isValidChecksum = true;
    }
    

    return isValidChecksum;
  }
  
  public boolean verifycheckSumIBMJCE(String masterKey, TreeMap<String, String> paramap, String responseCheckSumString) throws Exception
  {
    boolean isValidChecksum = false;
    StringBuilder response = checkSumServiceHelper.getCheckSumString(paramap);
    
    EncryptionIBMJCE encryption = EncryptionFactory.getEncryptionInstanceIBMJCE("AES");
    
    String responseCheckSumHash = encryption.decryptIBMJCE(responseCheckSumString, masterKey);
    
    String randomStr = getLastNChars(responseCheckSumHash, 4);
    String payTmCheckSumHash = calculateRequestCheckSum(randomStr, response.toString());
    
    if ((responseCheckSumHash != null) && (payTmCheckSumHash != null) && 
      (responseCheckSumHash.equals(payTmCheckSumHash))) {
      isValidChecksum = true;
    }
    

    return isValidChecksum;
  }
  
 /* public boolean verifycheckSumIBMJCEQueryStr(String masterKey, String paramap, String responseCheckSumString) throws Exception {
    boolean isValidChecksum = false;
    StringBuilder response = checkSumServiceHelper.getCheckSumStringByQueryString(paramap);
    EncryptionIBMJCE encryption = EncryptionFactory.getEncryptionInstanceIBMJCE("AES");
    String responseCheckSumHash = encryption.decryptIBMJCE(responseCheckSumString, masterKey);
    String randomStr = getLastNChars(responseCheckSumHash, 4);
    String payTmCheckSumHash = calculateRequestCheckSum(randomStr, response.toString());
    
    if ((responseCheckSumHash != null) && (payTmCheckSumHash != null) && 
      (responseCheckSumHash.equals(payTmCheckSumHash))) {
      isValidChecksum = true;
    }
    
    return isValidChecksum;
  }*/
  
  private String calculateRequestCheckSum(String randomStr, String checkSumString) throws Exception
  {
    String reqCheckSumValue = checkSumString;
    
    String checkSumHash = CryptoUtils.getSHA256(reqCheckSumValue.concat(randomStr));
    checkSumHash = checkSumHash.concat(randomStr);
    return checkSumHash;
  }
  
  public static String getLastNChars(String inputString, int subStringLength)
  {
    if ((inputString != null) && (inputString.length() > 0))
    {
      int length = inputString.length();
      if (length <= subStringLength) {
        return inputString;
      }
      int startIndex = length - subStringLength;
      return inputString.substring(startIndex);
    }
    return "";
  }
  
  public static void main(String[] a)
  {
    try
    {
      System.out.println(checkSumServiceHelper.genrateCheckSum("1234567812345678", "1234567812345678"));

    }
    catch (Exception e)
    {
      e.printStackTrace();
    }
  }
}
