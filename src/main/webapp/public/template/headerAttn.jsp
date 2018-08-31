<%@page import="com.bugfree.testgt.commons.KrenaiCONSTANTS"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@page import="org.apache.shiro.SecurityUtils"%>
<%@page import="org.apache.commons.lang.WordUtils"%>
<%@ taglib prefix="shiro" uri="customShiroTags" %>
		    <%
		      	boolean relecheckParent2 = SecurityUtils.getSubject().hasRole(KrenaiCONSTANTS.usertype_parent);
		      	if(relecheckParent2 && !Boolean.parseBoolean(request.getParameter("isTest"))){
		       %>
		   <div>
			<%} %>
			<nav class="navbar navbar-toggleable-md navbar-default navbar-absolute navbar-inverse" data-topbar-color="blue">
                <div class="navbar-minimize">
                    <button id="minimizeSidebar" class="btn btn-round btn-white btn-fill btn-just-icon">
                    <i class="material-icons visible-on-sidebar-regular f-26">keyboard_arrow_left</i>
                    <i class="material-icons visible-on-sidebar-mini f-26">keyboard_arrow_right</i>
                </button>
                </div>
                <div class="navbar-header d-flex">
                    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
                    <a class="navbar-brand" href="#"> Dashboard </a>
                   
                </div>
              
               <div class="navbar-header d-flex">
                    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
                    <a class="navbar-brand" href="#"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </a>
                   
                </div>
                <div class="navbar-header d-flex">
                    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
                    <a class="navbar-brand" href="#"> ${student_admission} &nbsp;&nbsp; ${user_name_student} &nbsp;&nbsp; ${student_class}  </a>
                   
                </div>
				<div class="collapse navbar-collapse">
                    <ul class="navbar-nav ml-auto">
                         <%
                    	boolean relecheckParent3 = SecurityUtils.getSubject().hasRole(KrenaiCONSTANTS.usertype_parent);
                    	if(relecheckParent3 && !Boolean.parseBoolean(request.getParameter("isTest"))){
                    %>
                        <li class="nav-item dropdown"   >
                            <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
                                <i class="material-icons">notifications</i>
                                <span class="notification"></span>
                                <p class="hidden-lg-up">
                                    Notifications
                                    <i class="material-icons">arrow_drop_down</i>
                                </p>
                            </a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="/get/notification/detail">You have {{count}} new messages</a>
                                <!-- <a class="dropdown-item" href="#">You're now friend with Mike</a>
                                <a class="dropdown-item" href="#">Wish Mary on her birthday!</a>
                                <a class="dropdown-item" href="#">5 warnings in Server Console</a>
                                <a class="dropdown-item" href="#">Jane completed 'Induction Training'</a>
                                <a class="dropdown-item" href="#">'Prepare Marketing Report' is overdue</a> -->
                            </div>
                        </li><%} %>
                       
                        <li class="nav-item dropdown" >
                            <a href="#" style="color: #fffff;" class="dropdown-toggle nav-link" data-toggle="dropdown">
                                 <h4> ${user_name}</h4>
                            </a>
                            <%-- <div class="dropdown-menu">
                               <h4 style="color: #000000;"> ${user_name_student} </h4>
                            </div> --%>
                        </li>
                       <%--  <li class="nav-item">
                           <h4> ${user_name} &nbsp; ${user_name_student}</h4>
                        </li> --%>
                        <li class="separator hidden-lg-up"></li>
                    </ul>
                </div>
                 
               </nav>
               
               