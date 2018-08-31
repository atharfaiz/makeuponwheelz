package com.bugfree.testgt.service;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.UnauthorizedException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.support.RequestContextUtils;
import org.springframework.web.servlet.view.RedirectView;

import com.bugfree.testgt.commons.EmployRollCommon;


public class ExceptionHandlerService{
	
	@Autowired
	private MessageSource messageSource;
	
	@ExceptionHandler(UnauthorizedException.class)
	 public RedirectView unauthorizedException(UnauthorizedException e, HttpServletRequest request) {
		e.printStackTrace();
		//FlashMap outputFlashMap = RequestContextUtils.getOutputFlashMap(request);
		//outputFlashMap.put(SGTConstants.ERROR_MESSAGE, messageSource.getMessage("unauthorized.exception",null,null));
		return new RedirectView("/sgterp/login");
	 }
	
	@ExceptionHandler(ArrayIndexOutOfBoundsException .class)
	 public RedirectView arrayIndexOutOfBoundsException (ArrayIndexOutOfBoundsException  e, HttpServletRequest request) {
		e.printStackTrace();
		FlashMap outputFlashMap = RequestContextUtils.getOutputFlashMap(request);
		outputFlashMap.put(EmployRollCommon.ERROR_MESSAGE,ArrayIndexOutOfBoundsException.class.getName()+ " "+messageSource.getMessage("exception",null,null));
		return new RedirectView(request.getHeader("Referer"));
	 }
	
	@ExceptionHandler(ClassCastException .class)
	 public RedirectView classCastException (ClassCastException  e, HttpServletRequest request) {
		e.printStackTrace();
		FlashMap outputFlashMap = RequestContextUtils.getOutputFlashMap(request);
		outputFlashMap.put(EmployRollCommon.ERROR_MESSAGE,ClassCastException.class.getName()+" "+ messageSource.getMessage("exception",null,null));
		return new RedirectView(request.getHeader("Referer"));
	 }
	
	@ExceptionHandler(IllegalArgumentException .class)
	 public RedirectView illegalArgumentException (IllegalArgumentException  e, HttpServletRequest request) {
		e.printStackTrace();
		FlashMap outputFlashMap = RequestContextUtils.getOutputFlashMap(request);
		outputFlashMap.put(EmployRollCommon.ERROR_MESSAGE,IllegalArgumentException.class.getName()+" "+ messageSource.getMessage("exception",null,null));
		return new RedirectView(request.getHeader("Referer"));
	 }
	
	@ExceptionHandler(NullPointerException.class)
	 public RedirectView nullPointerException(NullPointerException e, HttpServletRequest request) {
		e.printStackTrace();
		FlashMap outputFlashMap = RequestContextUtils.getOutputFlashMap(request);
		outputFlashMap.put(EmployRollCommon.ERROR_MESSAGE,NullPointerException.class.getName()+" "+ messageSource.getMessage("exception",null,null));
		return new RedirectView(request.getHeader("Referer"));
	 }
	
	@ExceptionHandler(NumberFormatException .class)
	 public RedirectView numberFormatException (NumberFormatException  e, HttpServletRequest request) {
		e.printStackTrace();
		FlashMap outputFlashMap = RequestContextUtils.getOutputFlashMap(request);
		outputFlashMap.put(EmployRollCommon.ERROR_MESSAGE,NumberFormatException.class.getName()+ " "+messageSource.getMessage("exception",null,null));
		return new RedirectView(request.getHeader("Referer"));
	 }
	
	@ExceptionHandler(AssertionError.class)
	 public RedirectView assertionError(AssertionError e, HttpServletRequest request) {
		e.printStackTrace();
		FlashMap outputFlashMap = RequestContextUtils.getOutputFlashMap(request);
		outputFlashMap.put(EmployRollCommon.ERROR_MESSAGE,AssertionError.class.getName()+ " "+messageSource.getMessage("exception",null,null));
		return new RedirectView(request.getHeader("Referer"));
	 }
	
	@ExceptionHandler(ExceptionInInitializerError .class)
	 public RedirectView exceptionInInitializerError (ExceptionInInitializerError  e, HttpServletRequest request) {
		e.printStackTrace();
		FlashMap outputFlashMap = RequestContextUtils.getOutputFlashMap(request);
		outputFlashMap.put(EmployRollCommon.ERROR_MESSAGE,ExceptionInInitializerError.class.getName()+ " "+messageSource.getMessage("exception",null,null));
		return new RedirectView(request.getHeader("Referer"));
	 }
	
	@ExceptionHandler(StackOverflowError .class)
	 public RedirectView stackOverflowError (StackOverflowError  e, HttpServletRequest request) {
		e.printStackTrace();
		FlashMap outputFlashMap = RequestContextUtils.getOutputFlashMap(request);
		outputFlashMap.put(EmployRollCommon.ERROR_MESSAGE,StackOverflowError.class.getName()+ " "+messageSource.getMessage("exception",null,null));
		return new RedirectView(request.getHeader("Referer"));
	 }
	
	@ExceptionHandler(NoClassDefFoundError.class)
	 public RedirectView noClassDefFoundError (NoClassDefFoundError  e, HttpServletRequest request) {
		e.printStackTrace();
		FlashMap outputFlashMap = RequestContextUtils.getOutputFlashMap(request);
		outputFlashMap.put(EmployRollCommon.ERROR_MESSAGE,NoClassDefFoundError.class.getName()+ " "+messageSource.getMessage("exception",null,null));
		return new RedirectView(request.getHeader("Referer"));
	 }
	
	@ExceptionHandler(Exception.class)
	 public RedirectView exception(Exception  e, HttpServletRequest request) {
		e.printStackTrace();
		FlashMap outputFlashMap = RequestContextUtils.getOutputFlashMap(request);
		outputFlashMap.put(EmployRollCommon.ERROR_MESSAGE,Exception.class.getName()+" "+ messageSource.getMessage("exception",null,null));
		return new RedirectView(request.getHeader("Referer"));
	 }
}