<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>

<html lang="en" class="no-js">
	<!--<![endif]-->
	<!-- start: HEAD -->
<head>
<link rel="stylesheet" href="/sgterp/resources/plugins/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="/sgterp/resources/plugins/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="/sgterp/resources/fonts/style.css">
		<link rel="stylesheet" href="/sgterp/resources/css/clip/main.css">
        <link rel="stylesheet" href="/sgterp/resources/plugins/iCheck/skins/all.css">
		<link rel="stylesheet" href="/sgterp/resources/css/clip/main-responsive.css">
		<link rel="stylesheet" href="/sgterp/resources/plugins/bootstrap-colorpalette/css/bootstrap-colorpalette.css">
		<link rel="stylesheet" href="/sgterp/resources/css/clip/theme_light.css" type="text/css" id="skin_color">
		<link rel="stylesheet" href="/sgterp/resources/plugins/perfect-scrollbar/src/perfect-scrollbar.css">
		<link rel="stylesheet" href="/sgterp/resources/css/print.css" type="text/css" media="print"/>

		<link rel="stylesheet" href="sgterp/resources/plugins/gritter/css/jquery.gritter.css">
		<link rel="stylesheet" href="/sgterp/resources/plugins/datepicker/css/datepicker.css">

		<link rel="stylesheet" href="/sgterp/resources/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css">


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

		<link href="/sgterp/resources/plugins/bootstrap-modal/css/bootstrap-modal-bs3patch.css" rel="stylesheet" type="text/css"/>
		<link href="/sgterp/resources/plugins/bootstrap-modal/css/bootstrap-modal.css" rel="stylesheet" type="text/css"/>


