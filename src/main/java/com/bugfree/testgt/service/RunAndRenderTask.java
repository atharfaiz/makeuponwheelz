package com.bugfree.testgt.service;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.eclipse.birt.core.framework.Platform;
import org.eclipse.birt.report.engine.api.EngineConfig;
import org.eclipse.birt.report.engine.api.EngineConstants;
import org.eclipse.birt.report.engine.api.EngineException;
import org.eclipse.birt.report.engine.api.HTMLRenderOption;
import org.eclipse.birt.report.engine.api.HTMLServerImageHandler;
import org.eclipse.birt.report.engine.api.IPDFRenderOption;
import org.eclipse.birt.report.engine.api.IReportEngine;
import org.eclipse.birt.report.engine.api.IReportEngineFactory;
import org.eclipse.birt.report.engine.api.IReportRunnable;
import org.eclipse.birt.report.engine.api.IRunAndRenderTask;
import org.eclipse.birt.report.engine.api.PDFRenderOption;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class RunAndRenderTask {
	
	
	private static final Logger log=LoggerFactory.getLogger(RunAndRenderTask.class); 
	
	
	@SuppressWarnings("unchecked")
	public String runReport(String reportFile, HttpServletRequest request, Map<?,?> parameterValues) throws EngineException
	{
	  IReportEngine engine=null;
	  EngineConfig config = null;
	  String ret = null ;
	  try{
		   config = new EngineConfig( );   
		   config.setBIRTHome("");
		   Platform.startup( config );
		   IReportEngineFactory factory = (IReportEngineFactory) Platform.createFactoryObject( IReportEngineFactory.EXTENSION_REPORT_ENGINE_FACTORY );
		   engine = factory.createReportEngine( config );
		
		   IReportRunnable design = engine.openReportDesign(reportFile); 
		   IRunAndRenderTask task = engine.createRunAndRenderTask(design);   
		   task.getAppContext().put(EngineConstants.APPCONTEXT_BIRT_VIEWER_HTTPSERVET_REQUEST, request); 
		  
		   HTMLRenderOption options = new HTMLRenderOption();
		
		   options.setOutputFormat(HTMLRenderOption.OUTPUT_FORMAT_HTML);
		   options.setImageHandler(new HTMLServerImageHandler());
		  
		   options.setBaseImageURL(request.getSession().getServletContext().getContextPath()+"/images");

		   options.setImageDirectory(request.getSession().getServletContext().getRealPath("/images"));
		   ByteArrayOutputStream outStream = new ByteArrayOutputStream();

		   options.setOutputStream(outStream) ;
		   task.setRenderOption(options);
		   task.setParameterValues(parameterValues);
		   task.run();
		   task.close();
		   
		   ret = outStream.toString() ;
		  
		   engine.destroy();
	  }catch( Exception ex){
		  ex.printStackTrace();
	  }  
	  finally
	  {
		  Platform.shutdown( );
	  }
	  return ret ;
	} 
	

	
	 @SuppressWarnings("unchecked")
	public File runReport(String reportFile, HttpServletRequest request, Map<?,?> parameterValues, String OutputFileName ) throws EngineException
	 {
		
	  IReportEngine engine=null;
	  EngineConfig config = null;
	  //String ret = null ;
	  //FileOutputStream outputFile = null;
	  File file = new File(OutputFileName);
	  try{
		  //outputFile = new FileOutputStream(file);
	   config = new EngineConfig( );   
	   config.setBIRTHome("");
	   Platform.startup( config );
	   IReportEngineFactory factory = (IReportEngineFactory) Platform.createFactoryObject( IReportEngineFactory.EXTENSION_REPORT_ENGINE_FACTORY );
	   engine = factory.createReportEngine( config );

	   IReportRunnable design = engine.openReportDesign(reportFile); 
	   IRunAndRenderTask task = engine.createRunAndRenderTask(design);   
	   task.getAppContext().put(EngineConstants.APPCONTEXT_BIRT_VIEWER_HTTPSERVET_REQUEST, request); 
	  
	   /*HTMLRenderOption options = new HTMLRenderOption();
	   options.setOutputFormat(HTMLRenderOption.OUTPUT_FORMAT_HTML);
	   options.setImageHandler(new HTMLServerImageHandler());
	   */
	   
	   PDFRenderOption pdfOptions = new PDFRenderOption( );
		pdfOptions.setOutputFormat("pdf");
		pdfOptions.setOption(IPDFRenderOption.PAGE_OVERFLOW, IPDFRenderOption.FIT_TO_PAGE_SIZE);
		pdfOptions.setOutputStream(new FileOutputStream(file));
		task.setRenderOption(pdfOptions);
     
	   //options.setBaseImageURL(baseImageURL);

	   //options.setImageDirectory(imagesDirectory);

	  //task.setParameterValues("poNum", poNum);
		task.setParameterValues(parameterValues);
	
	   task.run();
	   task.close();

	  
	  engine.destroy();
	  }catch( Exception ex){
	   ex.printStackTrace();
	  }  
	  finally
	  {
	   Platform.shutdown( );
	  }
	  return file ;
	 } 

	 public String runReporthtml(String InputFile, ServletContext servletContext, String poNum ) throws EngineException
	 {
		 
		 IReportEngine engine=null;
		  EngineConfig config = null;
		  String ret = null ;
		  try{
		   config = new EngineConfig( );   
		   config.setBIRTHome("");
		   Platform.startup( config );
		   IReportEngineFactory factory = (IReportEngineFactory) Platform.createFactoryObject( IReportEngineFactory.EXTENSION_REPORT_ENGINE_FACTORY );
		   engine = factory.createReportEngine( config );

		   IReportRunnable design = engine.openReportDesign(InputFile); 
		   IRunAndRenderTask task = engine.createRunAndRenderTask(design);   
		   HTMLRenderOption options = new HTMLRenderOption();

		   options.setOutputFormat(HTMLRenderOption.OUTPUT_FORMAT_HTML);
		   options.setImageHandler(new HTMLServerImageHandler());

		  // options.setBaseImageURL(baseImageURL);

		  // options.setImageDirectory(imagesDirectory);

		   ByteArrayOutputStream outStream = new ByteArrayOutputStream();
		   options.setOutputStream(outStream) ;
		   
		   task.setRenderOption(options);
		   task.setParameterValue("poNum", poNum);
		   task.run();
		   task.close();

		   ret = outStream.toString() ;
		 
		   engine.destroy();
	  }catch( Exception ex){
	   ex.printStackTrace();
	  }  
	  finally
	  {
	   Platform.shutdown( );
	  }
	  return ret ;
	 } 
 
	 @SuppressWarnings("unchecked")
	 public File runReportDateSheet(String reportFile, HttpServletRequest request, Map<?,?> parameterValues, String OutputFileName ) throws EngineException
	 {
		 
	  IReportEngine engine=null;
	  EngineConfig config = null;
	  //String ret = null ;
	  //FileOutputStream outputFile = null;
	  File file = new File(OutputFileName);
	  try{
		  //outputFile = new FileOutputStream(file);
	   config = new EngineConfig( );   
	   config.setBIRTHome("");
	   Platform.startup( config );
	   IReportEngineFactory factory = (IReportEngineFactory) Platform.createFactoryObject( IReportEngineFactory.EXTENSION_REPORT_ENGINE_FACTORY );
	   engine = factory.createReportEngine( config );

	   IReportRunnable design = engine.openReportDesign(reportFile); 
	   IRunAndRenderTask task = engine.createRunAndRenderTask(design);   
	   task.getAppContext().put(EngineConstants.APPCONTEXT_BIRT_VIEWER_HTTPSERVET_REQUEST, request); 
	  
	   /*HTMLRenderOption options = new HTMLRenderOption();
	   options.setOutputFormat(HTMLRenderOption.OUTPUT_FORMAT_HTML);
	   options.setImageHandler(new HTMLServerImageHandler());
	   */
	   
	   PDFRenderOption pdfOptions = new PDFRenderOption( );
		pdfOptions.setOutputFormat("pdf");
		pdfOptions.setOption(IPDFRenderOption.PAGE_OVERFLOW, IPDFRenderOption.FIT_TO_PAGE_SIZE);
		pdfOptions.setOutputStream(new FileOutputStream(file));
		task.setRenderOption(pdfOptions);
     
	   //options.setBaseImageURL(baseImageURL);

	   //options.setImageDirectory(imagesDirectory);

		task.setParameterValue("textNarration","Good");
		task.setParameterValues(parameterValues);
	
		 task.run();
	   task.close();

	  
	  engine.destroy();
	  }catch( Exception ex){
	   ex.printStackTrace();
	  }  
	  finally
	  {
	   Platform.shutdown( );
	  }
	  return file ;
	 } 


}