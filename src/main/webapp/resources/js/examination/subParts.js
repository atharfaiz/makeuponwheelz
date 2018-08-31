function SubjectChange(examId)
			{
				resetSubjectChange();
				$("#SubjectSubPartsId").find("option").remove();
				$("#SubjectSubPartsId").append('<option value="">Select</option>');
				$("#SubjectSubPartsDiv").css("display", "none");
				$("#SubjectSubPartsId").attr("disabled",true);
				if(examId != "")
				{
					$.ajax({
						url: "/sgterp/protected/exam/getSubjectSubPartsId",
						type: "POST",
						data: "examId="+examId,
						success: function(data) {
						  if(data.length >0)
							{
								$("#SubjectSubPartsDiv").css("display", "block");
								$("#SubjectSubPartsId").attr("disabled",false);
								
								for(var i=0;i<data.length;i++){
								$("#SubjectSubPartsId").append('<option value="'+data[i].subSubjectId+'">'+data[i].subjectName+'</option>');}
							}
							

							
						},
						error: function(data) {
							//alert("");
						}
					});
				}
			}
			function resetDDElement(element)
			{
				var ddElement=document.getElementById(element);
				$("#"+element).find('option').remove();
				var option1 = document.createElement("option");
				option1.value = "";
				option1.innerHTML = "Select...";
				option1.selected="selected";
				ddElement.appendChild(option1);
			}
			
			function resetSemYear()
			{
				resetDDElement("semYear");
			}
			function resetExaminationDate()
			{
				resetDDElement("examination");
				examChange("","");
			}
			function resetSubjectChange()
			{
				$("#SubjectSubPartsDiv").css("display", "none");
				$("#SubjectSubPartsId").attr("disabled",true);
				resetDDElement("SubjectSubPartsId");
				
			}