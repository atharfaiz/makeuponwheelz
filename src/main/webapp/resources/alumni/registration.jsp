<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.*" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page import="org.apache.shiro.SecurityUtils"%>
<!DOCTYPE html>

<html lang="en" class="no-js">
	<head>
		<script type="text/javascript" src="/sgterp/resources/js/registration/jquery.maskedinput.js"></script>
		<script type="text/javascript" src="/sgterp/resources/js/registration/custom.validation.masking.js"></script>
		<script src="/sgterp/resources/js/registration/state.js"></script>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta content="" name="description" />
		<meta content="" name="author" />
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
		<link rel="stylesheet" href="/sgterp/resources/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css">
		<link rel="stylesheet" href="/sgterp/resources/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css">
		<link rel="stylesheet" href="/sgterp/resources/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.css">
		<link rel="stylesheet" href="/sgterp/resources/plugins/jQuery-Tags-Input/jquery.tagsinput.css">
		<link rel="stylesheet" href="/sgterp/resources/plugins/summernote/build/summernote.css">
		<!-- end: CSS REQUIRED FOR THIS PAGE ONLY -->

		<!--[if IE 7]>
		<link rel="stylesheet" href="/sgterp/resources/plugins/font-awesome/css/font-awesome-ie7.min.css">
		<![endif]-->
		<!-- end: MAIN CSS -->
		<!-- start: CSS REQUIRED FOR THIS PAGE ONLY -->
		<!-- end: CSS REQUIRED FOR THIS PAGE ONLY -->
		<link rel="shortcut icon" href="favicon.ico" />

	</head>
	<!-- end: HEAD -->
	<!-- start: BODY -->
	<body >
	<script>
		registrationNo="";
	</script>
		<div class="row" <% if (SecurityUtils.getSubject().getPrincipal()!=null){%> style="margin-top:2%"<%}%>>
			<div class="col-sm-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<i class="fa fa-external-link-square"></i>
						<spring:message code='alumni'/>
						<% if (SecurityUtils.getSubject().getPrincipal()==null){%>
						<a href="/sgterp/public/backToHome"><div class="nbutton" style="float:right; margin-right:-1px;" >
							<button  class="btn btn-blue " type="button"  style="width:25%; float:right; margin-top:-2%; color:#FFF;">	<i class="fa fa-arrow-circle-left"></i><spring:message code='header.home'/>&nbsp;</button></div>
						</a><%}%>
					</div>
					<div class="panel-body">
						<form method="post" action="/sgterp/resources/saveAlumniRegistration" enctype="multipart/form-data"  class="smart-wizard form-horizontal">
							<div class="swMain">
		<!--***********************************************Step 1 starts *********************************************************************************-->

								<div>
								<% if (SecurityUtils.getSubject().getPrincipal()==null){%>
								<h3 class="StepTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message code='studentReg.filldetails'/></h3><%}%>
									  <div class="col-md-6">
									  <c:if test="${alumni!=null}">
										<input type="hidden" name="alumniId" value="${alumni.alumniId}" />
									  </c:if>
										<div class="form-group">
											<label class="col-sm-4 control-label">
												<spring:message code='registrationNo'/> <span class="symbol required"></span>
											</label>
											<div class="col-sm-6">
												<input  class="form-control input-sm" name="registrationNo" <c:if test="${alumni!=null}"> value="${alumni.registrationNo}" </c:if> <c:if test="${registrationNo!=null}"> value="${registrationNo}" </c:if> required="required" readonly />
											</div>
										</div>
										<c:if test="${alumni!=null}">
										<fmt:formatDate var="year" value="${alumni.passingYear}" pattern="yyyy" />
										<script>
											registrationNo="${alumni.registrationNo}";
										</script>
										</c:if>
										<div class="form-group">
											<label class="col-sm-4 control-label">
												<spring:message code='YearOfJoining'/> <span class="symbol required"></span>
											</label>
											<div class="col-sm-6">
												<div class="input-group">
													<input id="passingYearAlumni" name="passingYearAlumni" data-date-format="yyyy"  <c:if test="${alumni!=null}">readonly="true" value="${year}"</c:if> data-date-viewmode="years" class="form-control input-sm date-picker-year" required="required"/>
													<span class="input-group-addon"> <i class="fa fa-calendar"></i> </span>
												</div>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-4 control-label">
												 Faculty <span class="symbol required"></span>
											</label>
											<div class="col-sm-6">
												<select class="form-control input-sm search-select"  id="faculty77" <c:if test="${alumni!=null}">readonly="true"</c:if> name="faculty.facultyId"  onchange="facultyChange(this.value);">
													<c:if test="${alumni==null}"> 
													<option value="">Select...</option>
													<c:forEach var="faculty" items="${facultyList}">
													<option value="${faculty.facultyId}">${faculty.facultyName}</option>
													</c:forEach>
													</c:if>
													<c:if test="${alumni!=null}">
													<option value="${alumni.course.faculty.facultyId}">${alumni.course.faculty.facultyName}</option>
													</c:if>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-4 control-label">
												Course <span class="symbol required"></span>
											</label>
											<div class="col-sm-6">
												<select class="form-control input-sm search-select "  <c:if test="${alumni!=null}">readonly="true"</c:if> id="course77" name="course.courseId" required="required" >
													<c:if test="${alumni==null}"> 
													<option value="">Select...</option>
													<c:forEach var="course" items="${courseList}">
													<option value="${course.courseId}">${course.courseName}</option>
													</c:forEach>
													</c:if>
													<c:if test="${alumni!=null}">
													<option value="${alumni.course.courseId}">${alumni.course.courseName}</option>
													</c:if>
												</select>
											</div>
										</div>
										
										<div class="form-group">
											<label class="col-sm-4 control-label">
												<spring:message code='makepayment.firstname'/><span class="symbol required"></span>
											</label>
											<div class="col-sm-6">
												<input  class="form-control  nameField input-sm" id="firstName" name="firstName" onblur="upperCaseName(this.value,this.id)" <c:if test="${alumni!=null}">readonly="true" value="${alumni.firstName}"</c:if>  required="required"/>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-4 control-label">
												<spring:message code='studentReg.lastname'/>
											</label>
											<div class="col-sm-6">
												<input class="form-control  nameField input-sm" id="lastName" <c:if test="${alumni!=null}">readonly="true" value="${alumni.lastName}"</c:if> name="lastName" onblur="upperCaseName(this.value,this.id)"/>
											</div>
										</div>
										<c:if test="${alumni!=null}">
										<fmt:formatDate var="dob" value="${alumni.dob}" pattern="dd-MM-yyyy" />
										</c:if>
										<div class="form-group">
											<label class="col-sm-4 control-label">
												<spring:message code='studentReg.dob'/> <span class="symbol required"></span>
											</label>
											<div class="col-sm-6">
												<div class="input-group">
												<input id="dob" name="dobAlumni" data-date-format="dd-mm-yyyy"  <c:if test="${alumni!=null}">readonly="true" value="${dob}"</c:if> data-date-viewmode="years" class="form-control input-sm date-picker" required="required"/>
												<span class="input-group-addon"> <i class="fa fa-calendar"></i> </span>
											 </div>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-4 control-label">
												<spring:message code='studentReg.gender'/>  <span class="symbol required"></span>
											</label>
											<div class="col-sm-6">
												<select class="form-control input-sm" id="gender" name="gender" <c:if test="${alumni!=null}">readonly="true"</c:if> required="required">
													<c:if test="${alumni==null}"> 
													<option value="">Select...</option>
													<option value="Male">Male</option>
													<option value="Female">Female</option>
													</c:if>
													<c:if test="${alumni!=null}">
													<option value="${alumni.gender}">${alumni.gender}</option>
													</c:if>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-4 control-label">
												<spring:message code='studentReg.email'/> <span class="symbol required"></span>
											</label>
											<div class="col-sm-6">
												<input type="email"  class="form-control input-sm" id="email" name="email"  <c:if test="${alumni!=null}"> value="${alumni.email}"</c:if> required="required"/>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-4 control-label">
												<spring:message code='studentReg.mobile'/>  <span class="symbol required"></span>
											</label>
											<div class="col-sm-6">
												<input class="form-control mobile-number-mask input-sm"  id="mobile"  name="mobileNum" <c:if test="${alumni!=null}"> value="${alumni.mobileNum}"</c:if> required="required"/>
											</div>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
										<label class="col-sm-4 control-label">
											</label>
											<div class="col-sm-8">
												<label>
													Image Upload(.jpg,.jpeg,.png,.gif only)
												</label>
												<div class="fileupload fileupload-new" data-provides="fileupload">
													<div class="fileupload-new thumbnail" style="width: 200px; height: 150px;"><img  <c:if test="${alumni==null || alumni.picPath eq '' || alumni.picPath==null}"> src="/sgterp/resources/provisionalregistration/noteImage/noteImgSize.png"</c:if>  <c:if test="${alumni!=null && !(alumni.picPath eq '') && alumni.picPath!=null}">src="${alumni.picPath}"</c:if> alt=""/>
													</div>
													<div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
													<div>
														<span class="btn btn-light-grey btn-file"><span class="fileupload-new"><i class="fa fa-picture-o"></i><spring:message code='studentReg.selectimage'/></span><span class="fileupload-exists"><i class="fa fa-picture-o"></i> Change</span>
														<input type="file" class="imageExtension" name="alumniPicPath" id="candidatePicFile" accept=".jpg,.jpeg,.png,.gif" />
														<input type="hidden" name="picPath" <c:if test="${alumni!=null}">readonly="true" value="${alumni.picPath}"</c:if>/>
														</span>
														<a href="#" class="btn fileupload-exists btn-light-grey" data-dismiss="fileupload">
															<i class="fa fa-times"></i><spring:message code='studentReg.remove'/>
														</a>
														<span  style="display:none; color: #a94442;" class="help-block" for="candidatePicFile"><spring:message code='studentReg.required'/></span>
													</div>
												</div>
											</div>
										</div>
										<div class="form-group"></div>
										<div class="form-group"></div>
										<div class="form-group"></div>
										<div class="form-group">
											<label class="col-sm-4 control-label">
												<spring:message code='studentReg.father'/><span class="symbol required"></span>
											</label>
											<div class="col-sm-6">
												<input  class="form-control input-sm nameField" id="fatherName" <c:if test="${alumni!=null}">readonly="true" value="${alumni.fatherName}"</c:if> name="fatherName" onblur="upperCaseName(this.value,this.id)"  required="required"/>
											</div>
										</div>
										
										<div class="form-group">
											<label class="col-sm-4 control-label">
												<spring:message code='studentReg.mother'/><span class="symbol required"></span>
											</label>
											<div class="col-sm-6">
												<input  class="form-control input-sm nameField" id="motherName"  <c:if test="${alumni!=null}">readonly="true" value="${alumni.motherName}"</c:if> name="motherName" required="required" onblur="upperCaseName(this.value,this.id)"/>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-4 control-label">
												<spring:message code='emergency.contact'/><span class="symbol required"></span>
											</label>
											<div class="col-sm-6">
												<input class="form-control mobile-number-mask input-sm"  name="emergancyContactNum" <c:if test="${alumni!=null}">value="${alumni.emergancyContactNum}"</c:if> required="required"/>
											</div>
										</div>
										<c:if test="${alumni!=null}">
										<input value="Pending" type="hidden"  name="status"/>
										</c:if>
									</div>
								</div>
								
				<!--Checked step one-->
		<!--************************************************************************************************************************************************************************-->
					<div>
						<div class="row">
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
												<input  class="form-control  input-sm" id="permanentAddr1" name="permanentAddress1"  <c:if test="${alumni!=null}"> value="${alumni.permanentAddress1}"</c:if> required="required"/>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-4 control-label">
											<spring:message code='studentReg.address1'/><span ></span>
											</label>
											<div class="col-sm-7">
												<input  class="form-control  input-sm" id="permanentAddr2" name="permanentAddress2" <c:if test="${alumni!=null}"> value="${alumni.permanentAddress2}"</c:if> />
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-4 control-label">
												<spring:message code='studentReg.country'/><span class="symbol required"></span>
											</label>
											<div class="col-sm-7" >
											<select class="form-control input-sm " id="permanentCountry" name="permanentCountry.countryId"
														required="required" onchange="changeCountry(this.value,'permanent')" >
												<option value="" >Select...</option>
												<c:forEach var="country" items="${countryList}">
													<option value="${country.countryId}" <c:if test="${alumni!=null && country.countryId eq alumni.permanentCountry.countryId}">selected='selected'</c:if> >${country.countryName}</option>
												</c:forEach>
											</select>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-4 control-label" >
												<spring:message code='studentReg.state'/><span class="symbol required"></span>
											</label>
											<div class="col-sm-7">
												<select class="form-control input-sm " id="permanentState" name="permanentState.stateId" required="required" onchange="changeState(this.value,'permanent')" >
												<option value="" >Select...</option>
												<c:forEach var="state" items="${permanentStateList}">
													<option value="${state.stateId}" <c:if test="${alumni!=null && state.stateId eq alumni.permanentState.stateId}">selected='selected'</c:if> >${state.stateName}</option>
												</c:forEach>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-4 control-label" required>
												<spring:message code='studentReg.district'/><span class="symbol required"></span>
											</label>
											<div class="col-sm-7">
												<select class="form-control input-sm " id="permanentCity" name="permanentCity.cityId" required="required"  >
												<c:forEach var="city" items="${permanentCityList}">
													<option value="${city.cityId}" <c:if test="${alumni!=null && city.cityId eq alumni.permanentCity.cityId}">selected='selected'</c:if> >${city.cityName}</option>
												</c:forEach>
											</select>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-4 control-label">
												<spring:message code='studentReg.pincode' /> <span class="symbol required"></span>
											</label>
											<div class="col-sm-7">
												<input class="form-control zipcode-mask input-sm"  name="permanentPinCode" <c:if test="${alumni!=null}"> value="${alumni.permanentPinCode}"</c:if> id="permanentPin" required="required"/>
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
												<input  class="form-control input-sm " id="correspondAddr1" required="required" name="correspondenceAddress1" <c:if test="${alumni!=null}"> value="${alumni.correspondenceAddress1}"</c:if>/>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-4 control-label">
											<spring:message code='studentReg.address1'/>
											</label>
											<div class="col-sm-7">
												<input  class="form-control  input-sm" id="correspondAddr2" name="correspondenceAddress2" <c:if test="${alumni!=null}"> value="${alumni.correspondenceAddress2}"</c:if> />
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-4 control-label">
											<spring:message code='studentReg.country'/>
											</label>
											<div class="col-sm-7">
											<select class="form-control input-sm " id="correspondCountry" required="required" name="correspondenceCountry.countryId" onchange="changeCountry(this.value,'correspond')" >
											<option value="" >Select...</option>
												<c:forEach var="country" items="${countryList}">
													<option value="${country.countryId}"<c:if test="${alumni!=null && country.countryId eq alumni.correspondenceCountry.countryId}">selected='selected'</c:if>>${country.countryName}</option>
												</c:forEach>
											</select>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-4 control-label">
												<spring:message code='studentReg.state'/>
											</label>
											<div class="col-sm-7">

												<select class="form-control input-sm " id="correspondState" required="required" name="correspondenceState.stateId" onchange="changeState(this.value,'correspond')
												" >
												<option value="" >Select...</option>
												<c:forEach var="state" items="${correspondStateList}">
													<option value="${state.stateId}" <c:if test="${alumni!=null && state.stateId eq alumni.correspondenceState.stateId}">selected='selected'</c:if>>${state.stateName}</option>
												</c:forEach>
											</select>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-4 control-label">
												<spring:message code='studentReg.district'/>
											</label>
											<div class="col-sm-7">
												<select class="form-control input-sm " id="correspondCity" name="correspondenceCity.cityId" required="required">
												<c:forEach var="city" items="${correspondCityList}">
													<option value="${city.cityId}" <c:if test="${alumni!=null && city.cityId eq alumni.correspondenceCity.cityId}">selected='selected'</c:if>>${city.cityName}</option>
												</c:forEach>
											</select>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-4 control-label">
												<spring:message code='studentReg.pincode'/>
											</label>
											<div class="col-sm-7">
												<input  class="form-control zipcode-mask input-sm" id="correspondPin" required="required" name="correspondencePinCode" <c:if test="${alumni!=null}"> value="${alumni.correspondencePinCode}"</c:if>/>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						</div>
					</div>
					<div>
						<div class="row">
							<div class="col-md-12">
							<div class="col-md-6">
								<div class="panel panel-default">

									<div class="panel-heading">
										<i class="fa fa-external-link-square"></i>
											<p style="margin-left:20px;"><spring:message code='records'/> </p>
									</div>
									<div class="panel-body">
										<div class="form-group">
											<div class="col-sm-11">
												<textarea class="form-control input-sm" name="record" style="resize:none;" rows="8"><c:if test="${alumni!=null}">${alumni.record}</c:if></textarea>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="panel panel-default">

									<div class="panel-heading">
										<i class="fa fa-external-link-square"></i>
											<p style="margin-left:20px;"><spring:message code='achivement'/> </p>
									</div>
									<div class="panel-body">
										<div class="form-group">
											<div class="col-sm-11">
												<textarea class="form-control" name="achivement" style="resize:none;" rows="8"><c:if test="${alumni!=null}">${alumni.achivement}</c:if></textarea>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="col-md-12" align="right" id="submitButtonDiv" style="display:none">
					<div class="col-sm-6"></div>
						<div class="form-group" >
							<div class="col-sm-2 col-sm-offset-3" style="margin-left:18%">
								<input type="submit" value="Submit" class="btn btn-blue btn-block"/>
							</div>
						</div>
					</div>
					<% if (SecurityUtils.getSubject().getPrincipal()==null){%>
					<!--Step 2 ends -->

					<!--***********************************************************************************************************************************************************************-->

					<!--***********************************************************************************************************************************************************************-->
								<div class="footer-items btn-blue" style="margin-right:2%;">
				  <span class="go-top btn-blue ">
				 <i class="clip-chevron-up  btn-blue"></i>
			   </span>
				 </div>
<%}%>

							</form>
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
					$('.date-picker-year').datepicker({
						 format: "yyyy",
						startView: 1,
						minViewMode: 2,
						multidateSeparator: "-"
					});
				FormWizard.init();
				FormElements.init();
			});
		</script>
		<script>
		
			function facultyChange(facultyValue){
			course=document.getElementById("course77");
			if(facultyValue==null || facultyValue=='')
			{
						
								course.options.length=0;
								opt=document.createElement('option');
								 opt.value='';
							     opt.text="Select...";
								 course.add(opt);
							

			}
			else{
		     $.ajax({
						  url: "/sgterp/resources/changeProvRegFacultyCourse",
						  type: "POST",
						  data: "facultyId="+facultyValue,
						  success: function(data) {
							  course.options.length=0;
								opt=document.createElement('option');
								 opt.value='';
							     opt.text="Select...";
								 course.add(opt);
							  for(var i=0;i<data.length;i++)
							  {
								opt=document.createElement('option');
								 opt.value=data[i].courseId;
							     opt.text=data[i].courseName;
								 course.add(opt);
							  }

						   },
							error: function(data){
								alert(JSON.stringify(data));
							}
							});
		}
		}

		
		
		
		
		
		
		
		if(registrationNo=="<%=SecurityUtils.getSubject().getPrincipal()%>" ||"<%=SecurityUtils.getSubject().getPrincipal()%>"=="null"){
			$("#submitButtonDiv").show();
		}
		
			if($("#correspondAddr1").val()==$("#permanentAddr1").val() && $("#correspondAddr2").val()==$("#permanentAddr2").val() && $("#correspondCountry").val()==$("#permanentCountry").val() && $("#correspondState").val()==$("#permanentState").val() && $("#correspondCity").val()==$("#permanentCity").val() && $("#correspondPin").val()==$("#permanentPin").val()){
				$('#copyData').prop('checked',"checked")
			}
			
			function fillData(id)
			{
			if($('#'+id).prop('checked'))
			{
			$("#correspondAddr1").val($("#permanentAddr1").val());
			$("#correspondAddr1").attr("readnonly","readnonly");
			$("#correspondAddr2").val($("#permanentAddr2").val());
			$("#correspondAddr2").attr("readnonly","readnonly");
			$("#correspondCountry").val($("#permanentCountry").val());
			$("#correspondCountry").attr("readnonly","readnonly");
			$("#correspondState").val($("#permanentState").val());
			$("#correspondState").attr("readnonly","readnonly");
			var countryId=$("#permanentCountry").val();
			var stateId=$("#permanentState").val();
			var cityId=$("#permanentCity").val();


			$.ajax({
					url: "/sgterp/resources/sameAsPermanentState",
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
					url: "/sgterp/resources/sameAsPermanentCity",
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
			$("#correspondCity").attr("readnonly","readnonly");
			$("#correspondPin").val($("#permanentPin").val());
			$("#correspondPin").attr("readnonly","readnonly");
			}
			else
			{
			$("#correspondAddr1").val("");
			$("#correspondAddr1").removeAttr("readnonly");
			$("#correspondAddr2").val("");
			$("#correspondAddr2").removeAttr("readnonly");
			$("#correspondCountry").val("");
			$("#correspondCountry").removeAttr("readnonly");
			$("#correspondState").removeAttr("readnonly");
			state=document.getElementById("correspondState");
			state.options.length=0;
			opt=document.createElement('option');
			opt.value="";
			opt.text="Select...";
			state.add(opt);



			$("#correspondCity").removeAttr("readnonly");
			city=document.getElementById("correspondCity");
			city.options.length=0;
			opt=document.createElement('option');
			opt.value="";
			opt.text="Select...";
			city.add(opt);
			$("#correspondPin").val("");
			$("#correspondPin").removeAttr("readnonly");
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

