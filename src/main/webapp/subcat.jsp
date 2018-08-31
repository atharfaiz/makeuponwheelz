		<!-- subheader -->
        <section id="subheader" class="subh-center" data-stellar-background-ratio=".2">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h1>${name}</h1>
                    </div>
                </div>
            </div>
        </section>
        <!-- subheader close -->
        
        <div id="content" class="no-bottom no-top" ng-controller="subcatCtrl">
            <section id="services-hair" aria-label="services-hair" class="side-bg">
                <div class="col-md-6 image-container">
                    <div class="background-image" style="background: url({{hostPrefix}}${subcatImage})"></div>
                </div>

                <div class="container"  >
                    <div class="row">
                        <div class="col-md-5 col-md-offset-7">
                            <div class="padding40">


								 <div class="sub-item-service" ng-if="productListLen==0">
                                    <div class="c1">No Product is Available</div>
                                    <div class="c2"></div>
                                    <div class="c3"></div>
                                </div>
								<div  ng-show="productListLen>0">
                                <div class="sub-item-service" ng-repeat="product in productList">
                                    <div class="c1"><span class="disc" ng-if="product.discount>0">{{product.discount | number : 2}} <label ng-if="product.discoutIsPer">%</label> Off</span>{{product.productName}}</div>
                                    <div class="c2"></div>
                                    <div class="c3"> <span>₹  {{product.promrp}} </span>₹  {{product.sellPrc}}</div>
                                </div>
								</div>

                               


                            </div>
                        </div>
                    </div>
                </div>
            </section>

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

        </div>
     
	<script src="/assets/js/ng/ctrl/subcatCtrl.js"></script>