</head>
<body class="login example1" style="width:100%" onload="Captcha();">

					<div class="main-login col-md-6 col-md-offset-3 col-sm-6 col-sm-offset-3">



					<div class="col-sm-12" style="margin-top:5%;">
					<div class="alert alert-block alert-danger" id="provisionalRegDone"  style="display:none">
										<button data-dismiss="alert" class="close">
											&times;
										</button>
										<i class="fa fa-times-circle"></i>&nbsp;
										<spring:message code='prospectus.message2'/>
					</div>
					<c:if test="${emailFailed eq 'emailFailed'}">	
									<div class="alert alert-block alert-danger" id="emailFailed">
										<button data-dismiss="alert" class="close">
											&times;
										</button>
										<i class="fa fa-times-circle"></i>&nbsp;
									Sorry,unable to send email due to network problem.
									</div>
					</c:if>
					<div class="alert alert-block alert-danger" id="existsInStudent"  style="display:none">
										<button data-dismiss="alert" class="close">
											&times;
										</button>
										<i class="fa fa-times-circle"></i>&nbsp;
										<spring:message code='prospectus.message3'/>
					</div>

						<div class="alert alert-block alert-danger" id="duplicateEmail" style="display:none">
										<button data-dismiss="alert" class="close">
											&times;
										</button>
										<i class="fa fa-times-circle"></i>&nbsp;
										<spring:message code='prospectus.message4'/>
								<p></p>
								<p></p>
 <p>
											<a class="btn btn-bricky" onclick="checkFormNo();"> 
											<!-- checkFormNo() function is defined on this jsp .Ignore this function in to the prospectus.js file-->
											<spring:message code='prospectus.message5'/>
											</a>
											<a href="/sgterp/resources/prospectus" class="btn btn-light-grey">
											<spring:message code='prospectus.message6'/>
											</a>
										</p>
					</div>

					
                    <c:if test="${currentAdmissionSessionNotFound eq 'currentAdmissionSessionNotFound'}">
					<div class="alert alert-block alert-danger" id="afterRegistration">
										<button data-dismiss="alert" class="close">
											&times;
										</button>
										<i class="fa fa-check-circle"></i>
									Sorry !! There is no admission going on for any session 
								
					</div></c:if>

					


                    <c:if test="${provReg.tempRegistrationNo!=null}">
					<div class="alert alert-success" id="afterRegistration">
										<button data-dismiss="alert" class="close">
											&times;
										</button>
										<i class="fa fa-check-circle"></i>
										<strong><spring:message code='prospectus.message7'/></strong> ${provReg.firstName }&nbsp;&nbsp;${provReg.lastName}.
								<spring:message code='prospectus.message8'/></br>

								<spring:message code='prospectus.message9'/> ${finalProvRegNo}.				</br>

								<spring:message code='prospectus.message10'/>	</br>
								<spring:message code='prospectus.message11'/>
					</div></c:if>

							<!-- start: TEXT FIELDS PANEL -->
							<div class="panel panel-default">

								<div class="panel-heading">

						<!-- <a href="showProvReg" style="float:right; color:#000;">Apply Online</a>  -->

					<!--	 <a href="deleteChild" style="float:right; color:#000;">Delete child</a>  -->


									<i class="fa fa-external-link-square"></i>


									<p style="margin-left:20px;"><spring:message code='prospectus.prospectusHeading'/></p>




								</div>



								<div class="panel-body" style="background-color:#099;">
									<form  class="smart-wizard  form-horizontal" id="form" name="frm">
										<div id="wizard" class="swMain">
											<div class="col-sm-12">
												<div class="form-group">
													<label class="col-sm-3 control-label">
													<spring:message code='stu_name'/><span class="symbol required"></span>
													</label>
													<div class="col-sm-7">
														<input type="text" class="nameField form-control  input-sm saveDisabled" id="name" name="firstname" onchange="changeCall()" onblur="upperCaseName(this.value,this.id)" required>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label">
														<spring:message code='contacts.email'/> <span class="symbol required"></span>
													</label>
													<div class="col-sm-7">
														<input type="text" class="form-control input-sm saveDisabled" id="email" name="email" onchange="changeCall1(this.value)" onblur="trimValidateEmail(this.value)" required>
													</div>
												</div>
												
												
												<div class="form-group">
													<label class="col-sm-3 control-label">
														Faculty <span class="symbol required"></span>
													</label>
													<div class="col-sm-7">
													<select class="form-control input-sm search-select saveDisabled"  id="faculty77" name="facultyId" required="required" onchange="changeFaculty(this.value);$('#course77').select2('val','');">

													  <option value="">Select...</option>
													<c:forEach var="faculty" items="${facultyList}">
														<option value="${faculty.facultyId}">${faculty.facultyName}</option>
													  </c:forEach>
												    </select>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label">
														Course <span class="symbol required"></span>
													</label>
													<div class="col-sm-7">

													<select class="form-control input-sm search-select saveDisabled "  id="course77" name="courseId" required="required" >
														<option value="">Select...</option>
													    <c:forEach var="course" items="${courseList}">
														<option value="${course.courseId}">${course.courseName}</option>
													  </c:forEach>

												    </select>
													</div>
												</div>

												<div class="form-group">
													<label class="col-sm-3 control-label">
														<spring:message code='studentReg.dob'/> <span class="symbol required"></span>
													</label>

													<div class="col-sm-7">
														<div class="input-group">
														<input type="text" id="dob" data-date-format="dd-mm-yyyy" data-date-viewmode="years" name="dob"  class="form-control input-sm date-picker" required/>
														<span class="input-group-addon"> <i class="fa fa-calendar"></i> </span>
														</div>
													</div>

												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label">
													<spring:message code='prospectus.phone'/><span class="symbol required"></span>
													</label>
													<div class="col-sm-7">
														 <input type="text" class="form-control mobileNumberVal input-sm saveDisabled"  maxlength="10" pattern=".{10,10}" placeholder="xxxxxxxxxx" id="phone" name="phone" onchange="mobileNoValidation(event)" required>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label">
														<spring:message code='prospectus.location'/><span class="symbol required"></span>
													</label>
													<div class="col-sm-7">
														<input type="text" class="form-control input-sm saveDisabled" id="location" name="location" onblur="clearLeadTrailingSpace(this.value,this.id)" required>
													</div>
												</div>
                                        <!--        <div style="margin-left: 2%; margin-top: -10px; ">
													<input  type="checkbox" name="myName" value="true" > &nbsp;&nbsp; Check this if Same as Permanent Address.
													<ins class="iCheck-helper" ></ins>
												</div>
			<input type="hidden"  id="chk" name="chk">
			<input type="hidden"  id="unchk" name="unchk"> -->



                                    <script type="text/javascript">


                 function Captcha(){
                     var alpha = new Array('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','1','2','3','4','5','6','7','8','9','0','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p');
                     var i;
                     for (i=0;i<6;i++){
                       var a = alpha[Math.floor(Math.random() * alpha.length)];
                       var b = alpha[Math.floor(Math.random() * alpha.length)];
                       var c = alpha[Math.floor(Math.random() * alpha.length)];
                       var d = alpha[Math.floor(Math.random() * alpha.length)];
                       var e = alpha[Math.floor(Math.random() * alpha.length)];
                       var f = alpha[Math.floor(Math.random() * alpha.length)];
                       var g = alpha[Math.floor(Math.random() * alpha.length)];
                      }
                    var code = a + ' ' + b + ' ' + ' ' + c + ' ' + d + ' ' + e + ' '+ f + ' ' + g;
                    document.getElementById("mainCaptcha").value = code
                  }
                  function ValidCaptcha(){
                      var string1 = removeSpaces(document.getElementById('mainCaptcha').value);
                      var string2 = removeSpaces(document.getElementById('txtInput').value);
                      if (string1 == string2){
                        return true;
                      }
                      else{

					  	Captcha();
                        return false;
                      }
                  }
                  function removeSpaces(string){
                    return string.split(' ').join('');
                  }
             </script>

        <label class="col-sm-12" style="margin-top:-10px; margin-left:6%">
                <spring:message code='prospectus.captcha'/>

                  </label>
        <div class="form-group">
        <label class="col-sm-3 control-label" >
                 <spring:message code='prospectus.captcha1'/><span class="symbol required"></span>

                  </label>

            <div class="col-sm-7" >
             <input  readonly id="mainCaptcha" class="captcha" disabled="disabled"/>
