/*
	this code is restricting the user to enter age<15 year. this script is applied on dob calendar
*/
	var date=new Date();
	var endDate=new Date(date.getFullYear()-15,date.getMonth(),date.getDate());
	var startDate=new Date(date.getFullYear()-200,date.getMonth(),date.getDate());
	$("#dob").datepicker({format:'dd-mm-yyyy',startDate:startDate,endDate:endDate});

	function upperCaseName(nameValue,elementId){
			var trimedValue=$.trim(nameValue);

			trimedValue=trimedValue.toUpperCase();
			$("#"+elementId).val(trimedValue);

		}

//this function will trim leading and trailing spaces and then check email validation and make border red if validation failed
function trimValidateEmail(emailValue)
 {       if(($("#email").val()=="")||($("#email").val()==null))
		 {
			//$("#email").focus();
			return false;
		 }
		 else
		 {
				var trimedEmail=$.trim(emailValue);
				if (/^\w+([\.-]?\w+)*@\w{2,30}([\.-]?\w+)*(\.\w{2,3})+$/.test(trimedEmail))
				{
					$("#email").val(trimedEmail);
					$("#email").css("border","1px solid #D5D5D5");
			    }
				else{
				    $("#email").val(trimedEmail);
					$("#email").css("border","2px solid red");
				//	$("#email").focus();
				$("#email").val('');
					event.preventDefault();
					return false;
				}
		}

 }

function prospectusSubmit()
{

$('.nameVal').bind('keyup blur', function() {
            $(this).val($(this).val().replace(/[^A-Za-z. ]/g, '').toUpperCase())
            });





$("#save").click(function(event) {
		if(($("#name").val()=="")||($("#name").val()==null))
		 {
			$("#name").focus();
			return false;
		 }
		if(($("#email").val()=="")||($("#email").val()==null))
		 {
			$("#email").css("border","2px solid red");
			$("#email").focus();
			return false;
		 }
		 else
		 {

				var trimedEmail=$.trim($("#email").val());
                $("#email").val(trimedEmail);
				if (/^\w+([\.-]?\w+)*@\w{2,30}([\.-]?\w+)*(\.\w{2,3})+$/.test(trimedEmail))

				{
					$("#email").css("border","green");
			    }
				else{
					$("#email").css("border","2px solid red");
					$("#email").focus();

					event.preventDefault();
					return false;
				}
		}
		if(($("#faculty77").val()=="")||($("#faculty77").val()==null))
		 {
			$("#faculty77").focus();
			return false;
		 }
		 if(($("#course77").val()=="")||($("#course77").val()==null))
		 {
			$("#course77").focus();
			return false;
		 }
		if(($("#dob").val()=="")||($("#dob").val()==null))
		 {
			$("#dob").focus();
			return false;
		 }

      if(($("#phone").val()=="")||($("#phone").val()==null) || $("#phone").val().length < 10)
		 {
			$("#phone").focus();
			return false;
		 }
	if (!$("#phone").val().match(/^[1-9][0-9]{9}$/))
		{
		$("#phone").css("border","2px solid red");
		return false;
		}
		if(($("#location").val()=="")||($("#location").val()==null))
		 {
           $("#location").focus();
           return false;
          }
		   var string1 = removeSpaces(document.getElementById('mainCaptcha').value);
                      var string2 = removeSpaces(document.getElementById('txtInput').value);
                      if (string1 != string2){
                             txtFieldId=document.getElementById('txtInput');
							 txtFieldId.value="";
							$("#txtInput").css("border","2px solid red");
                  			$("#txtInput").focus();
					  	Captcha();
                        return false;
                      }
				save("AddProspectus");

			 event.preventDefault();

            });



}

