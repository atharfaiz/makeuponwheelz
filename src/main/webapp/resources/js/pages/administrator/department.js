var specialKeys = new Array();
var specialKeys = new Array();
specialKeys.push(8); //Backspace
function upperCaseName(nameValue,elementId){
			var trimedValue=$.trim(nameValue);
			trimedValue=trimedValue.toUpperCase();
			$("#"+elementId).val(trimedValue);
		
		}
		

function alphabet(event){ // Alphabet only
         
    // Allow only backspace and delete
    	if ( event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39 ||event.keyCode == 38 || event.keyCode == 40 || event.keyCode == 32 || (event.keyCode >=65 &&  event.keyCode <= 90)) 
		{
    	 	
    	}
    	else 
		{
    		// Ensure that it is a alphabet and stop the keypress
    		if (event.shiftKey || event.keyCode < 65 ||  event.keyCode > 90)
			{ 
    			event.preventDefault();	
    		}
    	}
         }
 function storeRoom(aData){ 
                $.ajax({
				 url: "/sgterp/protected/scm/storeList",
				 type: "GET",
				 success: function(data) {
				var storeSelect=document.getElementById("storeSelect");
				var option1 = document.createElement("option");
				option1.value = 0;
				option1.innerHTML = "Select Store Room";
				option1.selected="selected";
				storeSelect.appendChild(option1);
				for(var i=0; i<data.length; i++)	//filter items from json object
				{
					var option = document.createElement("option");
					option.value = data[i].storeId;
					option.innerHTML = data[i].storeName;
						if(data[i].storeName == aData[2])
							option.selected = true;
					storeSelect.appendChild(option);
				}//end for loop
				 },
				error: function(data){
					alert("Unable to fetch data, Please try again!");
				}
			});
 }

