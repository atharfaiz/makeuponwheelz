package com.paytm.pg.crypto;

import java.io.PrintStream;







public class SecurityException
  extends Exception
{
  private static final long serialVersionUID = -3956900350777254445L;
  private String errorCode;
  private String errorMessage;
  private Exception exception;
  
  public SecurityException(String errorCode, String errorMessage)
  {
    super(errorMessage);
    this.errorCode = errorCode;
    this.errorMessage = errorMessage;
  }
  






  public SecurityException(String errorMessage)
  {
    super(errorMessage);
  }
  





  public SecurityException(Throwable cause)
  {
    super(cause);
  }
  







  public SecurityException(String errorMessage, Throwable cause)
  {
    super(errorMessage, cause);
  }
  







  public SecurityException(String errorMessage, Exception exception)
  {
    this.errorMessage = errorMessage;
    this.exception = exception;
  }
  


  public String getErrorCode()
  {
    return errorCode;
  }
  



  public void setErrorCode(String errorCode)
  {
    this.errorCode = errorCode;
  }
  


  public String getErrorMessage()
  {
    return errorMessage;
  }
  



  public void setErrorMessage(String errorMessage)
  {
    this.errorMessage = errorMessage;
  }
  




  public void printStackTrace(PrintStream stream)
  {
    if (exception != null) {
      exception.printStackTrace(stream);
    }
  }
}
