 <!-- subheader -->
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
        <section id="subheader" class="subh-center" data-stellar-background-ratio=".2">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h1>Appointment</h1>
                        <h4>Services Booking</h4>
                    </div>
                </div>
            </div>
        </section>
        <!-- subheader close -->
        <!-- content begin -->
        <div id="content" ng-controller="bookingCtrl" >
            <div class="container" ng-show="!showOrderBooked">
            <div class="row table-set" >
                	<div class="col-md-12" ng-if="userProduct.length==0 && userPackage.length==0">
                        <!-- package begin -->
                        <div class="table package text-center">
                        	Please add atleast one product or package...
                        </div>
                    </div>
                    <div class="col-md-12" ng-if="userProduct.length>0 || userPackage.length>0">
                        <!-- package begin -->
                        <h2 style="text-align: center !important;">Shopping Cart</h2>
                        <div class="table package text-center">
                            <div class="c1">
                                 <table class="table m-b-0 table-hover">
                                <thead>
                                    <tr>
                                        <!-- <th>Sl.</th> -->
                                        <th style="text-align: center;">Item</th>
                                        <th style="text-align: center;">Price</th>
                                        <th style="text-align: center;">Qty</th>
                                        <th style="text-align: center;">Total</th>
                                        <th style="text-align: center;">Action</th>
                                    </tr>
                                </thead>
                                <tbody ng-if="userProduct.length>0">
                                    <tr ng-repeat="product in userProduct">
                                        <!-- <td>
                                            <h5>1.</h5>
                                        </td> -->
                                        <td>
                                            <h5>{{product.productName}}</h5>
                                        </td>
                                        <td>
                                            <h6>&#8377;  {{product.productSellPrc | number: 2}}</h6>
                                        </td>
                                        <td>
                                            <h6>{{product.qty}}</h6>
                                        </td>
                                        <td>
                                            <h6>&#8377;  {{product.total | number: 2}}</h6>
                                        </td>
                                        <td>
                                            <a style="cursor: pointer;" ng-click="removeProduct(product)"><i class="fa fa-times-circle"></i></a>
                                        </td>
                                    </tr>
                                    
                                </tbody>
                                 <tbody ng-if="userPackage.length>0">
                                    <tr ng-repeat="package in userPackage">
                                        <!-- <td>
                                            <h5>1.</h5>
                                        </td> -->
                                        <td>
                                            <h5>{{package.name}}</h5>
                                        </td>
                                        <td>
                                            <h6>&#8377;  {{package.sellPrc | number: 2}}</h6>
                                        </td>
                                        <td>
                                        	 <h6>{{package.qty}}</h6>
                                        </td>
                                            
                                        <td>
                                            <h6>&#8377;  {{package.total | number: 2}}</h6>
                                        </td>
                                        <td>
                                            <a style="cursor: pointer;" ><i ng-click="removePackage(package)" class="fa fa-times-circle"></i></a>
                                        </td>
                                    </tr>
                                    
                                </tbody>
                            </table>
                            </div>

                            <div class="c2 text-right">
                                <h4  style="margin-right: 30px;">Basic: &#8377;  {{subTotal | number: 2}}</h4>
                                <h4  style="margin-right: 30px;">GST ({{totalTax*100/subTotal | number : 2}} %): &#8377;  {{totalTax | number : 2}}</h4>
                                <h4  style="margin-right: 30px;">Grand Total: &#8377;  {{totalAmount | number: 2}}</h4>
                            </div>

                            <div class="c3 text-right">
                                <a class="btn-line" ng-disabled="orderProcess" ng-class="{'disabledColor': form_booking.$invalid || orderProcess}" ng-click="submitOrder()"  style="cursor: pointer; margin-right: 30px;">
								 <i class="fa fa-circle-o-notch fa-spin" ng-show="orderProcess"></i> BOOK NOW </a>
                                
                                <div id='mail_success' class='success'>Your order has been successfully placed.</div>
                            <div id='mail_fail' class='error1'>{{errmsg}}</div>
                            </div>

                        </div>
                        <!-- package close -->
                    </div>
                </div>
                <form name="form_booking" id='form_booking' class="deform-1" method="post" action='#'>
                    <div class="row">
                        <div class="col-md-4">
                            <h4>Personal Info</h4>
                            <div class="tiny-border"><span></span></div>
                            
                            <div>
                                <input type='text' name='name'  ng-model="userName" ng-disabled="authen == 'authen'" id='name' required="required" class="form-control" placeholder="Your Name">
                            </div>
							<div id='name_error' class='error' ng-show="form_booking.name.$invalid&&orderSubmitted">Please enter your name.</div>
							
                            <div>
                                <input type='email' name='email' ng-model="userMail" ng-disabled="authen == 'authen'" id='email' required="required" class="form-control" placeholder="Your Email">
                            </div>
							<div id='email_error' class='error' ng-show="form_booking.email.$invalid&&orderSubmitted">Please enter your valid E-mail ID.</div>
                            
                            <div>
                                <input type='text' name='phone' ng-pattern="/[0-9]+$/" ng-minlength="10" ng-maxlength="10" ng-model="userPhone" ng-disabled="authen == 'authen'" id='phone' required="required" class="form-control" placeholder="Your Phone">
                            </div>
                            <div id='phone_error' class='error' ng-show="form_booking.phone.$invalid&&orderSubmitted">Please enter your phone number.</div>
                            
                            <div>
                                <input type='text' name='aphone'  ng-pattern="/[0-9]+$/" ng-minlength="10" ng-maxlength="10" ng-model="userPhoneAlter"  id='phone' class="form-control" placeholder="Your Alternate Phone">
                            </div>
                            <div id='phone_error' class='error' ng-show="form_booking.aphone.$invalid&&orderSubmitted">Please enter your alternate phone number.</div>                            
                            
                            <div>
                                <textarea name='address' id='message'  ng-model="userAddress" required="required" class="form-control" placeholder="Your Address"></textarea>
                            </div>
                            <div id='phone_error' class='error' ng-show="form_booking.address.$invalid&&orderSubmitted">Please enter your address.</div>
                                                       
                        </div>

                        <div class="col-md-4">
                            <h4>Product</h4>
                            <div class="tiny-border"><span></span></div>
                                <div class="row text-center selector-img">
                                <label class="col-md-12 col-sm-12 col-xs-12">

                                    <div class="table package text-center">
                                       <div class="c3">
                                        <a href="#" style="padding-left: 0px;padding-right: 0px;" class="btn-line" data-toggle="modal" data-target="#myModal">SELECT PRODUCT</a>
                                    </div>

                                    </div>
                                
                                </label>
                                <label class="col-md-12 col-sm-12 col-xs-12">
                                  <div class="table package text-center">
                                        <div class="c3">
                                            <a style="padding-left: 0px;padding-right: 0px;" href="#" class="btn-line" data-toggle="modal" data-target="#myModal1">SELECT PACKAGES</a>
                                        </div>

                                    </div>
                                                                   

                                </label>
                            </div>
                            <!-- <span class="spacer-single"></span>
                            <h4>Service Taken by</h4>
                            <div class="tiny-border"><span></span></div>
                            <div class="row text-center selector-img">
                                <label class="col-md-3 col-sm-4 col-xs-6" ng-click="serviceTaken('Man')">
                                    <input type="radio" name="stylist" value="Briana" checked/>
                                    <img src="/assets/images/team/team_pic_1.jpg" alt="" class="img-responsive img-circle">
                                    <span class="spacer-half"></span>
                                    Men
                                </label>
                                <label class="col-md-3 col-sm-4 col-xs-6" ng-click="serviceTaken('Women')">
                                    <input type="radio" name="stylist" value="Jessica"/>
                                    <img src="images/team/team_pic_2.jpg" alt="" class="img-responsive img-circle">
                                    <span class="spacer-half"></span>
                                    Women
                                </label>
                                <label>                            
                                </label>
                            </div> -->
                        </div>

                        <div class="col-md-4">
                            <h4>Prefered Date &amp; Time</h4>
                            <div class="tiny-border"><span></span></div>
                            <div class="row">
                            	
                                <div class="col-md-6">
                                    <input type='text' name='date' id='date' class="form-control" placeholder="select date">
                                </div>
                                
                                <div class="col-md-6">
                                    <select name="selectime" id="time" required="required" ng-model="selectedTime" class="form-control">
                                        <option value="">select time</option>
                                        <option value="{{timesl.time}}" ng-repeat="timesl in timeSlot" ng-disabled="(sameDate && currenttime>timesl.timealias) ">{{timesl.time}} - {{timesl.timeend}}  </option>
                                        <!-- <option value="09:00" ng-disabled="prevDate || (sameDate && currenttime>9)">09:00</option>
                                        <option value="10:00" ng-disabled="prevDate || (sameDate && currenttime>10)">10:00</option>
                                        <option value="11:00" ng-disabled="prevDate || (sameDate && currenttime>11)">11:00</option>
                                        <option value="12:00" ng-disabled="prevDate || (sameDate && currenttime>12)">12:00</option>
                                        <option value="13:00" ng-disabled="prevDate || (sameDate && currenttime>13)">13:00</option>
                                        <option value="14:00" ng-disabled="prevDate || (sameDate && currenttime>14)">14:00</option>
                                        <option value="15:00" ng-disabled="prevDate || (sameDate && currenttime>15)">15:00</option>
                                        <option value="16:00" ng-disabled="prevDate || (sameDate && currenttime>16)">16:00</option>
                                        <option value="17:00" ng-disabled="prevDate || (sameDate && currenttime>17)">17:00</option>
                                        <option value="18:00" ng-disabled="prevDate || (sameDate && currenttime>18)">18:00</option>
                                        <option value="19:00" ng-disabled="prevDate || (sameDate && currenttime>19)">19:00</option>
                                        <option value="20:00" ng-disabled="prevDate || (sameDate && currenttime>20)">20:00</option> -->
                                    </select>
                                </div>
                                
								<div id='message_error' class='error col-md-12' ng-show="form_booking.selectime.$invalid&&orderSubmitted"> &nbsp;&nbsp;&nbsp; Please select correct date and time.</div>

                            </div>

                            <div class="row">   
                             <h4>Family Mumbers</h4>
                            <div class="tiny-border"><span></span>
                            </div>
                            <div class="col-md-6">
                                    <select name="time" ng-model="familyMember" id="time" class="form-control">
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                        <option value="5+">5+</option>
                                    </select>
                            </div>

                            </div>
                            

                            <h4>Notes</h4>
                            <div class="tiny-border"><span></span></div>
                            <div id='message_error' class='error1'>Please enter your message.</div>
                            <div>
                                <textarea name='message' id='message' ng-model="personMessage" class="form-control" placeholder="Your Message"></textarea>
                            </div>
                        </div>

                        <div class="spacer-double"></div>

                        <div class="col-md-4 col-md-offset-4 text-right">
                            <p id='submit'>
                                
                            </p>
                            <div id='mail_success' class='success'>Your order has been successfully placed.</div>
                            <div id='mail_fail' class='error1'>{{errmsg}}</div>
                        </div>
                    </div>
                </form>
                
            </div>
            <div class="container" ng-show="showOrderBooked">
                  <!--   <div class="col-md-12">
                        <div class="de_tab tab_style_2">
                           
                            <div class="de_tab_content">

                                <div id="tab1" class="tab_single_content">
                                    <div class="row">
                                        <div class="text-center">
                                            <img src="/assets/images/services/seccess.png" alt="" class="img-circle img-service-thumbnail" />
                                            <div class="spacer-single"></div>
                                            <h3>Total Order Cost- &#8377;  {{totalOrderAmount}}</h3>
                                            <div class="spacer-single"></div>
                                        </div>


                                        <div class="col-md-6" ng-repeat="userPack in userPackageReplica">
                                            <div class="sub-item-service">
                                                <div class="c1">{{userPack.name}}</div>
                                                <div class="c2"></div>
                                                <div class="c3">&#8377;  {{userPack.sellPrc}}</div>
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-6" ng-repeat="userPro in userProductReplica">
                                            <div class="sub-item-service">
                                                <div class="c1">{{userPro.productName}}</div>
                                                <div class="c2"></div>
                                                <div class="c3">&#8377;  {{userPro.productSellPrc}}</div>
                                            </div>
                                        </div>

                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="col-md-12 text-right">
                                        <a href="/home" class="btn-slider">Back To Home</a>
                                    </div>
                                </div>

                               
                            </div>

                        </div>
                    </div> -->
               
               <div class="row table-set">

                    <div class="text-center">
                        <img src="/assets/images/services/seccess.png" alt="" class="img-circle img-service-thumbnail" style="margin-bottom:10px">
                        <h3>Your Order has been placed Successfully</h3>
                    </div>

                    <div class="col-md-12">
                        <!-- package begin -->
                        <div class="table package">
                            <div class="c1" ng-if="userProductReplica.length">
                                <h2>Products Details</h2>
                                <ul class="list">
                                    <li ng-repeat="userPro in userProductReplica">{{userPro.productName}}   (&#8377;  {{userPro.productSellPrc}})</li>
                                </ul>
                            </div>
                             <div class="c1" ng-if="userPackageReplica.length">
                                <h2>Packages Details</h2>
                                <ul class="list">
                                    <li ng-repeat="userPack in userPackageReplica">{{userPack.name}}   (&#8377;  {{userPack.sellPrc}})</li>
                                </ul>
                            </div>
                            

                            <div class="c3" style="padding: 30px 30px 30px 30px; color:#fff">

                                <h2 style="color: #fff">Customer Details</h2>
                                <p><b>Customer Name : </b>{{userName}}</p>
                                <p><b>Address: </b>{{userAddress}} </p>
                                <p><b>Contact Number : </b>{{userPhone}}</p>
                                <p><b>Service Date and Time : </b>{{selectedDate}} | {{selectedTime}} </p>
								<!-- <p><b>Booking Message: </b>{{personMessage}}</p> -->
                            </div>

							<div ng-if="personMessage.length" class="c2 text-right" style="font-size: 19px;padding: 30px 30px 30px 0;max-height: 52px !important;background-color: palevioletred;">
                                <strong>{{personMessage}}</strong>
                            </div>

                            <div class="c2 text-right" style="padding: 30px 30px 30px 0;">
                                <strong>Order Cost</strong>
                                <h3 class="price"><span>₹</span>{{totalOrderAmount}}</h3>
                            </div>
                            
                         
                        </div>
                        <!-- package close -->
                    </div>

                </div>
                </div>
            
            <!-- Modal -->
            <div id="myModal1" class="modal fade" role="dialog">
              <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Select Package</h4>
                  </div>
                  <div>
                    <div class="col-md-12">
                        <div class="de_tab tab_style_2">
                            <ul class="de_nav" >
                                <li ng-repeat="catPro in categoryPackage" ng-class="{'active': catPro.catActive}" data-link="#section-services-tab">
                                	<span ng-click="getpackageAssign(catPro)">{{catPro.catName}}</span><div class="v-border"></div>
                                </li>
                               
                            </ul>

                            <div class="de_tab_content">

                                <div id="tab{{categoryPackageReplica.catId}}" class="tab_single_content" >
                                       
                                    <ul class="products">
                                <li class="col-md-4 product" ng-repeat="package in categoryPackageReplica.catPackageList">
                                    <img src="{{package.imageUrl}}" class="img-responsive" alt="">
                                    <div class="info">
                                        <h4>{{package.name}}</h4>
                                        <div class="price"><strike style="color: lightgrey; padding-right: 4px; font-size: medium;">&#8377;  {{package.mrp}}</strike>&#8377;  {{package.sellPrc}}</div>
                                        <a href="#" ng-if="package.qty==0" ng-click="addPackageToCart(package)" class="btn">Add To Cart</a>
                                        <div class="row button_holder" ng-if="package.qty>0">
                                                    <div class="col-md-4">
                                                        <BUTTON ng-click="addPackageToCart(package)">+</BUTTON>
                                                    </div>
                                                    <div class="col-md-2">
                                                       {{package.qty}}
                                                    </div>
                                                    <div class="col-md-4">
                                                        <BUTTON ng-click="removeFromCart(package)">-</BUTTON>
                                                    </div>
                                                </div>	
                                    </div>
                                </li>

                               
                            </ul>
                                    
                                </div>


                        </div>
                    </div>
                  </div>
                  <div>
                    <button type="buton" data-dismiss="modal"></button>
                  </div>
                </div>

              </div>
            </div>


    </div>
            
            <!-- Modal -->
            <div id="myModal" class="modal fade" role="dialog">
              <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Select Products</h4>
                  </div>
                  <div>
                    <div class="col-md-12" style="background-color: white;">
                        <div class="de_tab tab_style_2">
                            <ul class="de_nav" >
                                <li ng-repeat="catPro in categoryProduct" ng-class="{'active': catPro.catActive}" data-link="#section-services-tab">
                                	<span ng-click="getProductAssign(catPro)">{{catPro.catName}}</span><div class="v-border"></div>
                                </li>
                               
                            </ul>

                            <div class="de_tab_content">

                                <div id="tab{{categoryProductReplica.catId}}" class="tab_single_content" >
                                       
                                    <ul class="products">
                                <li class="col-md-4 product" ng-repeat="product in categoryProductReplica.catProductList">
                                    <img src="{{product.imageUrl}}" class="img-responsive" alt="">
                                    <div class="info">
                                        <h4>{{product.productName}}</h4>
                                        <div class="price"><strike style="color: lightgrey; padding-right: 4px; font-size: medium;">&#8377;  {{product.productMrp}}</strike>&#8377;   {{product.productSellPrc}}</div>
                                        <a href="#" class="btn" ng-click="addProductToCart(product)" ng-if="product.qty==0">Add To Cart</a>
                                        <div class="row button_holder" ng-if="product.qty>0">
                                                    <div class="col-md-4">
                                                        <BUTTON ng-click="addProductToCart(product)">+</BUTTON>
                                                    </div>
                                                    <div class="col-md-2">
                                                       {{product.qty}}
                                                    </div>
                                                    <div class="col-md-4">
                                                        <BUTTON ng-click="removeProductFromCart(product)">-</BUTTON>
                                                    </div>
                                                </div>	
                                    </div>
                                </li>

                               
                            </ul>
                                    
                                </div>


                        </div>
                    </div>
                  </div>
                  <div>
                    <!-- <button type="buton" class="dismiss-rnd" data-dismiss="modal"></button> -->
                  </div>
                </div>

              </div>
            </div>


    </div>
    	<!-- Modal -->
            <div id="myModal3" class="modal fade" role="dialog">
              <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">{{buttonValue}}</h4>
                  </div>
                  <div>
                    <div class="col-md-12" style="margin-top: 40px; margin-bottom: 40px;">
                         <div id='phone_error' class='error' ng-show="otpRec&&form_booking.otp.$invalid">Please enter otp.</div>
                            <div>
                                <input type='text' name='otp' ng-show="otpRec" required="required" ng-model="userOtp"  id='phone' class="form-control" placeholder="Please otp">
                            </div>
                            <div id='phone_error' class='error' ng-show="otpRec&&form_booking.password.$invalid">Please enter password.(Your mail has been already registered.)</div>
                            <div>
                                <input type='password' name='password' ng-show="!otpRec" required="required" ng-minlength="6" ng-model="userPassword"  id='phone' class="form-control" placeholder="Enter Password( mail already registered)">
                            </div>
                  </div>
                  <div class="row">
                  	<!-- <div class="col-md-3"><button type="button" data-dismiss="modal"></button></div> -->
                  	<div class="col-md-6" ><label>{{errmsg}}</label></div>
                     <div class="col-md-3"><button class="btn btn-primary" type="button" ng-click="otpVerClick = true; submitOrder()" style="float: right; margin-right: 36px; width: 110px">{{buttonValue}}</button></div>
                    
                  </div>
                  
                </div>

              </div>
            </div>


    	</div>
        </div>
        <script src="/assets/js/bootstrap-datepicker.js"></script>
       <script type="text/javascript">
    	$('#date').datepicker({
    		format: 'dd/mm/yyyy',
        	startDate:new Date(),
        	minDate:new Date(),
        	autoclose: true
       }).on('changeDate', function (e) {
          //console.log(e.timeStamp);
          //console.log(new Date().getTime());
          /* if(e.timeStamp < new Date().getTime()){
           //alert('before date selected');
          } */
          
          getDateChanged();
       });
    	function getDateChanged(){
        	//console.log('into change date initail');
        	console.log('into change date  : '+document.getElementById("date").value);
        	var sarray = document.getElementById("date").value;
        	var sdateArr = sarray.split("/");
        	sarray = sdateArr[1]+"-"+sdateArr[0]+"-"+sdateArr[2];
        	console.log('=============moderate========='+sarray);
         	var sdate = new Date(sarray);
        	var dateNow = new Date();
        	console.log(sdate);
        	if(sdate.getFullYear()<dateNow.getFullYear()){
        		document.getElementById("date").value = '';
        		console.log('=============log1');
        	}else if(sdate.getMonth()<dateNow.getMonth()&&sdate.getFullYear()==dateNow.getFullYear()){
        		document.getElementById("date").value = '';
        		console.log('=============log2');
        	}else if(sdate.getDate()<dateNow.getDate()&&sdate.getMonth()==dateNow.getMonth()&&sdate.getFullYear()==dateNow.getFullYear()){
        		document.getElementById("date").value = '';
        		console.log('=============log3');
        	}else{
        		//document.getElementById("date").value = '';
        		var selectedDate = document.getElementById("date").value;
        		var scope = angular.element(document.getElementById('content')).scope();
        		$('#date').datepicker('hide');
        		scope.timeSelect();
        		/* var sdateArr = selectedDate.split("/");
        		$.ajax({
        			url : '/get/user/available/time/slot',
        			data : {
        				selectedDate : sdateArr[1]+sdateArr[0]+sdateArr[2]
        				},
        			type: "POST",
        			success : function(data) {
        			
        			console.log(data);
        			},
        			error: function(data){
        				alert("error found while updating subscripton!!");
        			}
        		}); */
        		
        		if(sdate.getDate()==dateNow.getDate()){
        			//document.getElementById("date").value = '';
        			console.log('=============log4');
        		}else{
        			console.log('=============log5');
        		}
        	}
        	
        	
        }
    </script>
  
    <script src="/assets/js/ng/ctrl/bookingCtrl.js"></script>
    