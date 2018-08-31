package com.bugfree.testgt.commons;

import java.io.File;
import java.util.Date;

import org.joda.time.DateTime;
import org.joda.time.DateTimeZone;

import com.ibm.icu.text.DateFormat;
import com.ibm.icu.text.SimpleDateFormat;
import com.ibm.icu.util.TimeZone;

public class KrenaiCONSTANTS {

	public final static String MID= "UandVs41282959729466"; //"KRENAI32447934461669";
	public final static String MERCHANT_KEY= "6EIA00X54WcAB@VR"; //"0fFFpHGXlFmLdKGq";
	public final static String INDUSTRY_TYPE_ID= "Retail109"; //"Retail";
	public final static String CHANNEL_ID_APP="WAP";
	public final static String WEBSITE= "MAKEUPONWHEELWAP"; //"DIYtestingwap"
	public final static String PAYTM_PAYMENT_URL_WEB = "https://pguat.paytm.com/oltp-web/processTransaction";
	public final static String PAYTM_PAYMENT_URL_APP = "https://securegw.paytm.in/theia/paytmCallback?";
	//public final static String PAYTM_CALLBACK_URL_APP = "https://pguat.paytm.com/paytmchecksum/paytmCallback.jsp";
	//public final static String PAYTM_CALLBACK_URL_APP = "http://110.125.130.239:3333/application-json/android/paytm/server/callback";
	//public final static String PAYTM_CALLBACK_URL_APP = "https://securegw.paytm.in/theia/paytmCallback";
	public final static String PAYTM_CALLBACK_URL_APP = "https://securegw.paytm.in/theia/paytmCallback?ORDER_ID=";
	//public final static String PAYTM_CALLBACK_URL_APP = "https://secure.paytm.in/oltp-web/processTransaction";
	public final static String PAYTM_CALLBACK_URL_APP1 = "https://pguat.paytm.com/oltp/HANDLER_INTERNAL/getTxnStatus?JsonData=";
	public static String errorDisplay="ErrorMessageDisplay";
	public static String productAddedSuccessMessage="Product is Successfully Added";
	public static String userApplication="http://localhost:3333/user";
	public static String sellerApplication="http://localhost:4444/seller";
	public static String productDefaultImage="https://www.krenai.com/assets/img/default-product.png";
	public static int nearestDistance=2;
	public static String india = "India";
	public static String deviceMobile = "Mobile";
	public static String deviceWeb = "Web";
	
	
	public static String imageFolder = "assets" + File.separator + "images" + File.separator;
	
	public static String userNotificationEmail = "email";
	public static String userNotificationMobile = "mobile";
	public static Date getCurrentDate(){
		Date today = new Date();
		//System.out.println("===================today============ " + today);
	       
        //displaying this date on IST timezone
		DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
		DateFormat df1 = new SimpleDateFormat("HH:mm:SS");
		df.setTimeZone(TimeZone.getTimeZone("Asia/Kolkata"));
		df1.setTimeZone(TimeZone.getTimeZone("Asia/Kolkata"));
		String IST = df.format(today);
		String IST1 = df1.format(today);
		String []date = IST.split("-");
		String []time = IST1.split(":");
		
		//System.out.println("=====================Date in Indian Timezone (IST) : " + IST);
		//System.out.println("=====================Date in Indian Timezone (IST) : " + IST1);
        
        Date dd = new Date();
        dd.setDate(Integer.parseInt(date[0]));
        dd.setMonth(Integer.parseInt(date[1])-1);
        //dd.setYear(today.getYear());
        
        dd.setHours(Integer.parseInt(time[0]));
        dd.setMinutes(Integer.parseInt(time[1]));
        dd.setSeconds(Integer.parseInt(time[2]));
        
        //System.out.println("=================new dd====="+ dd);
        
		DateTimeZone zone = DateTimeZone.forID("Asia/Kolkata");
		DateTime dt = new DateTime(zone);
		//System.out.println("----------------------------new date-kolkata--------"+new Date(dt.getMillis()));
		//System.out.println("----------------------------new date---------"+new Date());
//		return new Date(dt.getMillis());
		return dd;
		
	}
	
	public static boolean schedulerBool = true;
	public static boolean schedulerBool1 = true;
	public static Boolean schedulerBoolBday= true;
	public static Boolean schedulerBoolServerStatus = true;
	
	public static String transactionTypeCredit = "CREDIT";
	public static String transactionTypeDebit = "DEBIT";
	public static String rewardPointAtRate = "point_at_rate";
	public static String referRegistrationMode = "refer_registration_reward";
	public static String ratingMode = "rating-reward";
	public static String postFeedMode ="feed-reward";
	
	public static String superAdminMailId = "customizedsoftwaresolutions@gmail.com";
	//public static String superAdminMailId = "smitbaranwal@gmail.com";
	
