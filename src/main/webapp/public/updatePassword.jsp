<!-- <script src="/assets/js/ngApp/passwordUpdate.js"></script> -->
<script src="/assets/js/ng-controller/passwordUpdateCtrl.js"></script>

		<header id="topbar">
           <div class="topbar-left">
                    <ol class="breadcrumb">
                     
                        <li class="crumb-link">
                            <a href="#">Home</a>
                        </li>                        
                        <li class="crumb-trail">Change Password</li>                        
                    </ol>
                </div>       
      </header>
      
      <section id="content" class="table-layout animated fadeIn"  
      	   ng-cloak ng-controller="passwordUpdateCtrl">
        <!-- begin: .tray-center -->
        <div class="tray tray-center">
			<div class="alert alert-success animated flipInX" ng-show="succMsg" ng-cloak>
               <strong>Success!</strong> Password Updated Successfully.
          </div>
          <div class="alert alert-success animated flipInX" ng-show="otpMsg" ng-cloak>
               <strong>Success!</strong> OTP Send Successfully.
          </div>
          <div class="alert alert-danger animated flipInX" ng-show="failedMsg" ng-cloak>
               <strong>Success!</strong> {{alertMsg}}
          </div>
          <div class="row">
          
               <!-- Contact Form 2 -->
              <div class="admin-form theme-info tab-pane 00" id="contact2" role="tabpanel">
                <div class="panel">
                  <div class="panel-heading">
                    <span class="panel-title">
                      <i class="fa fa-lock"></i>Change Password</span>
                  </div>
                  <!-- end .form-header section -->

                  <form ng-submit="submit()" id="form-contact2">
                    <div class="panel-body p25">
                      <div class="section row">
                        <label for="names" class="field-label col-md-5">Your Current Password</label>
                        <div class="col-md-7">
                          <label for="names" class="field prepend-icon">
                            <input type="password" name="names" id="names" ng-model="password.curr" class="gui-input" placeholder="Current Password">
                            <label for="names" class="field-icon">
                              <i class="fa fa-lock"></i>
                            </label>
                          </label>
                        </div>
                        <!-- end section -->
                      </div>
                      <!-- end .section row section -->

                      <div class="section row">
                        <label for="email" class="field-label col-md-5">New Password</label>
                        <div class="col-md-7">
                          <label for="email" class="field prepend-icon">
                            <input type="password" ng-model="password.newPass" class="gui-input" placeholder="New Password">
                            <label for="email" class="field-icon">
                              <i class="fa fa-lock"></i>
                            </label>
                          </label>
                        </div>
                        <!-- end section -->
                      </div>
                      <!-- end .section row section -->

                      <div class="section row">
                        <label for="telephone" class="field-label col-md-5">Confirm Password</label>
                        <div class="col-md-7">
                          <label for="telephone" class="field prepend-icon">
                            <input type="password"  ng-model="password.confPass" class="gui-input" placeholder="Confirm Password">
                            <label for="email" class="field-icon">
                              <i class="fa fa-lock"></i>
                            </label>
                          </label>
                        </div>
                        <!-- end section -->
                      </div>
                      <!-- end .section row section -->
						<div class="section row">
                        <label for="telephone" class="field-label col-md-5">Enter OTP</label>
                        <div class="col-md-7">
                          <label for="telephone" class="field prepend-icon">
                            <input type="text" ng-model="password.jspOtp" class="gui-input" placeholder="OTP">
                            <label for="telephone" class="field-icon">
                              <i class="fa fa-phone-square"></i>
                            </label>
                          </label>
                        </div>
                      <!--   <a href="" ng-click="resendOtp()">&nbsp;&nbsp;&nbsp;Resend OTP</a> -->
                         
                        <!-- end section -->
                      </div>
                      
                      <div class="section">
                        <label class="switch switch-round">
                          <input type="checkbox"  ng-model="password.logIn" id="newsletter" checked="">
                          <label for="newsletter" data-on="YES" data-off="NO"></label>
                          <span>Keep Me Login?</span>
                        </label>

                        <div class="pull-right"><button class="resend_link" type="button" ng-click="resendOtp()">Resend OTP</button></div>
                      </div>
                      <!-- end section -->

                    </div>
                    <!-- end .form-body section -->
                    <div class="panel-footer">
                      <button type="submit" class="button btn-primary">Save</button>
                    </div>
                    <!-- end .form-footer section -->
                  </form>
                </div>
                <!-- end .panel -->
              </div>
          </div>

        </div>
        <!-- end: .tray-center -->

      </section>