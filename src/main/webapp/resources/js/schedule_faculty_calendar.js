function eventL(){return window.eventList=[],"select"==$("#courseSelect").val()||"select"==$("#semOrYr").val()||"select"==$("#sessionSelect").val()?void $("#calendar").fullCalendar("removeEvents"):($.ajax({url:"semesterEndDates?course="+$("#courseSelect").val()+"&semester="+$("#semOrYr").val()+"&session="+$("#sessionSelect").val(),type:"POST",success:function(e){return null==e.startDate?($("#dateRange").val(""),$("#endDate").val(""),$("#startDate").val(""),void $("#dateRange").focus()):($("#dateRange").val(e.startDate+" - "+e.endDate),$("#startDate").val(e.startDate),$("#endDate").val(e.endDate),void 0)},error:function(e){alert("Unable to fetch data, Please try again!"),$("#dateRange").val(""),$("#endDate").val(""),$("#startDate").val("")}}),void $.ajax({url:"scheduleList?courseId="+$("#courseSelect").val()+"&semOrYr="+$("#semOrYr").val()+"&session="+$("#sessionSelect").val(),type:"GET",success:function(e){var t=JSON.parse(e),a=Object.keys(t).length/6;for(temp1=new Date,temp2=new Date,temp3=new Date(temp1.setDate(temp1.getDate()-7)),temp4=new Date(temp2.setDate(temp2.getDate()+7)),$("#calendar").fullCalendar("removeEvents");temp3<temp4;){for(i=0;i<a;i++)if(subjectId="subjectId"+i,scheduleId="scheduletId"+i,batch="batch"+i,start="startTime"+i,end="endTime"+i,day="day"+i,subjectName="subjectName"+i,temp3.getDay()==t[day])switch(tmp=temp3+"",temp123=tmp.substring(0,16),startTime=temp123+t[start],endTime=temp123+t[end],null!=t[batch]&&""!=t[batch]?titl=t[subjectName]+"["+t[scheduleId]+"][  "+t[batch]+" Batch ]":titl=t[subjectName]+"["+t[scheduleId]+"]",t[day]){case"0":window.eventList[eventList.length]={title:titl,start:startTime,end:endTime,className:"label-red",allDay:!1};break;case"1":window.eventList[eventList.length]={title:titl,start:startTime,end:endTime,className:"label-yellow",allDay:!1};break;case"2":window.eventList[eventList.length]={title:titl,start:startTime,end:endTime,className:"label-green",allDay:!1};break;case"3":window.eventList[eventList.length]={title:titl,start:startTime,end:endTime,className:"label-teal",allDay:!1};break;case"4":window.eventList[eventList.length]={title:titl,start:startTime,end:endTime,className:"label-purple",allDay:!1};break;case"5":window.eventList[eventList.length]={title:titl,start:startTime,end:endTime,className:"label-beige",allDay:!1};break;case"6":window.eventList[eventList.length]={title:titl,start:startTime,end:endTime,className:"label-orange",allDay:!1}}temp3.setDate(temp3.getDate()+1)}$,$("#calendar").fullCalendar("addEventSource",eventList)},error:function(e){alert("Unable to fetch data, Please try again!")}}))}function sessionList(){$.ajax({url:"sessionlist",type:"GET",success:function(e){var t=JSON.parse(e),a=Object.keys(t).length/2,s=document.getElementById("sessionSelect");$("#sessionSelect").find("option").remove();var l=document.createElement("option");l.value="select",l.innerHTML="Session",l.selected="selected",s.appendChild(l);for(var n=0;a>n;n++){sessionId="sessionId"+n,value="value"+n;var c=document.createElement("option");c.value=t[sessionId],c.innerHTML=t[value],s.appendChild(c)}},error:function(e){alert(JSON.stringify(e))}})}function courseList(){document.getElementById("abc").deleteRow(0),$.ajax({url:"courselist",type:"POST",success:function(e){var t=JSON.parse(e),a=Object.keys(t).length/7;semesterStore=t,semesterSize=a;var s=document.getElementById("courseSelect");$("#courseSelect").find("option").remove();var l=document.createElement("option");l.value="select",l.innerHTML="Select Course",l.selected="selected",s.appendChild(l);for(var n=0;a>n;n++){var c="courseId"+n,r="courseName"+n,i=document.createElement("option");i.value=t[c],i.innerHTML=t[r],s.appendChild(i)}},error:function(e){alert(JSON.stringify(e))}}),eventL()}function courseChange(e){var t=document.getElementById("semOrYr");$("#semOrYr").find("option").remove();var a=document.createElement("option");a.value="select",a.innerHTML="Sem/Yr/Tri",a.selected="selected",t.appendChild(a);if(e==1){$("#semOrYr").find("option").remove().end().append("<option value=''>Select</option><option value='1st Prof (1 Year)'>1st Prof (1 Year)</option><option value='2nd Prof. (1 1/2 Years)'>2nd Prof. (1 1/2 Years)</option><option value='3rd Prof. Part 1 (1 Year)'>3rd Prof. Part 1 (1 Year)</option><option value='3rd Prof. Part 2 (1 Year)'>3rd Prof. Part 2 (1 Year)</option>")}else{for(var s,l,n=0;semesterSize>n;n++){var c="courseId"+n,r="courseDuration"+n;if(l="coursePattern"+n,e==semesterStore[c]){s=semesterStore[r];break}}for(var i=1;s>=i;i++){var o=document.createElement("option");o.value=i+" "+semesterStore[l],o.innerHTML=i+" "+semesterStore[l],t.appendChild(o)}}eventL()}function semDateUpdate(){$.ajax({url:"semesterEndDatesUpdate?course="+$("#courseSelect").val()+"&semester="+$("#semOrYr").val()+"&session="+$("#sessionSelect").val()+"&startDate="+$("#startDate").val()+"&endDate="+$("#endDate").val(),type:"POST",success:function(e){"success"==e&&alert("Dates Saved SuccessFully. Now, You can create Lecture Schedule"),eventL()},error:function(e){alert("Unable to Save data, Please try again!"),$("#dateRange").focus(),eventL()}})}var eventList=[],Calendar=function(){var e=function(){var e=$("#event-management");$("#event-categories div.event-category").each(function(){var e={title:$.trim($(this).text())};$(this).data("eventObject",e),$(this).draggable({zIndex:999,revert:!0,revertDuration:50})});var t=new Date,a=(t.getDate(),t.getMonth(),t.getFullYear(),""),s=$("#calendar").fullCalendar({buttonText:{prev:'<i class="fa fa-chevron-left"></i>',next:'<i class="fa fa-chevron-right"></i>'},header:{left:"",center:"",right:""},events:eventList,editable:!0,droppable:!0,drop:function(e,t){var a=$(this).data("eventObject"),s=$(this).attr("data-class"),l=$.extend({},a);l.start=e,l.allDay=t,s&&(l.className=[s]),$("#calendar").fullCalendar("renderEvent",l,!0),$("#drop-remove").is(":checked")&&$(this).remove()},selectable:!0,selectHelper:!0,select:function(t,l,n){if("month"!=$(".fc-state-active").text()){if("select"==$("#courseSelect").val())return alert("Please Select Value First"),void $("#courseSelect").focus();if("select"==$("#semOrYr").val())return alert("Please Select Value First"),$("#calendar").fullCalendar("removeEvents"),void $("#semOrYr").focus();if("select"==$("#sessionSelect").val())return alert("Please Select Value First"),$("#calendar").fullCalendar("removeEvents"),void $("#sessionSelect").focus();if(""==$("#startDate").val()||""==$("#endDate").val())return alert("Please Contact your Administrator to Save selected Sem/Yr/Tri Dates."),void $("#calendar").fullCalendar("removeEvents");e.modal({backdrop:"static"}),a=$("<form action='/sgterp/protected/classSchedule' mehtod='post'></form>"),a.append("<div class='row'></div>"),a.find(".row").append("<div class='col-sm-12'><div class='col-sm-6 form-group'><label class='control-label'>Select Subject&emsp;</label><select id = subject class='form-control'   name='title'><option selected='selected' value=''>Select</option></select></div><div class='col-sm-6 form-group' id='practicalDiv' style='display:none'><label class='control-label'>Select Batch&emsp;</label><select id = 'batchId' name='batch' class='form-control'><option value=''>Select</option><option value='A'>A Batch</option><option value='B'>B Batch</option></select></div></div>"),$.ajax({url:"assignedSujectList?courseId="+$("#courseSelect").val()+"&semOrYr="+$("#semOrYr").val(),type:"GET",success:function(e){var t=JSON.parse(e),a=Object.keys(t).length/2,s=document.getElementById("subject");$("#subject").find("option").remove();var l=document.createElement("option");l.value="select",l.innerHTML="Select Subject",l.selected="selected",s.appendChild(l);for(var n=0;a>n;n++){subjectId="subjectId"+n,subjectName="subjectName"+n;var c=document.createElement("option");c.value=t[subjectId],c.innerHTML=t[subjectName],s.appendChild(c)}},error:function(e){alert(JSON.stringify(e))}}),e.find(".remove-event").hide().end().find(".save-event").show().end().find(".modal-body").empty().prepend(a).end().find(".save-event").unbind("click").click(function(){start_date=new Date(t),end_date=new Date(l),"select"==$("#subject").val()?(alert("select subject"),$("#subject").focus()):($.ajax({url:"classSchedule",type:"POST",data:"subjectId="+$("#subject").val()+"&scheduleId="+l+"&startTime="+start_date+"&sessionId="+$("#sessionSelect").val()+"&endTime="+l+"&batchId="+$("#batchId").val(),success:function(e){eventL()},error:function(e){alert(JSON.stringify(e))}}),e.modal("hide"))}),e.find("form").on("submit",function(){return title=a.find("input[name='title']").val(),$categoryClass=a.find("select[name='category'] option:checked").val(),null!==title&&s.fullCalendar("renderEvent",{title:title,start:t,end:l,allDay:n,className:$categoryClass},!0),e.modal("hide"),!1}),s.fullCalendar("unselect")}},eventClick:function(t,a,l){var checkAssign=true;$('input[name="subName"]').each(function(){if(t.title.indexOf(this.value)!=-1)checkAssign=false});if(checkAssign){alert("You have not been assigned the selected subject");eventL();return}for(var n=t.title.indexOf("["),c=t.title.indexOf("  "),r=t.title.indexOf(" ]"),i=0,o="",d="";n>i;)o+=t.title[i],i++;for(;c>i;)i++;for(;r>i;){if(" "!=t.title[i]){d=t.title[i];break}i++}var u=$("<form></form>");u.append("<div class='row'></div>"),u.find(".row").append("<div class='col-sm-12'><div class='col-sm-4'><label class='control-label'>Change Subject&emsp;</label><select id = subject class='form-control' name='title'><option selected='selected' value=''>Select</option></select></div><div class='col-sm-4' id='practicalDiv' style='display:none'><label class='control-label'>Change Batch&emsp;</label><select id = 'batchId123' name='batch' class='form-control'><option value=''>Select</option><option value='A'>A Batch</option><option value='B'>B Batch</option></select></div><div class='col-sm-4'><button type='submit' style='margin-top:11%;' class='btn btn-success'><i class='fa fa-check'></i> Save</button></div></div>"),$.ajax({url:"assignedSujectList?courseId="+$("#courseSelect").val()+"&semOrYr="+$("#semOrYr").val(),type:"GET",success:function(e){var t=JSON.parse(e),a=Object.keys(t).length/2,s=document.getElementById("subject");$("#subject").find("option").remove();var l=document.createElement("option");l.value="select",l.innerHTML="Select Subject",s.appendChild(l);for(var n=0;a>n;n++){subjectId="subjectId"+n,subjectName="subjectName"+n;var c=document.createElement("option");c.value=t[subjectId],c.innerHTML=t[subjectName],t[subjectName]==o&&(c.selected="true"),s.appendChild(c)}},error:function(e){alert(JSON.stringify(e))}}),e.modal({backdrop:"static"}),e.find(".remove-event").show().end().find(".save-event").hide().end().find(".modal-body").empty().prepend(u).end().find(".remove-event").unbind("click").click(function(){for(var a=t.title.indexOf("[")+1,l="";a<t.title.indexOf("]");)l+=t.title[a],a++;$.ajax({url:"scheduleDelete?scheduleId="+l,type:"GET",success:function(e){s.fullCalendar("removeEvents",function(e){return e._id==t._id})},error:function(e){alert(JSON.stringify(e))}}),e.modal("hide")}),e.find("form").on("submit",function(){for(var a=t.title.indexOf("[")+1,s="";a<t.title.indexOf("]");)s+=t.title[a],a++;return $.ajax({url:"scheduleUpdate?scheduleId="+s+"&subjectId="+$("#subject").val()+"&batchId="+$("#batchId123").val(),type:"GET",success:function(e){eventL()},error:function(e){alert(JSON.stringify(e))}}),e.modal("hide"),!1}),null!=d&&""!=d&&($("#practicalDiv").css("display","block"),$("#batchId123").val(d))}})};return{init:function(){e()}}}();$(document).on("change","#subject",function(){$.ajax({url:"practicalSubjectRecord?subjectId="+$("#subject").val(),type:"GET",success:function(e){"Yes"==e?$("#practicalDiv").css("display","block"):$("#practicalDiv").css("display","none")}})});var semesterStore,semesterSize;$("#semDateUpdate").bind("click",function(){var e=$("#dateRange").val();return 23!=e.length||"select"==$("#courseSelect").val()||"select"==$("#semOrYr").val()||"select"==$("#sessionSelect").val()?void alert("Invalid Inputs"):($("#startDate").val(e.substring(0,10)),$("#endDate").val(e.substring(13)),semDateUpdate(),void 0)});