package com.paytm.pg.crypto;

public abstract interface EncryptConstants
{
  public static final String ALGTHM_TYPE_3DES = "DESede";
  public static final String ALGTHM_TYPE_HASH_SHA_256 = "SHA-256";
  public static final String ALGTHM_TYPE_AES = "AES";
  public static final String ALGTHM_CBC_PAD_AES = "AES/CBC/PKCS5PADDING";
  public static final String ALGTHM_PROVIDER_BC = "SunJCE";
  public static final String STR_COMMA = ",";
  public static final String KEYSTORE_TYPE = "JCEKS";
  public static final String ALIAS_TYPE_AES = "ALIAS_AES";
  public static final String ALIAS_TYPE_3DES = "ALIAS_3DES";
  public static final String KEYSTORE_NOT_FOUND_MSG = "Not able to load or generate the KeyStore";
  public static final String ALGTHM_PROVIDER_JCE = "IBMJCE";
}
