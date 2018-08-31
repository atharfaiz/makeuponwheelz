var eventList = [];

function eventL() {
    window.eventList = [];
    $('#calendar').fullCalendar('removeEvents');
    if (($("#courseSelect").val() == "select") || ($("#semOrYr").val() == "select") || ($("#sessionSelect").val() == "select")) {
        return
    } else {
        $.ajax({
            url: "/sgterp/protected/semesterEndDates?course=" + $("#courseSelect").val() + "&semester=" + $("#semOrYr").val() + "&session=" + $("#sessionSelect").val(),
            type: "POST",
            success: function(data) {
                if (data.startDate == null) {
                    $('#endDate').val('');
                    $('#startDate').val('');
                    return
                } else {
                    $('#startDate').val(data.startDate);
                    $('#endDate').val(data.endDate)
                }
                temp1 = new Date();
                temp2 = new Date();
                day = temp1.getDay();
                tempStart = new Date(temp1.setDate(temp1.getDate() - day));
                tempEnd = new Date(temp2.setDate(temp2.getDate() + 6 - day));
                fetchAndDraw(tempStart, tempEnd)
            },
            error: function(data) {
                alert("Unable to fetch data, Please try again!");
                $('#endDate').val('');
                $('#startDate').val('');
                return
            }
        })
    }
}
var Calendar = function() {
    var runCalendar = function() {
        var $modal = $('#event-management');
        $('#event-categories div.event-category').each(function() {
            var eventObject = {
                title: $.trim($(this).text())
            };
            $(this).data('eventObject', eventObject);
            $(this).draggable({
                zIndex: 999,
                revert: true,
                revertDuration: 50
            })
        });
        var date = new Date();
        var d = date.getDate();
        var m = date.getMonth();
        var y = date.getFullYear();
        var form = '';
        var calendar = $('#calendar').fullCalendar({
            buttonText: {
                prev: '<i class="fa fa-chevron-left"></i>',
                next: '<i class="fa fa-chevron-right"></i>'
            },
            header: {
                left: 'prev next today',
                center: 'title',
                right: ''
            },
            events: eventList,
            editable: true,
            droppable: true,
            drop: function(date, allDay) {
                return;
                var originalEventObject = $(this).data('eventObject');
                var $categoryClass = $(this).attr('data-class');
                var copiedEventObject = $.extend({}, originalEventObject);
                copiedEventObject.start = date;
                copiedEventObject.allDay = allDay;
                if ($categoryClass) copiedEventObject['className'] = [$categoryClass];
                $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);
                if ($('#drop-remove').is(':checked')) {
                    $(this).remove()
                }
            },
            selectable: true,
            selectHelper: true,
            select: function(start, end, allDay) {
                return;
                $modal.modal({
                    backdrop: 'static'
                });
                form = $("<form action='/sgterp/protected/classSchedule' mehtod='post'></form>");
                form.append("<div class='row'></div>");
                form.find(".row").append("<div class='col-md-12'><div class='form-group'><label class='control-label'>Select Subject&emsp;</label><select id = subject class='form-control'   name='title'><option selected='selected' value=''>Select</option></select></div></div>");
                $modal.find('.remove-event').hide().end().find('.save-event').show().end().find('.modal-body').empty().prepend(form).end().find('.save-event').unbind('click').click(function() {
                    if ($("#subject").val() == 'select') {
                        alert("select subject");
                        $("#subject").focus()
                    } else {
                        $.ajax({
                            url: "/sgterp/protected/administrator/examDateSheetSave",
                            type: "POST",
                            data: "subjectId=" + $("#subject").val() + "&startTime=" + start + "&sessionId=" + $("#sessionSelect").val() + "&endTime=" + end,
                            success: function(data) {
                                eventL()
                            },
                            error: function(data) {
                                alert("Please Select Subject First")
                            }
                        });
                        $modal.modal('hide')
                    }
                });
                $modal.find('form').on('submit', function() {
                    title = form.find("input[name='title']").val();
                    $categoryClass = form.find("select[name='category'] option:checked").val();
                    if (title !== null) {
                        calendar.fullCalendar('renderEvent', {
                            title: title,
                            start: start,
                            end: end,
                            allDay: allDay,
                            className: $categoryClass
                        }, true)
                    }
                    $modal.modal('hide');
                    return false
                });
                calendar.fullCalendar('unselect')
            },
            eventClick: function(calEvent, jsEvent, view) {
				var eventStartTemp =  calEvent.start+"";
				eventStartTemp=eventStartTemp.split("GMT");
				eventStartTemp=eventStartTemp[0];
                var temp_sch = calEvent.title.indexOf("[") + 1;
                var scheduleId = '';
                while (temp_sch < calEvent.title.indexOf("]")) {
                    scheduleId = scheduleId + calEvent.title[temp_sch];
                    temp_sch++
                }
                $.ajax({
                    url: "/sgterp/protected/attendance?course=" + $("#courseSelect").val() + "&scheduleId=" + scheduleId + "&semester=" + $("#semOrYr").val() + "&session=" + $("#sessionSelect").val()+ "&scheduleDate=" + eventStartTemp,
                    type: "POST",
                    success: function(data) {
                        if (data.content != null) {
                            $('#content').val(data.content)
                        }
                        $("#event-management tbody").empty();
							$('#attendanceMarkDate').val(eventStartTemp);
                        if (data.length == 2) {
                            $("#attendanceMessage").css("display", "none");
                            $("#holidayMsg").css("display", "none");
                            $modal.modal({
                                backdrop: 'static'
                            });
                            $modal.find('.remove-event').show().end().find('.save-event').hide().end().find('.modal-body').empty().prepend(form).end().find('.remove-event').unbind('click').click(function() {
                                var temp_str = calEvent.title.indexOf("[") + 1;
                                var schId = '';
                                while (temp_str < calEvent.title.indexOf("]")) {
                                    schId = schId + calEvent.title[temp_str];
                                    temp_str++
                                }
                                $modal.modal('hide')
                            });
                            var isToMarkChecked = false;
                            var absentList = data[0];
                            var studentList = data[1];
							
						
                            for (var i = 0; i < studentList.length; i++) {
                                var studentRecordMap = studentList[i];
                                for (var j = 0; j < absentList.length; j++) {
                                    var absentRecordMap = absentList[j];
                                    if (absentRecordMap.regno == studentRecordMap.studentId) {
                                        isToMarkChecked = true
                                    }
                                }
                                if (isToMarkChecked) {
                                    $("#sample_2 tbody").append("<tr><td>" + studentRecordMap.studentId + "</a></td><td>" + studentRecordMap.name + "</td> <td><label class='checkbox-table'><input type='checkbox' name='regNum' value='" + studentRecordMap.studentId + "' onclick='enableNDisableInput()' checked/><input type='hidden' value='" + scheduleId + "' name='scheduleId' /></label></td> </tr>");
                                    isToMarkChecked = false
                                } else {
                                    $("#sample_2 tbody").append("<tr><td>" + studentRecordMap.studentId + "</a></td><td>" + studentRecordMap.name + "</td> <td><label class='checkbox-table'><input type='checkbox' name='regNum' value='" + studentRecordMap.studentId + "' onclick='enableNDisableInput()' /><input type='hidden' value='" + scheduleId + "' name='scheduleId' /></label></td> </tr>")
                                }
                            }
                        }
                        if (data.length == 0) {
                            $("#holidayMsg").css("display", "none");
                            $("#attendanceMessage").css("display", "block")
                        }
                        if (data.length == 1) {
                            $("#attendanceMessage").css("display", "none");
                            $("#holidayMsg").css("display", "block")
                        }
                        TableData.init()
                    },
                    error: function(data) {
                        alert("Unable to Fetch Data. Please Try Again!")
                    }
                });
                $('#save-success').on('click', function() {
                    var temp_str2 = calEvent.title.indexOf("[") + 1;
                    var schId2 = '';
                    while (temp_str2 < calEvent.title.indexOf("]")) {
                        schId2 = schId2 + calEvent.title[temp_str2];
                        temp_str2++
                    }
                    var isContentLibrary = "false";
                    if ($('#isContentLibrary').is(':checked')) isContentLibrary = "true";
                    return;
                    $.ajax({
                        url: "/sgterp/protected/syllabusAndClassroomUpdate?scheduleId=" + schId2 + "&content=" + $('#content').val() + "&syllabusDate=" + calEvent.start + "&isContentLibrary" + isContentLibrary,
                        type: "POST",
                        success: function(data) {},
                        error: function(data) {
                            alert("Unable to Process Data. Please try again!")
                        }
                    });
                    $modal.modal('hide');
                    return false
                })
            }
        })
    };
    return {
        init: function() {
            runCalendar()
        }
    }
}();