function save(urls)
{
//alert($("#txnId").val());
$.ajax({
			 url: "/sgterp/resources/"+urls,
			 type: "POST",
			 data: "email="+$("#email").val()+"&name="+$("#name").val()+"&phone="+$("#phone").val()+"&location="+$("#location").val()+"&dob="+$("#dob").val()+"&course.courseId="+$("#course77").val()+"&txnId="+$("#txnId").val(),

			 success: function(data) {
			  //alert(data);

			  if(data=="success") //when formNo is not there. so basic details are updated in ProspectusBuyer
				{//alert("success");
				$("#duplicateEmail").css("display","none");
				$("#provisionalRegDone").css("display","none");
				$("#existsInStudent").css("display", "none");
				$("#afterRegistration").css("display", "none");
				$("#correctEmail").css("display", "block");
			    document.getElementById("pay").disabled=false;

				$(".saveDisabled").attr("readonly","readonly");
				document.getElementById("dob").disabled=true;
				document.getElementById("save").disabled=true;
				$("#paymentGatewayDialog").modal();
				}
			 else if(data=="makepayment") //when first time record is saved in prospectusBuyer
			 {//alert("makepaymet");
			    $("#provisionalRegDone").css("display","none");
                $("#duplicateEmail").css("display", "none");
				$("#existsInStudent").css("display", "none");
				$("#afterRegistration").css("display", "none");
				$("#correctEmail").css("display", "block"); //show message that your record saved successfully
			    document.getElementById("pay").disabled=false;
				$(".saveDisabled").attr("readonly","readonly");
				document.getElementById("dob").disabled=true;
				document.getElementById("save").disabled=true;
				$("#paymentGatewayDialog").modal();
			  }
			else   // when details are duplicate in ProspectusBuyer
				{ //alert("duplicate");
				  //alert("duplicate");
				  $("#provisionalRegDone").css("display","none");
				  $("#correctEmail").css("display", "none");
				  $("#existsInStudent").css("display", "none");
				  $("#afterRegistration").css("display", "none");
				  $("#duplicateEmail").css("display","block");
				}
				$("#firstname").val($("#name").val());
				$("#emailPayment").val($("#email").val());
				changeCall1($("#email").val());
				changeCall();
				},
					error: function(data){

						alert("Sorry! Error in connectivity. Please Try again...");
					}
				});
}

/*
	this function is called when you click on continue with existing button in the message box
	message box will display when you are already registered with the provided email
	this checkFormNo() function will submit an ajax request to the url:checkFormNo along with params email and dob
	ajax resoponse can be one of these :
		existed            -	means formNo is generated for user entered email
		provisionalRegDone -	means provisional registration is already done for entered email
        notexists          -	means formNo is not generated means no payment done .when this response is received,
							    then details are updated corresponding to the user entered email
*/
//this function is not in use. you can find this function definition on prospectus.jsp  
function checkFormNo()
{  //alert("==============");
	$("#duplicateEmail").css("display","none");
	$.ajax({
			 url: "/sgterp/resources/checkFormNo",
			 type: "POST",
			 data: "email="+$("#email").val()+"&dob="+$("#dob").val(),
			 success: function(data) { 
				if(data=="existed"){ // payment done but prov reg not done till now
					window.location="redirectToRegistrationOptions?email="+$("#email").val()+"&dob="+$("#dob").val();
				}
				else if(data=="provisionalRegDone")   // prov reg done
				 {
					$("#duplicateEmail").css("display","none");
					$("#correctEmail").css("display", "none");
					$("#provisionalRegDone").css("display", "block");
				 }
				else if(data=="notexists")  // payment not done
				 {
				// alert("------------------");
					save("updateProsBuyerRecord");
				 }
				 else{ // student record created for this email
					$("#duplicateEmail").css("display","none");
					$("#correctEmail").css("display", "none");
					$("#provisionalRegDone").css("display", "none");
					$("#existsInStudent").css("display", "block");
				 }

			  },
			 error: function(data){
					alert("Sorry! Error in connectivity... Please Try again...");
				}
			});
  }//end function

function onLoad()
{
  var aa=new Date().getTime();
  $("#txnId").val(aa);
			$.ajax({
				url: "/sgterp/resources/hashFetch?txnid="+$("#txnId").val()+"&amount="+$("#amount").val()+"&firstname="+$("#firstname").val()+"&email="+$("#emailPayment").val()+"&productinfo="+$("#productinfo").val()+"&key="+$("#key").val()+"&salt="+$('#salt').val(),
				type: "GET",
				success: function(data) {
					$("#hash").val(data);
				},
				error: function(data){

				}
				});
}


