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
 
		<link rel="stylesheet" href="/sgterp/resources/plugins/font-awesome/css/font-awesome.min.css">
        	<link rel="stylesheet" href="/sgterp/resources/plugins/bootstrap-social-buttons/social-buttons-3.css">
	<link rel="stylesheet" href="/sgterp/resources/fonts/style.css">
		<link rel="stylesheet" href="/sgterp/resources/css/clip/main.css">
        		<link rel="stylesheet" href="/sgterp/resources/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="screen.css" media="screen, print" />
<link rel="stylesheet" type="text/css" href="print.css" media="print" />

</head>
<body class="login example1">
<div class="row" style="display:none">
<div class="table-responsive" id="sample_2">
 <style>

table {
    border: 3px solid black;
	border-collapse: collapse;
}
 #total{
		  border: 3px solid black;
		 }
#fontSize {
    font-size: 120%;
}
#fontSize1 {
    font-size: 120%;
}

</style>
<div class="bg print"></div>
								<table   id="square" width="90%"  height="100%" >
													 <tr>
													 <td colspan="5" align="center"><img src="/sgterp/resources/img/sgterp.ico" height="100px" width="100px" alt="*" /></td>
    <td colspan="7" class="image"align="center"><font size="5"><p><b>SGT University Gurgaon,<br/><br/> Delhi-NCR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></p></font></td>
   
   
  </tr>
  <tr>
    <th id="total" colspan="12"><font size="5"><center><b>Student Copy</b></center></font></th>
   		
    
  </tr>
  <tr>
    <td colspan="4" id="fontSize">&nbsp;&nbsp;<b>Receipt No.:</b> </td>
    <td colspan="2" id="fontSize1">${txdId}</td>		
    <td colspan="4" id="fontSize">&nbsp;&nbsp;<b>Date :</b></td>
    <td colspan="2"  id="fontSize1">${date}</td>	
		
  </tr>
  <tr>
    <td colspan="2"id="fontSize">&nbsp;&nbsp;<b>Admission</b></td>
	<td colspan="2"id="fontSize">&nbsp;&nbsp;<b>Session:</b></td>
	<td colspan="8" id="fontSize1">&nbsp;&nbsp;${admissionSession}</td>	
    
  </tr>
  <tr>
    <td colspan="4"id="fontSize">&nbsp;&nbsp;<b>Name :</b></td>
	<td colspan="8" id="fontSize1">${studentName}</td>	
    
  </tr>
  <tr>
   <td colspan="4" id="fontSize">&nbsp;&nbsp;<b>Form  No. :</b></td>
	<td colspan="8" id="fontSize1">${formNo}</td>		
    
  </tr>
  <tr >
    <td colspan="4" id="fontSize">&nbsp;&nbsp;<b>Course :</b></td>
	<td colspan="8" id="fontSize1">${courseName}</td>	
    
  </tr>
  <tr>
    <td colspan="4" id="fontSize">&nbsp;&nbsp;<b>Tax Reg No. :</b></td>
	<td colspan="8" id="fontSize1">${taxRegNo}</td>		
    
  </tr>
  <tr id="total">
   <td colspan="4" id="fontSize">&nbsp;<b><u>Fee Head</u></b><br><br><b>&nbsp;Prospectus Fee</b></td>
	<td colspan="8"id="fontSize">&nbsp;<b><u>Amount</u></b><br><br>&nbsp;&nbsp;&nbsp;1100</td>	
     
  </tr>
  <tr id="total">
   <td colspan="4"id="fontSize">&nbsp;&nbsp;<b>Total</b></td>
	<td colspan="8" id="fontSize1">1100</td>	
    
  </tr>
  <tr>
    <td colspan="12" align="right"id="fontSize"><br><br><br><br><b>Signature</b>&nbsp;&nbsp;</td>
    
  </tr>
