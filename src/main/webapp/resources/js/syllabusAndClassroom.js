function eventL(){window.eventList=[],$("#calendar").fullCalendar("removeEvents"),"select"!=$("#courseSelect").val()&&"select"!=$("#semOrYr").val()&&"select"!=$("#sessionSelect").val()&&$.ajax({url:"/sgterp/protected/semesterEndDates?course="+$("#courseSelect").val()+"&semester="+$("#semOrYr").val()+"&session="+$("#sessionSelect").val(),type:"POST",success:function(e){return null==e.startDate?($("#endDate").val(""),void $("#startDate").val("")):($("#startDate").val(e.startDate),$("#endDate").val(e.endDate),temp1=new Date,temp2=new Date,day=temp1.getDay(),tempStart=new Date(temp1.setDate(temp1.getDate()-day)),tempEnd=new Date(temp2.setDate(temp2.getDate()+6-day)),void fetchAndDraw(tempStart,tempEnd))},error:function(e){alert("Unable to fetch data, Please try again!"),$("#endDate").val(""),$("#startDate").val("")}})}function sessionList(){$.ajax({url:"/sgterp/protected/sessionlist",type:"GET",success:function(e){var t=JSON.parse(e),n=Object.keys(t).length/2,a=document.getElementById("sessionSelect");$("#sessionSelect").find("option").remove();var r=document.createElement("option");r.value="select",r.innerHTML="Select Session",r.selected="selected",a.appendChild(r);for(var s=0;n>s;s++){sessionId="sessionId"+s,value="value"+s;var l=document.createElement("option");l.value=t[sessionId],l.innerHTML=t[value],a.appendChild(l)}},error:function(e){alert(JSON.stringify(e))}})}function courseList(){$.ajax({url:"/sgterp/protected/courselist",type:"POST",success:function(e){var t=JSON.parse(e),n=Object.keys(t).length/7;semesterStore=t,semesterSize=n;var a=document.getElementById("courseSelect");$("#courseSelect").find("option").remove();var r=document.createElement("option");r.value="select",r.innerHTML="Select Course",r.selected="selected",a.appendChild(r);for(var s=0;n>s;s++){var l="courseId"+s,i="courseName"+s,o=document.createElement("option");o.value=t[l],o.innerHTML=t[i],a.appendChild(o)}},error:function(e){alert(JSON.stringify(e))}}),eventL()}function courseChange(e){var t=document.getElementById("semOrYr");$("#semOrYr").find("option").remove();var n=document.createElement("option");n.value="select",n.innerHTML="Select Sem/Yr",n.selected="selected",t.appendChild(n);if(e==1){$("#semOrYr").find("option").remove().end().append("<option value=''>Select</option><option value='1st Prof (1 Year)'>1st Prof (1 Year)</option><option value='2nd Prof. (1 1/2 Years)'>2nd Prof. (1 1/2 Years)</option><option value='3rd Prof. Part 1 (1 Year)'>3rd Prof. Part 1 (1 Year)</option><option value='3rd Prof. Part 2 (1 Year)'>3rd Prof. Part 2 (1 Year)</option>")}else{for(var a,r,s=0;semesterSize>s;s++){var l="courseId"+s,i="courseDuration"+s;if(r="coursePattern"+s,e==semesterStore[l]){a=semesterStore[i];break}}for(var o=1;a>=o;o++){var c=document.createElement("option");c.value=o+" "+semesterStore[r],c.innerHTML=o+" "+semesterStore[r],t.appendChild(c)}}eventL()}function subjectList(){$.ajax({url:"/sgterp/protected/scheduleSujectList?courseId="+$("#courseSelect").val()+"&semOrYr="+$("#semOrYr").val(),type:"GET",success:function(e){var t=JSON.parse(e),n=Object.keys(t).length/2,a=document.getElementById("subjectSelect");$("#subjectSelect").find("option").remove();var r=document.createElement("option");r.value="select",r.innerHTML="Subject",r.selected="selected",a.appendChild(r);for(var s=0;n>s;s++){subjectId="subjectId"+s,subjectName="subjectName"+s;var l=document.createElement("option");l.value=t[subjectId],l.innerHTML=t[subjectName],a.appendChild(l)}},error:function(e){alert(JSON.stringify(e))}})}function fetchAndDraw(e,t){$.ajax({url:"/sgterp/protected/scheduleList?courseId="+$("#courseSelect").val()+"&semOrYr="+$("#semOrYr").val()+"&session="+$("#sessionSelect").val(),type:"GET",success:function(n){var a=JSON.parse(n),r=Object.keys(a).length/8;temp5=new Date($("#startDate").val()),temp6=new Date($("#endDate").val()),temp9=(e+"").substring(0,15),temp10=(t+"").substring(0,15),$.ajax({url:"/sgterp/protected/syllabusAndClassroomList?start="+temp9+"&end="+temp10,type:"GET",success:function(n){for(eventList.length=0,window.eventList.length=0;t>=e;){for(i=0;i<r&&!(e<temp5||e>temp6);i++)if(subjectId="subjectId"+i,scheduleId="scheduletId"+i,start="startTime"+i,end="endTime"+i,day="day"+i,subjectName="subjectName"+i,e.getDay()==a[day]){tmp=e+"",temp123=tmp.substring(0,16),startTime=temp123+a[start],endTime=temp123+a[end],titl=a[subjectName]+"["+a[scheduleId]+"]";var s=!0;if("select"==$("#subjectSelect").val()){for(j=0;j<n.length;j++)if(n[j].scheduleId==a[scheduleId]){"true"==n[j].isContentLibrary?window.eventList[eventList.length]={title:titl,start:startTime,end:endTime,className:"label-green",allDay:!1}:window.eventList[eventList.length]={title:titl,start:startTime,end:endTime,className:"label-yellow",allDay:!1},s=!1;break}s&&(window.eventList[eventList.length]={title:titl,start:startTime,end:endTime,className:"label-orange",allDay:!1})}else if(a[subjectId]==$("#subjectSelect").val()){for(j=0;j<n.length;j++)if(n[j].scheduleId==a[scheduleId]){"true"==n[j].isContentLibrary?window.eventList[eventList.length]={title:titl,start:startTime,end:endTime,className:"label-green",allDay:!1}:window.eventList[eventList.length]={title:titl,start:startTime,end:endTime,className:"label-yellow",allDay:!1},s=!1;break}s&&(window.eventList[eventList.length]={title:titl,start:startTime,end:endTime,className:"label-orange",allDay:!1})}}e.setDate(e.getDate()+1)}$("#calendar").fullCalendar("removeEvents"),$("#calendar").fullCalendar("addEventSource",eventList)},error:function(e){alert("Unable to fetch data, Please try again!")}})},error:function(e){alert("Unable to fetch data, Please try again!")}})}var eventList=[],Calendar=function(){var e=function(){var e=$("#event-management");$("#event-categories div.event-category").each(function(){var e={title:$.trim($(this).text())};$(this).data("eventObject",e),$(this).draggable({zIndex:999,revert:!0,revertDuration:50})});{var t=new Date;t.getDate(),t.getMonth(),t.getFullYear(),$("#calendar").fullCalendar({buttonText:{prev:'<i class="fa fa-chevron-left"></i>',next:'<i class="fa fa-chevron-right"></i>'},header:{left:"prev next today",center:"title",right:""},events:eventList,editable:!0,droppable:!0,drop:function(e,t){return},selectable:!0,selectHelper:!0,select:function(e,t,n){},eventClick:function(t,n,a){for(var r=t.title.indexOf("[")+1,s="";r<t.title.indexOf("]");)s+=t.title[r],r++;var l=$("<form id='tempForm'></form>");l.append("<label>Syllabus :</label>"),l.append("SYLLABUS_AND_CLASSROOM_WRITE"==$("#permission").val()?"<textarea  id = content class='form-control' name='content' maxlength='255'/><span class='input-group-btn'></span><input name='isContentLibrary' id='isContentLibrary' value='true' type='checkbox' ><label for='isContentLibrary'>Content Uploaded in Content Library</label>":"<textarea  id = content class='form-control' name='content' readonly='true'/><span class='input-group-btn'></span>"),$.ajax({url:"/sgterp/protected/syllabusAndClassroomFind?scheduleId="+s+"&syllabusDate="+t.start,type:"POST",success:function(e){null!=e.content&&$("#content").val(e.content),"true"==e.isContentLibrary&&$("#isContentLibrary").attr("checked",!0)},error:function(e){alert("Unable to Fetch Data. Please Try Again!")}}),e.modal({backdrop:"static"}),e.find(".remove-event").show().end().find(".save-event").hide().end().find(".modal-body").empty().prepend(l).end().find(".remove-event").unbind("click").click(function(){for(var n=t.title.indexOf("[")+1,a="";n<t.title.indexOf("]");)a+=t.title[n],n++;e.modal("hide")}),$("#tempForm").on("submit",function(){for(var n=t.title.indexOf("[")+1,a="";n<t.title.indexOf("]");)a+=t.title[n],n++;var r="false";return $("#isContentLibrary").is(":checked")&&(r="true"),$.ajax({url:"/sgterp/protected/syllabusAndClassroomUpdate?scheduleId="+a+"&content="+$("#content").val()+"&syllabusDate="+t.start+"&isContentLibrary="+r,type:"POST",success:function(e){eventL()},error:function(e){eventL(),alert("Unable to Process Data. Please try again!")}}),e.modal("hide"),!1})}})}};return{init:function(){e()}}}(),semesterStore,semesterSize;