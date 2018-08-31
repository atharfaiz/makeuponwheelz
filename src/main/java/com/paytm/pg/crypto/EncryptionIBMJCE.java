package com.paytm.pg.crypto;

public abstract interface EncryptionIBMJCE
{
  public abstract String encryptIBMJCE(String paramString1, String paramString2)
    throws Exception;
  
  public abstract String decryptIBMJCE(String paramString1, String paramString2)
    throws Exception;
}
