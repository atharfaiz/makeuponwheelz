

		$(".real-number-key-only").keydown(function(event) 
	{
	
		if(event.shiftKey)
		{
			event.preventDefault();	
		}
		// Allow only decimal, backspace and delete
    	else if ( event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 190 || event.keyCode == 9 || event.keyCode == 37|| event.keyCode == 38|| event.keyCode == 39|| event.keyCode == 40) 
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
    });
		
		
		function chkObtainedMarks(value,id,original)
{
			if(value == 0 || value == '')
						{
						$("#"+id).val(0);
						return false;
						}
						if(value > original)
						{
						alert('Marks have exceeded Maximum Marks');
								$("#"+id).val(0);
						return false;
						}
}	
function chkFailPass(value,subPracticle,regNo,capMarks)
{
var availableGrace = parseFloat($("#Available"+regNo).val()) + parseFloat($("#OBGRACE"+value).val());
var totalObtained = parseFloat($("#OBTH"+value).val()) + parseFloat($("#OBTHIA"+value).val());
//alert('total theory marks '+$("#OBTH"+value).val() + 'total Practicle marks '+$("#OBTHIA"+value).val());
//alert('total Passing marks '+totalObtained);
var totalMarks = parseFloat($("#TotalMarks"+value).val());
if(subPracticle=='Yes')
{
	var totalPassingMarks = (parseFloat(totalMarks) * parseFloat($("#passingPRMark").val()))/100;
	//alert('Total Passing Marks PR '+totalPassingMarks);
	if(totalObtained < totalPassingMarks)
	{
			var reqMarks = parseFloat(totalPassingMarks - totalObtained);
			if(capMarks==0 || capMarks=='')
			{
				if(reqMarks <= availableGrace)
				{
					$("#OBGRACE"+value).val(reqMarks);
					$("#Available"+regNo).val((availableGrace - reqMarks).toFixed(2));
				}
				else
				{
					$("#Available"+regNo).val(availableGrace);
					$("#OBGRACE"+value).val(0);
				}
			}
			else
			{
				if(reqMarks <= availableGrace && reqMarks <= capMarks)
				{
					$("#OBGRACE"+value).val(reqMarks);
					$("#Available"+regNo).val((availableGrace - reqMarks).toFixed(2));
				}
				else
				{
					$("#Available"+regNo).val(availableGrace);
					$("#OBGRACE"+value).val(0);
				}
			}
	}
	else
	{
		if($("#OBGRACE"+value).val()>0)
		{
			$("#Available"+regNo).val(availableGrace);
			$("#OBGRACE"+value).val(0);
		}
	}
}
else
{
	var totalPassingMarks = (parseFloat(totalMarks) * parseFloat($("#passingTHMark").val()))/100;
	//alert('Total Passing Marks TH '+totalPassingMarks);
	if(totalObtained < totalPassingMarks)
	{
		var reqMarks = parseFloat(totalPassingMarks - totalObtained);
	//	alert('Requested Marks to get Pass  '+reqMarks);
	//	alert('Available grace that can be given  '+availableGrace);
		if(capMarks==0 || capMarks=='')
			{
				if(reqMarks <= availableGrace)
				{
				//	alert('if part means grace can be provided');
					$("#OBGRACE"+value).val(reqMarks);
					$("#Available"+regNo).val((availableGrace - reqMarks).toFixed(2));
				}
				else
				{
				//	alert('else part means grace is not sufficeint');
					$("#Available"+regNo).val(availableGrace);
					$("#OBGRACE"+value).val(0);
				}
			}
			else
			{
				if(reqMarks <= availableGrace && reqMarks <= capMarks)
				{
					$("#OBGRACE"+value).val(reqMarks);
					$("#Available"+regNo).val((availableGrace - reqMarks).toFixed(2));
				}
				else
				{
					$("#Available"+regNo).val(availableGrace);
					$("#OBGRACE"+value).val(0);
				}
			}
		
	}
	else
	{
		if($("#OBGRACE"+value).val()>0)
		{
			$("#Available"+regNo).val(availableGrace);
			$("#OBGRACE"+value).val(0);
		}
	}
}
	//var finalTotalObtained = parseFloat($("#OBTH"+value).val()) + parseFloat($("#OBTHIA"+value).val()) + parseFloat($("#OBGRACE"+value).val());
	//var finalPercentage = ((finalTotalObtained*100)/totalMarks).toFixed(2);
	//alert('Final Total Obtained '+finalTotalObtained);
	//alert('Final Total Percentage '+finalPercentage);
	
}
function chkIAMarks(value,id,original)
{
		if(value == 0 || value == '')
						{
						$("#"+id).val(0);
						return false;
						}
						if(value > original)
						{
						alert('Marks have exceeded Maximum Marks');
								$("#"+id).val(0);
						return false;
						}
}
function oralMarksFunction(value,id,original)
{
	if(value == 0 || value == '')
						{
						$("#"+id).val(0);
						return false;
						}
						if(value > original)
						{
						alert('Marks have exceeded Maximum Marks');
								$("#"+id).val(0);
						return false;
						}
}
	
