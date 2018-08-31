
<%@page import="com.bugfree.testgt.commons.KrenaiCONSTANTS"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="shiro" uri="customShiroTags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="org.apache.shiro.SecurityUtils"%>


				
		 <nav class="sidebar">
            <div class="logo">
                <a href="#" class="simple-text">
                  CSS SOFTLAB <br>
                   PVT. LTD.
                </a>
            </div>
            <div class="logo logo-mini">
                <a href="#" class="simple-text">
                  W
                </a>
            </div>
            <div class="sidebar-wrapper">
                <ul class="nav flex-column">
                <li class="nav-item">
                        <a class="nav-link" href="/home">
                            <i class="material-icons">dashboard</i>
                            <p>
                                Dashboard
                            </p>
                        </a>
                    </li>
                 <%boolean rolecheckadmin = SecurityUtils.getSubject().hasRole(KrenaiCONSTANTS.usertype_admin);
                    	if(rolecheckadmin){
                    %>
                    
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="collapse" href="#charts" class="collapsed" aria-expanded="false">
                            <i class="material-icons">account_balance</i>
                            <p>
                                School
                                <i class="material-icons">arrow_drop_down</i>
                            </p>
                        </a>
						
                        <div class="collapse" id="charts" aria-expanded="false" style="height: 0px;">
                            <ul class="nav flex-column">
                                <li class="nav-item">
                                    <a class="nav-link" href="/admin/school/add">Add New School</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/home">School Listing</a>
                                </li>
                                
                               
                            </ul>
                        </div>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="collapse" href="#gps" class="collapsed" aria-expanded="false">
                            <i class="material-icons">explore</i>
                            <p>
                                GPS Tracking
                                <i class="material-icons">arrow_drop_down</i>
                            </p>
                        </a>
                        <div class="collapse" id="gps" aria-expanded="false" style="height: 0px;">
                            <ul class="nav flex-column">
                                <li class="nav-item">
                                    <a class="nav-link" href="/gps/tracking/settings">Tracking Settings</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                     
                     
                    <%} %>
                    
                    
                     <%
                    	boolean relecheckTeacher = SecurityUtils.getSubject().hasRole(KrenaiCONSTANTS.usertype_teacher);
                    	if(relecheckTeacher){
                    %>
                    
                    
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="collapse" href="#student" class="collapsed" aria-expanded="false">
                            <i class="material-icons">account_balance</i>
                            <p>
                                Students
                                <i class="material-icons">arrow_drop_down</i>
                            </p>
                        </a>
                        <div class="collapse" id="student" aria-expanded="false" style="height: 0px;">
                            <ul class="nav flex-column">
                                <li class="nav-item">
                                    <a class="nav-link" href="/student/listing">Student Listing</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                     
                     <li class="nav-item">
                        <a class="nav-link" data-toggle="collapse" href="#notification" class="collapsed" aria-expanded="false">
                            <i class="material-icons">account_balance</i>
                            <p>
                                Notification
                                <i class="material-icons">arrow_drop_down</i>
                            </p>
                        </a>
                        <div class="collapse" id="notification" aria-expanded="false" style="height: 0px;">
                            <ul class="nav flex-column">
                                <li class="nav-item">
                                    <a class="nav-link" href="/send/student/notification">Send Notification</a>
                                </li>
                                
                            </ul>
                        </div>
                         
                    </li>
                    <%}%>
                    
                    
                    <%boolean rolecheck = SecurityUtils.getSubject().hasRole(KrenaiCONSTANTS.usertype_school);
                    	boolean rolecheckSchoolAdmin =SecurityUtils.getSubject().hasRole(KrenaiCONSTANTS.usertype_school_admin);
                    	
                    	if(rolecheck || rolecheckSchoolAdmin ){
                    %>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="collapse" href="#student" class="collapsed" aria-expanded="false">
                            <i class="material-icons">face</i>
                            <p>
                                Students
                                <i class="material-icons">arrow_drop_down</i>
                            </p>
                        </a>
                        <div class="collapse" id="student" aria-expanded="false" style="height: 0px;">
                            <ul class="nav flex-column">
                                <li class="nav-item">
                                    <a class="nav-link" href="/student/upload">Add New Student</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/student/listing">Student Listing</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                     <li class="nav-item">
                        <a class="nav-link" data-toggle="collapse" href="#teacher" class="collapsed" aria-expanded="false">
                            <i class="material-icons">assignment_ind</i>
                            <p>
                                Teachers
                                <i class="material-icons">arrow_drop_down</i>
                            </p>
                        </a>
                        <div class="collapse" id="teacher" aria-expanded="false" style="height: 0px;">
                            <ul class="nav flex-column">
                                <li class="nav-item">
                                    <a class="nav-link" href="/get/add/teacher/page">Add New Teacher</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/get/teacher/listing">Teacher Listing</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                     <li class="nav-item">
                        <a class="nav-link" data-toggle="collapse" href="#notification" class="collapsed" aria-expanded="false">
                            <i class="material-icons">tap_and_play</i>
                            <p>
                                Notification
                                <i class="material-icons">arrow_drop_down</i>
                            </p>
                        </a>
                        <div class="collapse" id="notification" aria-expanded="false" style="height: 0px;">
                            <ul class="nav flex-column">
                                <li class="nav-item">
                                    <a class="nav-link" href="/send/student/notification">Send Notification</a>
                                </li>
                             
                                <li class="nav-item">
                                    <a class="nav-link" href="/get/school/update/log">Log Listing</a>
                                </li>
                               
                            </ul>
                        </div>
                    </li>
                     <li class="nav-item">
                        <a class="nav-link" data-toggle="collapse" href="#fee" class="collapsed" aria-expanded="false">
                            <i class="material-icons">attach_money</i>
                            <p>
                                Fee
                                <i class="material-icons">arrow_drop_down</i>
                            </p>
                        </a>
                        <div class="collapse" id="fee" aria-expanded="false" style="height: 0px;">
                            <ul class="nav flex-column">
                                <li class="nav-item">
                                    <a class="nav-link" href="/student/fee/upload/page">Upload Fee List</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/get/fee/studentfee"> Fee Details</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/get/yearbal/upload"> Year Balance Upload</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="collapse" href="#timetable" class="collapsed" aria-expanded="false">
                            <i class="material-icons">av_timer</i>
                            <p>
                                Time Table
                                <i class="material-icons">arrow_drop_down</i>
                            </p>
                        </a>
                        <div class="collapse" id="timetable" aria-expanded="false" style="height: 0px;">
                            <ul class="nav flex-column">
                                <li class="nav-item">
                                    <a class="nav-link" href="/timetable/upload">Upload Timetable</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/timetable/view"> Timetable Details</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    
                    
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="collapse" href="#attendance" class="collapsed" aria-expanded="false">
                            <i class="material-icons">format_color_text</i>
                            <p>
                                Attendance
                                <i class="material-icons">arrow_drop_down</i>
                            </p>
                        </a>
                        <div class="collapse" id="attendance" aria-expanded="false" style="height: 0px;">
                            <ul class="nav flex-column">
                                <li class="nav-item">
                                    <a class="nav-link" href="/attendance/upload">Upload Attendance</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/attendance/view">View Attendance</a>
                                </li>
                               <!--  <li class="nav-item">
                                    <a class="nav-link" href="/attendance/absent/notification">Sent Attendance Absent</a>
                                </li> -->
                            </ul>
                        </div>
                    </li>
                     
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="collapse" href="#marksheet" class="collapsed" aria-expanded="false">
                            <i class="material-icons">import_contacts</i>
                            <p>
                                Marks Sheet
                                <i class="material-icons">arrow_drop_down</i>
                            </p>
                        </a>
                        <div class="collapse" id="marksheet" aria-expanded="false" style="height: 0px;">
                            <ul class="nav flex-column">
                                <li class="nav-item">
                                    <a class="nav-link" href="/marksheet/upload">Upload Marks Sheet</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/marksheet/view">View Marks Sheet</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                     
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="collapse" href="#examination" class="collapsed" aria-expanded="false">
                            <i class="material-icons">announcement</i>
                            <p>
                                Examinations
                                <i class="material-icons">arrow_drop_down</i>
                            </p>
                        </a>
                        <div class="collapse" id="examination" aria-expanded="false" style="height: 0px;">
                            <ul class="nav flex-column">
                                <li class="nav-item">
                                    <a class="nav-link" href="/examination/upload">Upload Examination</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/examination/view">View Examination</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                     
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="collapse" href="#academics" class="collapsed" aria-expanded="false">
                            <i class="material-icons">date_range</i>
                            <p>
                                Academic Calendar
                                <i class="material-icons">arrow_drop_down</i>
                            </p>
                        </a>
                        <div class="collapse" id="academics" aria-expanded="false" style="height: 0px;">
                            <ul class="nav flex-column">
                                <li class="nav-item">
                                    <a class="nav-link" href="/academics/upload">Upload Academic Calendar</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/academics/view">View Academic Calendar</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    
                    
                   
                    <%}%>
                    
                    <% boolean rolecheckparent = SecurityUtils.getSubject().hasRole(KrenaiCONSTANTS.permission_parent);
                       if(rolecheckparent){
                    %>
                     <li class="nav-item">
                        <a class="nav-link" href="/get/notification/detail">
                            <i class="material-icons">add_alert</i>
                            <p>
                                Notice Board
                            </p>
                        </a>
                    </li>
                    
                    <!-- <li class="nav-item">
                        <a class="nav-link" href="/get/fee/detail">
                            <i class="material-icons">attach_money</i>
                            <p>
                                Fees
                            </p>
                        </a>
                    </li> -->
                    
                     <li class="nav-item">
                        <a class="nav-link" href="/student/attendance">
                            <i class="material-icons">format_color_text</i>
                            <p>
                                Attendance
                            </p>
                        </a>
                    </li>
                      <li class="nav-item">
                        <a class="nav-link" href="/student/examinations">
                            <i class="material-icons">announcement</i>
                            <p>
                                Exam Schedule
                            </p>
                        </a>
                    </li>
                     
                      <li class="nav-item">
                        <a class="nav-link" href="/student/timetable">
                            <i class="material-icons">av_timer</i>
                            <p>
                                Time Table
                            </p>
                        </a>
                    </li>
                     
                     <li class="nav-item">
                        <a class="nav-link" href="/student/academics">
                            <i class="material-icons">date_range</i>
                            <p>
                                School Calendar
                            </p>
                        </a>
                    </li>
                    
                     <li class="nav-item">
                        <a class="nav-link" href="/marksheet/detail">
                            <i class="material-icons">import_contacts</i>
                            <p>
                                Report Card
                            </p>
                        </a>
                    </li>
                    
                    
                     <li class="nav-item" id="gateway-ul">
                        <a class="nav-link" data-toggle="collapse" href="#gateway" class="collapsed" aria-expanded="false">
                            <i class="material-icons">account_balance</i>
                            <p>
                                Fees
                                <i class="material-icons">arrow_drop_down</i>
                            </p>
                        </a>
                        
                        
                        <div class="collapse" id="gateway" aria-expanded="false" style="height: 0px;">
                            <ul class="nav flex-column">
                                <li class="nav-item">
                                    <a class="nav-link" href="/get/fee/detail"> Fee Status</a>
                                </li>
                                <hr>
                                <li class="nav-item">
                                 
                                   <u style=" margin-left: 17%;">FEE PAY ONLINE</u>
                                    
                                </li>
                                <li class="nav-item" id="gateway1">
                                    <a class="nav-link" target="_blank" id="gateway1url"></a>
                                </li>
                                <li class="nav-item" id="gateway2">
                                    <a class="nav-link" target="_blank"  id="gateway2url"></a>
                                </li>
                                
                                
                            </ul>
                        </div>
                    </li>
                    
                    <%}%>
                    
                    <%boolean rolecheckadmin1 = SecurityUtils.getSubject().hasRole(KrenaiCONSTANTS.usertype_admin);
                    	if(rolecheckadmin1){
                    %>
                     <li class="nav-item">
                        <a class="nav-link active" href="/get/registraion/summary/school">
                            <i class="material-icons">assignment</i>
                            <p>
                                Registation Summary
                            </p>
                        </a>
                    </li><%}%>
                    <li class="nav-item">
                        <a class="nav-link" href="/changepassword">
                            <i class="material-icons">settings</i>
                            <p>
                                Setting
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/logout">
                            <i class="material-icons">power_settings_new</i>
                            <p>
                                Log Out
                            </p>
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
        
        <script>

        var jqxhr = $.ajax( "/get/school/gateway" )
        .done(function(data) {
        	console.log(data)
        	if(data.gatewayTitle1==null){
        		$("#gateway-ul").hide();
        	}
			if(data.gatewayTitle2==null){
				$("#gateway2").hide();
        	}
			if(data.gatewayTitle1!=null){
        		$("#gateway1url").attr("href",data.gatewayUrl1);
        		$("#gateway1url").text(data.gatewayTitle1);
        	}
			if(data.gatewayTitle2!=null){
				$("#gateway2url").attr("href",data.gatewayUrl2);
        		$("#gateway2url").text(data.gatewayTitle2);
        	}
        	
        })
       
		    
		</script>

