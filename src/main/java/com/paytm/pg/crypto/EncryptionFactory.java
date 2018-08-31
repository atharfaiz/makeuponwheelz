package com.paytm.pg.crypto;











public class EncryptionFactory
{
  private EncryptionFactory() {}
  










  public static Encryption getEncryptionInstance(String algorithmType)
  {
    return new AesEncryption();
  }
  






  public static EncryptionGAE getEncryptionInstanceGAE(String algorithmType)
  {
    return new AesEncryptionGAE();
  }
  






  public static EncryptionIBMJCE getEncryptionInstanceIBMJCE(String algorithmType)
  {
    return new AesEncryptionIBMJCE();
  }
}
