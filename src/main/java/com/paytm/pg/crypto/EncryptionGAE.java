package com.paytm.pg.crypto;

public abstract interface EncryptionGAE
{
  public abstract String encryptGAE(String paramString1, String paramString2)
    throws Exception;
  
  public abstract String decryptGAE(String paramString1, String paramString2)
    throws Exception;
}