function changeCall()

		{
		var aa=new Date().getTime();
		$("#txnId").val(aa);
			$.ajax({
				url: "/sgterp/resources/hashFetch?txnid="+$("#txnId").val()+"&amount="+$("#amount").val()+"&firstname="+$("#firstname").val()+"&email="+$("#emailPayment").val()+"&productinfo="+$("#productinfo").val()+"&key="+$("#key").val()+"&salt="+$('#salt').val(),
				type: "GET",
				success: function(data) {
					$("#hash").val(data);
				},
				error: function(data){

				}
				});
		}
function changeCall1(email12)

		{
		var aa=new Date().getTime();
		$("#email").css("border","white");
		$("#txnId").val(aa);
			$.ajax({
				url: "/sgterp/resources/hashFetch?txnid="+$("#txnId").val()+"&amount="+$("#amount").val()+"&firstname="+$("#firstname").val()+"&email="+$("#emailPayment").val()+"&productinfo="+$("#productinfo").val()+"&key="+$("#key").val()+"&salt="+$('#salt').val(),
				type: "GET",
				success: function(data) {
					$("#hash").val(data);
				},
				error: function(data){
					alert(data+"error");
				}
				});
		}

//this function will mark the border color white when focus is removed from enter captcha chars input box
function captchaValidate(enteredCaptchaValue,elementId)
		{
			if(enteredCaptchaValue==null || enteredCaptchaValue == ""){
				//alert(enteredCaptchaValue);
				$('#'+elementId).css("border","2px solid red");
			//	$('#'+elementId).focus();
				Captcha(); //generate new captcha
			  }
			 else{
			        //alert("else");
					var captchaValue = $('#mainCaptcha').val();
                    captchaValue = removeSpaces(captchaValue);
                    enteredCaptchaValue = removeSpaces(enteredCaptchaValue);

                      if (enteredCaptchaValue != captchaValue){
                            $('#'+elementId).val("");
							$('#'+elementId).css("border","2px solid red");
                  	//		$('#'+elementId).focus();
					  	    Captcha(); //generate new captcha

                        return false;
                      }
					  else{
					       $("#txtInput").css("border","1px white");
						   $("#save").focus();
						   }
		          }

		}