function sessionList() {
    $.ajax({
        url: "/sgterp/protected/sessionlist",
        type: "GET",
        success: function(data) {
            var sessionStore = JSON.parse(data);
            var size = (Object.keys(sessionStore).length) / 2;
            var sessionSelect = document.getElementById("sessionSelect");
            $("#sessionSelect").find('option').remove();
            var option1 = document.createElement("option");
            option1.value = "select";
            option1.innerHTML = "Select Session";
            option1.selected = "selected";
            sessionSelect.appendChild(option1);
            for (var i = 0; i < size; i++) {
                sessionId = "sessionId" + i;
                value = "value" + i;
                var option = document.createElement("option");
                option.value = sessionStore[sessionId];
                option.innerHTML = sessionStore[value];
                sessionSelect.appendChild(option)
            }
        },
        error: function(data) {
            alert(JSON.stringify(data))
        }
    })
}
var semesterStore, semesterSize;

function courseList() {
    $.ajax({
        url: "/sgterp/protected/courselist",
        type: "POST",
        success: function(data) {
            var courseStore = JSON.parse(data);
            var size = (Object.keys(courseStore).length) / 7;
            semesterStore = courseStore;
            semesterSize = size;
            var courseSelect = document.getElementById("courseSelect");
            $("#courseSelect").find('option').remove();
            var option1 = document.createElement("option");
            option1.value = "select";
            option1.innerHTML = "Select Course";
            option1.selected = "selected";
            courseSelect.appendChild(option1);
            for (var i = 0; i < size; i++) {
                var courseId = "courseId" + i;
                var courseName = "courseName" + i;
                var facultyId = "facultyId" + i;
                var option = document.createElement("option");
                option.value = courseStore[courseId];
                option.innerHTML = courseStore[courseName];
                courseSelect.appendChild(option)
            }
        },
        error: function(data) {
            alert(JSON.stringify(data))
        }
    });
    eventL()
}

