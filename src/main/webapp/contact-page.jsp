		<style>
			.btn-custom-style {
			    background: #333 !important;
			    border: none;
			    border-radius: 0 !important;
			    color: #fff;
			    font-weight: bold;
			    text-transform: uppercase;
			    font-weight: bold;
			    letter-spacing: 2px;
			    padding: 5px 20px 5px 20px;
			}
		</style>
<!-- subheader -->
        <section id="subheader" class="subh-center" data-stellar-background-ratio=".2">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h1>Contact</h1>
                        <h4>Get In Touch</h4>
                    </div>
                </div>
            </div>
        </section>
        <!-- subheader close -->
	<!-- content begin -->
        <div id="content" class="no-top" ng-controller="contactCtrl">
		
			
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-md-offset-3 text-center">
                        <h2>Send Us Message</h2>
                        <div class="small-border wow zoomIn" data-wow-delay=".3s" data-wow-duration=".3s"></div>
                    </div>

                    <div class="col-md-8 col-md-offset-2">
                        <form name="contactForm" id='contact_form' class="deform-1" >
                            <div class="row">
                                <div class="col-md-4">
                                    <div id='name_error' class='error'>Please enter your name.</div>
                                    <div>
                                        <input type='text' name='name' ng-model="userName" id='name' required="required" class="form-control" placeholder="Your Name">
                                    </div>

                                    <div id='email_error' class='error'>Please enter your valid E-mail ID.</div>
                                    <div>
                                        <input type='email' name='email' ng-model="userMail" id='email' required="required" class="form-control" placeholder="Your Email">
                                    </div>

                                    <div id='phone_error' class='error'>Please enter your phone number.</div>
                                    <div>
                                        <input type='text' name='phone' ng-model="userMobile" id='phone' required="required" class="form-control" placeholder="Your Phone">
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div id='message_error' class='error'>Please enter your message.</div>
                                    <div>
                                        <textarea name='message' id='message' ng-model="userMessage" required="required" class="form-control" placeholder="Your Message"></textarea>
                                    </div>
                                </div>

                                <div class="col-md-12 text-center">
                                    <p >
                                        <button type='button' ng-disabled="contactForm.$invalid || mailProcess" ng-click="sendUserMail()" class="btn btn-custom btn-custom-style" style="background-color: #de3370 !important; width: 105px;"> 
                                        Submit
                                         <i class="fa fa-circle-o-notch fa-spin" ng-show="mailProcess"></i></button>
                                    </p>
                                    <div id='mail_success' class='success' >Your message has been sent successfully.</div>
                                    <div id='mail_fail' class='error'>Sorry, error occured this time sending your message.</div>
                                </div>
                            </div>
                        </form>

                    </div>


                </div>
            </div>
        </div>
        
        	<script src="/assets/js/ng/ctrl/contactCtrl.js"></script>