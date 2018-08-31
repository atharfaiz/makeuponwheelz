<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="customShiroTags" %>
<!-- header begin -->
<header class="header_center">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <!-- logo begin -->
                <div id="logo">
                    <a href="/home">
                        <img class="logo logo_dark_bg" src="/assets/images/logo.png" alt="">
                        <img class="logo logo_light_bg" src="/assets/images/logo_light.png" alt="">
                    </a>
                </div>
                <!-- logo close -->

                <!-- small button begin -->
                <span id="menu-btn"></span>
                <!-- small button close -->

               
                <!-- mainmenu begin -->
                <nav>
                    <ul id="mainmenu">
                        <li><a href="/home">Home</a></li>
                        <li><a href="/about-us">About Us</a></li> 
                        <li><a href="#">Services</a>
                            <ul>
                            	<c:forEach var="cat" items="${categoryList}">
	                                <li><a href="#">${cat.categoryName}</a>
	                                    <ul>
	                                    	<c:forEach var="subcat" items="${subcatList}">
	                                    	<c:if test = "${subcat.id == cat.id}">
	                                        <li><a href="${subcat.url }">${subcat.subcatName }</a></li>
	                                        </c:if>
	                                        </c:forEach>
	                                    </ul>
	                                </li>
                                </c:forEach>
                                <li><a href="/packages">Packages</a>
                                    
                                </li>
                            </ul>
                        </li>                               
                        <li><a href="/appointment">Appointment</a></li>
                        <li><a href="/contact-us">Contact</a></li>
                        <shiro:notAuthenticated>
                        	 <li><a href="/login">Login</a></li>
                        </shiro:notAuthenticated>
                       <shiro:authenticated>
                       	<li><a href="#">${username}</a>
                               <ul>
                                   <li><a href="/logout">Logout</a></li>
                                  
                               </ul>
                           </li>
                       </shiro:authenticated>
                        
                    </ul>
                </nav>
                <div class="clearfix"></div>
            </div>
            <!-- mainmenu close -->

        </div>
    </div>
</header>
<!-- header close -->