	public static String status_debutLogin = "DEBUT_LOGIN";
	public static String status_debutLoginWithoutAddress = "debutLoginWithoutAddress";
	public static String blockedByKrenai = "blockedByKrenai";
	public static String loggedOutStatus = "loggedoutstatus";
	public static String activeStatus = "ACTIVE";
	public static String inactiveStatus = "INACTIVE";
	public static String pendingStatus = "pending";
	public static String rejectStatus = "rejected";
	public static String awaitedOtp = "AWAITED_OTP";
	
	
	public static String accessPermission_public = "public";
	public static String feedLiked = "liked";
	public static String feedCommented = "commented";
	public static String feedShared = "shared";
	public static String friendRequest = "friend_request";
	public static String send = "sends";
	public static String responded = "responded";
	public static String friendStatusValue = "friend";
	public static String friendRequestAccepted = "accepted";
	public static String friendRequestRequested = "requested";
	public static String supplierFollowing = "following";
	public static String status_removed = "removed";
	public static String orderOrdered = "ordered";
	public static String ordercancelled = "cancelled";
	public static String orderInprocess = "inprocess";
	public static String orderOutForDelivery = "outForDelivery";
	public static String orderDelivered = "delivered";
	public static String orderReturned = "returned";
	public static String minimumOrder = "150";
	public static String supplierNotInterested = "notIntrested";
	public static String elasticIP = "192.168.0.21";
	public static int statusActive = 1;
	public static int statusInActive = 2;
	public static int statusOrdered = 18;
	public static int statusDelivered = 16;
	public static int statusDebutLogin = 10;
	public static int statusCancelled = 15;
	public static int statusOutForDelivery = 17;
	public static int statusReturned = 14;
	public static int statusInprocess = 13;
	public static int statusInactive = 2;
	
	
	public static String statusIncomplete = "INCOMPLETE";
	public static String usertype_school = "SCHOOL";
	public static String usertype_parent = "PARENT";
	public static String usertype_admin = "ADMIN";
	public static String usertype_school_admin = "SCHOOL_ADMIN";
	public static String usertype_teacher = "TEACHER";
	
	public static String schoolUpdateType_studentDataUpload = "StudentDataUpload";
	public static String schoolUpdateType_studentAttendanceUpload = "StudentAttendanceUpload";
	public static String schoolUpdateType_studentExaminationUpload = "SchoolExaminationScheduleUpload";
	public static String schoolUpdateType_studentTimetableUpload = "SchoolTimeTableUpload";
	public static String schoolUpdateType_studentFeeUpload = "StudentFeeUpload";
	public static String schoolUpdateType_studentYearBalanceUpload = "StudentYearBalanceUpload";
	public static String schoolUpdateType_studentMarksUpload = "StudentMarkSheetUpload";
	public static String schoolUpdateType_teacherRegistration = "TeacherRegistration";
	public static String schoolUpdateType_teacherStatusChange = "teacherStatusChange";
	public static String schoolUpdateType_studentNotificationSend = "StudentNotificationSendSchool";
	public static String teacherUpdateType_studentNotificationSend = "StudentNotificationSendTeacher";
	public static String schoolUpdateType_studentNotificationSchedule = "studentNotificationScheduleSchool";
	public static String teacherUpdateType_studentNotificationSchedule = "studentNotificationScheduleTeacher";
	public static String schoolUpdateType_studentAcademicsUpload = "SchoolAcademicsUpload";
	
	public static String status_order_booked = "BOOKED";
	 public static String status_order_accepted = "ACCEPTED";
	 public static String status_order_rejected = "REJECTED";
	 public static String status_order_cancelled = "CANCELLED";
	 public static String status_order_completed = "COMPLETED";
	 
	 public static String status_payment_unpaid = "UNPAID";
	 public static String status_payment_paid = "PAID";
	 public static String status_payment_partial = "PARTIAL";
	 
	 
	 
	 
	 
	public static String permission_school = "SCHOOL";
	public static String permission_parent = "PARENT";
	//public static String firebaseServerKey = "AAAAuwXXWgU:APA91bG32FZzxiUCCZ3Nufmi8uRQlV5ERHMBCcxEcS2d4Ctguhc6Zcsye-8bC1AC7qZgHWtKZQwScz0t9szoC1ftrtNOMj_iY9S0WKyHf3cQ9p3oBBunbg2WSUoV1eFEkErEGQ4uWPVD";
	public static String firebaseServerKey = "AAAAzLGwU1g:APA91bHG_KvPM4F557_UY-bCDQAt1VIh1ftTS4NiS-FjvE-p1D3jzFeYzvJ4ny1DjCN8lyjh0vEWJhCh39NroDcfPZnDhyAb5RwPJI6HA3g-bqXxWL98k-hY4eu755ieQKojRatyc2dG";
	public static String firebaseServerKey1 = "AAAA4HRtFb4:APA91bH8XhJZ6P8BaEPUpVd39G6WR61zlnV3oPlTMqOjmVtueqQ-O0pZ50g0ZY8WED5jNlO-vuCAWSZTeqqmN4achahY4atiXhDLFDrZsZpZCzjQV_fP8ScPTjozuPhZ27ZASYhvxE31rRJD6zaLyO75sS1JX0lFjA";
	public static String paymentStatusUnpaid = "UNPAID";
	
	
}
