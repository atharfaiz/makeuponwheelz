function eventL(){window.eventList=[],$.ajax({url:"leaveRequestList",type:"POST",success:function(e){var t=e.length;for($("#calendar").fullCalendar("removeEvents"),start="fromDate",end="toDate",i=0;i<t;i++)titl=e[i].reason+"["+e[i].leaveRequestId+"]","Applied"==e[i].status&&(window.eventList[eventList.length]={title:titl,start:e[i][start],end:e[i][end],className:"label-teal",allDay:!0}),"Rejected"==e[i].status&&(window.eventList[eventList.length]={title:titl,start:e[i][start],end:e[i][end],className:"label-red",allDay:!0}),"Approved"==e[i].status&&(window.eventList[eventList.length]={title:titl,start:e[i][start],end:e[i][end],className:"label-green",allDay:!0});$("#calendar").fullCalendar("addEventSource",eventList)},error:function(e){alert("Unable to fetch data, Please try again!")}})}var eventList=[],Calendar=function(){var e=function(){var e=$("#event-management");$("#event-categories div.event-category").each(function(){var e={title:$.trim($(this).text())};$(this).data("eventObject",e),$(this).draggable({zIndex:999,revert:!0,revertDuration:50})});var t=new Date,a=(t.getDate(),t.getMonth(),t.getFullYear(),""),n=$("#calendar").fullCalendar({buttonText:{prev:'<i class="fa fa-chevron-left"></i>',next:'<i class="fa fa-chevron-right"></i>'},header:{left:" today prev next",center:"title",right:""},events:eventList,editable:!0,droppable:!0,drop:function(e,t){var a=$(this).data("eventObject"),n=$(this).attr("data-class"),l=$.extend({},a);l.start=e,l.allDay=t,n&&(l.className=[n]),$("#calendar").fullCalendar("renderEvent",l,!0),$("#drop-remove").is(":checked")&&$(this).remove()},selectable:!0,selectHelper:!0,select:function(t,l,r){new Date((t+"").substring(0,15))<new Date((new Date+"").substring(0,15))||($.ajax({url:"leaveRequestList",type:"POST",success:function(s){var d=s.length;for(startDate="fromDate",toDate="toDate",i=0;i<d;i++)if(t>=new Date(s[i][startDate])&&t<=new Date(s[i][toDate])||l>=new Date(s[i][startDate])&&l<=new Date(s[i][toDate])){if(e.modal("hide"),"Applied"==s[i].status)return alert("Leave for selected date is already applied!"),void eventL();if("Approved"==s[i].status)return alert("Leave for selected date is already approved!"),void eventL()}e.modal({backdrop:"static"}),a=$("<form></form>"),a.append("<div class='row'></div>"),a.find(".row").append("<div class='col-md-12'><div class='form-group'><label class='control-label'>Reason</label><input id=reason class='form-control' placeholder='Enter Leave Reason' type=text name='title' maxlength='100' value=''/></div></div>"),e.find(".remove-event").hide().end().find(".save-event").show().end().find(".modal-body").empty().prepend(a).end().find(".save-event").unbind("click").click(function(){return""==$("#reason").val()?void alert("Please Specify a Reason"):($.ajax({url:"requestLeave",type:"POST",data:"status=Applied&registrationNo=&reason="+$("#reason").val()+"&startDate="+t+"&endDate="+l,success:function(e){eventL()},error:function(e){alert("Unable to save, Please try again!"),eventL()}}),title=a.find("input[name='title']").val(),$categoryClass=a.find("select[name='category'] option:checked").val(),null!==title&&n.fullCalendar("renderEvent",{title:title,start:t,end:l,allDay:r,className:$categoryClass},!0),void e.modal("hide"))})},error:function(e){alert("Unable to fetch data, Please try again!"),ventL()}}),n.fullCalendar("unselect"))},eventClick:function(e,t,a){return void eventL()}})};return{init:function(){e()}}}();