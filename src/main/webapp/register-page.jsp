	<style type="text/css">
 			
 			.enableCursor{
 				cursor: pointer;
 			}
 			.error {
			    padding: 10px;
			    border: none;
			    display: block;
			    color: #d9534f;
			    margin-top: -22px;
    			margin-bottom: 18px;
			    font-size: 12px;
			}
			.error1 {
			    padding: 20px;
			    border: none;
			    display: none;
			    color: #d9534f;
			    border: solid 1px #d9534f;
			    font-size: 12px;
			}
		</style>
	<!-- subheader -->
        <section id="subheader" class="subh-center" data-stellar-background-ratio=".2">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h1>Register</h1>
                        <h4>If you are new customer</h4>
                    </div>
                </div>
            </div>
        </section>
        <!-- subheader close -->
        
         <!-- content begin -->

        <div id="content">
            <div class="container" ng-controller="registerCtrl">
                <form name="form_regis" id='form_booking' class="deform-1" method="post" action='#'>
                    <div class="row">
                        <div class="col-md-2" ng-show="!hideDetail"></div>
                        <div class="col-md-4" ng-show="!hideDetail">
                            <h4>Personal Info</h4>
                            <div class="tiny-border"><span></span></div>
                            
                            <div>
                                <input type='text' ng-model="name" name='name' id='name' class="form-control" placeholder="Your Name" required="required">
                            </div>
							<div id='name_error' class='error' ng-show="form_regis.name.$invalid&&registerSubmit">Please enter your name.</div>
                            
                            <div>
                                <input type="email" ng-model="usermail" name='email' id='email' class="form-control" placeholder="Your Email" required="required">
                            </div>
							<div id='email_error' ng-show="form_regis.email.$invalid&&registerSubmit" class='error'>Please enter your valid E-mail ID.</div>
                            
                            <div>
                                <input type='text' name='phone' ng-model="phone" id='phone' ng-pattern="/[0-9]+$/" ng-minlength="10" ng-maxlength="10" class="form-control" placeholder="Your Phone" required="required">
                            </div>
                            <div id='phone_error' ng-show="form_regis.phone.$invalid&&registerSubmit" class='error'>Please enter your valid phone number.</div>
                            
                            <div>
                                <input type='text' name='password' ng-model="password" id='password' ng-minlength="6" class="form-control" placeholder="Your Password (min 6 digit)" required="required">
                            </div>
                            <div id='phone_error' ng-show="form_regis.password.$invalid&&registerSubmit" class='error'>Please enter minimum 6 digit password.</div>                     
                        </div>

                        <div class="col-md-4" ng-show="!hideDetail">
                            <h4>Address</h4>
                            <div class="tiny-border"><span></span></div>
                            
                            <div>
                                <textarea name='message' id='message' ng-model="address" class="form-control" placeholder="Your Address"></textarea>
                            </div>
							<div id='phone_error' class='error1'>Please enter your address.</div>
                            <div class="spacer-half"></div>
                            If you are already register, click <a href="/login">login</a>
							<div class="spacer-single"></div>
                        </div>
                        <div class="col-md-2" ng-show="hideDetail"></div>
                        <div class="col-md-8" ng-show="hideDetail" style="display: flex;">
                        	<div class="col-md-4">
                        		<div id='otp_error' ng-show="otp.length!=4&&otpSubmit" class='error'>enter 4 digit otp.</div>
                                <input type='text' name='otp' ng-model="otp" style="min-width: 100px;"  id='otp' class="form-control" placeholder="Your otp"> 
                             </div>
                             <div class="col-md-4" style="display: -webkit-box;">
                                <input type="checkbox" name="continuelog" style="max-height: 20px; max-width: 20px; margin-right: 100px; margin-left: 50px;" ng-click="checklog()" ng-model="continueLogin" class="form-control">
                                 <label>Want to continue LOGIN</label> 
                            </div>
                        </div>

                        <div class="spacer-single"></div>

                        <div class="col-md-2 col-md-offset-8 text-center">
                            <p id='submit' ng-show="!hideDetail">
                                <input type='button' id='register' style="cursor: pointer;" ng-click="registerVerify()" value='Register' class="btn btn-custom fullwidth">
                            </p>
                            <p id='submit' ng-show="hideDetail">
                                <input type='button' id='register' style="cursor: pointer;" ng-click="otpVerify()" value='Otp Verify' class="btn btn-custom fullwidth">
                            </p>
                            <div id='mail_success' class='success'>You are successfully register.</div>
                            <div id='mail_fail' class='error1'>{{msg}}</div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        
        
    
	<script src="/assets/js/ng/ctrl/registerCtrl.js"></script>