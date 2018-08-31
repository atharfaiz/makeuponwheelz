<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page import="org.apache.shiro.SecurityUtils"%>
<!DOCTYPE html>
<!-- Template Name: Clip-One - Responsive Admin Template build with Twitter Bootstrap 3.x Version: 1.4 Author: ClipTheme -->
<!--[if IE 8]><html class="ie8 no-js" lang="en"><![endif]-->
<!--[if IE 9]><html class="ie9 no-js" lang="en"><![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
	<!--<![endif]-->
	<!-- start: HEAD -->
	<head>
 <script type="text/javascript" src="/sgterp/resources/js/registration/jquery.maskedinput.js"></script>
 <script type="text/javascript" src="/sgterp/resources/js/registration/custom.validation.masking.js"></script>
 <script src="/sgterp/resources/js/registration/state.js"></script>

 <meta charset="utf-8" />
		<!--[if IE]><meta http-equiv='X-UA-Compatible' content="IE=edge,IE=9,IE=8,chrome=1" /><![endif]-->
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta content="" name="description" />
		<meta content="" name="author" />
		<!-- end: META -->
		<!-- start: MAIN CSS -->
		<link rel="stylesheet" href="/sgterp/resources/plugins/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="/sgterp/resources/plugins/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="/sgterp/resources/fonts/style.css">
		<link rel="stylesheet" href="/sgterp/resources/css/clip/main.css">
		<link rel="stylesheet" href="/sgterp/resources/css/clip/main-responsive.css">
		<link rel="stylesheet" href="/sgterp/resources/plugins/iCheck/skins/all.css">
		<link rel="stylesheet" href="/sgterp/resources/plugins/bootstrap-colorpalette/css/bootstrap-colorpalette.css">
		<link rel="stylesheet" href="/sgterp/resources/plugins/perfect-scrollbar/src/perfect-scrollbar.css">
		<link rel="stylesheet" href="/sgterp/resources/css/clip/theme_light.css" type="text/css" id="skin_color">
		<link rel="stylesheet" href="/sgterp/resources/css//clip/print.css" type="text/css" media="print"/>
		<link rel="stylesheet" href="/sgterp/resources/plugins/select2/select2.css">
		<link rel="stylesheet" href="/sgterp/resources/plugins/datepicker/css/datepicker.css">
		<link rel="stylesheet" href="/sgterp/resources/plugins/bootstrap-fileupload/bootstrap-fileupload.min.css">
		<!-- start: CSS REQUIRED FOR THIS PAGE ONLY -->
		<link rel="stylesheet" href="/sgterp/resources/plugins/select2/select2.css">
		<link rel="stylesheet" href="/sgterp/resources/plugins/datepicker/css/datepicker.css">
		<link rel="stylesheet" href="/sgterp/resources/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css">
		<link rel="stylesheet" href="/sgterp/resources/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css">
		<link rel="stylesheet" href="/sgterp/resources/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.css">
		<link rel="stylesheet" href="/sgterp/resources/plugins/jQuery-Tags-Input/jquery.tagsinput.css">
		<link rel="stylesheet" href="/sgterp/resources/plugins/bootstrap-fileupload/bootstrap-fileupload.min.css">
		<link rel="stylesheet" href="/sgterp/resources/plugins/summernote/build/summernote.css">
		<!-- end: CSS REQUIRED FOR THIS PAGE ONLY -->

		<!--[if IE 7]>
		<link rel="stylesheet" href="/sgterp/resources/plugins/font-awesome/css/font-awesome-ie7.min.css">
		<![endif]-->
		<!-- end: MAIN CSS -->
		<!-- start: CSS REQUIRED FOR THIS PAGE ONLY -->
		<!-- end: CSS REQUIRED FOR THIS PAGE ONLY -->
		<link rel="shortcut icon" href="favicon.ico" />
<%
		Map religionList=new HashMap();
		religionList.put("Hindu","Hindu");
		religionList.put("Muslim","Muslim");
		religionList.put("Sikh","Sikh");
		religionList.put("Parsi","Parsi");
		religionList.put("Jain","Jain");
		religionList.put("Buddhist","Buddhist");
		religionList.put("Christian","Christian");
	    pageContext.setAttribute("religionList", religionList);
		%>


	</head>
	<!-- end: HEAD -->
	<!-- start: BODY -->
	<body>
<script>
var checkboxForEmailPic=false; checkboxForEmailSign=false; checkboxForEmailGSign=false;
</script>
		<!-- start: HEADER -->

		<!-- end: HEADER -->
		<!-- start: MAIN CONTAINER -->
					<div class="row">

						<div class="col-sm-12">
							<!-- start: FORM WIZARD PANEL -->
							<div class="panel panel-default">

								<c:if test="${duplicate eq 'duplicate'}">
									<div class="alert alert-block alert-danger" id="emailFailed">
										<button data-dismiss="alert" class="close">
											&times;
										</button>
										<i class="fa fa-times-circle"></i>&nbsp;
									There is a duplicate record with same FirstName,LastName,Dob and FatherName.
									</div>
					</c:if>

								<div class="panel-heading">
									<i class="fa fa-external-link-square"></i>
										<center><spring:message code='studentReg.proRegPro'/><center>
										<% if (!(SecurityUtils.getSubject().hasRole("PROVISIONAL"))) {%>
										<a href="/sgterp/protected/home"><div class="nbutton" style="float:right; margin-right:-1px;" >
                                     <button  class="btn btn-blue " type="button"  style="width:25%; float:right; margin-top:-27px; color:#FFF;">	<i class="fa fa-arrow-circle-left"></i>
                                           <spring:message code='header.home'/>&nbsp;

													</button>
												</div></a>
												<%} else {%>
									<a href="/sgterp/public/backToHome"><div class="nbutton" style="float:right; margin-right:-1px;" >
                                     <button  class="btn btn-blue " type="button"  style="width:25%; float:right; margin-top:-27px; color:#FFF;">	<i class="fa fa-arrow-circle-left"></i>
                                           <spring:message code='header.home'/>&nbsp;

													</button>
												</div></a><%}%>
								</div>
							<div class="panel-body">

									<form:form method="post" action="saveProvReg" enctype="multipart/form-data"  class="smart-wizard form-horizontal" id="form" modelAttribute="provRegForm">
								<div id="wizard" class="swMain">
											<ul>
												<li>
													<a href="#step-1">
														<div class="stepNumber">
															1
														</div>
														<span class="stepDesc">
															<br />
															<small><spring:message code='studentReg.personaldetails'/></small> </span>
													</a>
												</li>
												<li>
													<a href="#step-2">
														<div class="stepNumber">
															2
														</div>
														<span class="stepDesc">
															<br />
															<small><spring:message code='studentReg.educationaldetails'/></small> </span>
													</a>
												</li>

											</ul>
											<div class="progress progress-striped active progress-sm">
												<div aria-valuemax="100" aria-valuemin="0" role="progressbar" class="progress-bar progress-bar-success step-bar">
													<span class="sr-only"><spring:message code='studentReg.completesuccess'/></span>
												</div>
											</div>
	<!--***********************************************Step 1 starts *********************************************************************************-->

								<div id="step-1">
									<div class="col-md-12">
										<div class="col-md-6">
										<c:if test="${prospectusNo!=null}">
											<div class="form-group">
													<label class="col-sm-4 control-label">
														Prospectus No<span class="symbol required"></span>
													</label>
													<div class="col-sm-6">
														<form:input type="hidden" class="form-control alphanumeric-key-only input-sm" id="formNo" path="formNo" />
													</div>
													<div class="col-sm-6">
														<form:input class="form-control alphanumeric-key-only input-sm" id="prospectusNo" value="${prospectusNo}" path="prospectusNo" readonly="true"/>
													</div>
													<div class="col-sm-6">
														<form:input type="hidden" class="form-control alphanumeric-key-only input-sm" id="registrationStatus" path="registrationStatus" value="Provisional" />
													</div>
											</div>
										</c:if>
										<c:if test="${prospectusNo==null}">
											<div class="form-group">
													<label class="col-sm-4 control-label">
														<spring:message code='studentReg.formno'/><span class="symbol required"></span>
													</label>
													<div class="col-sm-6">
														<form:input class="form-control alphanumeric-key-only input-sm" id="formNo" path="formNo" readonly="true"/>
													</div>
													<div class="col-sm-6">
														<form:input type="hidden" class="form-control alphanumeric-key-only input-sm" id="prospectusNo" path="prospectusNo"/>
													</div>
													<div class="col-sm-6">
														<form:input type="hidden" class="form-control alphanumeric-key-only input-sm" id="registrationStatus" path="registrationStatus" value="Provisional" />
													</div>
											</div>
										</c:if>
										</div>

									<div class="col-sm-12">
						<div class="col-sm-8" style="flot; text-align:justify;" >

										<p><h3><spring:message code='studentReg.impInfo'/></h3></p>
											<p style="text-align:justify;">1. Candidates,who have appeared in the qualifying examination and whose results are
											 awaited, may also apply.Such candidates will be &nbsp;&nbsp;&nbsp;considered for provisional admission
											 subject to submission of relevant documents satisfying eligibility conditions at the time of
											  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;counselling.</p>
											<p>2.	Original certificates are required to be submitted at the time of admission.</p>
										<p>	3.	The Application Form will be considered only after the application fee is received.</p>

						</div>
                                  <div class="col-sm-4" style="flot:right;">
								<div class="form-group">
											<div class="col-sm-12">
												<label>
													Image Upload(.jpg,.jpeg,.png,.gif only)
												</label>
												<div class="fileupload fileupload-new" data-provides="fileupload">
													<div class="fileupload-new thumbnail" style="width: 200px; height: 150px;"><img src="/sgterp/resources/provisionalregistration/noteImage/noteImgSize.png" alt=""/><script>checkboxForEmailPic=true;
													</script>
													</div>
													<div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
													<div>
														<span class="btn btn-light-grey btn-file"><span class="fileupload-new"><i class="fa fa-picture-o"></i><spring:message code='studentReg.selectimage'/></span><span class="fileupload-exists"><i class="fa fa-picture-o"></i> Change</span>
														<input type="file" class="imageExtension" onchange="changeCheckboxForEmail();" name="candidatePicFile" id="candidatePicFile" accept=".jpg,.jpeg,.png,.gif" />
														</span>
														<a href="#" class="btn fileupload-exists btn-light-grey" data-dismiss="fileupload">
															<i class="fa fa-times"></i><spring:message code='studentReg.remove'/>
														</a>
                                                        <span  style="display:none; color: #a94442;" class="help-block" for="candidatePicFile"><spring:message code='studentReg.required'/></span>
													</div>
												</div>

											</div>
										</div>

					         </div> </div>
									</div>
												<h3 class="StepTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message code='studentReg.filldetails'/></h3>
									          <div class="col-md-6">

												<div class="form-group">
													<label class="col-sm-4 control-label">
														 Faculty <span class="symbol required"></span>
													</label>
													<div class="col-sm-6">
													<form:select class="form-control input-sm" readonly="true" id="faculty77" path="faculty.facultyId" required="required" style="height:38px;" >
														<form:option value="${provRegForm.faculty.facultyId}">${provRegForm.faculty.facultyName}</form:option>
												    </form:select>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-4 control-label">
														Course <span class="symbol required"></span>
													</label>
													<div class="col-sm-6">

													<form:select class="form-control input-sm " readonly="true"  id="course77" path="course.courseId" required="required" >
														<form:option value="${provRegForm.course.courseId}">${provRegForm.course.courseName}</form:option>

												    </form:select>
													</div>
												</div>

												<div class="form-group">
													<label class="col-sm-4 control-label">
														<spring:message code='makepayment.firstname'/><span class="symbol required"></span>
													</label>
													<div class="col-sm-6">
														<form:input  class="form-control  nameField input-sm" id="firstName" path="firstName" onblur="upperCaseName(this.value,this.id)"  required="required"/>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-4 control-label">
														<spring:message code='studentReg.lastname'/>
													</label>
													<div class="col-sm-6">
														<form:input class="form-control  nameField input-sm" id="lastName" path="lastName" onblur="upperCaseName(this.value,this.id)"/>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-4 control-label">
														<spring:message code='studentReg.dob'/> <span class="symbol required"></span>
													</label>
													<div class="col-sm-6">
														<div class="input-group">
														<form:input id="dob" data-date-format="dd-mm-yyyy" data-date-viewmode="years" path="dob"  class="form-control input-sm date-picker" required="required"/>
														<span class="input-group-addon"> <i class="fa fa-calendar"></i> </span>
													 </div>
													</div>

												</div>
												<div class="form-group">
													<label class="col-sm-4 control-label">
														<spring:message code='studentReg.gender'/>  <span class="symbol required"></span>
													</label>
													<div class="col-sm-6">
													<form:select class="form-control input-sm" id="gender" path="gender" required="required">
														<form:option value="">Select...</form:option>
														<form:option value="Male">Male</form:option>
														<form:option value="Female">Female</form:option>
													</form:select>
													</div>
												</div>
											<div class="form-group">
												<label class="col-sm-4 control-label">
													Category Type<span class="symbol required"></span>
												</label>
												<div class="col-sm-6">
														<form:select id="categoryType"  path="categoryType" class="form-control input-sm" required="required">
																<form:option value="">Select...</form:option>
																<form:option value="SC">SC</form:option>
																<form:option value="ST">ST</form:option>
																<form:option value="OBC">OBC</form:option>
																<form:option value="GENERAL">General</form:option>
															</form:select>
												</div>
										</div>
										<div class="form-group">
											<label class="col-sm-4 control-label">
										 Caste<span class="symbol required"></span>
											</label>
											<div class="col-sm-6">
											<form:input  path="caste" class="form-control input-sm" type="text" required="required"/>
											</div>
										</div>

									</div>

									<div class="col-md-6">
												<div class="form-group">
													<label class="col-sm-4 control-label">
														<spring:message code='studentReg.email'/> <span class="symbol required"></span>
													</label>
													<div class="col-sm-6">
														<form:input type="email"  class="form-control input-sm" id="email" path="email" readonly="true"/>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-4 control-label">
														<spring:message code='studentReg.mobile'/>  <span class="symbol required"></span>
													</label>
													<div class="col-sm-6">
														<form:input class="form-control mobile-number-mask input-sm"  id="mobile" path="mobile" readonly="true" required="required"/>
													</div>
											  </div>

												<div class="form-group">
													<label class="col-sm-4 control-label">
														<spring:message code='studentReg.seattype'/> <span class="symbol required"></span>
													</label>
													<div class="col-sm-6">
													<form:select class="form-control input-sm" id="seatType" path="seatType" required="required">
														<form:option value="">Select...</form:option>
														<form:option value="Regular">Regular</form:option>
														<form:option value="Reserved">Reserved</form:option>
													</form:select>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-4 control-label">
														<spring:message code='studentReg.nationality'/> <span class="symbol required"></span>
													</label>
													<div class="col-sm-6">
														<form:input  class="form-control alphabet-key-only input-sm" id="nationality" path="nationality" required="required" value="Indian"/>
													</div>
												</div>
												<!--<div class="form-group">
													<label class="col-sm-4 control-label">
														Registration No
													</label>
													<div class="col-sm-6">
														<input type="text" class="form-control" id="registration" name="registration" placeholder="Text Field">
													</div>
												</div>-->


												<div class="form-group">
													<label class="col-sm-4 control-label">
														<spring:message code='studentReg.blood'/> 
													</label>
													<div class="col-sm-6">
													<form:select class="form-control input-sm" id="bloodGroup" path="bloodGroup" >
														<form:option value="">Select...</form:option>
														<form:option value="O+">O+</form:option>
														<form:option value="O-">O-</form:option>
														<form:option value="A+">A+</form:option>
														<form:option value="A-">A-</form:option>
														<form:option value="B+">B+</form:option>
														<form:option value="B-">B-</form:option>
														<form:option value="AB+">AB+</form:option>
														<form:option value="AB-">AB-</form:option>
													</form:select>

													</div>
												</div>
												<div class="form-group">
						<label class="col-sm-4 control-label">
							 <spring:message code='Aadhar No' />
						</label>
						<div class="col-sm-6">
							<form:input  class="form-control input-sm number-key-only" id="Aadhar" path="aadhar" maxlength="12" minlength="12"/>
						</div>
					</div>
												<div class="form-group">
													<label class="col-sm-4 control-label">
													<spring:message code='studentReg.religion'/> <span class="symbol required"></span>
													</label>
													<div class="col-sm-6">
														<select  class="form-control alphabet-key-only input-sm" id="religion" required="required" onchange="if(this.value=='Other'){$('#religionDiv').show();$('#religionText').val('');}else{$('#religionDiv').hide();$('#religionText').val(this.value);}">
														<option value=''>Select...</option>
														<c:forEach var="religion" items="${religionList}"><c:if test="${studentFormData.religion==religion.key}">
															<option value="${religion.key}" selected="true">
																${religion.value}
															</option></c:if>
										<c:if test="${studentFormData.religion != religion.key}">
															<option value="${religion.key}">
																${religion.value}
															</option></c:if>
														</c:forEach>
														<option value="Other">Other</option>
</select>
													</div>
												</div>
<div class="form-group" id ="religionDiv">
													<label class="col-sm-4 control-label">
												 Specify<span class="symbol required"></span>
													</label>
													<div class="col-sm-6">
													<form:input  id="religionText" path="religion" class="form-control input-sm" type="text" required="required"/>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-4 control-label">
														<spring:message code='studentReg.areatype'/>   <span class="symbol required"></span>
													</label>
													<div class="col-sm-6">
														<form:select class="form-control input-sm" id="areaType" path="areaType" required="required">
														<form:option value="">Select...</form:option>
														<form:option value="Urban">Urban</form:option>
														<form:option value="Rural">Rural</form:option>
													</form:select>

													</div>
												</div>
<div class="form-group">
											<label class="col-sm-4 control-label">
												Category applied for<span class="symbol required"></span>
											</label>
											<div class="col-sm-6">
												<label class="radio-inline">
													<form:radiobutton value="Haryana" path="categoryLevel" class="grey" required="required"  />
													<spring:message code='studentReg.haryana'/>
												</label>
												<label class="radio-inline">
													<form:radiobutton value="All India" path="categoryLevel" class="grey" required="required"/>
													<spring:message code='studentReg.india'/>
												</label>
											</div>
										</div>
											<div class="form-group">
												<label class="col-sm-4 control-label">
													 Person with Disability<span class="symbol required"></span>
												</label>
												<div class="col-sm-6">
													<label class="radio-inline">
														<form:radiobutton value="1" path="pwd" class="grey" required="required"  />
														Yes
													</label>
													<label class="radio-inline">
														<form:radiobutton value="0" path="pwd" class="grey" required="required"/>
														No
													</label>
												</div>
											</div>


									</div>
								<div class="col-md-12">
									<div class="col-md-6">
										<div class="panel panel-default">

											<div class="panel-heading">
												<i class="fa fa-external-link-square"></i>
													<p style="margin-left:20px;"><spring:message code='studentReg.permanentadd'/> </p>
											</div>
											<div class="panel-body">
												<div class="form-group">
                                                <p></p><p></p><p></p>
													<label class="col-sm-4 control-label">
														<spring:message code='studentReg.address'/><span class="symbol required"></span>
													</label>
													<div class="col-sm-7">
														<form:input  class="form-control  input-sm" id="permanentAddr1" path="permanentAddr1"  required="required"/>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-4 control-label">
													<spring:message code='studentReg.address1'/><span ></span>
													</label>
													<div class="col-sm-7">
														<form:input  class="form-control  input-sm" id="permanentAddr2" path="permanentAddr2"  />
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-4 control-label">
														<spring:message code='studentReg.country'/><span class="symbol required"></span>
													</label>
													<div class="col-sm-7" >
													<form:select class="form-control input-sm " id="permanentCountry"
															     path="permanentCountry" required="required" onchange="changeCountry(this.value,'permanent')" >
														<option value="" >Select...</option>
														<c:forEach var="country" items="${countryList}">
															<form:option value="${country.countryId}">${country.countryName}</form:option>
														</c:forEach>
													</form:select>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-4 control-label" >
														<spring:message code='studentReg.state'/><span class="symbol required"></span>
													</label>
													<div class="col-sm-7">
														<form:select class="form-control input-sm " id="permanentState" path="permanentState" required="required" onchange="changeState(this.value,'permanent')" >
														<option value="" >Select...</option>
														<c:forEach var="state" items="${permanentStateList}">
															<form:option value="${state.stateId}" >${state.stateName}</form:option>
														</c:forEach>
													</form:select>
													</div>
												</div>

												<div class="form-group">
													<label class="col-sm-4 control-label" required>
														<spring:message code='studentReg.district'/><span class="symbol required"></span>
													</label>
													<div class="col-sm-7">
														<form:select class="form-control input-sm " id="permanentCity" path="permanentCity" required="required"  >
														<c:forEach var="city" items="${permanentCityList}">
															<form:option value="${city.cityId}" >${city.cityName}</form:option>
														</c:forEach>
													</form:select>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-4 control-label">
														<spring:message code='studentReg.pincode'/> <span class="symbol required"></span>
													</label>
													<div class="col-sm-7">
														<form:input class="form-control zipcode-mask input-sm" id="permanentPin" path="permanentPin"  required="required"/>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-md-6">
										<div class="panel panel-default">
												<div class="panel-heading">
												<i class="fa fa-external-link-square"></i>

													<p style="margin-left:20px;"><spring:message code='studentReg.coraddress'/>	</p>
											</div>
											<div class="panel-body">

											<div style="margin-left: 2%; margin-top: -10px; ">

			<input  id="copyData" name="sameAsPermanentCheckBox" type="checkbox" value="Y" onclick="fillData(this.id);"> &nbsp;&nbsp; Check this if Same as Permanent Address.

			<ins class="iCheck-helper" ></ins>
			</div>
					<p></p>							<div class="form-group">
													<label class="col-sm-4 control-label">
														<spring:message code='studentReg.address'/>
													</label>
													<div class="col-sm-7">
														<form:input  class="form-control input-sm " id="correspondAddr1" path="correspondAddr1" />
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-4 control-label">
													<spring:message code='studentReg.address1'/>
													</label>
													<div class="col-sm-7">
														<form:input  class="form-control  input-sm" id="correspondAddr2" path="correspondAddr2" />
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-4 control-label">
													<spring:message code='studentReg.country'/>
													</label>
													<div class="col-sm-7">
													<form:select class="form-control input-sm " id="correspondCountry" path="correspondCountry" onchange="changeCountry(this.value,'correspond')" >
													<option value="" >Select...</option>
														<c:forEach var="country" items="${countryList}">
															<form:option value="${country.countryId}">${country.countryName}</form:option>
														</c:forEach>
													</form:select>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-4 control-label">
														<spring:message code='studentReg.state'/>
													</label>
													<div class="col-sm-7">

														<form:select class="form-control input-sm " id="correspondState" path="correspondState" onchange="changeState(this.value,'correspond')
														" >
														<option value="" >Select...</option>
														<c:forEach var="state" items="${correspondStateList}">
															<form:option value="${state.stateId}" >${state.stateName}</form:option>
														</c:forEach>
													</form:select>
													</div>
												</div>

												<div class="form-group">
													<label class="col-sm-4 control-label">
														<spring:message code='studentReg.district'/>
													</label>
													<div class="col-sm-7">
														<form:select class="form-control input-sm " id="correspondCity" path="correspondCity" >
														<c:forEach var="city" items="${correspondCityList}">
															<form:option value="${city.cityId}" >${city.cityName}</form:option>
														</c:forEach>
													</form:select>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-4 control-label">
														<spring:message code='studentReg.pincode'/>
													</label>
													<div class="col-sm-7">
														<form:input  class="form-control zipcode-mask input-sm" id="correspondPin" path="correspondPin" />
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-12">
									<div class="col-md-6">
										<div class="panel panel-default">
											<div class="panel-heading">
												<i class="fa fa-external-link-square"></i>
													<p style="margin-left:20px;"><spring:message code='studentReg.fatherdetails'/></p>
											</div>
											<div class="panel-body">
												<div class="form-group">
													<label class="col-sm-4 control-label">
														<spring:message code='studentReg.father'/><span class="symbol required"></span>
													</label>
													<div class="col-sm-6">
														<form:input  class="form-control input-sm nameField" id="fatherName" path="fatherName" onblur="upperCaseName(this.value,this.id)"  required="required"/>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-4 control-label">
													<spring:message code='studentReg.email'/>
												</label>
													<div class="col-sm-6">
														<form:input type="email" class="form-control input-sm" id="fatherEmail" path="fatherEmail"/>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-4 control-label">
														<spring:message code='studentReg.mobile'/><span class="symbol required"></span>
													</label>
													<div class="col-sm-6">
													<div class="input-group" >
														<span class="input-group-addon"> <i class="fa fa-phone"></i> </span>
														<form:input  id="fatherMobile" path="fatherMobile" class="form-control mobile-number-mask input-sm" required="required"/>
													</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-md-6">
										<div class="panel panel-default">

											<div class="panel-heading">
												<i class="fa fa-external-link-square"></i>
													<p style="margin-left:20px;"><spring:message code='studentReg.motherdetails'/>	</p>
											</div>
											<div class="panel-body">
												<div class="form-group">
													<label class="col-sm-4 control-label">
														<spring:message code='studentReg.mother'/><span class="symbol required"></span>
													</label>
													<div class="col-sm-6">
														<form:input  class="form-control input-sm nameField" id="motherName" path="motherName"  required="required" onblur="upperCaseName(this.value,this.id)"/>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-4 control-label">
													<spring:message code='studentReg.email'/>

													</label>
													<div class="col-sm-6">
														<form:input type="email" class="form-control input-sm" id="motherEmail" path="motherEmail"  />
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-4 control-label">
														<spring:message code='studentReg.mobile'/><span></span>
													</label>
													<div class="col-sm-6">
													<div class="input-group" >
														<span class="input-group-addon"> <i class="fa fa-phone"></i> </span>
														<form:input  id="motherMobile" path="motherMobile" class="form-control mobile-number-mask input-sm" />
													</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
												<div class="form-group">
													<div class="col-sm-2 col-sm-offset-8">
														<button class="btn btn-blue next-step btn-block">
															<spring:message code='pagination.next'/> <i class="fa fa-arrow-circle-right"></i>
														</button>
													</div>
												</div>
								</div>
						<!--Checked step one-->
	<!--************************************************************************************************************************************************************************-->
							<div id="step-2">

								<div class="row">
									<div class="col-sm-12">
												<!-- start: PANLEL TABS -->
										<div class="panel panel-default">
													<div class="panel-heading">
														<i class="fa fa-reorder"></i>
														<spring:message code='studentReg.edudetail'/>
													</div>
											<div class="panel-body">
												<div class="tabbable panel-tabs">
													<ul class="nav nav-tabs">
															<li class="active">
																<a data-toggle="tab" href="#panel_tab_example1">
																	<spring:message code='studentReg.10thstandard'/>
																</a>
															</li>
															<li>
																<a data-toggle="tab" href="#panel_tab_example2">
																	<spring:message code='studentReg.12thstandard'/>
																</a>
															</li>
															<li>
																<a data-toggle="tab" href="#panel_tab_example3">
																	<spring:message code='studentReg.diploma'/>
																</a>
															</li>
															<li>
																<a data-toggle="tab" href="#panel_tab_example4">
																	<spring:message code='studentReg.graduation'/>
																</a>
															</li>
															<li>
																<a data-toggle="tab" href="#panel_tab_example6">
																	<spring:message code='studentReg.postgraduation'/>
																</a>
															</li>
															<li>
																<a data-toggle="tab" href="#panel_tab_example7">
																	<spring:message code='feesubmission.other'/>
																</a>
															</li>
														</ul>

												<div class="panel-body">
													<div class="tabbable panel-tabs">

														<div class="tab-content">
														<div id="panel_tab_example1" class="tab-pane active">
															<div id="10th Standard" class="tab-pane">
																<p>
																<h2 class="StepTitle"><spring:message code='studentReg.10thstandard'/></h2>
															<div class="col-md-6">
																<div class="form-group">
																	<label class="col-sm-3 control-label">
																		<spring:message code='studentReg.board'/>
																	</label>
																	<div class="col-sm-7">
																		<form:input  class="form-control input-sm" id="10thBoard"  path="provisionalRegQual[0].boardUniversity"/>
																	</div>
																</div>
																<div class="form-group">
																	<label class="col-sm-3 control-label">
																		<spring:message code='studentReg.school'/>
																	</label>
																	<div class="col-sm-7">
																		<form:input  class="form-control input-sm capital" id="10thSchool" readonly="true" path="provisionalRegQual[0].schoolCollegeInstitue" />
																	</div>
																</div>
																<div class="form-group">
																	<label class="col-sm-3 control-label">
																		<spring:message code='studentReg.passingyear'/>
																	</label>
																	<div class="col-sm-7">
																		<form:input  class="form-control input-sm number-key-only" maxlength="4" id="10thYear" readonly="true" path="provisionalRegQual[0].yearOfPassing"/>
																	</div>
																</div>
																<div class="form-group">
																	<label class="col-sm-3 control-label">
																	</label>
																	<div class="col-sm-7">
					<form:input type="hidden" value="10th"  class="form-control input-sm" id="" path="provisionalRegQual[0].classStandard"/>


																	</div>
																</div>
															</div>
															<div class="col-md-6">
																<div class="form-group">
																	<label class="col-sm-3 control-label">
																		<spring:message code='studentReg.stream'/>
																	</label>
																	<div class="col-sm-7">
																		<form:input  class="form-control input-sm" id="10thStream" readonly="true" path="provisionalRegQual[0].stream" />
																	</div>
																</div>
																<div class="form-group">
																	<label class="col-sm-3 control-label">
																		<spring:message code='studentReg.subjects'/>
																	</label>
																	<div class="col-sm-7">
																		<form:input  class="form-control input-sm" id="10thSubjects" readonly="true" path="provisionalRegQual[0].subjects" />
																	</div>
																</div>
																<div class="form-group">
																	<label class="col-sm-3 control-label">
																		<spring:message code='result.obtainedmarks'/>
																	</label>
																	<div class="col-sm-7">
																		<form:input  class="form-control input-sm " maxlength="100" id="10thMarks" readonly="true" path="provisionalRegQual[0].obtainedMarks" />
																	</div>
																</div>
																<div class="form-group">
																	<label class="col-sm-3 control-label">
																		<spring:message code='result.maxmarks'/>
																	</label>
																	<div class="col-sm-7">
																		<form:input  class="form-control input-sm" maxlength="100" id="10thAggregates" readonly="true" path="provisionalRegQual[0].maxMarks" />
																	</div>
																</div>
															</div>
																</p>
															</div>
															</div>

															<div id="panel_tab_example2" class="tab-pane">
																<div id="12th Standard" class="tab-pane active">
																<p>
																<h2 class="StepTitle"><spring:message code='studentReg.12thstandard'/></h2>
																<div class="col-md-6">
																<div class="form-group">
																	<label class="col-sm-3 control-label">
																		<spring:message code='studentReg.board'/>
																	</label>
																	<div class="col-sm-7">
																		<form:input  class="form-control input-sm capital" id="12thBoard" path="provisionalRegQual[1].boardUniversity"/>
																	</div>
																</div>
																<div class="form-group">
																	<label class="col-sm-3 control-label">
																		<spring:message code='studentReg.school'/>
																	</label>
																	<div class="col-sm-7">
																		<form:input  class="form-control input-sm capital" id="12thSchool" readonly="true"  path="provisionalRegQual[1].schoolCollegeInstitue" />
																	</div>
																</div>
																<div class="form-group">
																	<label class="col-sm-3 control-label">
																		<spring:message code='studentReg.passing'/>
																	</label>
																	<div class="col-sm-7">
																		<form:input  class="form-control input-sm number-key-only" maxlength="4" id="12thYear" readonly="true"  path="provisionalRegQual[1].yearOfPassing"/>
																	</div>
																</div>
																<div class="form-group">
																	<label class="col-sm-3 control-label">
																	</label>
																	<div class="col-sm-7">
																		<form:input type="hidden" value="12th" class="form-control input-sm" id="" path="provisionalRegQual[1].classStandard"/>
																	</div>
																</div>
															</div>
															<div class="col-md-6">
																<div class="form-group">
																	<label class="col-sm-3 control-label">
																		<spring:message code='studentReg.stream'/>
																	</label>
																	<div class="col-sm-7">
																		<form:input class="form-control input-sm" id="12thStream" readonly="true" path="provisionalRegQual[1].stream" />
																	</div>
																</div>
																<div class="form-group">
																	<label class="col-sm-3 control-label">
																		<spring:message code='studentReg.subjects'/>
																	</label>
																	<div class="col-sm-7">
																		<form:input  class="form-control input-sm" id="12thSubjects" readonly="true" path="provisionalRegQual[1].subjects" />
																	</div>
																</div>
																<div class="form-group">
																	<label class="col-sm-3 control-label">
																		<spring:message code='result.obtainedmarks'/>
																	</label>
																	<div class="col-sm-7">
																		<form:input class="form-control input-sm" maxlength="100" id="12thMarks" readonly="true" path="provisionalRegQual[1].obtainedMarks" />
																	</div>
																</div>
																<div class="form-group">
																	<label class="col-sm-3 control-label">
																		<spring:message code='result.maxmarks'/>
																	</label>
																	<div class="col-sm-7">
																		<form:input  class="form-control input-sm" maxlength="100" id="12thAggregates" readonly="true" path="provisionalRegQual[1].maxMarks" />
																	</div>
																</div>
															</div>
																</p>
															</div>
														</div>


															<div id="panel_tab_example3" class="tab-pane">
																<p>
																<h2 class="StepTitle"><spring:message code='studentReg.diploma'/></h2>
																 <div class="col-md-6">
																<div class="form-group">
																	<label class="col-sm-3 control-label">
																		<spring:message code='studentReg.board'/>
																	</label>
																	<div class="col-sm-7">
																		<form:input  class="form-control input-sm capital" id="diplomaBoard" path="provisionalRegQual[2].boardUniversity"/>
																	</div>
																</div>
																<div class="form-group">
																	<label class="col-sm-3 control-label">
																		<spring:message code='studentReg.school'/>
																	</label>
																	<div class="col-sm-7">
																		<form:input  class="form-control input-sm capital" id="diplomaSchool" readonly="true" path="provisionalRegQual[2].schoolCollegeInstitue" />
																	</div>
																</div>
																<div class="form-group">
																	<label class="col-sm-3 control-label">
																		<spring:message code='studentReg.passing'/>
																	</label>
																	<div class="col-sm-7">
																		<form:input  class="form-control input-sm number-key-only" maxlength="4" id="diplomaYear" readonly="true" path="provisionalRegQual[2].yearOfPassing"/>
																	</div>
																</div>
																<div class="form-group">
																	<label class="col-sm-3 control-label">
																	</label>
																	<div class="col-sm-7">
																		<form:input type="hidden" value="diploma" class="form-control input-sm" id="" path="provisionalRegQual[2].classStandard"/>
																	</div>
																</div>
															</div>
															<div class="col-md-6">
																<div class="form-group">
																	<label class="col-sm-3 control-label">
																		<spring:message code='studentReg.stream'/>
																	</label>
																	<div class="col-sm-7">
																		<form:input  class="form-control input-sm" id="diplomaStream" readonly="true" path="provisionalRegQual[2].stream" />
																	</div>
																</div>
																<div class="form-group">
																	<label class="col-sm-3 control-label">
																		<spring:message code='studentReg.subjects'/>
																	</label>
																	<div class="col-sm-7">
																		<form:input class="form-control input-sm" id="diplomaSubjects" readonly="true" path="provisionalRegQual[2].subjects" />
																	</div>
																</div>
																<div class="form-group">
																	<label class="col-sm-3 control-label">
																	<spring:message code='result.obtainedmarks'/>
																	</label>
																	<div class="col-sm-7">
																		<form:input  class="form-control input-sm" maxlength="100" id="diplomaMarks" readonly="true" path="provisionalRegQual[2].obtainedMarks" />
																	</div>
																</div>
																<div class="form-group">
																	<label class="col-sm-3 control-label">
																		<spring:message code='result.maxmarks'/>
																	</label>
																	<div class="col-sm-7">
																		<form:input  class="form-control input-sm" maxlength="100" id="diplomaAggregates" readonly="true" path="provisionalRegQual[2].maxMarks" />
																	</div>
																</div>
															</div>
																</p>
															</div>

															<div id="panel_tab_example4" class="tab-pane">
																<p>
																<h2 class="StepTitle"><spring:message code='studentReg.graduation'/></h2>
																<div class="col-md-6">
																<div class="form-group">
																	<label class="col-sm-3 control-label">
																		<spring:message code='studentReg.board'/>
																	</label>
																	<div class="col-sm-7">
																		<form:input  class="form-control input-sm capital" id="graduationBoard" path="provisionalRegQual[3].boardUniversity"/>
																	</div>
																</div>
																<div class="form-group">
																	<label class="col-sm-3 control-label">
																		<spring:message code='studentReg.school'/>
																	</label>
																	<div class="col-sm-7">
																		<form:input  class="form-control input-sm capital" id="graduationSchool" readonly="true" path="provisionalRegQual[3].schoolCollegeInstitue" />
																	</div>
																</div>
																<div class="form-group">
																	<label class="col-sm-3 control-label">
																		<spring:message code='studentReg.passing'/>
																	</label>
																	<div class="col-sm-7">
																		<form:input  class="form-control input-sm number-key-only" maxlength="4" id="graduationYear" readonly="true" path="provisionalRegQual[3].yearOfPassing"/>
																	</div>
																</div>
																<div class="form-group">
																	<label class="col-sm-3 control-label">
																	</label>
																	<div class="col-sm-7">
																		<form:input type="hidden" value="graduation" class="form-control input-sm" id="" path="provisionalRegQual[3].classStandard"/>
																	</div>
																</div>
															</div>
															<div class="col-md-6">
																<div class="form-group">
																	<label class="col-sm-3 control-label">
																		<spring:message code='studentReg.stream'/>
																	</label>
																	<div class="col-sm-7">
																		<form:input class="form-control input-sm" id="graduationStream" readonly="true" path="provisionalRegQual[3].stream" />
																	</div>
																</div>
																<div class="form-group">
																	<label class="col-sm-3 control-label">
																		<spring:message code='studentReg.subjects'/>
																	</label>
																	<div class="col-sm-7">
																		<form:input  class="form-control input-sm" id="graduationSubjects" readonly="true" path="provisionalRegQual[3].subjects" />
																	</div>
																</div>
																<div class="form-group">
																	<label class="col-sm-3 control-label">
																		<spring:message code='result.obtainedmarks'/>
																	</label>
																	<div class="col-sm-7">
																		<form:input  class="form-control input-sm" maxlength="100" id="graduationMarks" readonly="true" path="provisionalRegQual[3].obtainedMarks" />
																	</div>
																</div>
																<div class="form-group">
																	<label class="col-sm-3 control-label">
																		<spring:message code='result.maxmarks'/>
																	</label>
																	<div class="col-sm-7">
																		<form:input  class="form-control input-sm" maxlength="100" id="graduationAggregates" readonly="true" path="provisionalRegQual[3].maxMarks" />
																	</div>
																</div>
															</div>
																</p>
															</div>

															<div id="panel_tab_example6" class="tab-pane">
																<p>
																<h2 class="StepTitle"><spring:message code='studentReg.postgraduation'/></h2>
																<div class="col-md-6">
																<div class="form-group">
																	<label class="col-sm-3 control-label">
																		<spring:message code='studentReg.board'/>
																	</label>
																	<div class="col-sm-7">
																		<form:input  class="form-control input-sm capital" id="postGradBoard" path="provisionalRegQual[4].boardUniversity"/>
																	</div>
																</div>
																<div class="form-group">
																	<label class="col-sm-3 control-label">
																		<spring:message code='studentReg.school'/>
																	</label>
																	<div class="col-sm-7">
																		<form:input  class="form-control input-sm capital" id="postGradSchool" readonly="true" path="provisionalRegQual[4].schoolCollegeInstitue" />
																	</div>
																</div>
																<div class="form-group">
																	<label class="col-sm-3 control-label">
																		<spring:message code='studentReg.passing'/>
																	</label>
																	<div class="col-sm-7">
																		<form:input  class="form-control input-sm number-key-only" maxlength="4" id="postGradYear" readonly="true" path="provisionalRegQual[4].yearOfPassing"/>
																	</div>
																</div>
																<div class="form-group">
																	<label class="col-sm-3 control-label">
																	</label>
																	<div class="col-sm-7">
																		<form:input type="hidden" value="postgraduation" class="form-control input-sm" id="phone" path="provisionalRegQual[4].classStandard"/>
																	</div>
																</div>
															</div>
															<div class="col-md-6">
																<div class="form-group">
																	<label class="col-sm-3 control-label">
																	<spring:message code='studentReg.stream'/>
																	</label>
																	<div class="col-sm-7">
																		<form:input  class="form-control input-sm" id="postGradStream" readonly="true" path="provisionalRegQual[4].stream" />
																	</div>
																</div>
																<div class="form-group">
																	<label class="col-sm-3 control-label">
																		<spring:message code='studentReg.subjects'/>
																	</label>
																	<div class="col-sm-7">
																		<form:input  class="form-control input-sm" id="postGradSubjects" readonly="true" path="provisionalRegQual[4].subjects" />
																	</div>
																</div>
																<div class="form-group">
																	<label class="col-sm-3 control-label">
																		<spring:message code='result.obtainedmarks'/>
																	</label>
																	<div class="col-sm-7">
																		<form:input  class="form-control input-sm" maxlength="100" id="postGradMarks" readonly="true" path="provisionalRegQual[4].obtainedMarks" />
																	</div>
																</div>
																<div class="form-group">
																	<label class="col-sm-3 control-label">
																		<spring:message code='result.maxmarks'/>
																	</label>
																	<div class="col-sm-7">
																		<form:input  class="form-control input-sm" maxlength="100" id="postGradAggregates" readonly="true" path="provisionalRegQual[4].maxMarks" />
																	</div>
																</div>
															</div>
																</p>
															</div>


															<div id="panel_tab_example7" class="tab-pane">
																<p>
																<h2 class="StepTitle"><spring:message code='feesubmission.other'/></h2>
																<div class="col-md-6">
																<div class="form-group">
																	<label class="col-sm-3 control-label">
																	<spring:message code='studentReg.board'/>
																	</label>
																	<div class="col-sm-7">
																		<form:input  class="form-control capital input-sm" id="othersBoard" path="provisionalRegQual[5].boardUniversity"/>
																	</div>
																</div>
																<div class="form-group">
																	<label class="col-sm-3 control-label">
																		<spring:message code='studentReg.school'/>
																	</label>
																	<div class="col-sm-7">
																		<form:input  class="form-control capital input-sm" id="othersSchool" readonly="true" path="provisionalRegQual[5].schoolCollegeInstitue" />
																	</div>
																</div>
																<div class="form-group">
																	<label class="col-sm-3 control-label">
																		<spring:message code='studentReg.passing'/>
																	</label>
																	<div class="col-sm-7">
																		<form:input  class="form-control number-key-only input-sm" maxlength="4" id="othersYear" readonly="true" path="provisionalRegQual[5].yearOfPassing"/>
																	</div>
																</div>
																<div class="form-group">
																	<label class="col-sm-3 control-label">
																	</label>
																	<div class="col-sm-7">
																		<form:input type="hidden" value="other" class="form-control input-sm" id="" path="provisionalRegQual[5].classStandard"/>
																	</div>
																</div>
															</div>
															<div class="col-md-6">
																<div class="form-group">
																	<label class="col-sm-3 control-label">
																		<spring:message code='studentReg.stream'/>
																	</label>
																	<div class="col-sm-7">
																		<form:input  class="form-control input-sm" id="othersStream" readonly="true" path="provisionalRegQual[5].stream" />
																	</div>
																</div>
																<div class="form-group">
																	<label class="col-sm-3 control-label">
																		<spring:message code='studentReg.subjects'/>
																	</label>
																	<div class="col-sm-7">
																		<form:input  class="form-control input-sm" id="othersSubjects" readonly="true" path="provisionalRegQual[5].subjects" />
																	</div>
																</div>
																<div class="form-group">
																	<label class="col-sm-3 control-label">
																		<spring:message code='result.obtainedmarks'/>
																	</label>
																	<div class="col-sm-7">
																		<form:input class="form-control input-sm " maxlength="100" id="othersMarks" readonly="true" path="provisionalRegQual[5].obtainedMarks" />
																	</div>
																</div>
																<div class="form-group">
																	<label class="col-sm-3 control-label">
																		<spring:message code='result.maxmarks'/>
																	</label>
																	<div class="col-sm-7">
																		<form:input class="form-control input-sm " maxlength="100" id="othersAggregates" readonly="true" path="provisionalRegQual[5].maxMarks" />
																	</div>
																</div>
															</div>
																</p>
															</div>
														</div>
													</div>
												</div>

												</div>
											<!-- end: PANLEL TABS -->
											</div>
										</div>

											<!-- end: PANLEL TABS -->
									</div>
									<h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message code='studentReg.qualificationexam'/></h3>

										<div class="row">

											<div class="col-md-6">
												<div class="form-group">
													<label class="col-sm-3 control-label">
														<spring:message code='studentReg.candidatetype'/>
													</label>
													<div class="col-sm-7">
													    <form:select class="form-control input-sm" id="country" path="qualCandType">
															<form:option value="">Select..</form:option>
															<form:option value="Reserved">Reserved</form:option>
															<form:option value="Regular">Regular</form:option>
														</form:select>
													</div>
												</div>
										    </div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="col-sm-3 control-label">
														<spring:message code='studentReg.category'/>
													</label>
													<div class="col-sm-7">
														<form:select class="form-control input-sm" id="country"
														                                           path="qualCandCategory">
															<form:option value="">Select..</form:option>
															<form:option value="SC">SC</form:option>
															<form:option value="OBC">OBC</form:option>
															<form:option value="GENERAL">General</form:option>
														</form:select>
													</div>
												</div>
											</div>
										</div>


														    <div class="col-sm-12">
																<div class="tabbable">
																		<ul id="myTab4" class="nav nav-tabs tab-padding tab-space-3 tab-blue">

																				<li class="active">
																					<a href="#panel_tab3_example1" data-toggle="tab">
																						<spring:message code='studentReg.entranceexam1'/>
																					</a>
																				</li>
																				<li>
																					<a href="#panel_tab3_example2" data-toggle="tab">
																						<spring:message code='studentReg.entranceexam2'/>
																					</a>
																				</li>
																			</ul>
																			<div class="tab-content">
																			<div class="tab-pane active" id="panel_tab3_example1">
																				<div class="form-group">
																	            <label class="col-sm-3 control-label">
																		         <spring:message code='studentReg.exam'/>
																	            </label>
																	            <div class="col-sm-7">
																		        <form:input  class="form-control capital input-sm" id="qualExam1" path="qualExam1" />
																	            </div>
																               </div>
																			   <div class="form-group">
																	            <label class="col-sm-3 control-label">
																		         <spring:message code='studentReg.marks'/>
																	            </label>
																	            <div class="col-sm-7">
																		        <form:input class="form-control real-number-key-only input-sm" maxlength="5" id="qualExamMarks1" path="qualExamMarks1" />
																	            </div>
																               </div>
																			   <div class="form-group">
																	            <label class="col-sm-3 control-label">
																		         <spring:message code='studentReg.roll'/>
																	            </label>
																	            <div class="col-sm-7">
																		        <form:input  class="form-control input-sm" id="qualExamRollNo1" path="qualExamRollNo1" />
																	            </div>
																               </div>


																			</div>
																			<div class="tab-pane" id="panel_tab3_example2">
																				<div class="form-group">
																	            <label class="col-sm-3 control-label">
																		         <spring:message code='studentReg.exam'/>
																	            </label>
																	            <div class="col-sm-7">
																		        <form:input  class="form-control capital input-sm" id="qualExam2" path="qualExam2" />
																	            </div>
																               </div>
																			   <div class="form-group">
																	            <label class="col-sm-3 control-label">
																		         <spring:message code='studentReg.marks'/>
																	            </label>
																	            <div class="col-sm-7">
																		        <form:input  class="form-control real-number-key-only input-sm" maxlength="5" id="qualExamMarks2" path="qualExamMarks2" />
																	            </div>
																               </div>
																			   <div class="form-group">
																	            <label class="col-sm-3 control-label">
																		         <spring:message code='studentReg.roll'/>
																	            </label>
																	            <div class="col-sm-7">
																		        <form:input class="form-control input-sm" id="qualExamRollNo2" path="qualExamRollNo2" />
																	            </div>
																               </div>
																			</div>
																		</div>
																</div>
															</div>
															 <div class="col-sm-6" style="flot:left;">
																<div class="form-group">
											<div class="col-sm-6"style="margin-left: 50%;">
												<label>
													<spring:message code='registration.studentSign'/>
												</label>
												<div class="fileupload fileupload-new" data-provides="fileupload">
													<div class="fileupload-new thumbnail" style="width: 200px; height: 150px;"><img src="/sgterp/resources/provisionalregistration/noteImage/noteSignImgSize.png" alt=""/><script> checkboxForEmailSign=true;
													</script>
													</div>
													<div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
													<div>
														<span class="btn btn-light-grey btn-file"><span class="fileupload-new"><i class="fa fa-picture-o"></i> <spring:message code='studentReg.selectimage'/></span><span class="fileupload-exists"><i class="fa fa-picture-o"></i> Change</span>
															<input type="file" class="signImageExtension" onchange="changeCheckboxForEmail();"  name="candidateSignFile" id="ssignature" accept=".jpg,.jpeg,.png,.gif"/>
														</span>
														<a href="#" class="btn fileupload-exists btn-light-grey" data-dismiss="fileupload">
															<i class="fa fa-times"></i> <spring:message code='studentReg.remove'/>
														</a>
                                                         <span  style="display:none; color: #a94442;" class="help-block" for="ssignature"><spring:message code='studentReg.required'/></span>
													</div>
												</div>

											</div>
										</div>

															 </div>
															    <div class="col-sm-6" style="flot:right;">
								<div class="form-group">
											<div class="col-sm-6"style="margin-left: 20%;">
												<label>
													<spring:message code='registration.guardianSign'/>
												</label>
												<div class="fileupload fileupload-new" data-provides="fileupload">
													<div class="fileupload-new thumbnail" style="width: 200px; height: 150px;"><img src="/sgterp/resources/provisionalregistration/noteImage/noteSignImgSize.png" alt=""/><script>checkboxForEmailGSign=true;
													</script>
													</div>
													<div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
													<div>
														<span class="btn btn-light-grey btn-file"><span class="fileupload-new"><i class="fa fa-picture-o"></i>  <spring:message code='studentReg.selectimage'/></span><span class="fileupload-exists"><i class="fa fa-picture-o"></i> Change</span>
															<input type="file" class="signImageExtension" onchange="changeCheckboxForEmail();"  name="guardianSignFile" id="gsignature" accept=".jpg,.jpeg,.png,.gif"/>
														</span>
														<a href="#" class="btn fileupload-exists btn-light-grey" data-dismiss="fileupload">
															<i class="fa fa-times"></i> <spring:message code='studentReg.remove'/>
														</a>
                                                        <span  style="display:none; color: #a94442;" class="help-block" for="gsignature"><spring:message code='studentReg.required'/></span>
													</div>
												</div>

											</div>
										</div>

					         </div>
<div style="margin-left: 2%;">

			<input name="emailForPic" id="emailForPic" readonly="readonly" style="pointer-events:none;cursor:default;" type="checkbox"> &nbsp;&nbsp; <spring:message code='email.send.when.no.image'/>
			<ins class="iCheck-helper" ></ins>
			</div><br/><br/>
															 </div>


																<div class="form-group">
																	<div class="col-sm-2 col-sm-offset-3">
																		<button class="btn btn-blue back-step btn-block">
																			<i class="fa fa-circle-arrow-left"></i> Previous
																		</button>
																	</div>
																	<div class="col-sm-2 col-sm-offset-3" style="margin-left:18%">
																	<input type="submit" value="Finish" class="btn btn-blue btn-block"/>

																	</div>

																</div>
	                        </div></div>
							<!--Step 2 ends -->

							<!--***********************************************************************************************************************************************************************-->

							<!--***********************************************************************************************************************************************************************-->
										<div class="footer-items btn-blue" style="margin-right:2%;">
                          <span class="go-top btn-blue ">
                         <i class="clip-chevron-up  btn-blue"></i>
                       </span>
                         </div>


									</form:form>
									</div>
							</div>
						</div>
					</div>

		<script src="/sgterp/resources/plugins/jQuery-lib/2.0.3/jquery.min.js"></script>
		<script src="/sgterp/resources/plugins/jquery-ui/jquery-ui-1.10.2.custom.min.js"></script>
		<script src="/sgterp/resources/plugins/bootstrap/js/bootstrap.min.js"></script>
		<script src="/sgterp/resources/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js"></script>
		<script src="/sgterp/resources/plugins/blockUI/jquery.blockUI.js"></script>
		<script src="/sgterp/resources/plugins/iCheck/jquery.icheck.min.js"></script>
		<script src="/sgterp/resources/plugins/perfect-scrollbar/src/jquery.mousewheel.js"></script>
		<script src="/sgterp/resources/plugins/perfect-scrollbar/src/perfect-scrollbar.js"></script>
		<script src="/sgterp/resources/plugins/less/less-1.5.0.min.js"></script>
		<script src="/sgterp/resources/plugins/jquery-cookie/jquery.cookie.js"></script>
		<script src="/sgterp/resources/plugins/bootstrap-colorpalette/js/bootstrap-colorpalette.js"></script>
		<script src="/sgterp/resources/js/main.js"></script>
		<script src="/sgterp/resources/plugins/jquery-validation/dist/jquery.validate.min.js"></script>
		<script src="/sgterp/resources/plugins/jQuery-Smart-Wizard/js/jquery.smartWizard.js"></script>
		<script src="/sgterp/resources/js/form-wizard.js"></script>

		<!-- start: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
		<script src="/sgterp/resources/plugins/jquery-inputlimiter/jquery.inputlimiter.1.3.1.min.js"></script>
		<script src="/sgterp/resources/plugins/autosize/jquery.autosize.min.js"></script>
		<script src="/sgterp/resources/plugins/select2/select2.min.js"></script>
		<script src="/sgterp/resources/plugins/jquery.maskedinput/src/jquery.maskedinput.js"></script>
		<script src="/sgterp/resources/plugins/jquery-maskmoney/jquery.maskMoney.js"></script>
		<script src="/sgterp/resources/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
		<script src="/sgterp/resources/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
		<script src="/sgterp/resources/plugins/bootstrap-daterangepicker/moment.min.js"></script>
		<script src="/sgterp/resources/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
		<script src="/sgterp/resources/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
		<script src="/sgterp/resources/plugins/bootstrap-colorpicker/js/commits.js"></script>
		<script src="/sgterp/resources/plugins/jQuery-Tags-Input/jquery.tagsinput.js"></script>
		<script src="/sgterp/resources/plugins/bootstrap-fileupload/bootstrap-fileupload.min.js"></script>
		<script src="/sgterp/resources/plugins/summernote/build/summernote.min.js"></script>
		<script src="/sgterp/resources/plugins/ckeditor/ckeditor.js"></script>
		<script src="/sgterp/resources/plugins/ckeditor/adapters/jquery.js"></script>
		<script src="/sgterp/resources/js/form-elements.js"></script>
		<script src="/sgterp/resources/js/registration/registration.js"></script>
		<script src="/sgterp/resources/js/registration/location.js"></script>
		<script src="/sgterp/resources/js/registration/prospectus.js"></script>
		<script>
			jQuery(document).ready(function() {
				Main.init();
				FormWizard.init();
				FormElements.init();
			});
		</script>

		<script>
		
				QualTabs();
				religionSelect();
				
			function fillData(id)
			{
			if($('#'+id).prop('checked'))
			{
			$("#correspondAddr1").val($("#permanentAddr1").val());
			$("#correspondAddr1").attr("disabled","disabled");
			$("#correspondAddr2").val($("#permanentAddr2").val());
			$("#correspondAddr2").attr("disabled","disabled");
			$("#correspondCountry").val($("#permanentCountry").val());
			$("#correspondCountry").attr("disabled","disabled");
			$("#correspondState").val($("#permanentState").val());
			$("#correspondState").attr("disabled","disabled");
			var countryId=$("#permanentCountry").val();
			var stateId=$("#permanentState").val();
			var cityId=$("#permanentCity").val();


			$.ajax({
					url: "sameAsPermanentState",
					type: "POST",
					data: "countryId="+countryId,
					success: function(data) {
				            state=document.getElementById("correspondState");
							state.options.length=0;
							for(var k=0;k<data.length;k++)
							{
								opt=document.createElement('option');
								opt.value=data[k].stateId;
								opt.text=data[k].stateName;
								if(stateId==data[k].stateId){
								opt.selected=true;}
								state.add(opt);
							}
							state.selectmenu("refresh");

						},
					error: function(data){
						//alert("error in data fetching");
					}
					});


			$.ajax({
					url: "sameAsPermanentCity",
					type: "POST",
					data: "stateId="+stateId,
					success: function(data) {
				            city=document.getElementById("correspondCity");
							city.options.length=0;
							for(var k=0;k<data.length;k++)
							{
								opt=document.createElement('option');
								opt.value=data[k].cityId;
								opt.text=data[k].cityName;
								if(cityId==data[k].cityId){
								opt.selected=true;}
								city.add(opt);
							}
							city.selectmenu("refresh");

						},
					error: function(data){
						//alert("error in data fetching");
					}
					});

			$("#correspondCity").val($("#permanentCity").val());
			$("#correspondCity").attr("disabled","disabled");
			$("#correspondPin").val($("#permanentPin").val());
			$("#correspondPin").attr("disabled","disabled");
			}
			else
			{
			$("#correspondAddr1").val("");
			$("#correspondAddr1").removeAttr("disabled");
			$("#correspondAddr2").val("");
			$("#correspondAddr2").removeAttr("disabled");
			$("#correspondCountry").val("");
			$("#correspondCountry").removeAttr("disabled");
			$("#correspondState").removeAttr("disabled");
			state=document.getElementById("correspondState");
			state.options.length=0;
			opt=document.createElement('option');
			opt.value="";
			opt.text="Select...";
			state.add(opt);



			$("#correspondCity").removeAttr("disabled");
			city=document.getElementById("correspondCity");
			city.options.length=0;
			opt=document.createElement('option');
			opt.value="";
			opt.text="Select...";
			city.add(opt);
			$("#correspondPin").val("");
			$("#correspondPin").removeAttr("disabled");
			city.selectmenu('refresh');
			}
			}

		</script>

	<!-- <script language="javascript">
	$( ".capital" ).bind( "keyup", function(e) {
 var str = $( this ).val();
  if(str && str.length >=1){
  var firstChar = str.charAt(0);
  var remainingStr = str.slice(1);
  str= firstChar.toUpperCase() + remainingStr;
  }

 $( this ).val(str);
});


</script>	 -->
<script type="text/javascript">

   $('.imageExtension').change( function() {

    var ext = $(this).val().split('.').pop().toLowerCase();
    if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
      $(this).val("");
        alert('Image must be jpg, jpeg, gif or png');
    }else{
	var fileSize = this.files[0];
    var sizeInMb = fileSize.size/1024;
    var sizeLimit= 1024*1;
    if (sizeInMb > sizeLimit) {
	 $(this).val("");
	alert("Uploaded image size must be less than 1 MB");
    }
    }
   });

</script>
<script type="text/javascript">

   $('.signImageExtension').change( function() {

    var ext = $(this).val().split('.').pop().toLowerCase();
    if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
      $(this).val("");
       alert('Image must be jpg, jpeg, gif or png');
    }else{
	var fileSize = this.files[0];
    var sizeInMb = fileSize.size/1024;
    var sizeLimit= 100*1;
    if (sizeInMb > sizeLimit) {
	 $(this).val("");
	alert("Uploaded image size must be less than 100 KB");
    }
    }
   });

</script>
    <script>
		var specialKeys = new Array();
        specialKeys.push(8); //Backspace
        function IsNumeric(event)
       {
			if(event.shiftKey)
			{
				event.preventDefault();
									}
									// Allow only decimal, backspace and delete
									else if ( event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37|| event.keyCode == 39)
									{
										// let it happen, don't do anything
									}
									else
									{
										// Ensure that it is a REAL NUMBER and stop the keypress
										if ((event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105))
										{
											event.preventDefault();
										}
			}
		}
        </script>


	</body>
	<!-- end: BODY -->
</html>
<script>
function religionSelect(){
if ($('#religion').val()==$('#religionText').val() && $('#religion').val()!="Other")
$('#religionDiv').hide();
}
</script>
