<!-- footer begin -->
		<style type="text/css">
		
			.aboutUsScrool{
				overflow-y: scroll;
  				max-height: 172px;
			}
		
		</style>
<footer>
    <div class="container"  ng-controller="footerCtrl">
        <div class="row">

            <div class="col-md-4">
                <div class="widget widget_recent_post">
                    <h3>About</h3>
                    <p ng-class="{'aboutUsScrool' : storeAboutMore}">{{storeAboutSub}} <br ng-if="!storeAboutMore">
                    <a ng-show="!storeAboutMore" ng-click="expandAbout()" style="cursor: pointer; float: right;">Read More</a></p>
                </div>
            </div>

            <div class="col-md-4">
                <div class="widget">
                    <h3>We're Open</h3>
                    <div class="box-border double" style="padding: 0 !important; padding-left: 20px !important; padding-right: 20px !important;">
                        <ul class="list-border-bottom">
                            <li ng-repeat="workHour in workingHour" style="padding-bottom: 0; margin-bottom: 0">
                                <span class="pull-left">{{workHour.day}}</span>
                                <span class="pull-right id-color">{{workHour.openTime}} to {{workHour.closeTime}}</span>
                                <div class="clearfix"></div>
                            </li>
                            
                        </ul>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="widget widget-address">
                    <h3>Contact Us</h3>

                    <address>
                        <span>{{storeAddress}}</span>
                        <span><strong>Phone:</strong>(+91) {{storePhone}}</span>
                        <span><strong>Fax:</strong>(+91) {{storeAlterPhone}}</span>
                        <span><strong>Email:</strong><a href="mailto:contact@modis-salon.com">{{storeEmail}}</a></span>
                        <!-- <span><strong>Web:</strong><a href="#">http://beauty.com</a></span> -->
                    </address>
                </div>
            </div>


        </div>
    </div>

    <div class="subfooter">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    &copy;  Makeup on wheel 2018. All rights reserved.                    
                </div>
                <div class="col-md-6 text-right">
                    <div class="social-icons">
                        <a href="#"><i class="fa fa-facebook fa-lg"></i></a>
                        <a href="#"><i class="fa fa-twitter fa-lg"></i></a>
                        <a href="#"><i class="fa fa-rss fa-lg"></i></a>
                        <a href="#"><i class="fa fa-google-plus fa-lg"></i></a>
                        <a href="#"><i class="fa fa-skype fa-lg"></i></a>
                        <a href="#"><i class="fa fa-dribbble fa-lg"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>

</footer>
<!-- footer close -->
<script src="/assets/js/ng/ctrl/footerCtrl.js"></script>