function courseChange(value) {
    var semSelect = document.getElementById("semOrYr");
    $("#semOrYr").find('option').remove();
    var option1 = document.createElement("option");
    option1.value = "select";
    option1.innerHTML = "Select Sem/Yr";
    option1.selected = "selected";
    semSelect.appendChild(option1);
    if (value == 1) {
        $("#semOrYr").find("option").remove().end().append("<option value=''>Select</option><option value='1st Prof (1 Year)'>1st Prof (1 Year)</option><option value='2nd Prof. (1 1/2 Years)'>2nd Prof. (1 1/2 Years)</option><option value='3rd Prof. Part 1 (1 Year)'>3rd Prof. Part 1 (1 Year)</option><option value='3rd Prof. Part 2 (1 Year)'>3rd Prof. Part 2 (1 Year)</option>")
    } else {
        var SemOrYearValue, coursePattern;
        for (var i = 0; i < semesterSize; i++) {
            var courseId = "courseId" + i;
            var courseDuration = "courseDuration" + i;
            coursePattern = "coursePattern" + i;
            if (value == semesterStore[courseId]) {
                SemOrYearValue = semesterStore[courseDuration];
                break
            }
        }
        for (var j = 1; j <= SemOrYearValue; j++) {
            var option = document.createElement("option");
            option.value = j + " " + semesterStore[coursePattern];
            option.innerHTML = j + " " + semesterStore[coursePattern];
            semSelect.appendChild(option)
        }
    }
    eventL()
}

function subjectList() {
    $.ajax({
        url: "/sgterp/protected/attendanceScheduleSujectList?courseId=" + $('#courseSelect').val() + "&semOrYr=" + $('#semOrYr').val() + "&session=" + $("#sessionSelect").val(),
        type: "GET",
        success: function(data) {
            var sessionStore = JSON.parse(data);
            var size = (Object.keys(sessionStore).length) / 2;
            var subjectSelect = document.getElementById("subjectSelect");
            $("#subjectSelect").find('option').remove();
            var option1 = document.createElement("option");
            option1.value = "select";
            option1.innerHTML = "Subject";
            option1.selected = "selected";
            subjectSelect.appendChild(option1);
            for (var i = 0; i < size; i++) {
                subjectId = "subjectId" + i;
                subjectName = "subjectName" + i;
                var option = document.createElement("option");
                option.value = sessionStore[subjectId];
                option.innerHTML = sessionStore[subjectName];
                subjectSelect.appendChild(option)
            }
        },
        error: function(data) {
            alert(JSON.stringify(data))
        }
    })
}

