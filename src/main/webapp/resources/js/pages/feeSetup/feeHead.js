function IsNumeric(e){e.shiftKey?e.preventDefault():46==e.keyCode||8==e.keyCode||9==e.keyCode||37==e.keyCode||39==e.keyCode||(e.keyCode<48||e.keyCode>57)&&(e.keyCode<96||e.keyCode>105)&&e.preventDefault()}function isAlphaNumeric(e){46==e.keyCode||8==e.keyCode||32==e.keyCode||9==e.keyCode||37==e.keyCode||39==e.keyCode||(e.shiftKey||(e.keyCode<65||e.keyCode>90)&&(e.keyCode<48||e.keyCode>57)&&(e.keyCode<96||e.keyCode>105))&&e.preventDefault()}var specialKeys=new Array;specialKeys.push(8);var TableData=function(){var e=function(){var e=$("#sample_1").dataTable({aoColumnDefs:[{bSortable:!1,bSearchable:!1,aTargets:[-1,-2]}],oLanguage:{sLengthMenu:"Show _MENU_ Rows",sSearch:"",oPaginate:{sPrevious:"",sNext:""}},aaSorting:[[1,"asc"]],aLengthMenu:[[5,10,15,20,-1],[5,10,15,20,"All"]],iDisplayLength:10});$("#sample_1_wrapper .dataTables_filter input").addClass("form-control input-sm").attr("placeholder","Search"),$("#sample_1_wrapper .dataTables_length select").addClass("m-wrap small"),$("#sample_1_wrapper .dataTables_length select").select2(),$('#sample_1_column_toggler input[type="checkbox"]').change(function(){var a=parseInt($(this).attr("data-column")),t=e.fnSettings().aoColumns[a].bVisible;e.fnSetColumnVis(a,t?!1:!0)})},a=function(){function e(e,a){for(var t=e.fnGetData(a),n=$(">td",a),l=0,s=n.length;s>l;l++)e.fnUpdate(t[l],a,l,!1);e.fnDraw()}function a(e,a){var t=e.fnGetData(a),n=$(">td",a);n[0].innerHTML='<input type="text" id="headId" maxlength="5" onkeydown="IsNumeric(event);" class="form-control" style="width:100%;" value="'+t[0]+'" required>',n[1].innerHTML='<input type="text" class="form-control" style="width:100%;" value="'+t[1]+'">',n[2].innerHTML='<input type="text" id="defaultValue" class="form-control" style="width:100%;" value="'+t[2]+'">',n[3].innerHTML='<a class="save-row btn btn-green btn-sm" href=""><i class="fa fa-save"></i> Save</a>',n[4].innerHTML='<a class="cancel-row btn btn-bricky btn-sm" href=""><i class="clip-cancel-circle"></i> Cancel</a>'}function t(e,a){var t=e.fnGetData(a),n=(a.cells,$(">td",a));n[0].innerHTML='<input type="text" readonly maxlength="5" onkeydown="IsNumeric(event);" class="form-control" value="'+t[0]+'">',n[1].innerHTML='<input type="text" class="form-control" value="'+t[1]+'">',n[2].innerHTML='<input type="text" class="form-control" value="'+t[2]+'">',n[3].innerHTML='<a class="save-row btn btn-green btn-sm" href=""><i class="fa fa-save"></i> Save</a>',n[4].innerHTML='<a class="cancel-row btn btn-bricky btn-sm" href=""><i class="clip-cancel-circle"></i> Cancel</a>'}function n(e,a){var t=$("input",a);if(null==t[0].value||""==t[0].value)return alert("Please Enter Head Id!"),!1;if(null==t[1].value||""==t[1].value)return alert("Please Enter Head Description!"),!1;if(null==t[2].value||""==t[2].value)return alert("Please Enter Default Value!"),!1;if(0==warnBeforeUpdate("sample_2",t[0].value,0,"no","Head Id"))return!1;var n=t[1].value,r=n.replace(/&/g,"%26");null!=t[0].value&&""!=t[0].value?$.ajax({url:"addHead",type:"POST",data:"headId="+t[0].value+"&description="+r+"&defaultValues="+t[2].value,success:function(n){e.fnUpdate(t[0].value,a,0,!1),e.fnUpdate(t[1].value,a,1,!1),e.fnUpdate(t[2].value,a,2,!1),e.fnUpdate('<a class="edit-row btn btn-green btn-sm" href=""><i class="fa fa-edit"> </i> Edit</a>',a,3,!1),e.fnUpdate('<a class="delete-row btn btn-bricky btn-sm" href=""><i class="fa fa-trash-o"></i> Delete</a>',a,4,!1),e.fnDraw(),l=!1,s=null,location.reload()},error:function(e){alert("Unable to save, Please try again")}}):alert("Invalid Inputs")}var l=!1,s=null;$.ajax({url:"headsList",type:"GET",success:function(a){store=JSON.parse(a),size=Object.keys(store).length/3;for(var t=0;t<size;t++)if(headId="headId"+t,description="description"+t,defaultValues="defaultValues"+t,0==l){s&&e(r,s),l=!0;var n;n=r.fnAddData(authCheck?["","",""]:["","","","",""]);var o=r.fnGetNodes(n[0]);r.fnUpdate(store[headId],o,0,!1),r.fnUpdate(store[description],o,1,!1),r.fnUpdate(store[defaultValues],o,2,!1),authCheck||(r.fnUpdate('<a class="edit-row btn btn-green btn-sm" href=""><i class="fa fa-edit"> </i> Edit</a>',o,3,!1),r.fnUpdate('<a class="delete-row btn btn-bricky btn-sm" href=""><i class="fa fa-trash-o"></i> Delete</a>',o,4,!1)),r.fnDraw(),l=!1,s=null}},error:function(e){alert("Getting some problems, Please try again!")}}),$("body").on("click",".add-row",function(t){if(t.preventDefault(),0==l){s&&e(r,s),l=!0;var n=r.fnAddData(["","","","",""]),o=r.fnGetNodes(n[0]);a(r,o),s=o}}),$("#sample_2").on("click",".cancel-row",function(a){if(a.preventDefault(),l){l=!1,s=null;var t=$(this).parents("tr")[0];r.fnDeleteRow(t)}else e(r,s),s=null}),$("#sample_2").on("click",".delete-row",function(e){e.preventDefault(),l&&s&&(r.fnDeleteRow(s),l=!1);var a=$(this).parents("tr")[0],t=a.cells,n=t[0].innerHTML;bootbox.confirm("Are you sure to delete this record?",function(e){e&&($.blockUI({message:'<i class="fa fa-spinner fa-spin"></i> Do some ajax to sync with backend...'}),$.mockjax({url:"/tabledata/delete/webservice",dataType:"json",responseTime:1e3,responseText:{say:"ok"}}),$.ajax({url:"/tabledata/delete/webservice",dataType:"json",success:function(e){$.unblockUI(),"ok"==e.say&&$.ajax({url:"deleteHead",type:"POST",data:"headId="+n,success:function(e){"error"!=e?(r.fnDeleteRow(a),location.reload()):alert("Record in Use.")},error:function(e){alert("Already in use")}})}}))})}),$("#sample_2").on("click",".save-row",function(e){e.preventDefault();var a=$(this).parents("tr")[0];$.blockUI({message:'<i class="fa fa-spinner fa-spin"></i> saving data...'}),$.mockjax({url:"/tabledata/add/webservice",dataType:"json",responseTime:1e3,responseText:{say:"ok"}}),$.ajax({url:"/tabledata/add/webservice",dataType:"json",success:function(e){$.unblockUI(),"ok"==e.say&&n(r,a)}})}),$("#sample_2").on("click",".edit-row",function(a){a.preventDefault(),s&&(l?(r.fnDeleteRow(s),l=!1):e(r,s));var n=$(this).parents("tr")[0];t(r,n),s=n});var r=$("#sample_2").dataTable({aoColumnDefs:[{bSortable:!1,bSearchable:!1,aTargets:[-1,-2]}],oLanguage:{sLengthMenu:"Show _MENU_ Rows",sSearch:"",oPaginate:{sPrevious:"",sNext:""}},aaSorting:[[1,"asc"]],aLengthMenu:[[5,10,15,20,-1],[5,10,15,20,"All"]],iDisplayLength:10});$("#sample_2_wrapper .dataTables_filter input").addClass("form-control input-sm").attr("placeholder","Search"),$("#sample_2_wrapper .dataTables_length select").addClass("m-wrap small"),$("#sample_2_wrapper .dataTables_length select").select2(),$('#sample_2_column_toggler input[type="checkbox"]').change(function(){var e=parseInt($(this).attr("data-column")),a=r.fnSettings().aoColumns[e].bVisible;r.fnSetColumnVis(e,a?!1:!0)})};return{init:function(){e(),a()}}}();