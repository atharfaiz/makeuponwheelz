<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="shiro" uri="customShiroTags" %>
<%@page import="org.apache.shiro.SecurityUtils"%>

<!-- <script src="/assets/js/ng/ctrl/passwordUpd.js"></script> -->
<script src="/assets/js/ng/ctrl/parentAccessCtrl.js"></script>
<div class="content"   ng-cloak ng-controller="changePass" ng-mock>
                <div class="container-fluid">
                   
                    <br>
                      <br>
                      <br>
                      <br>
                      <br>
                      
                    <div class="row">
                     
                    
                        <div class="col-lg-12">
                            <div class="card" style="min-height:370px;">
                                    <div class="card-content" ng-hide="otpsec">
                                        <h4 class="card-title">Change Password</h4>
                                        <div class="form-group">
                                            <label class="col-form-label">
                                                Old Password
                                                <small>*</small>
                                            </label>
                                            <input class="form-control" name="email" ng-model="pass.oldpass" type="password" required="true" />
                                        </div>
                                        <div class="form-group">
                                            <label class="col-form-label">
                                                 New Password
                                                <small>*</small>
                                            </label>
                                            <input class="form-control" name="password" ng-model="pass.newpass" id="registerPassword" type="password" required="true" />
                                        </div>
                                        <div class="form-group">
                                            <label class="col-form-label">
                                                Confirm Password
                                                <small>*</small>
                                            </label>
                                            <input class="form-control" name="password_confirmation" ng-model="pass.confpass" type="password" required="true" equalTo="#registerPassword" />
                                        </div>
                                        <div class="category form-category">
                                            </div>
                                        <div class="form-footer text-right">
                                            <div class="checkbox float-left checkbox-inline">
                                                <label>
                                                    
                                                </label>
                                            </div>
                                            <label style="color:red">{{msg}}</label>
                                            <button type="submit" class="btn btn-primary" ng-click="chgPass()">Change Password</button>
                                        </div>
                                    </div>
                                    
                                   <!--  <div class="card-content" ng-show="otpsec">
                                        <h4 class="card-title">OTP</h4>
                                        <div class="form-group">
                                            <label class="col-form-label">
                                                Enter OTP
                                                <small>*</small>
                                            </label>
                                            <input class="form-control" name="otp" ng-model="pass.otp" type="text" required="true" />
                                        </div>
                                        
                                        <div class="category form-category">
                                            </div>
                                        <div class="form-footer text-right">
                                            <div class="checkbox float-left checkbox-inline" id="sendagain">
                                                <label>
                                                    <button class="btn btn-danger" ng-click="chgPass()">Send Again</button>
                                                </label>
                                            </div>
                                            <label style="color:red">{{otpmsg}}</label>
                                            <button class="btn btn-primary" ng-click="chgotpPass()">Submit</button>
                                        </div>
                                    </div> -->
                                    
                            </div>
                        </div>
                    </div>
                </div>
            </div>