function fetchAndDraw(temp3, temp4) {
    eventList = [];
    $.ajax({
        url: "/sgterp/protected/attendanceScheduleList?courseId=" + $("#courseSelect").val() + "&semOrYr=" + $("#semOrYr").val() + "&session=" + $("#sessionSelect").val(),
        type: "GET",
        success: function(data) {
            var dataStore = JSON.parse(data);
            var size = (Object.keys(dataStore).length) / 8;
            temp5 = new Date($('#startDate').val());
            temp6 = new Date($('#endDate').val());
            temp9 = (temp3 + "").substring(0, 15);
            temp10 = (temp4 + "").substring(0, 15);
            $.ajax({
                url: "/sgterp/protected/syllabusAndClassroomList?start=" + temp9 + "&end=" + temp10,
                type: "GET",
                success: function(data) {
                    for (; temp3 < temp4;) {
                        for (i = 0; i < size; i++) {
                            if (temp3 < temp5 || temp3 > temp6) {
                                break
                            }
                            subjectId = "subjectId" + i;
                            scheduleId = "scheduletId" + i;
                            start = "startTime" + i;
                            end = "endTime" + i;
                            day = "day" + i;
                            batch = "batch" + i;
                            subjectName = "subjectName" + i;
                            if (temp3.getDay() == dataStore[day]) {
                                tmp = temp3 + "";
                                temp123 = tmp.substring(0, 16);
                                startTime = temp123 + dataStore[start];
                                endTime = temp123 + dataStore[end];
                                if (dataStore[batch] != null && dataStore[batch] != '') titl = dataStore[subjectName] + "[" + dataStore[scheduleId] + "]" + "[" + dataStore[batch] + ' Batch' + "]";
                                else titl = dataStore[subjectName] + "[" + dataStore[scheduleId] + "]";
                                var check = true;
                                if ($('#subjectSelect').val() == 'select') {
                                    for (j = 0; j < data.length; j++) {
                                        if (data[j]["scheduleId"] == dataStore[scheduleId]) {
                                            if (data[j]["isContentLibrary"] == "true") window.eventList[eventList.length] = {
                                                title: titl,
                                                start: startTime,
                                                end: endTime,
                                                className: 'label-green',
                                                allDay: false
                                            };
                                            else window.eventList[eventList.length] = {
                                                title: titl,
                                                start: startTime,
                                                end: endTime,
                                                className: 'label-yellow',
                                                allDay: false
                                            };
                                            check = false;
                                            break
                                        }
                                    }
                                    if (check) window.eventList[eventList.length] = {
                                        title: titl,
                                        start: startTime,
                                        end: endTime,
                                        className: 'label-orange',
                                        allDay: false
                                    }
                                } else {
                                    if (dataStore[subjectId] == $('#subjectSelect').val()) {
                                        for (j = 0; j < data.length; j++) {
                                            if (data[j]["scheduleId"] == dataStore[scheduleId]) {
                                                if (data[j]["isContentLibrary"] == "true") window.eventList[eventList.length] = {
                                                    title: titl,
                                                    start: startTime,
                                                    end: endTime,
                                                    className: 'label-green',
                                                    allDay: false
                                                };
                                                else window.eventList[eventList.length] = {
                                                    title: titl,
                                                    start: startTime,
                                                    end: endTime,
                                                    className: 'label-yellow',
                                                    allDay: false
                                                };
                                                check = false;
                                                break
                                            }
                                        }
                                        if (check) window.eventList[eventList.length] = {
                                            title: titl,
                                            start: startTime,
                                            end: endTime,
                                            className: 'label-orange',
                                            allDay: false
                                        }
                                    }
                                }
                            }
                        }
                        temp3.setDate(temp3.getDate() + 1)
                    }
                    $('#calendar').fullCalendar('addEventSource', eventList)
                },
                error: function(data) {
                    alert("Unable to fetch data, Please try again!")
                }
            });
            $
        },
        error: function(data) {
            alert("Unable to fetch data, Please try again!")
        }
    });
    $('#calendar').fullCalendar('removeEvents')
}