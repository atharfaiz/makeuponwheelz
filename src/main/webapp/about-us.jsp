<!-- subheader -->
        <section id="subheader" class="subh-center" data-stellar-background-ratio=".2">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h1>About Us</h1>
                        <h4>Who We Are</h4>
                    </div>
                </div>
            </div>
        </section>
        <!-- subheader close -->
        
        <!-- content begin -->
        <div id="content" class="no-bottom no-top" ng-controller="aboutUsCtrl">
		
			<!-- section begin -->
            <section id="explore-2" class="side-bg">
                <div class="col-md-6 image-container">
                    <div class="background-image"></div>
                </div>

                <div class="container">
                    <div class="row">
                        <div class="col-md-5 col-md-offset-7">
                            <div class="padding40"style="    color: black;">
                                <h2>Who we are
							<span class="small-border"></span>
                                </h2>
                                <p>Search of an on demand make up artist is now over. We introduce you to the first ever vanity van concept of travelling with services to your doorstep with extremely skilled team of professionals helping you to choose and look winsome.</p>
                                
                                <p><b>Make up on wheels</b> is an endeavour of providing services at your doorstep related to “make-up”. </p>
                                <p>Be it</p>
                                <div class="">
		                            <ul>
		                                <li>For an event</li>
		                                <li>Party</li>
		                                <li>Function</li>
		                                <li>Regular touch-up</li>
		                                <li>Frequent outings</li>
		                            </ul>
		                        </div>
                            </div>

                        </div>
                    </div>
                </div>
            </section>
			<!-- section close -->
			
			<!-- section begin -->
            <section id="explore-1" class="side-bg">
                <div class="col-md-6 col-md-offset-6 pull-right image-container">
                    <div class="background-image"></div>
                </div>

                <div class="container">
                    <div class="row">
                        <div class="col-md-5">
                            <div class="padding40">
                                <h2>Cozy Interior
							<span class="small-border"></span>
                                </h2>
                                Welcome to Modis beauty salons where our team of experienced and professionally trained to give you best services. We offer beauty treatments for ladies including hairdressing, make up, facial, massage and more.Search of an on demand make up artist is now over. We introduce you to the first ever vanity van concept of travelling with services to your doorstep with extremely skilled team of professionals helping you to choose and look winsome.  
                            </div>

                        </div>
                    </div>
                </div>
            </section>
			<!-- section close -->


            <!-- section begin -->
            <section id="section-stylist">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 col-md-offset-3 text-center">
                            <h1>Our Stylist</h1>
                            <div class="small-border wow zoomIn" data-wow-delay=".3s" data-wow-duration=".3s"></div>
                            <div class="spacer-single"></div>
                        </div>

                        <div class="clearfix"></div>

                        <div class="col-md-3 col-sm-3 col-xs-6 wow fadeInLeft" data-wow-delay=".8s" ng-repeat="artist in artistList">
                            <div class="team-member">
                                <img src="{{artist.artistImage}}" class="img-circle pic-grey" alt="" />
                                <h3>{{artist.artistName}}</h3>
                                <p>{{artist.artistAbout}}</p>
                                <!-- <div class="social">
                                    <a href="#"><i class="fa fa-facebook fa-lg"></i></a>
                                    <a href="#"><i class="fa fa-twitter fa-lg"></i></a>
                                    <a href="#"><i class="fa fa-google-plus fa-lg"></i></a>
                                    <a href="#"><i class="fa fa-skype fa-lg"></i></a>
                                </div> -->
                            </div>
                        </div>

                       
                    </div>
                </div>
            </section>
            <!-- section close -->


            <!-- section begin -->
            <section class="bg-grey no-padding">
                <div class="container-fluid bg-color-2">
                    <div class="row">
                        <div class="col-md-5 text-right">
                            <div class="small-padding text-light">
                                <h3>Fun Facts</h3>
                                <i class="icon_box-checked icon-bg"></i>
                            </div>


                        </div>

                        <div class="col-md-7 bg-grey pull-right">
                            <div class="small-padding">
                                Washing hair removes excess sweat and oil, as well as unwanted products from the hair and scalp. Often hair is washed as part of a shower or bathing with shampoo, a specialized surfactant. Shampoos work by applying water and shampoo to the hair.
                            </div>

                        </div>
                    </div>
                </div>
            </section>
            <!-- section close -->

        </div>
        <script src="/assets/js/ng/ctrl/aboutCtrl.js"></script>