</table>	
</div>	
</div>		
					<div class="main-login col-md-6 col-md-offset-3 col-sm-6 col-sm-offset-5">
									
						<div class="col-sm-12" style="margin-top:15%;">
						<c:if test="${emailFailed eq 'emailFailed'}">	
									<div class="alert alert-block alert-danger" id="emailFailed">
										<button data-dismiss="alert" class="close">
											&times;
										</button>
										<i class="fa fa-times-circle"></i>&nbsp;
									Sorry,unable to send email due to network problem.
									</div>
								</c:if>
							<!-- start: TEXT FIELDS PANEL -->
							<div class="panel panel-default">
								<div class="panel-heading">
									<i class="fa fa-external-link-square"></i>
                                     <a href="/sgterp/login"><div class="nbutton" >
                                     <button  class="btn btn-blue " type="button"  style="width:17%; float:right; margin-top:-9px; color:#FFF;">	<i class="fa fa-arrow-circle-left"></i>
                                           <spring:message code='header.home'/>&nbsp;
											
													</button>
												</div></a> 
									<p style="margin-left:20px;"><spring:message code='formOptions.message1'/> </p>
                                    
								</div>
								
							<c:if test="${afterPaymentChecker eq 'afterPaymentChecker'}">	
							<div style="background-color:#099; text-align:center;">
								<p style="margin-left:20px;"><spring:message code='formOptions.message2'/> </p> 
								<p style="margin-left:20px;"><spring:message code='formOptions.message3'/> ${formNo} </p> 
								<p style="margin-left:20px;"><spring:message code='formOptions.message4'/></p>
								<p style="margin-left:20px;"><spring:message code='formOptions.message5'/></p>
							</div>
							</c:if>
								<div class="panel-body" style="background-color:#099;">
								<form action="applyProvReg" method="post"  class="smart-wizard form-horizontal" id="form" name="frm">
										<input type="hidden" name="email" value="${email}"></input>
										<input type="hidden" name="dob" value="${dob}"></input>
										
										<div class="nbutton col-sm-8 control-label">
                                           <button class="btn btn-blue  right" type="submit" style="width:200px; color:#FFF;">
                                           <spring:message code='Apply Online'/>&nbsp;
												<i class="fa fa-arrow-circle-right"></i>
													</button>
										</div>
												
										<div>
										<font size="4.6px" face="verdana">
										   <a  onClick="resultSheet('sample_2')" class="btn btn-blue  center" style="margin: 75px 0px 12px -211px; width:200px; color:#FFF;"><i class="clip-file-pdf"></i> &nbsp;Print Receipt &nbsp;</a>
										</font>
										</div>
												
								</form>	
								</div>
							</div>
						</div>
					</div>
				</div>
				<script src="sgterp/resources/plugins/bootstrap-paginator/src/bootstrap-paginator.js"></script>
		<script src="sgterp/resources/plugins/jquery.pulsate/jquery.pulsate.min.js"></script>
		<script src="sgterp/resources/plugins/gritter/js/jquery.gritter.min.js"></script>
		<script src="sgterp/resources/js/ui-elements.js"></script>
		<script src="/sgterp/resources/plugins/jQuery-lib/2.0.3/jquery.min.js"></script>
		<!--<![endif]-->
		<script src="/sgterp/resources/plugins/jquery-ui/jquery-ui-1.10.2.custom.min.js"></script>
		<script src="/sgterp/resources/plugins/bootstrap/js/bootstrap.min.js"></script>
		<script src="/sgterp/resources/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js"></script>
		<script src="/sgterp/resources/plugins/blockUI/jquery.blockUI.js"></script>
		<script src="/sgterp/resources/plugins/iCheck/jquery.icheck.min.js"></script>
		<script src="/sgterp/resources/plugins/perfect-scrollbar/src/perfect-scrollbar.js"></script>
		<script src="/sgterp/resources/plugins/less/less-1.5.0.min.js"></script>
		<script src="/sgterp/resources/plugins/jquery-cookie/jquery.cookie.js"></script>
		<script src="/sgterp/resources/plugins/bootstrap-colorpalette/js/bootstrap-colorpalette.js"></script>
		<script src="/sgterp/resources/js/main.js"></script>
				<script>
			jQuery(document).ready(function() {
				Main.init();
				UIElements.init();
			});
		</script>
		<script type="text/javascript">
         function resultSheet(divID) {
				w=window.open("/sgterp/resources/img/sgterp.ico");
				w.document.write($('#'+divID).html());
				w.print();
			
	}
</script>
</body>
</html>