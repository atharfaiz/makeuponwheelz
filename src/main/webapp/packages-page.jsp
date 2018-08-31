 <style>
.row.masonry.isotope {
 overflow: visible !important;
}
</style>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <!-- subheader -->
        <section id="subheader" class="subh-center" data-stellar-background-ratio=".2">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h1>Our Services</h1>
                        <h4>Discover What We Do</h4>
                    </div>
                </div>
            </div>
        </section>
        <!-- subheader close -->
        <!-- content begin -->
        <div id="content" class="no-bottom no-top" ng-controller="packageCtrl">
            <section>
                <div class="container">
                    <div class="row masonry" style="display: content !important;">
                    
                    	<div class="col-md-6 item" ng-repeat="package in packageList">
                            <div class="box-border padding30" >
                                <div class="text-center">
                                    <img src="{{package.imageUrl}}" alt="" class="img-circle img-service-thumbnail" />
                                    <div class="spacer-single"></div>
                                    <h1>{{package.name}}</h1>
                                    <div class="spacer-double"></div>
                                </div>

								
									<div class="sub-item-service" ng-repeat="product in package.packageProduct">
	                                    <div class="c1">
	                                   
	                                    <span class="disc" ng-if="product.discountPer>0">{{product.discountPer | number : 2}} % Off</span> 
	                                   
	                                    {{product.productName}}</div>
	                                    <div class="c2"></div>
	                                    <div class="c3"><span>₹  {{product.productMrp}} </span>₹  {{product.productSell}}</div>
	                                </div>
								
								
                                                                
                            </div>
                        </div>
                    
                        

                    </div>
                </div>
            </section>


            <!-- section begin -->
            <!-- section begin -->
            <section id="cta" aria-label="cta" class="call-to-action bg-color-2 wow fadeInLeftBig text-light">
                <div class="container">
                    <div class="row">
                        <div class="col-md-9 mt10">
                            <h3><i class="fa fa-phone mr10"></i>Contact us now and get special offers!</h3>
                        </div>

                        <div class="col-md-3 text-right">
                            <a href="/appointment" class="btn btn-line-white btn-big">Make Appointment Now</a>
                        </div>
                    </div>
                </div>
            </section>
            <!-- section close -->
            <!-- section begin -->

        </div>
        
        	<script src="/assets/js/ng/ctrl/packageCtrl.js"></script>
        	