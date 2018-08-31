package com.paytm.pg.crypto;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;











public class AesEncryption
  implements Encryption
{
  private final BASE64Encoder base64Encoder = new BASE64Encoder();
  private final BASE64Decoder base64Decoder = new BASE64Decoder();
  
  private final byte[] ivParamBytes = { 64, 64, 64, 64, 
    38, 38, 38, 38, 
    35, 35, 35, 35, 
    36, 36, 36, 36 };
  
  public AesEncryption() {}
  
  public String encrypt(String toEncrypt, String key) throws Exception { String encryptedValue = "";
    
    Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5PADDING", "SunJCE");
    cipher.init(1, new SecretKeySpec(key.getBytes(), "AES"), new IvParameterSpec(ivParamBytes));
    encryptedValue = base64Encoder.encode(cipher.doFinal(toEncrypt.getBytes()));
    return encryptedValue;
  }
  
  public String decrypt(String toDecrypt, String key) throws Exception
  {
    String decryptedValue = "";
    
    Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5PADDING", "SunJCE");
    cipher.init(2, new SecretKeySpec(key.getBytes(), "AES"), new IvParameterSpec(ivParamBytes));
    decryptedValue = new String(cipher.doFinal(base64Decoder.decodeBuffer(toDecrypt)));
    return decryptedValue;
  }
}
