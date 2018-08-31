var eventList = [];

function eventL() {
    window.eventList = [];
    if (($("#courseSelect").val() == "select") || ($("#semOrYr").val() == "select") || ($("#sessionSelect").val() == "select")) {
        $('#calendar').fullCalendar('removeEvents');
        return
    } else {
        $.ajax({
            url: "semesterEndDates?course=" + $("#courseSelect").val() + "&semester=" + $("#semOrYr").val() + "&session=" + $("#sessionSelect").val(),
            type: "POST",
            success: function(data) {
                if (data.startDate == null) {
                    $('#dateRange').val('');
                    $('#endDate').val("");
                    $('#startDate').val("");
                    $('#dateRange').focus();
                    return
                } else {
                    $('#dateRange').val(data.startDate + " - " + data.endDate);
                    $('#startDate').val(data.startDate);
                    $('#endDate').val(data.endDate)
                }
            },
            error: function(data) {
                alert("Unable to fetch data, Please try again!");
                $('#dateRange').val('');
                $('#endDate').val("");
                $('#startDate').val("");
                return
            }
        });
        $.ajax({
            url: "scheduleList?courseId=" + $("#courseSelect").val() + "&semOrYr=" + $("#semOrYr").val() + "&session=" + $("#sessionSelect").val(),
            type: "GET",
            success: function(data) {
                var courseStore = JSON.parse(data);
                var size = (Object.keys(courseStore).length) / 6;
                temp1 = new Date();
                temp2 = new Date();
                temp3 = new Date(temp1.setDate(temp1.getDate() - 7));
                temp4 = new Date(temp2.setDate(temp2.getDate() + 7));
                $('#calendar').fullCalendar('removeEvents');
                for (; temp3 < temp4;) {
                    for (i = 0; i < size; i++) {
                        subjectId = "subjectId" + i;
                        scheduleId = "scheduletId" + i;
                        batch = "batch" + i;
                        start = "startTime" + i;
                        end = "endTime" + i;
                        day = "day" + i;
                        subjectName = "subjectName" + i;
                        if (temp3.getDay() == courseStore[day]) {
                            tmp = temp3 + "";
                            temp123 = tmp.substring(0, 16);
                            startTime = temp123 + courseStore[start];
                            endTime = temp123 + courseStore[end];
                            if (courseStore[batch] != null && courseStore[batch] != '') titl = courseStore[subjectName] + "[" + courseStore[scheduleId] + "]" + "[  " + courseStore[batch] + ' Batch ' + "]"
                            else titl = courseStore[subjectName] + "[" + courseStore[scheduleId] + "]"
                            switch (courseStore[day]) {
                                case "0":
                                    {
                                        window.eventList[eventList.length] = {
                                            title: titl,
                                            start: startTime,
                                            end: endTime,
                                            className: 'label-red',
                                            allDay: false
                                        };
                                        break
                                    }
                                case "1":
                                    {
                                        window.eventList[eventList.length] = {
                                            title: titl,
                                            start: startTime,
                                            end: endTime,
                                            className: 'label-yellow',
                                            allDay: false
                                        };
                                        break
                                    }
                                case "2":
                                    {
                                        window.eventList[eventList.length] = {
                                            title: titl,
                                            start: startTime,
                                            end: endTime,
                                            className: 'label-green',
                                            allDay: false
                                        };
                                        break
                                    }
                                case "3":
                                    {
                                        window.eventList[eventList.length] = {
                                            title: titl,
                                            start: startTime,
                                            end: endTime,
                                            className: 'label-teal',
                                            allDay: false
                                        };
                                        break
                                    }
                                case "4":
                                    {
                                        window.eventList[eventList.length] = {
                                            title: titl,
                                            start: startTime,
                                            end: endTime,
                                            className: 'label-purple',
                                            allDay: false
                                        };
                                        break
                                    }
                                case "5":
                                    {
                                        window.eventList[eventList.length] = {
                                            title: titl,
                                            start: startTime,
                                            end: endTime,
                                            className: 'label-beige',
                                            allDay: false
                                        };
                                        break
                                    }
                                case "6":
                                    {
                                        window.eventList[eventList.length] = {
                                            title: titl,
                                            start: startTime,
                                            end: endTime,
                                            className: 'label-orange',
                                            allDay: false
                                        };
                                        break
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
                left: '',
                center: '',
                right: ''
            },
            events: eventList,
            editable: true,
            droppable: true,
            drop: function(date, allDay) {
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
                if ($(".fc-state-active").text() == 'month') {
                    return
                }
                if ($("#courseSelect").val() == "select") {
                    alert("Please Select Value First");
                    $("#courseSelect").focus();
                    return
                }
                if ($("#semOrYr").val() == "select") {
                    alert("Please Select Value First");
                    $('#calendar').fullCalendar('removeEvents');
                    $("#semOrYr").focus();
                    return
                }
                if ($("#sessionSelect").val() == "select") {
                    alert("Please Select Value First");
                    $('#calendar').fullCalendar('removeEvents');
                    $("#sessionSelect").focus();
                    return
                }
                if ($("#startDate").val() == "" || $("#endDate").val() == "") {
                    alert("Please Save Sem/Yr/Tri Dates First");
                    $('#calendar').fullCalendar('removeEvents');
                    return
                }
                $modal.modal({
                    backdrop: 'static'
                });
                form = $("<form action='/sgterp/protected/classSchedule' mehtod='post'></form>");
                form.append("<div class='row'></div>");
                form.find(".row").append("<div class='col-sm-12'><div class='col-sm-6 form-group'><label class='control-label'>Select Subject&emsp;</label><select id = subject class='form-control'   name='title'><option selected='selected' value=''>Select</option></select></div><div class='col-sm-6 form-group' id='practicalDiv' style='display:none'><label class='control-label'>Select Batch&emsp;</label><select id = 'batchId' name='batch' class='form-control'><option value=''>Select</option><option value='A'>A Batch</option><option value='B'>B Batch</option></select></div></div>");
                $.ajax({
                    url: "scheduleSujectList?courseId=" + $('#courseSelect').val() + "&semOrYr=" + $('#semOrYr').val(),
                    type: "GET",
                    success: function(data) {
                        var sessionStore = JSON.parse(data);
                        var size = (Object.keys(sessionStore).length) / 2;
                        var sessionSelect = document.getElementById("subject");
                        $("#subject").find('option').remove();
                        var option1 = document.createElement("option");
                        option1.value = "select";
                        option1.innerHTML = "Select Subject";
                        option1.selected = "selected";
                        sessionSelect.appendChild(option1);
                        for (var i = 0; i < size; i++) {
                            subjectId = "subjectId" + i;
                            subjectName = "subjectName" + i;
                            var option = document.createElement("option");
                            option.value = sessionStore[subjectId];
                            option.innerHTML = sessionStore[subjectName];
                            sessionSelect.appendChild(option)
                        }
                    },
                    error: function(data) {
                        alert(JSON.stringify(data))
                    }
                });
                $modal.find('.remove-event').hide().end().find('.save-event').show().end().find('.modal-body').empty().prepend(form).end().find('.save-event').unbind('click').click(function() {
                    start_date = new Date(start);
                    end_date = new Date(end);
                    if ($("#subject").val() == 'select') {
                        alert("select subject");
                        $("#subject").focus()
                    } else {
                        $.ajax({
                            url: "classSchedule",
                            type: "POST",
                            data: "subjectId=" + $("#subject").val() + "&scheduleId=" + end + "&startTime=" + start_date + "&sessionId=" + $("#sessionSelect").val() + "&endTime=" + end + "&batchId=" + $("#batchId").val(),
                            success: function(data) {
                                eventL()
                            },
                            error: function(data) {
                                alert(JSON.stringify(data))
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
                var temp_event_title = calEvent.title.indexOf("[");
                var scId = calEvent.title.indexOf("  ");
                var batch = calEvent.title.indexOf(" ]");
                var tempI = 0;
                var schIdSubName = '';
                var batchName = '';
                while (tempI < temp_event_title) {
                    schIdSubName = schIdSubName + calEvent.title[tempI];
                    tempI++
                }
                while (tempI < scId) {
                    tempI++
                }
                while (tempI < batch) {
                    if (calEvent.title[tempI] != ' ') {
                        batchName = calEvent.title[tempI];
                        break
                    }
                    tempI++
                }
                var form = $("<form></form>");
                form.append("<div class='row'></div>");
                form.find(".row").append("<div class='col-sm-12'><div class='col-sm-4'><label class='control-label'>Change Subject&emsp;</label><select id = subject class='form-control' name='title'><option selected='selected' value=''>Select</option></select></div><div class='col-sm-4' id='practicalDiv' style='display:none'><label class='control-label'>Change Batch&emsp;</label><select id = 'batchId123' name='batch' class='form-control'><option value=''>Select</option><option value='A'>A Batch</option><option value='B'>B Batch</option></select></div><div class='col-sm-4'><button type='submit' style='margin-top:11%;' class='btn btn-success'><i class='fa fa-check'></i> Save</button></div></div>");
                $.ajax({
                    url: "scheduleSujectList?courseId=" + $('#courseSelect').val() + "&semOrYr=" + $('#semOrYr').val(),
                    type: "GET",
                    success: function(data) {
                        var sessionStore = JSON.parse(data);
                        var size = (Object.keys(sessionStore).length) / 2;
                        var sessionSelect = document.getElementById("subject");
                        $("#subject").find('option').remove();
                        var option1 = document.createElement("option");
                        option1.value = "select";
                        option1.innerHTML = "Select Subject";
                        sessionSelect.appendChild(option1);
                        for (var i = 0; i < size; i++) {
                            subjectId = "subjectId" + i;
                            subjectName = "subjectName" + i;
                            var option = document.createElement("option");
                            option.value = sessionStore[subjectId];
                            option.innerHTML = sessionStore[subjectName];
                            if (sessionStore[subjectName] == schIdSubName) option.selected = "true";
                            sessionSelect.appendChild(option)
                        }
                    },
                    error: function(data) {
                        alert(JSON.stringify(data))
                    }
                });
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
                    $.ajax({
                        url: "scheduleDelete?scheduleId=" + schId,
                        type: "GET",
                        success: function(data) {
                            calendar.fullCalendar('removeEvents', function(ev) {
                                return (ev._id == calEvent._id)
                            })
                        },
                        error: function(data) {
                            alert(JSON.stringify(data))
                        }
                    });
                    $modal.modal('hide')
                });
                $modal.find('form').on('submit', function() {
                    var temp_str2 = calEvent.title.indexOf("[") + 1;
                    var schId2 = '';
                    while (temp_str2 < calEvent.title.indexOf("]")) {
                        schId2 = schId2 + calEvent.title[temp_str2];
                        temp_str2++
                    }
                    $.ajax({
                        url: "scheduleUpdate?scheduleId=" + schId2 + "&subjectId=" + $('#subject').val() + "&batchId=" + $("#batchId123").val(),
                        type: "GET",
                        success: function(data) {
                            eventL()
                        },
                        error: function(data) {
                            alert(JSON.stringify(data))
                        }
                    });
                    $modal.modal('hide');
                    return false
                });
                if (batchName != null && batchName != '') {
                    $('#practicalDiv').css('display', 'block');
                    $('#batchId123').val(batchName)
                }
            }
        })
    };
    return {
        init: function() {
            runCalendar()
        }
    }
}();
$(document).on('change', '#subject', function() {
    $.ajax({
        url: "practicalSubjectRecord?subjectId=" + $("#subject").val(),
        type: "GET",
        success: function(data) {
            if (data == 'Yes') $("#practicalDiv").css("display", "block");
            else $("#practicalDiv").css("display", "none")
        }
    })
});

function sessionList() {
    $.ajax({
        url: "sessionlist",
        type: "GET",
        success: function(data) {
            var sessionStore = JSON.parse(data);
            var size = (Object.keys(sessionStore).length) / 2;
            var sessionSelect = document.getElementById("sessionSelect");
            $("#sessionSelect").find('option').remove();
            var option1 = document.createElement("option");
            option1.value = "select";
            option1.innerHTML = "Session";
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
    document.getElementById('abc').deleteRow(0);
    $.ajax({
        url: "courselist",
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
    option1.innerHTML = "Sem/Yr/Tri";
    option1.selected = "selected";
    semSelect.appendChild(option1);
    if (value == 1) {
        $("#semOrYr").find("option").remove().end().append("<option value=''>Select</option><option value='1st Prof (1 Year)'>1st Prof (1 Year)</option><option value='2nd Prof. (1 1/2 Years)'>2nd Prof. (1 1/2 Years)</option><option value='3rd Prof. Part 1 (1 Year)'>3rd Prof. Part 1 (1 Year)</option><option value='3rd Prof. Part 2 (1 Year)'>3rd Prof. Part 2 (1 Year)</option>");
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
$("#semDateUpdate").bind("click", function() {
    var dateRange = $('#dateRange').val();
    if ((dateRange.length == 23) && ($("#courseSelect").val() != "select") && ($("#semOrYr").val() != "select") && ($("#sessionSelect").val() != "select")) {
        $('#startDate').val(dateRange.substring(0, 10));
        $('#endDate').val(dateRange.substring(13));
        semDateUpdate()
    } else {
        alert("Invalid Inputs");
        return
    }
});

function semDateUpdate() {
    $.ajax({
        url: "semesterEndDatesUpdate?course=" + $("#courseSelect").val() + "&semester=" + $("#semOrYr").val() + "&session=" + $("#sessionSelect").val() + "&startDate=" + $("#startDate").val() + "&endDate=" + $("#endDate").val(),
        type: "POST",
        success: function(data) {
            if (data == "success") alert('Dates Saved SuccessFully. Now, You can create Lecture Schedule');
            eventL();
            return
        },
        error: function(data) {
            alert("Unable to Save data, Please try again!");
            $('#dateRange').focus();
            eventL();
            return
        }
    })
}