var TableData = function () {

    //function to initiate DataTable
    //DataTable is a highly flexible tool, based upon the foundations of progressive enhancement,
    //which will add advanced interaction controls to any HTML table
    //For more information, please visit https://datatables.net/
    var runDataTable = function () {
        var oTable = $('#sample_1').dataTable({
            "aoColumnDefs": [{
                "bSortable":false,
				"bSearchable":false,
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
                [0, 'asc']
            ],
            "aLengthMenu": [
                [5, 10, 15, 20, -1],
                [5, 10, 15, 20, "All"] // change per page values here
            ],
            // set the initial value
            "iDisplayLength": 10,
        });
        $('#sample_1_wrapper .dataTables_filter input').addClass("form-size input-sm").attr("placeholder", "Search");
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

    var runEditableTable = function(){

    	var newRow = false;
		var actualEditingRow = null;
		//$.blockUI({
				//	message : '<i class="fa fa-spinner fa-spin"></i> loading...'
//});
		$.ajax({
			 url: "/sgterp/protected/scm/departmentList",
			 type: "GET",
			 success: function(data) {
			 		for(var i=0; i<data.length; i++)
				{
					if (newRow == false) {
						if (actualEditingRow) {
							restoreRow(oTable, actualEditingRow);
						}
						newRow = true;
						if(checkPermission)
							var aiNew = oTable.fnAddData(['', '', '', '','']);
						else
							var aiNew = oTable.fnAddData(['', '', '']);
						var nRow = oTable.fnGetNodes(aiNew[0]);
						//oTable.fnUpdate(data[i].departmentId, nRow, 0, false);
						oTable.fnUpdate(data[i].departmentName, nRow, 0, false);
						oTable.fnUpdate(data[i].address, nRow, 1, false);
						oTable.fnUpdate(data[i].storeName, nRow, 2, false);
						
						if(checkPermission)
						{
							oTable.fnUpdate('<a class="edit-row btn btn-green btn-sm" href=""><i class="fa fa-edit"></i> Edit</a>', nRow, 3, false);
						  //  oTable.fnUpdate('<a class="delete-row btn btn-bricky btn-sm" href=""><i class="fa fa-trash-o"></i> Delete</a>', nRow, 4, false);
							oTable.fnUpdate(data[i].departmentId, nRow, 4, false);
						}
						
						
						
						nRow.cells[4].style.display="none";
						oTable.fnDraw();
						newRow = false;
						actualEditingRow = null;
					}
				}//end for loop
			//	$.unblockUI();
			 },
			error: function(data){
				alert("Unable to fetch data, Please try again!");
				//$.unblockUI();
			}
		});

		function restoreRow(oTable, nRow) {
			var aData = oTable.fnGetData(nRow);
			var jqTds = $('>td', nRow);

			for (var i = 0, iLen = jqTds.length; i < iLen; i++) {
				oTable.fnUpdate(aData[i], nRow, i, false);
			}

			oTable.fnDraw();
		}

		function editRow(oTable, nRow) {
			var aData = oTable.fnGetData(nRow);
			var jqTds = $('>td', nRow);
			storeRoom(aData);
		
			jqTds[0].innerHTML = '<input type="text"  style="width:100%" id="deptName" maxlength="50" onblur="upperCaseName(this.value,this.id)"   value="' + aData[0] + '">';
			jqTds[1].innerHTML = '<input type="text" class="form-control"  maxlength="255" style="width:100%"  value="' + aData[1] + '">';
			jqTds[2].innerHTML = '<select id="storeSelect" style="width:100%" class="form-control"></select>';
			jqTds[3].innerHTML = '<a class="save-row btn btn-green "  href=""><i class="fa fa-save"></i> </a> &nbsp;&nbsp;<a class="cancel-row btn btn-bricky "  href=""><i class="clip-cancel-circle"></i> </a>';
			jqTds[4].innerHTML = '<input type="hidden" class="form-control" style="width:100%"  value="'+ aData[4] + '" required>';
			nRow.cells[4].style.display="none";

		}

		function editRowGroup(oTable, nRow) {
			var aData = oTable.fnGetData(nRow);
			var nColumnGroup=nRow.cells;
			var group_name_column=nColumnGroup[0].innerHTML;
			var aData = oTable.fnGetData(nRow);
			var jqTds = $('>td', nRow);
		    storeRoom(aData);
			jqTds[0].innerHTML = '<input type="text" maxlength="50"  style="width:100%" id="depttName" onblur="upperCaseName(this.value,this.id)"  value="' + aData[0] + '">';
			jqTds[1].innerHTML = '<input type="text"  maxlength="255" class="form-control" style="width:100%"  value="' + aData[1] + '">';
			jqTds[2].innerHTML = '<select id="storeSelect" style="width:100%" class="form-control"></select>';
			jqTds[3].innerHTML = '<a class="save-row btn btn-green "  href="" data-placement="top" data-original-title="save"><i class="fa fa-save"></i></a>&nbsp;&nbsp;<a class="cancel-row btn btn-bricky "  href=""><i class="clip-cancel-circle"></i></a>';
			jqTds[4].innerHTML = '<input type="hidden" class="form-control" style="width:100%"  value="'+ aData[4] + '" required>';
			nRow.cells[4].style.display="none";
			$("#sample_2").css("width","100%");
		}

		function saveRow(oTable, nRow) {
			
			var jqInputs = $('input', nRow);
			var jqSelect = $('select', nRow);
			//oTable.fnUpdate(jqInputs[0].value, nRow, 0, false);
			//oTable.fnUpdate(jqInputs[1].value, nRow, 1, false);
			var dataForSubmit="departmentName="+jqInputs[0].value+"&address="+jqInputs[1].value+"&storeId="+jqSelect[0].value;
			if(jqInputs[2].value!=null && jqInputs[2].value!="")
				dataForSubmit="departmentName="+jqInputs[0].value+"&address="+jqInputs[1].value+"&storeId="+jqSelect[0].value+"&departmentId="+jqInputs[2].value;
			$.ajax({
				  url: "/sgterp/protected/scm/addDepartment",
				  type: "POST",
				  data: dataForSubmit,
				  success: function(data) {
				  if(data=='failure'){
				  alert('Department name already exist');
				  }
					    oTable.fnUpdate(jqInputs[0].value, nRow, 0, false);
						oTable.fnUpdate(jqInputs[1].value, nRow, 1, false);
						//oTable.fnUpdate(jqInputs[2].value, nRow, 2, false);
						oTable.fnUpdate(jqSelect[0].selectedOptions[0].text, nRow, 2, false);
						oTable.fnUpdate('<a class="edit-row btn btn-green "  href=""><i class="fa fa-edit"></i> </a>', nRow, 3, false);
						//oTable.fnUpdate('<a class="delete-row btn btn-bricky btn-sm" href=""><i class="fa fa-trash-o"></i> Delete</a>', nRow, 4, false);
						oTable.fnDraw();
						newRow = false;
						actualEditingRow = null;
						location.reload();
				  },
				error: function(data){
					alert("Unable to save, Please try again!");
				}
				});


		}//end function

		$('body').on('click', '.add-row', function(e) {
			e.preventDefault();

			if (newRow == false) {
				if (actualEditingRow) {
					restoreRow(oTable, actualEditingRow);
				}
				newRow = true;
				var aiNew = oTable.fnAddData(['', '', '', '','','']);
				var nRow = oTable.fnGetNodes(aiNew[0]);
				editRow(oTable, nRow);
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
	/*	$('#sample_2').on('click', '.delete-row', function(e) {
			e.preventDefault();
			if (newRow && actualEditingRow) {
				oTable.fnDeleteRow(actualEditingRow);
				newRow = false;

			}
			var nRow = $(this).parents('tr')[0];
			var nColumnDepartment=nRow.cells;
			var nColumnDepartmentId=nColumnDepartment[5].innerHTML;
			bootbox.confirm("Are you sure to delete this Department?", function(result) {
				if (result) {
					$.blockUI({
					message : '<i class="fa fa-spinner fa-spin"></i> Delete Department...'
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
								$.ajax({
								
							 		url: "/sgterp/protected/scm/deleteDepartment",
							 		type: "POST",
							 		data: "departmentId="+nColumnDepartmentId,
							 		success: function(data) {
								 	oTable.fnDeleteRow(nRow);
									location.reload();
							 	},
								error: function(data){
								alert("Department Already in use");
								}
							});
							}
						}
					});

				}
			});



		}); */
		$('#sample_2').on('click', '.save-row', function(e) {
			e.preventDefault();
			var nRow = $(this).parents('tr')[0];
			var nColumnDepartment=nRow.cells;
			//var nColumnDepartmentId=nColumnDepartment[0].children[0].value;
			var nColumnDepartmentName=nColumnDepartment[0].children[0].value;
			var nColumnAddress=nColumnDepartment[1].children[0].value;
			var nColumnStoreRoom=nColumnDepartment[2].children[0].value;
			
			if(nColumnDepartmentName==null || nColumnDepartmentName=="")
			{
				alert("Please Enter Department Name");
				return false;
			}
			
			var rows=$("#sample_2").dataTable().fnGetNodes();
	for(var i=0;i<rows.length;i++)
    {
		var elementValue=$(rows[i]).find("td:eq(0)").html();
		if(elementValue==nColumnDepartmentName)
		{
				alert("Department Name already exist. Please Enter different one.");
				return false;
		}
		
    }

			$.blockUI({
					message : '<i class="fa fa-spinner fa-spin"></i> saving data...'
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
			editRowGroup(oTable, nRow);
			actualEditingRow = nRow;

		});
		var oTable = $('#sample_2').dataTable({
			"aoColumnDefs" : [{
				"bSortable":false,
				"bSearchable":false,
                "aTargets": [-1,-2]
			}],
			"oLanguage" : {
				"sLengthMenu" : "Show _MENU_ Rows",
				"sSearch" : "",
				"oPaginate" : {
					"sPrevious" : "",
					"sNext" : ""
				}
			},
			"aaSorting" : [[0, 'asc']],
			"aLengthMenu" : [[5, 10, 15, 20, -1], [5, 10, 15, 20, "All"] // change per page values here
			],
			// set the initial value
			"iDisplayLength" : 10,
		});
		$('#sample_2_wrapper .dataTables_filter input').addClass("form-size input-sm").attr("placeholder", "Search");
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
            runDataTable();
            runEditableTable();
        }
    };
}();

			