<script>
jQuery("#mainCaptcha").bind("cut copy",function(e){
    e.preventDefault();
});
</script>
            <div class="refresh">
           <a style=" color:#FFF; text-decoration:none;" href=""> <i class="clip-spinner-4" id="refresh"  onclick="Captcha();"></i> </a>
       </div></div></div>
         <div class="form-group">
        <label class="col-sm-3 control-label" >
                 <spring:message code='prospectus.characters'/><span class="symbol required"></span>

                  </label>
            <div class="col-sm-7" >
            <input type="text"  id="txtInput" class="cap" onblur="captchaValidate(this.value,this.id)"/>

      <script>
jQuery("#txtInput").bind("cut copy paste drop",function(e){
    e.preventDefault();
});
</script>
              </div></div>
										<div class="form-group">
											<div class="row space20">
												<div class="col-sm-3" style="margin-left:26%;">
													 <a href="/sgterp/protected/home">
										   <div class="nbutton" >
											<button  onclick="window.location='/sgterp/protected/home';" class="btn btn-blue right" type="button"  style="background-color:#f5f5f5; color:#000;">	<i class="fa fa-arrow-circle-left"></i>
                                         <spring:message code='header.home'/>&nbsp;
										 </button>
										</div></a>
												</div><div class="col-sm-5">
													
												<div class="nbutton">
                                           <a  id="save" class="btn btn-yellow left"  type="submit">
                                          <spring:message code='save.and.proceed'/>&nbsp;
												<i class="fa fa-arrow-circle-right"></i>
													</a>
												</div>
												</div>
											</div>
										</div>
											</div>

										</div>


									</form>
								</div>

							</div>

						</div>

					</div>
				</div>
				
<div class="modal fade modal-dialog"  data-backdrop='static' id="paymentGatewayDialog" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-content">
			<form class="form-horizontal" action="<spring:message code='urlValue'/>" method="POST" enctype="multipart/form-data" onsubmit="return updateProspectusBuyer()" id="paymentGatewayForm">
				<div class="modal-header" style="color:black;">
					<h4 class="modal-title"><spring:message code='term.and.condition'/></h4>
				</div>
				<div class="modal-body">
					<div class="alert alert-success" id="correctEmail"  style="display:none">
						<button data-dismiss="alert" class="close">&times;</button>
						<i class="fa fa-check-circle"></i>&nbsp;<spring:message code='prospectus.message1'/>
					</div>
					<input type="hidden" id="firstname" name="firstname" onchange="changeCall()">
					<input class="form-control" type="hidden" id="key" name="key" value="<spring:message code='keyValue'/>" onchange="changeCall()">
					<input class="form-control" type="hidden" id="txnId" name="txnid" onchange="changeCall()">
					<input class="form-control" type="hidden" id="amount" name="amount" value="${amount}" onchange="changeCall()">
					<input class="form-control" type="hidden" id="productinfo" name="productinfo" value="Prospectus" onchange="changeCall()">
					<input class="form-control" type="hidden" id="surl" name="surl" value="<spring:message code='feePaymentGatewayResponse'/>" >
					<input class="form-control" type="hidden" id="furl" name="furl" value="<spring:message code='feePaymentGatewayResponseFailure'/>" >
					<input class="form-control" type="hidden" id="curl" name="curl" value="<spring:message code='feePaymentGatewayResponseCancel'/>">
					<input class="form-control" type="hidden" id="Pg" name="Pg" value="CC" >
					<input class="form-control" type="hidden" id="salt" name="salt" value="<spring:message code='saltValue'/>"/>
					<input class="form-control" type="hidden" id="hash" name="Hash">
					<input type="hidden" id="emailPayment" name="email" onchange="changeCall1(this.value)">
					<table class="space20" width="90%" style="color:black;margin-left:5%;">
						<tr>
							<td >
							<textarea class="input-sm" style="width:95%;resize:none;" rows="8" readonly="true">(i)&emsp;Submission of online Application Form for the course, selected by you does not guarantee or affirm your admission to the University in the selected course or any other course, being offered.
							
(ii)&emsp;Application form shall be followed by counseling as per applicable rules and regulations and final decision shall be taken by the Admission Committee, and which shall be binding on you.

