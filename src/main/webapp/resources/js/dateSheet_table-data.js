 textarearValue="";
var TableData = function () {
	//function to initiate DataTable
    //DataTable is a highly flexible tool, based upon the foundations of progressive enhancement, 
    //which will add advanced interaction controls to any HTML table
    //For more information, please visit https://datatables.net/
    var runDataTable = function () {
        var oTable = $('#sample_1').dataTable({
            "aoColumnDefs": [{
                "bSortable":false,
				"aTargets": [-1,-2]
            }],
            "oLanguage": {
                "sLengthMenu": "Show _MENU_ Rows",
                "sSearch": "",
                "oPaginate": {
                    "sPrevious": "",
                    "sNext": ""
                }
            },
            "aaSorting": [
                [1, 'asc']
            ],
            "aLengthMenu": [
                [5, 10, 15, 20, -1],
                [5, 10, 15, 20, "All"] // change per page values here
            ],
            // set the initial value
            "iDisplayLength": 10,
        });
        $('#sample_1_wrapper .dataTables_filter input').addClass("form-control input-sm").attr("placeholder", "Search");
        // modify table search input
        $('#sample_1_wrapper .dataTables_length select').addClass("m-wrap small");
        // modify table per page dropdown
        $('#sample_1_wrapper .dataTables_length select').select2();
        // initialzie select2 dropdown
        $('#sample_1_column_toggler input[type="checkbox"]').change(function () {
            /* Get the DataTables object again - this is not a recreation, just a get of the object */
            var iCol = parseInt($(this).attr("data-column"));
            var bVis = oTable.fnSettings().aoColumns[iCol].bVisible;
            oTable.fnSetColumnVis(iCol, (bVis ? false : true));
        });
    };
    var runDataTableCustom = function () {
        var oTable = $('#sample_5').dataTable({
            "bSort": false,
            "oLanguage": {
                "sLengthMenu": "Show _MENU_ Rows",
                "sSearch": "",
                "oPaginate": {
                    "sPrevious": "",
                    "sNext": ""
                }
            },
            "aLengthMenu": [
                [5, 10, 15, 20, -1],
                [5, 10, 15, 20, "All"] // change per page values here
            ],
            // set the initial value
            "iDisplayLength": 10,
        });
        $('#sample_5_wrapper .dataTables_filter input').addClass("form-control input-sm").css("width","300px").attr("placeholder", "Search by name, address, faculty, email etc.");
        // modify table search input
        $('#sample_5_wrapper .dataTables_length select').addClass("m-wrap small");
        // modify table per page dropdown
        $('#sample_5_wrapper .dataTables_length select').select2();
        // initialzie select2 dropdown
        
    };
    
    var runEditableTable = function(){

    	var newRow = false;
		var actualEditingRow = null;
		
		var examinationId = $('#examDate').val();

		if(examinationId!='' && examinationId!=null)
		{
				$.blockUI({
					message : '<i class="fa fa-spinner fa-spin"></i> loading...'
					});
	
		$.ajax({
			 url: "/sgterp/protected/examDateSheetList?examinationId="+examinationId,
			 type: "POST",
			 success: function(data) {
						
				for(var i=0; i<data.length; i++)
				{
					if(i == 0){
							$('#startTime555').val(data[i].startTime);
						$('#startTime343').val(data[i].startTime);
						$('#endTime555').val(data[i].endTime);
						$('#endTime343').val(data[i].endTime);
						$('#location343').val(data[i].location);
						$('#location555').val(data[i].location);					
					}
					if (newRow == false) {
						if (actualEditingRow) {
							restoreRow(oTable, actualEditingRow);
						}
						newRow = true;
				
						
						
							var aiNew = oTable.fnAddData(['', '', '', '','','','','','','']);
					
						var nRow = oTable.fnGetNodes(aiNew[0]);
					var nColumnGroup=nRow.cells;
						oTable.fnUpdate(data[i].subjectName, nRow, 0, false);
						oTable.fnUpdate(data[i].examDate, nRow, 1, false);
						oTable.fnUpdate(data[i].startTime, nRow, 2, false);
						nColumnGroup[2].style.display="none";
						oTable.fnUpdate(data[i].endTime, nRow, 3, false);
						nColumnGroup[3].style.display="none";
						oTable.fnUpdate('<textarea id="'+data[i].examId+'textArea" disabled style="color:#000;">'+data[i].location+'</textarea>', nRow, 4, false);
						nColumnGroup[4].style.display="none";
						oTable.fnUpdate(data[i].examId, nRow, 5, false);
						
						nColumnGroup[5].style.display="none";
						oTable.fnUpdate(data[i].subjectId, nRow, 6, false);
							nColumnGroup[6].style.display="none";
							if(data[i].remarks===null)
							oTable.fnUpdate('<textarea id="remarks'+data[i].examId+'textArea" disabled style="color:#000;"></textarea>', nRow, 7, false);
						else
							oTable.fnUpdate('<textarea id="remarks'+data[i].examId+'textArea" disabled style="color:#000;">'+data[i].remarks+'</textarea>', nRow, 7, false);
							oTable.fnUpdate('<a class="edit-row btn btn-green btn-sm" href=""><i class="fa fa-edit"></i> Edit</a>', nRow, 8, false);
							oTable.fnUpdate('<a class="delete-row btn btn-bricky btn-sm" href=""><i class="fa fa-trash-o"></i> Delete</a>', nRow, 9, false);
				
						oTable.fnDraw();
						newRow = false;
						actualEditingRow = null;
					}
				}//end for loop
				$.unblockUI();
			 },
			error: function(data){
				alert("Unable to fetch data, Please try again!");
				$.unblockUI();
			}
		});
		
		}
	
		
		
		
		
		
		
		function restoreRow(oTable, nRow) {
			var aData = oTable.fnGetData(nRow);
			var jqTds = $('>td', nRow);

			for (var i = 0, iLen = jqTds.length; i < iLen; i++) {
				oTable.fnUpdate(aData[i], nRow, i, false);
			}

			oTable.fnDraw();
		}

		function editRow(oTable, nRow,endTimeParam) {
		
		
			var aData = oTable.fnGetData(nRow);
			var jqTds = $('>td', nRow);
				
			var examDate = aData[1].split("<")[0];
			var startTime = aData[2].split("<")[0];	
			var endTime = aData[3].split("<")[0];	
		
			//var location1 = aData[4].split("<")[0];
				
			
		
			var examId123=aData[5];
			var subjectId123=aData[6];
			if(aData[5]!=null && aData[5]!='null')
				examId123=aData[5].split("<")[0];
			if(aData[6]!=null && aData[6]!='null')
				subjectId123=aData[6].split("<")[0];
		
			var location1 =$("#"+examId123+"textArea").text();
			
				if(location1=="" || location1==null || location1=="undefined")
				{
				location1=$("textarea#location890").val();
				}
			var remarks123 =$("#remarks"+examId123+"textArea").text();;
				
		 var endTimeValue12="";	
		 if(endTimeParam=='addRow'){endTimeValue12=$('#endTime343').val();}
		 else{endTimeValue12= endTime}
	  
	   var startTimeValue12="";	
		 if(endTimeParam=='addRow'){startTimeValue12=$('#startTime343').val();}
		 else{startTimeValue12= startTime}
	
	
	   var locationValue12="";	
		 if(endTimeParam=='addRow'){locationValue12=$('#location343').val();}
		 else{locationValue12=location1}
		 
			jqTds[0].innerHTML = '<select id="examList"  name="subjectName" class="form-size form-control" required="required" onchange="subjectId11.value = this.value; "><option>Select</option></select>';
			
			jqTds[1].innerHTML ='<div class="input-group"><span  class="input-group-addon"><i class="fa fa-calendar"></i> </span><input type="text" id="datePicker" name="examDate" required="required" class="form-control date-range" value="'+ examDate + '"></div>';
			
			$('#datePicker').daterangepicker();
			jqTds[2].innerHTML ='<div class="input-group input-append bootstrap-timepicker"><input id="startTime567" type="hidden" class="form-control time-picker add-on input-sm" value="'+ startTimeValue12+ '"><span style="display:none"  class="input-group-addon add-on"><i class="fa fa-clock-o"></i></span></div>';
			jqTds[2].style.display = 'none';
			jqTds[3].innerHTML ='<div class="input-group input-append bootstrap-timepicker"><input type="hidden" id="endTime567" class="form-control time-picker add-on input-sm" value="'+ endTimeValue12 + '"><span style="display:none"  class="input-group-addon add-on"><i class="fa fa-clock-o"></i></span></div>';
			$('.time-picker').timepicker();
			jqTds[3].style.display = 'none';
			jqTds[4].innerHTML ='<textarea style="display:none" name="location1"  id="location567" required class="form-control">'+locationValue12+'</textarea>';
			jqTds[4].style.display = 'none';
			jqTds[5].innerHTML = '<input type="text" name="" id="examId" class="form-control" value="'+ examId123 + '">';
			jqTds[5].style.display = 'none';
			jqTds[6].innerHTML = '<input type="hidden" name="subjectId11" id="subjectId11" class="form-control" value="'+ subjectId123  + '">';
			jqTds[6].style.display = 'none';
			jqTds[7].innerHTML ='<textarea name="remarks"  id="remarks567"  class="form-control">'+remarks123+'</textarea>';
			jqTds[8].innerHTML = '<a class="save-row btn btn-green btn-sm" href=""><i class="fa fa-edit"></i> Save</a>';
			jqTds[9].innerHTML = '<a class="cancel-row btn btn-bricky btn-sm" href=""><i class="fa fa-trash-o"></i> Cancel</a>';

			subjectListLoop($('#subjectId11').val());
		}

		function saveRow(oTable, nRow) {
	
			var jqInputs = $('input', nRow);

			oTable.fnUpdate($( "#examList option:selected" ).text()+'<input type="hidden" name="subjectId" id="'+$( "#examList" ).val()+ '" value="'+$( "#examList" ).val()+ '">', nRow, 0, false);
						
			oTable.fnUpdate(jqInputs[0].value+'<input type="hidden" name="examDate"  value="'+ jqInputs[0].value + '">', nRow, 1, false);
					
			oTable.fnUpdate(jqInputs[4].value+'<input type="hidden" name="startTime"  value="'+ jqInputs[4].value + '">', nRow, 2, false);
					
			oTable.fnUpdate(jqInputs[8].value+'<input type="hidden" name="endTime"  value="'+ jqInputs[8].value + '">', nRow, 3, false);

			oTable.fnUpdate('<textarea  name="location" id="location890" style="color:#000; pointer-events: none; cursor: default;" >'+$("textarea#location567" ).val()+'</textarea>', nRow, 4, false);
			
			oTable.fnUpdate(jqInputs[9].value+'<input type="hidden" name="examId"  value="'+ jqInputs[9].value + '">', nRow, 5, false);
			oTable.fnUpdate(jqInputs[10].value+'<input type="hidden" name="subjectId44"  value="'+ jqInputs[10].value + '">', nRow, 6, false);
			oTable.fnUpdate('<textarea  name="remarks" id="remarks890" style="color:#000; pointer-events: none; cursor: default;" >'+$("textarea#remarks567" ).val()+'</textarea>', nRow, 7, false);
			oTable.fnUpdate('<a class="edit-row btn btn-green btn-sm" href=""><i class="fa fa-edit"></i> Edit</a>', nRow, 8, false);
			oTable.fnUpdate('<a class="delete-row btn btn-bricky btn-sm"  href=""><i class="fa fa-trash-o"></i> Delete</a>', nRow, 9, false);
			
			oTable.fnDraw();
			newRow = false;
			actualEditingRow = null;
					
		}

		$('body').on('click', '.add-row', function(e) {
       e.preventDefault();
			if (newRow == false) {
				if (actualEditingRow) {
					restoreRow(oTable, actualEditingRow);
				}
				newRow = true;
				var aiNew = oTable.fnAddData(['','','','','','']);
				var nRow = oTable.fnGetNodes(aiNew[0]);
				editRow(oTable, nRow,'addRow');
				actualEditingRow = nRow;
			}
		});
		$('#sample_2').on('click', '.cancel-row', function(e) {

			e.preventDefault();
			if (newRow) {
				newRow = false;
				actualEditingRow = null;
				var nRow = $(this).parents('tr')[0];
				oTable.fnDeleteRow(nRow);

			} else {
				restoreRow(oTable, actualEditingRow);
				actualEditingRow = null;
			}
		});
		$('#sample_2').on('click', '.delete-row', function(e) {

			e.preventDefault();
			if (newRow && actualEditingRow) {
				oTable.fnDeleteRow(actualEditingRow);
				newRow = false;

			}
			var nRow = $(this).parents('tr')[0];
			var nColumnGroup=nRow.cells;
			var examId=nColumnGroup[5].innerHTML;

			bootbox.confirm("Are you sure to delete this row?", function(result) {
				if (result) {
		
					$.blockUI({
					message : '<i class="fa fa-spinner fa-spin"></i> Deleting Record......'
					});
					$.mockjax({
						url : '/tabledata/delete/webservice',
						dataType : 'json',
						responseTime : 1000,
						responseText : {
							say : 'ok'	
					}
				});
				$.ajax({
						url : '/tabledata/delete/webservice',
						dataType : 'json',
						success : function(json) {
							$.unblockUI();
							if (json.say == "ok") {
			if(examId!=null || examId!='' || examId!='null')	
			{
				$.ajax({
				 url: "/sgterp/protected/examination/deleteDateSheet",
				 type: "POST",
				 data: "examId="+examId,
				 success: function(data) {
				 if(data='success')
				 {
					 oTable.fnDeleteRow(nRow);
				
					}
					else
					{
					alert("DateSheet already in use!");
					}
					return false;
				 },
				error: function(data){
				//alert(JSON.stringify(data));
					alert("Internal server error !");
				}
			});
			}
						
							
							}
						}
					});			
				
				
				
				
				
				}
			});
			

			
		});
		$('#sample_2').on('click', '.save-row', function(e) {
		
		if ($("#examList").val()=="Select"){
			alert("Please select Exam");
			$("#examList").focus();
			return false;
		}
		if ($("#datePicker").val()==""){
			alert("Please select Exam Date");
			$("#datePicker").focus();
			return false;
		}
		if ($("#startTime567").val()==""){
			alert("Please select Exam Start time");
			$("#startTime567").focus();
			return false;
		}	
		if ($("#endTime567").val()==""){
			alert("Please select Exam Start time");
			$("#endTime567").focus();
			return false;
		}	
	
		if ($("textarea#location567" ).val().trim()==""){
			alert("Please enter Exam Center");
			$("textarea#location567").focus();
			return false;
		}
		
		
		var count=0;
		var saveRecord=true;
            currentSubjectId=$('#subjectId11').val();
			examId345=$('#examId').val();
		
		$('#sample_2 td:nth-child(7)').each(function(){
		     subjectId75=$(this).text();
			 if(subjectId75 != null || subjectId75 !=""){
				if(parseInt(subjectId75)== parseInt(currentSubjectId)&& examId345!=null){
					//alert("DateSheet has been already created for this exam"); 
					saveRecord=false;
					count++;
				}
			 }
		});
		currentExamDate=$('#datePicker').val();
			$('#sample_2 td:nth-child(2)').each(function(){
		     examDate101=$(this).text();
			 if(examDate101 != null || examDate101 !=""){
				if(examDate101== currentExamDate && examId345!=null){
					//alert("DateSheet has been already created for this Date"); 
					saveRecord=false;
					count++;
				}
			 }
		});
if(count>0)
{
alert("DateSheet has been already created for selected Exam or Exam Date"); 
}
		
			e.preventDefault();
if(saveRecord){
			var nRow = $(this).parents('tr')[0];
			$.blockUI({
					message : '<i class="fa fa-spinner fa-spin"></i> Now Loading...'
					});
					$.mockjax({
						url : '/tabledata/add/webservice',
						dataType : 'json',
						responseTime : 1000,
						responseText : {
							say : 'ok'
						}
					});
					
					$.ajax({
						url : '/tabledata/add/webservice',
						dataType : 'json',
						success : function(json) {
							$.unblockUI();
							if (json.say == "ok") {
								saveRow(oTable, nRow);
							}
						}
					});	
	}				
		});
		$('#sample_2').on('click', '.edit-row', function(e) {
			e.preventDefault();
			if (actualEditingRow) {
				if (newRow) {
					oTable.fnDeleteRow(actualEditingRow);
					newRow = false;
				} else {
					restoreRow(oTable, actualEditingRow);

				}
			}
			var nRow = $(this).parents('tr')[0];
			editRow(oTable, nRow,'editRow');
			actualEditingRow = nRow;

		});
		var oTable = $('#sample_2').dataTable({
			"aoColumnDefs" : [{
				"aTargets" : [0]
			}],
			"oLanguage" : {
				"sLengthMenu" : "Show _MENU_ Rows",
				"sSearch" : "",
				"oPaginate" : {
					"sPrevious" : "",
					"sNext" : ""
				}
			},
			"aaSorting" : [[1, 'asc']],
			"aLengthMenu" : [[5, 10, 15, 20, -1], [5, 10, 15, 20, "All"] // change per page values here
			],
			// set the initial value
			"iDisplayLength" : 10,
		});
		$('#sample_2_wrapper .dataTables_filter input').addClass("form-control input-sm").attr("placeholder", "Search");
		// modify table search input
		$('#sample_2_wrapper .dataTables_length select').addClass("m-wrap small");
		// modify table per page dropdown
		$('#sample_2_wrapper .dataTables_length select').select2();
		// initialzie select2 dropdown
		$('#sample_2_column_toggler input[type="checkbox"]').change(function() {
			/* Get the DataTables object again - this is not a recreation, just a get of the object */
			var iCol = parseInt($(this).attr("data-column"));
			var bVis = oTable.fnSettings().aoColumns[iCol].bVisible;
			oTable.fnSetColumnVis(iCol, ( bVis ? false : true));
		});
    	
    	
    	
    	
    	
    	
    };
    return {
        //main function to initiate template pages
        init: function () {
			runDataTableCustom();
           runDataTable();
            runEditableTable();
        }
    };
}();