function enableNDisableAll()
{
	if($('#header_check').is(':checked'))
	{
		$("input[name='subjectId']").prop('checked', true);
		$("input[name='examDate']").attr('disabled', false);
		$("input[name='obtainedTheoryMarks']").attr('disabled', false);
		$("input[name='internalAssmnttMarksTh']").attr('disabled', false);
		$("input[name='grade']").attr('disabled', false);
		$("input[name='resId']").attr('disabled', false);
		$("input[name='graceMarks']").attr('disabled', false);
		$("input[name='markInWord']").attr('disabled', false);
		$("input[name='oralMarks']").attr('disabled', false);
		$("input[name='oralMarksWord1']").attr('disabled', false);
	}
	else
	{
		$("input[name='subjectId']").prop('checked', false);
		$("input[name='obtainedTheoryMarks']").attr('disabled', true);
		$("input[name='examDate']").attr('disabled', true);
		$("input[name='internalAssmnttMarksTh']").attr('disabled', true);
		$("input[name='grade']").attr('disabled', true);
		$("input[name='resId']").attr('disabled', true);
		$("input[name='graceMarks']").attr('disabled', true);
		$("input[name='markInWord']").attr('disabled', true);
		$("input[name='oralMarks']").attr('disabled', true);
		$("input[name='oralMarksWord1']").attr('disabled', true);
	}
}
		