(iii)&emsp;Your application can be cancelled at any stage by the University, if you are found to be either unsuitable or does not fulfill the eligibility criterion without any further communication and no further request shall be entertained in this regard.

(iv)&emsp;Application processing fee of Rs. ${amount} /- is non-refundable in any circumstances.

(v)&emsp;You are required to follow/obey the terms and conditions, mentioned in Information Brochure and communicated by the University time to time regarding the Admission Process.
							</textarea>
							</td>
						</tr>
						<tr>
							
							<td ><div class="checkbox" style="text-align:left;">

												<input type="checkbox"  id="acceptTerm" name="acceptTerm" required/>
												<label style="color:black;"><spring:message code='accept.all.term.condition'/>

											</label>
										</div></td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
				<button id="pay" class="btn btn-green" type="submit"  onclick="payment(event)" disabled><spring:message code='accept.and.pay'/>&nbsp;
				</button>
				<a  href="/sgterp/protected/home" class="btn btn-light-grey left" type="button"  style="background-color:#f5f5f5; color:#000;">
					<spring:message code='cancel'/>&nbsp;
				 </a>
					 
				</div>
			</form>
		</div>
</div>
				
				
				
				
				
				
				
				
							
	<script src="/sgterp/resources/plugins/jQuery-lib/2.0.3/jquery.min.js"></script>
		<!--<![endif]-->
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
		<!-- end: MAIN JAVASCRIPTS -->
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
		
		<!-- most of the functional script inside prospectus.js for prospectus.jsp page -->
		<script src="/sgterp/resources/js/registration/prospectus.js"></script>
		<script src="/sgterp/resources/js/registration/registration.js"></script>
		<script src="/sgterp/resources/js/registration/custom.validation.masking.js"></script>
		<script src="/sgterp/resources/plugins/bootstrap-modal/js/bootstrap-modal.js"></script>
		<script src="/sgterp/resources/plugins/bootstrap-modal/js/bootstrap-modalmanager.js"></script>
		<script src="/sgterp/resources/js/ui-modals.js"></script>
		<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">

</script>
		<!-- end: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
		<script>
			jQuery(document).ready(function() {
				//$("#duplicateEmail").hide();
				Main.init();
				prospectusSubmit();
				onLoad();
				$("#txnId").val(new Date().getTime());
				UIElements.init();
				FormElements.init();
				
			});
		</script>

<script type="text/javascript">

/* <![CDATA[ */

var google_conversion_id = 955182983;

var google_conversion_language = "en";

var google_conversion_format = "3";

var google_conversion_color = "ffffff";

var google_conversion_label = "9zoUCKqkz1sQh9-7xwM";

var google_remarketing_only = false;

/* ]]> */

</script>

		<script language="javascript">
/*$( ".capital" ).bind( "keyup", function(e) {
 var str = $( this ).val();
  if(str && str.length >=1){
  var firstChar = str.charAt(0);
  var remainingStr = str.slice(1);
  str= firstChar.toUpperCase() + remainingStr;
  }
 $( this ).val(str);
});*/
function checkFormNo()
{

$("#duplicateEmail").css("display","none");
$.ajax({
			 url: "/sgterp/resources/checkFormNo",
			 type: "POST",
			 data: "email="+$("#email").val()+"&dob="+$("#dob").val(),
			 success: function(data) {

			 if(data=="existed"){// payment done but prov reg not done till now
			 window.location="/sgterp/resources/redirectToRegistrationOptions?email="+$("#email").val()+"&dob="+$("#dob").val();

			 }
			 if(data=="provisionalRegDone")   // prov reg done
			 {
				$("#duplicateEmail").css("display","none");
				$("#correctEmail").css("display", "none");
				$("#existsInStudent").css("display", "none");
				$("#afterRegistration").css("display", "none");
				$("#provisionalRegDone").css("display", "block");
				//alert(data);
			}
			if(data=="existsInStudent")  //student record created
			 {
				$("#duplicateEmail").css("display","none");
				$("#correctEmail").css("display", "none");
				$("#provisionalRegDone").css("display", "none");
				$("#afterRegistration").css("display", "none");
				$("#existsInStudent").css("display", "block");
				
			}
			if(data=="notexists")  // payment not done
			 {	//alert(data);
				save("updateProsBuyerRecord");
				//alert(data);
			}

				},
					error: function(data){
						alert("Sorry! Error in connectivity... Please Try again...");
					}
				});
				$("#firstname").val($("#name").val());
				$("#emailPayment").val($("#email").val());
				changeCall1($("#email").val());
				changeCall();

       }
</script>
<noscript>

<div style="display:inline;">

<img height="1" width="1" style="border-style:none;" alt="" src="//www.googleadservices.com/pagead/conversion/955182983/?label=9zoUCKqkz1sQh9-7xwM&amp;guid=ON&amp;script=0"/>

</div>

</noscript>


</body></html>