//this function will remove leading and training spaces from the name field value and then make first letter capital
		function clearLeadTrailingSpace(nameValue,elementId)
		{

			var trimedValue=$.trim(nameValue);
		    if(trimedValue && trimedValue.length >=1)
			{
				var firstChar = trimedValue.charAt(0);
				var remainingStr = trimedValue.slice(1);
				trimedValue= firstChar.toUpperCase() + remainingStr;
			}
			$("#"+elementId).val(trimedValue);
		}

	function confirmUserPassword(form,event)
		{
		var newPassword=$("#newPassword").val();
		var oldPassword=$("#oldPassword").val();
		var confirmPassword=$("#confirmPassword").val();
		if(newPassword!=confirmPassword || confirmPassword.length < 6)
		{
		if(newPassword!=confirmPassword){
		alert("Password did not matched");
		$("#newPassword").css("border","1px solid red");
		$("#confirmPassword").css("border","1px solid red");
		event.preventDefault();
		return false;

		}
		if(confirmPassword.length < 6) {
        alert("Error: Password must contain at least six characters!");
		$("#newPassword").css("border","1px solid red");
		$("#confirmPassword").css("border","1px solid red");
		event.preventDefault();
		return false;
		}
		}
		else{

		form.submit();
		}
		}
		function mobileNoValidation(event)
		{
		var phone=$("#phone").val();
		if (phone.match(/^[1-9][0-9]{9}$/))
		{
		$("#phone").css("border","1px solid #D5D5D5");
		}
		else
		{
		$("#phone").css("border","2px solid red");
		$("#phone").val('');
		event.preventDefault();
		return false;
		}
		}
	function feeModeOptions(feeMode)
	{
		if(feeMode=="DD"){
		$("#ddDiv").css("display", "block");
		$("#ddBank").attr('required', '');
		$("#ddDate").attr('required', '');
		$("#favourOf").attr('required', '');
		$("#ddNo").attr('required', '');

		//$("#chequeBank").removeAttr('required');
		//$("#chequeDate").removeAttr('required');
		//$("#payTo").removeAttr('required');
		//$("#chequeNo").removeAttr('required');

		//$("#chequeBank").val('');
		//$("#chequeDate").val('');
		//$("#payTo").val('');
		//$("#chequeNo").val('');

		//$("#chequeDiv").css("display", "none");
		}
		else{
		//$("#chequeBank").removeAttr('required');
		//$("#chequeDate").removeAttr('required');
		//$("#payTo").removeAttr('required');
		//$("#chequeNo").removeAttr('required');

		$("#ddBank").removeAttr('required');
		$("#ddDate").removeAttr('required');
		$("#favourOf").removeAttr('required');
		$("#ddNo").removeAttr('required');

		$("#ddBank").val('');
		$("#ddDate").val('');
		$("#favourOf").val('');
		$("#ddNo").val('');

		//$("#chequeBank").val('');
		//$("#chequeDate").val('');
		//$("#payTo").val('');
		//$("#chequeNo").val('');

		$("#ddDiv").css("display", "none");
		//$("#chequeDiv").css("display", "none");}
		}
	}

	function changeFormAction(event){
		if(	$("#name").val()==null || $("#name").val()=="" ||
			$("#email").val()==null || $("#email").val()=="" ||
			$("#dob").val()==null || $("#dob").val()=="" ||
			$("#phone").val()==null || $("#phone").val()=="" ||
			$("#course77").val()==null || $("#course77").val()=="" ||
			$("#faculty77").val()==null || $("#faculty77").val()=="" ||
			$("#feeMode").val()==null || $("#feeMode").val()==""){

		 alert("All fields are required");
		 event.preventDefault();
		}

		else if($("#feeMode").val()=='DD'){
			if(
			$("#ddBank").val()==null || $("#ddBank").val()=="" ||
			$("#ddDate").val()==null || $("#ddDate").val()=="" ||
			$("#favourOf").val()==null || $("#favourOf").val()=="" ||
			$("#ddNo").val()==null || $("#ddNo").val()=="" ){

			alert("All fields are required");
			event.preventDefault();
		  }
		  else{

			document.getElementById('searchForm').action= "/sgterp/protected/payAndSave";
			$('#searchForm').submit();
			event.preventDefault();
		}
		}
	/*	else if($("#feeMode").val()=='Cheque'){
			if(
			$("#chequeBank").val()==null || $("#chequeBank").val()=="" ||
			$("#chequeDate").val()==null || $("#chequeDate").val()=="" ||
			$("#payTo").val()==null || $("#payTo").val()=="" ||
			$("#chequeNo").val()==null || $("#chequeNo").val()=="" ){

			alert("All fields are required");
			event.preventDefault();
		  }
		  else{

			document.getElementById('searchForm').action= "/sgterp/protected/payAndSave";
			$('#searchForm').submit();
			event.preventDefault();
		}
		}
*/
		else{
			document.getElementById('searchForm').action= "/sgterp/protected/payAndSave";
			$('#searchForm').submit();
			event.preventDefault();
		}
	}
// On accept terms and condition dialog box during online payment , you click on Accept button ,then this function is called
// this function will update prospectus buyer with latest basic info along with txnId , bcz this latest txnId is passed to payment gateway.	
function updateProspectusBuyer()
{
submitOrNot=10;
//alert($("#txnId").val());
$.ajax({
			 url: "/sgterp/resources/updateProsBuyerRecord",
			 type: "POST",
			 async : false,
			 data: "email="+$("#email").val()+"&name="+$("#name").val()+"&phone="+$("#phone").val()+"&location="+$("#location").val()+"&dob="+$("#dob").val()+"&course.courseId="+$("#course77").val()+"&txnId="+$("#txnId").val(),

			 success: function(data) {
			  //alert(data);

			  if(data=="success") //buyer updated successfully
				{	submitOrNot=11;
					//alert("success");
//return true;
				}
				else{
//                 return false;
					
				}
				},
					error: function(data){
alert(stringif(data));
						alert("Sorry! Error in connectivity. Please Try again...");
						//return false;
					}
				});

				if(submitOrNot==11){
				//alert("if");
				return true;} else{
				//alert("else");
				return false;}
				} //end function