function enableNDisableRecord(value)
{
	if($('#'+value).is(':checked'))
	{
		$("#RESID"+value).attr('disabled', false);
		$("#EXM"+value).attr('disabled', false);
		$("#OBTH"+value).attr('disabled', false);
		$("#OBPR"+value).attr('disabled', false);
		$("#REVAL"+value).attr('disabled', false);
		$("#OBTHIA"+value).attr('disabled', false);
		$("#OBGRACE"+value).attr('disabled', false);
		$("#OBPRIA"+value).attr('disabled', false);
		$("#OBGD"+value).attr('disabled', false);
		$("#OBTHWORD"+value).attr('disabled', false);
		$("#oralMark"+value).attr('disabled', false);
		$("#oralMark1"+value).attr('disabled', false);
	}
	else
	{
	$('#header_check').prop('checked', false);
		$("#RESID"+value).attr('disabled', true);
		$("#EXM"+value).attr('disabled', true);
		$("#OBTH"+value).attr('disabled', true);
		$("#OBPR"+value).attr('disabled', true);
		$("#REVAL"+value).attr('disabled', true);
		$("#OBTHIA"+value).attr('disabled', true);
		$("#OBGRACE"+value).attr('disabled', true);
		$("#OBPRIA"+value).attr('disabled', true);
		$("#OBGD"+value).attr('disabled', true);
		$("#OBTHWORD"+value).attr('disabled', true);
		$("#oralMark"+value).attr('disabled', true);
		$("#oralMark1"+value).attr('disabled', true);
	}
}
	
		function facultyChange(facultyValue){
		
			semyear=document.getElementById("semYear77");
			course=document.getElementById("course77");
			exam12=document.getElementById("exam12");
			if(facultyValue==null || facultyValue=='')
			{

								course.options.length=0;
								opt=document.createElement('option');
								 opt.value='';
							     opt.text="Select Course";
								 course.add(opt);

								semyear.options.length=0;
								opt1=document.createElement('option');
								 opt1.value='';
							     opt1.text="Select Sem or Year";
								 semyear.add(opt1);
								 
								 exam12.options.length=0;
						opt2=document.createElement('option');
						 opt2.value='';
					     opt2.text="Select Exam";
						 exam12.add(opt2);

			}
			else{
		     $.ajax({
						  url: "/sgterp/protected/changeProvRegFaculty",
						  type: "POST",
						  data: "facultyId="+facultyValue,
						  success: function(data) {
							  course.options.length=0;
								opt=document.createElement('option');
								 opt.value='';
							     opt.text="Select Course";
								 course.add(opt);

								semyear.options.length=0;
								opt1=document.createElement('option');
								 opt1.value='';
							     opt1.text="Select Sem or Year";
								
						exam12.options.length=0;
						opt2=document.createElement('option');
						 opt2.value='';
					     opt2.text="Select Exam";
						 exam12.add(opt2);

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
		
		
function courseChange(courseValue)
{ 
exam12=document.getElementById("exam12");
	if(courseValue=='')
	{
	 semYear=document.getElementById("semYear77");
						semYear.options.length=0;
						opt=document.createElement('option');
						 opt.value='';
					     opt.text="Select Sem or Year";
						 semYear.add(opt);
	
				exam12.options.length=0;
						opt1=document.createElement('option');
						 opt1.value='';
					     opt1.text="Select Exam";
						 exam12.add(opt1);
	
	}
	else{
	
     $.ajax({
				  url: "/sgterp/protected/courseChange",
				  type: "POST",
				  data: "courseId="+courseValue,
				  success: function(data) {
					  
					 for(var i=0;i<data.length;i++)
					 {
					   if(i==0)
					   {			   
					
	                   }//end first record of data
					   
					 else
					  {
					    dataRecord3=data[i];
                        semYear=document.getElementById("semYear77");
						semYear.options.length=0;
						opt=document.createElement('option');
						    opt.value="";
						    opt.text="Select Sem or Year";
						    semYear.add(opt);
						
						exam12.options.length=0;
						opt1=document.createElement('option');
						 opt1.value='';
					     opt1.text="Select Exam";
						 exam12.add(opt1);
						for(var k=0;k<dataRecord3.length;k++)
						  { 
							
						    opt=document.createElement('option');
						    opt.value=dataRecord3[k].coursePattern;
						    opt.text=dataRecord3[k].coursePattern;
						    semYear.add(opt);
						  } 
					    }	//end else					
	                }//for loop for data
					faculty.selectmenu("refresh");
				   },
					error: function(data){
						alert("error in save");
					} 
					});
}
	}//end courseChange function
		
		
	

	function examDateChangeForExam() {
		 exam12=document.getElementById("exam12");
				exam12.options.length=0;
						opt1=document.createElement('option');
						 opt1.value='';
					     opt1.text="Select Exam";
						 exam12.add(opt1);
    if($("#examDate33").val() != "")
	{
	$.ajax({
			 url: "/sgterp/protected/result/examList?examDate="+$("#examDate33").val(),
			 type: "GET",
			 success: function(data) {

			 for(var i=0;i<data.length;i++)
				 {
						var maps = Object.keys(data[i]);
						for(var j=0;j< maps.length;j++){
						$("#exam12").append("<option value='"+maps[j]+"'>"+data[i][maps[j]]+"</option>");
			        }
				 }
			}
	});
	}
	}
	
	$('#reg_no').change(function () {
	$("#examDate35").empty();
    $.ajax({
			 url: "semOrYrList?registerationNo="+$('#reg_no').val(),
			 type: "GET",
			 success: function(data) {
			 $("#semYearId").empty();
			 semYearId=document.getElementById("semYearId");
				semYearId.options.length=0;
						opt1=document.createElement('option');
						 opt1.value='';
					     opt1.text="Select Semester";
						 semYearId.add(opt1);
				 for(var i=0;i<data.length;i++)
				 {
					$("#semYearId").append("<option value='"+data[i].coursePattern+"'>"+data[i].coursePattern+"</option>");
				 }
			 }
	});
	});
	


		