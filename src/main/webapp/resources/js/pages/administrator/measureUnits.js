function upperCaseName(e,a){var t=$.trim(e);t=t.toUpperCase(),$("#"+a).val(t)}function IsNumeric(e){e.shiftKey?e.preventDefault():46==e.keyCode||8==e.keyCode||9==e.keyCode||(e.keyCode<48||e.keyCode>57)&&(e.keyCode<96||e.keyCode>105)&&e.preventDefault()}function isAlphaNumeric(e){46==e.keyCode||8==e.keyCode||32==e.keyCode||9==e.keyCode||37==e.keyCode||39==e.keyCode||(20==e.keyCode||(e.keyCode<65||e.keyCode>90)&&(e.keyCode<48||e.keyCode>57)&&(e.keyCode<96||e.keyCode>105))&&e.preventDefault()}var specialKeys=new Array;specialKeys.push(8);var TableData=function(){var e=function(){var e=$("#sample_1").dataTable({aoColumnDefs:[{bSortable:!1,bSearchable:!1,aTargets:[-1,-2]}],oLanguage:{sLengthMenu:"Show _MENU_ Rows",sSearch:"",oPaginate:{sPrevious:"",sNext:""}},aaSorting:[[1,"asc"]],aLengthMenu:[[5,10,15,20,-1],[5,10,15,20,"All"]],iDisplayLength:10});$("#sample_1_wrapper .dataTables_filter input").addClass("form-control input-sm").attr("placeholder","Search"),$("#sample_1_wrapper .dataTables_length select").addClass("m-wrap small"),$("#sample_1_wrapper .dataTables_length select").select2(),$('#sample_1_column_toggler input[type="checkbox"]').change(function(){var a=parseInt($(this).attr("data-column")),t=e.fnSettings().aoColumns[a].bVisible;e.fnSetColumnVis(a,t?!1:!0)})},a=function(){function e(e,a){for(var t=e.fnGetData(a),n=$(">td",a),s=0,r=n.length;r>s;s++)e.fnUpdate(t[s],a,s,!1);e.fnDraw()}function a(e,a){var t=e.fnGetData(a),n=$(">td",a);n[0].innerHTML='<input type="text" id="uppercase" style="width:100%;" onblur="upperCaseName(this.value,this.id)" value="'+t[0]+'" required  >',n[1].innerHTML='<input type="text" style="width:100%;" maxlength="40" id="description" value="'+t[1]+'">',n[2].innerHTML='<a class="save-row btn btn-green btn-sm" href=""><i class="fa fa-save"></i> Save</a>&nbsp;&nbsp;<a class="cancel-row btn btn-bricky btn-sm" href=""><i class="clip-cancel-circle"></i> Cancel</a>'}function t(e,a){var t=e.fnGetData(a),n=(a.cells,$(">td",a));n[0].innerHTML='<input type="text" maxlength="25" id="measureUnit" onblur="upperCaseName(this.value,this.id)" style="width:100%;"  value="'+t[0]+'">',n[1].innerHTML='<input type="text" maxlength="40" style="width:100%;" onkeydown="isAlphaNumeric(event);" value="'+t[1]+'">',n[2].innerHTML='<a class="save-row btn btn-green btn-sm" href=""><i class="fa fa-save"></i> Save</a>&nbsp;&nbsp;<a class="cancel-row btn btn-bricky btn-sm" href=""><i class="clip-cancel-circle"></i> Cancel</a>'}function n(e,a){var t=$("input",a);$.ajax({url:"/sgterp/protected/scm/addMeasureUnits",type:"POST",data:"unitName="+t[0].value+"&description="+t[1].value,success:function(n){e.fnUpdate('<a href="">'+t[0].value+"</a>",a,0,!1),e.fnUpdate(t[1].value,a,1,!1),e.fnUpdate('<a class="edit-row btn btn-green btn-sm" href=""><i class="fa fa-edit"></i> Edit</a>',a,2,!1),e.fnDraw(),s=!1,r=null,location.reload()},error:function(e){alert("Unable to save, Please try again!")}})}var s=!1,r=null;$.ajax({url:"/sgterp/protected/scm/measureUnitList",type:"POST",success:function(a){store=JSON.parse(a),size=Object.keys(store).length/2;for(var t=0;t<size;t++)if(unitName="unitName"+t,description="description"+t,0==s){if(r&&e(l,r),s=!0,checkPermission)var n=l.fnAddData(["","",""]);else var n=l.fnAddData(["",""]);var i=l.fnGetNodes(n[0]);l.fnUpdate(store[unitName],i,0,!1),l.fnUpdate(store[description],i,1,!1),checkPermission&&l.fnUpdate('<a class="edit-row btn btn-green btn-sm" href=""><i class="fa fa-edit"></i> Edit</a>',i,2,!1),l.fnDraw(),s=!1,r=null}$.unblockUI()},error:function(e){alert("Unable to fetch data, Please try again!"),$.unblockUI()}}),$("body").on("click",".add-row",function(t){if(t.preventDefault(),0==s){r&&e(l,r),s=!0;var n=l.fnAddData(["","","",""]),i=l.fnGetNodes(n[0]);a(l,i),r=i}}),$("#sample_2").on("click",".cancel-row",function(a){if(a.preventDefault(),s){s=!1,r=null;var t=$(this).parents("tr")[0];l.fnDeleteRow(t)}else e(l,r),r=null}),$("#sample_2").on("click",".delete-row",function(e){e.preventDefault(),s&&r&&(l.fnDeleteRow(r),s=!1);var a=$(this).parents("tr")[0],t=a.cells,n=t[0].innerHTML;bootbox.confirm("Are you sure to delete this Unit?",function(e){e&&($.blockUI({message:'<i class="fa fa-spinner fa-spin"></i> Delete Unit...'}),$.mockjax({url:"/tabledata/delete/webservice",dataType:"json",responseTime:1e3,responseText:{say:"ok"}}),$.ajax({url:"/tabledata/delete/webservice",dataType:"json",success:function(e){$.unblockUI(),"ok"==e.say&&$.ajax({url:"/sgterp/protected/scm/deleteMeasureUnits",type:"POST",data:"unitName="+n,success:function(e){l.fnDeleteRow(a),location.reload()},error:function(e){alert("Already in use")}})}}))})}),$("#sample_2").on("click",".save-row",function(e){e.preventDefault();var a=$(this).parents("tr")[0],t=a.cells,s=t[0].children[0].value;return""==s||null==s?(alert("Please enter Unit Name"),!1):0==warnBeforeUpdate("sample_2",s,0,"no","Unit Name")?!1:($.blockUI({message:'<i class="fa fa-spinner fa-spin"></i> saving data...'}),$.mockjax({url:"/tabledata/add/webservice",dataType:"json",responseTime:1e3,responseText:{say:"ok"}}),void $.ajax({url:"/tabledata/add/webservice",dataType:"json",success:function(e){$.unblockUI(),"ok"==e.say&&n(l,a)}}))}),$("#sample_2").on("click",".edit-row",function(a){a.preventDefault(),r&&(s?(l.fnDeleteRow(r),s=!1):e(l,r));var n=$(this).parents("tr")[0];t(l,n),r=n});var l=$("#sample_2").dataTable({aoColumnDefs:[{bSortable:!1,bSearchable:!1,aTargets:[-1,-2]}],oLanguage:{sLengthMenu:"Show _MENU_ Rows",sSearch:"",oPaginate:{sPrevious:"",sNext:""}},aaSorting:[[1,"asc"]],aLengthMenu:[[5,10,15,20,-1],[5,10,15,20,"All"]],iDisplayLength:10});$("#sample_2_wrapper .dataTables_filter input").addClass("form-control input-sm").attr("placeholder","Search"),$("#sample_2_wrapper .dataTables_length select").addClass("m-wrap small"),$("#sample_2_wrapper .dataTables_length select").select2(),$('#sample_2_column_toggler input[type="checkbox"]').change(function(){var e=parseInt($(this).attr("data-column")),a=l.fnSettings().aoColumns[e].bVisible;l.fnSetColumnVis(e,a?!1:!0)})};return{init:function(){e(),a()}}}();