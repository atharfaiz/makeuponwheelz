
	<style type="text/css">
 			.disabledColor{
 				background-color: grey;
 			}
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
                        <h1>Login</h1>
                        <h4>Get In Touch</h4>
                    </div>
                </div>
            </div>
        </section>
        <!-- subheader close -->

        <!-- content begin -->
        <div id="content" class="no-top">
		
			
            <div class="container" ng-controller="loginCtrl">
                <div class="row">

                    <div class="spacer-double"></div>

                    <div class="col-md-12 col-md-offset-4">
                        <form name="contactForm" id='contact_form' class="deform-1" method="post" action='#'>
                            <div class="row">
                                <div class="col-md-4">
                                    
                                    <div>
                                        <input type='email' ng-model="username" ng-show="!forgotPwd" name='email' id='email' class="form-control" placeholder="Your Email">
                                    </div>
                                    <div id='email_error' class='error1' ng-show="!forgotPwd">Please enter your valid E-mail ID.</div>
                                    
                                    <div>
                                        <input type='password' ng-show="!forgotPwd"  style="color: black;" ng-model="password" name='password' id='password' class="form-control" placeholder="Your password">
                                    </div>
                                    <div id='phone_error' class='error1' ng-show="!forgotPwd">Please enter your password.</div>
                                    
                                    <div>
                                        <input type='email' ng-show="forgotPwd"  style="color: black;" ng-model="forgetMail" name='forgetMail' id='password' class="form-control" required="required" placeholder="Your registered mail">
                                    </div>
                                    <div id='phone_error' class='error' ng-show="contactForm.forgetMail.$invalid&&forgetPwdSubmitted">Please enter your valid registered mail.</div>
                                    
                                    <div>
                                        <input type='password' ng-show="forgotPwd&&otpVerify"  style="color: black;" ng-model="otp" name='otp' id='password' class="form-control" required="required" placeholder="Your otp">
                                    </div>
                                    <div id='phone_error' class='error' ng-show="contactForm.otp.$invalid&&forgetPwdSubmitted&&otpVerify">Please enter your otp.</div>
                                    
                                    <div>
                                        <input type='password' ng-show="forgotPwd&&otpVerify"  style="color: black;" ng-model="newpassword" name='newpassword' ng-minlength="6" required="required" id='password' class="form-control" placeholder="enter new Password">
                                    </div>
                                    <div id='phone_error' class='error' ng-show="contactForm.newpassword.$invalid&&forgetPwdSubmitted&&otpVerify">Please enter your new password (atleast 6 character).</div>
                                    <div class="spacer-single"></div>
                                    <div>
                                        <a href="#" ng-click="forgetPassword()" ng-show="!forgotPwd">Forget Password</a>
                                        <a href="#" ng-click="loginMode()" ng-show="forgotPwd">Login</a>
                                    </div>                                   
                                    
                                    <div class="text-right">
                                        <p id='submit' ng-show="!forgotPwd">
                                            <input type='button' ng-click="loginVerify()" ng-show="!forgotPwd" id='login' value='Login' class="btn btn-custom">
                                        </p>
                                        <p id='submit' ng-show="forgotPwd">
                                            <input type='button' ng-click="resetPassword()" ng-show="forgotPwd" id='login' value='{{buttonlabel}}' class="btn btn-custom">
                                        </p>
                                        <div id='mail_success'  class='success'>{{msg}}</div>
                                        <div id='mail_fail'  class='error1'>{{msg}}</div>
                                    </div>
                                    <div>
                                        If you are not register user, click <a href="/register">Regsiter</a>
                                    </div>
                                </div>                         
                            
                            </div>
                        </form>

                    </div>


                </div>
            </div>
        </div>

   
	<script src="/assets/js/ng/ctrl/loginCtrl.js"></script>