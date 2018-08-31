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

		
	
		<link rel="stylesheet" href="/sgterp/resources/css/clip/main.css">
        		<link rel="stylesheet" href="/sgterp/resources/css/bootstrap.min.css">
		

</head>
<body class="login example1">

					<div class="main-login col-md-6 col-md-offset-3 col-sm-6 col-sm-offset-5">
						<div class="col-sm-12" style="margin-top:5%;">
							<!-- start: TEXT FIELDS PANEL -->
							<div class="panel panel-default" style="width:700px">
								<div class="panel-heading">
									<i class="fa fa-external-link-square"></i>
									<p style="margin-left:20px;">Make Payment</p> 
								</div>
								<div class="panel-body" style="background-color:#099;">
									<form action="https://test.payu.in/_payment" class="smart-wizard form-horizontal" role="form" method="post">
									<div id="wizard" class="swMain">
											<div class="col-sm-12">
											
												<div class="form-group">
													<label  class="col-sm-3 control-label">
														Key <span class="symbol required"></span>
													</label>
													<div class="col-sm-3">
													<input class="form-control" type="text" id="key" name="key" value="gtKFFx" onchange="abc()">											
													</div>
												
													<label class="col-sm-3 control-label">
														TxnId<span class="symbol required"></span>
													</label>
													<div class="col-sm-3">
														<input class="form-control" type="text" id="txnId" name="txnid" value="123123123123" onchange="abc()">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label">
														Total Amount<span class="symbol required"></span>
													</label>
													<div class="col-sm-3">
														<input class="form-control" type="text" id="amount" name="amount" value="1500" onchange="abc()">
													</div>
												
													<label class="col-sm-3 control-label">
														Product<span class="symbol required"></span>
													</label>
													<div class="col-sm-3">
														<input class="form-control" type="text" id="productinfo" name="productinfo" value="Product_1" onchange="abc()">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label">
														First Name <span class="symbol required"></span>
													</label>
													<div class="col-sm-3">
														<input class="form-control" type="text" id="firstname" name="firstname" value="pnkj" onchange="abc()">
													</div>
												
													<label class="col-sm-3 control-label">
														Email <span class="symbol required"></span>
													</label>
													<div class="col-sm-3">
														<input class="form-control" type="text" id="email" name="email" value="pankaj.verma@eamerpsolutions.com" onchange="abc()">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label">
														Mobile No <span class="symbol required"></span>
													</label>
													<div class="col-sm-3">
														<input class="form-control" type="text" id="phone" name="phone" value="9958496959">
													</div>
												
													<label class="col-sm-3 control-label">
														Success Url <span class="symbol required"></span>
													</label>
													<div class="col-sm-3">
														<input class="form-control" type="text" id="surl" name="surl" value="http://5.153.7.98/sgterp/resources/feePaymentGatewayResponse" >
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label">
														Fail Url <span class="symbol required"></span>
													</label>
													<div class="col-sm-3">
														<input class="form-control" type="text" id="furl" name="furl" value="http://5.153.7.98/sgterp/resources/feePaymentGatewayResponse" >
													</div>
												
													<label class="col-sm-3 control-label">
														Cancel url<span class="symbol required"></span>
													</label>
													<div class="col-sm-3">
														<input class="form-control" type="text" id="curl" name="curl" value="http://5.153.7.98/sgterp/resources/feePaymentGatewayResponse" >
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label">
														Default page<span class="symbol required"></span>
													</label>
													<div class="col-sm-3">
														<input class="form-control" type="text" id="Pg" name="Pg" value="CC" >
													</div>
												
													<label class="col-sm-3 control-label">
													Salt<span class="symbol required"></span>
													</label>
													<div class="col-sm-3">
														<input class="form-control" type="text" id="salt" name="salt" value="eCwWELxi">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label" >
													Hash<span class="symbol required"></span>
													</label>
													<div class="col-sm-3">
														<input class="form-control" type="text" id="hash" name="Hash">
													</div>
												</div>
												<div class="form-group" style='margin-left: 112px;'>
							                    
								              &nbsp; &nbsp; &nbsp; &nbsp; <label for="agree" class="checkbox-inline">
								               	
						                          </div>
												<div class="nbutton" style='margin-left: 145px;'>
                                           <div class="sbutton" >
<button class="btn btn-yellow btn-block" style="width:400px" type="submit">
Make Payment <i class="fa fa-arrow-circle-right"></i>
</button>
												</div>
											</div>
											
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				
	
		<!-- end: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
		<script>

			$.ajax({
				url: "hashFetch?txnid="+$("#txnId").val()+"&amount="+$("#amount").val()+"&firstname="+$("#firstname").val()+"&email="+$("#email").val()+"&productinfo="+$("#productinfo").val()+"&key="+$("#key").val()+"&salt="+$('#salt').val(),
				type: "GET",
				success: function(data) {
					alert(data);
					$("#hash").val(data);
				},
				error: function(data){
					<!--alert(data+"error");-->
				}
				});
		function abc()
		{alert($("#txnId").val());
			$.ajax({
				url: "hashFetch?txnid="+$("#txnId").val()+"&amount="+$("#amount").val()+"&firstname="+$("#firstname").val()+"&email="+$("#email").val()+"&productinfo="+$("#productinfo").val()+"&key="+$("#key").val()+"&salt="+$('#salt').val(),
				type: "GET",
				success: function(data) {
					$("#hash").val(data);
				},
				error: function(data){
					<!--alert(data+"error");-->
				}
				});
		}
			// Example of adding a regular item after picklist creation.
			// Note there is no "element" property as that's for rich content only.
	</script>
		<script>
			jQuery(document).ready(function() {
				Main.init();
				Login.init();
			});
		</script>
</body></html>
