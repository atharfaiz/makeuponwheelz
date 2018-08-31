
//find by radio button options for searching by an employeeId,department,employeeName
function changeContent(){
	// if search by enquiryNo radio button is checked
	if($("#enquiryNoRadio").is(':checked') ){
	    $("#contactNoDiv").css('display','none');
		$("#othersDiv").css('display','none');
	    $("#dateRangeDiv").css('display','none');
		$("#emailDiv").css('display','none');
		$("#nameDiv").css('display','none');
		$("#enquiryNoDiv").show();
		
		}
	// if search by contactNo radio button is checked
	else if($("#contactNoRadio").is(':checked') ){
	     $("#enquiryNoDiv").css('display','none');
		 $("#othersDiv").css('display','none');
		 $("#emailDiv").css('display','none');
		 $("#contactNoDiv").show();
		 $("#nameDiv").css('display','none');
		 $("#dateRangeDiv").css('display','none');
	    }
	//if search by email radio button is checked
	else if($("#emailRadio").is(':checked') ){
	     $("#enquiryNoDiv").css('display','none');
		 $("#othersDiv").css('display','none');
		 $("#emailDiv").show();
		 $("#contactNoDiv").css('display','none');
		 $("#nameDiv").css('display','none');
		 $("#dateRangeDiv").css('display','none');
	    }
	// if search by dateRange radio button is checked
	else if($("#dateRangeRadio").is(':checked') ){
	     $("#enquiryNoDiv").css('display','none');
		 $("#othersDiv").css('display','none');
		 $("#contactNoDiv").css('display','none');
		 $("#emailDiv").css('display','none');
		 $("#nameDiv").css('display','none');
		 $("#dateRangeDiv").show();
		 
	    }
	// if search by name radio button is checked
	else if($("#byNameRadio").is(':checked') ){
	     $("#enquiryNoDiv").css('display','none');
		 $("#othersDiv").css('display','none');
		 $("#contactNoDiv").css('display','none');
		 $("#emailDiv").css('display','none');
		 $("#dateRangeDiv").css('display','none');
		 $("#nameDiv").show();
		
		 
	    }	
	// if search by others radio button is checked	
	else{
	     $("#dateRangeDiv").css('display','none');
	     $("#contactNoDiv").css('display','none');
		 $("#enquiryNoDiv").css('display','none');
		 $("#emailDiv").css('display','none');
		 $("#nameDiv").css('display','none');
		 $("#othersDiv").show();
		
	}
	
}//end function