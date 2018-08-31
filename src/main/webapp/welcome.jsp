<!-- content begin -->

<div id="content" class="no-bottom no-top" ng-controller="welcomeCtrl">

    <!-- revolution slider begin -->
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <section id="section-slider" aria-label="section-slider" class="fullwidthbanner-container">
        <div id="revolution-slider">
            <ul>
            <c:forEach var="banner" items="${bannerList}">
                <li data-transition="boxfade" data-slotamount="10" data-masterspeed="800" data-thumb="">
                    <!--  BACKGROUND IMAGE -->
                    <img src="${banner.bannerImage}" alt="" />

                    <div class="tp-caption big-white sfb"
                        data-x="center"
                        data-y="260"
                        data-speed="1000"
                        data-start="800"
                        data-easing="easeInOutExpo"
                        data-endspeed="450">
                        ${banner.text2}
                    </div>

                    <div class="tp-caption ultra-big-white sfb"
                        data-x="center"
                        data-y="190"
                        data-speed="1200"
                        data-start="600"
                        data-easing="easeInOutExpo"
                        data-endspeed="400">
                        ${banner.text1}
                    </div>

                    <div class="tp-caption sfb"
                        data-x="center"
                        data-y="320"
                        data-speed="1000"
                        data-start="1100"
                        data-easing="easeInOutExpo">
                        <a href="/appointment" class="btn-slider">Book an appointment
                        </a>
                    </div>
                </li>
			</c:forEach>
                <%-- <li data-transition="boxfade" data-slotamount="10" data-masterspeed="800" data-thumb="">
                    <!--  BACKGROUND IMAGE -->
                    <img src="${bannerImage2}" alt="" />

                    <div class="tp-caption big-white sfb"
                        data-x="center"
                        data-y="260"
                        data-speed="1000"
                        data-start="800"
                        data-easing="easeInOutExpo"
                        data-endspeed="450">
                        Full Services Salon.
                    </div>

                    <div class="tp-caption ultra-big-white sfb"
                        data-x="center"
                        data-y="190"
                        data-speed="1200"
                        data-start="600"
                        data-easing="easeInOutExpo"
                        data-endspeed="400">
                        From Head To Toe
                    </div>

                    <div class="tp-caption sfb"
                        data-x="center"
                        data-y="320"
                        data-speed="1000"
                        data-start="1100"
                        data-easing="easeInOutExpo">
                        <a href="/appointment" class="btn-slider">Book an appointment</a>
                    </div>
                </li> --%>

            </ul>
        </div>
    </section>
    <!-- revolution slider close -->


    <div class="no-padding mt-130 height90px mobile-hide absolute z-index500 width100 text-light">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="overlay10">

                        <div class="row-fluid">
                            <div class="col-md-4">
                                <div class="info-box padding20">
                                    <i class="icon_clock_alt id-color"></i>
                                    <div class="info-box_text">
                                        <div class="info-box_title" ng-if="todayStatus=='open'">Opening Times</div>
                                        <div class="info-box_subtite" ng-if="todayStatus=='open'">{{openTime}} - {{closeTime}}</div>
                                        <div class="info-box_title" ng-if="todayStatus=='close'">Today Closed</div>
                                        <div class="info-box_subtite" ng-if="todayStatus=='close'">Please back soon...</div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="info-box padding20">
                                    <i class="icon_house_alt id-color"></i>
                                    <div class="info-box_text">
                                        <div class="info-box_title">Our Location</div>
                                        <div class="info-box_subtite">{{storeAddress}}</div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="info-box padding20">
                                    <i class="icon_calendar id-color"></i>
                                    <div class="info-box_text">
                                        <div class="info-box_title">Book Now</div>
                                        <div class="info-box_subtite">{{storePhone}}</div>
                                    </div>
                                </div>
                            </div>

                            <div class="clearfix"></div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>


    <!-- section begin -->
    <section id="section-top-reason" class="no-top no-bottom">
        <div class="container-fluid">
            <div class="row-fluid display-table">

                <div class="col-md-4 text-middle" data-bgcolor="#e2e2e2">
                    <div class="padding40">
                        <div class="box-icon">
                            <i class="fa fa-tags wow zoomIn" data-wow-delay=".25s"></i>
                            <div class="text">
                                <h4>Special Promo</h4>
                                <p>Our commitment to quality and services ensures our client’s satisfaction and happiness. We proudly boast on launching our experienced staff for your services enthusiastically. We’re happy to assist you adjudicate the best appearance. </p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 text-middle text-light" data-bgimage="url(/assets/images/background/bg-div-1.jpg)">
                    <div class="padding40 hoverdark30">
                        <div class="box-icon">
                            <i class="fa fa-tags wow zoomIn" data-wow-delay=".25s"></i>
                            <div class="text">
                                <h4>Get Discount</h4>
                                <p>Nothing creates a sense of urgency like realising you already missed out on a deal- that is unless you NOW have an even better deal in front of you. </br>
									On a fence? Don’t worry-Here’s how you get the discounts…!</br>
									Keep rolling our website for more exciting offers to come…!</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 text-middle text-center" data-bgcolor="#50094d">
                    <div class="padding40">
                        <a href="/appointment" class="btn btn-line-white btn-big wow fadeInUp" data-wow-delay=".3s">Make Appointment Now</a>
                    </div>
                </div>

            </div>
        </div>
    </section>
    <!-- section close -->

    <!-- section begin -->
    <section id="section-services-tab" aria-label="section-services-tab">
        <div class="container">

            <div class="col-md-12 wow fadeInUp">
                <div class="de_tab tab_style_2 scrollTo">
                    <ul class="de_nav">
                        <li data-link="#section-services-tab" ng-class="{'active': package.catActive}" ng-repeat="package in packageList">
                            <img ng-click="getPackageAssign(package)" src="{{package.imageUrl}}" alt="">
                            <span ng-click="getPackageAssign(package)">{{package.name}}</span><div class="v-border"></div>
                        </li>
                        
                    </ul>

                    <div class="de_tab_content">

                        <div id="tab1" class="tab_single_content">
                            <div class="row">


                                <div class="col-md-6" ng-repeat="product in packageProductList">
                                    <div class="sub-item-service">
                                        <div class="c1"><span class="disc" ng-if="product.discountPer>0">{{product.discountPer | number : 2}} % Off</span> {{product.productName}} </div>
                                        <div class="c2"></div>
                                        <div class="c3"> <span>₹ {{product.productMrp}} </span>₹  {{product.productSell}}</div>
                                    </div>
                                </div>

                                <div class="clearfix"></div>
                                <div class="col-md-12 text-right">
                                    <a class="btn-slider" ng-disabled="addPackageDisable" style="cursor: pointer;" ng-click="addToCart(selctedPackae)">Add to Cart</a>
                                </div>
                            </div>
                        </div>

                        
                       

                    </div>

                </div>
            </div>
        </div>
    </section>
    <!-- section close -->




    <!-- section begin -->
    <section id="explore-5" class="side-bg text-light">
        <div class="col-md-6 image-container">
            <div class="background-image"></div>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-md-5 col-md-offset-7">

                    <h2 class="wow-fadeIn">What They Says</h2>
                    <div class="small-border left wow zoomIn" data-wow-delay=".3s" data-wow-duration=".3s"></div>

                    <ul class="testimonial-list wow fadeIn" data-wow-delay=".25s">
                        <li ng-repeat="testimonial in testimonials">{{testimonial.message}}
                                                        <span>{{testimonial.by}}</span>
                        </li>
                        
                    </ul>

                </div>


            </div>
        </div>
    </section>
    <!-- section close -->

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

<script src="/assets/js/ng/ctrl/welcomeCtrl.js"></script>