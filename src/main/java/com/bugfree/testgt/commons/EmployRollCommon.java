package com.bugfree.testgt.commons;

import java.util.Date;

import org.joda.time.DateTime;
import org.joda.time.DateTimeZone;

public class EmployRollCommon {
	public static final String SUPERADMIN_TECH_SUPP="SUPERADMIN_TECH_SUPP";
	public static final String COMPANY_ADMIN_ROLE = "COMPANY_ADMIN";
	public static final String RO_EMP_ADD_ROLE = "RO_EMP_ADD";
	public static final String RO_EMP_DETAILS_EDIT_ROLE = "RO_EMP_DETAILS_EDIT";
	public static final String RO_EMP_DETAILS_VIEW_ROLE = "RO_EMP_DETAILS_VIEW";
	public static final String COMPANY_RO_ROLE = "COMPANY_RO";
	public static final String RO_ATT_VIEW_ROLE = "RO_ATT_VIEW";
	public static final String ERROR_MESSAGE = "Something went wrong.";
	public static final String SCHOOL_ADMIN_ROLE = "SCHOOL_ADMIN";
	public static final String PARENT_ROLE = "PARENT";
	public static final String TEACHER_ROLE = "TEACHER";
	
	public static String statusActive = "ACTIVE";
	public static String s3Bucket = "employroll.com";
	public static String s3UrlPrefix = "https://s3.ap-south-1.amazonaws.com/employroll.com/";
	
	public static String statusInActive = "INACTIVE";
	
	public static String newRegistration_PENDING = "PENDING";
	public static String newRegistration_PAYMENT_NOT_CONFIRMED = "PAYMENT_NOT_CONFIRMED";
	public static String newRegistration_HOLD = "HOLD";
	public static String newRegistration_APPROVED = "APPROVED";
	public static String defaultBranchType = "Head Office";

	
	public static Date getCurrentDate() {
		DateTimeZone zone = DateTimeZone.forID("Asia/Kolkata");
		DateTime dt = new DateTime(zone);
		Date date = new Date(dt.getMillis());
		return date;
	}
	
	/*
	 * Device And Sim Details Status
	 */
	/*
	 * installed status is when the paired one is installed at client location,
	 * available shows availability in inventory, 
	 * requested means the device is occupied at new registration
	 * multi_org is for availability of device for multiple location
	 * 
	 */
	public static String deviceAndSim_Installed = "INSTALLED";
	public static String deviceAndSim_Available = "AVAILABLE";
	public static String deviceAndSim_Requested = "REQUESTED";
	public static String deviceAndSim_AvailableMultiLoc = "AVAILABLE_MULTI_LOC";

	
	/*
	 * device details
	 * sim details status
	 */
	public static String DeviceDetails_Unpaired = "UNPAIRED";
	public static String DeviceDetails_Paired = "PAIRED";
	
	
	/*
	 * Organisation Device Status
	 */
	public static String organisationDeviceSt_ACTIVE = "ACTIVE";
	
	
	/*
	 * user account status
	 */
	public static String userAccountStatus_ACTIVE = "ACTIVE";
	public static String userAccountStatus_AwaitedFirstLogin = "AWAITED_FIRST_LOGIN";
	
	
	/*
	 * device payment mode
	 */
	public static String devicePaymentMode_Onetime = "ONETIME";
	public static String devicePaymentMode_Installment = "INSTALLMENT";
	
	/*
	 * Organisation shift status 
	 */
	public static String organisationShift_active = "ACTIVE";
	public static String organisationShift_inactive = "INACTIVE";
	
	/*
	 * Employee Shift Status
	 */
	public static String employeeShift_active = "ACTIVE";
	public static String employeeShift_inactive = "INACTIVE";

	
	/*
	 * dynamic role according to service type and device type
	 */
	public static String att_withbio = "ATT_BIO";
	public static String att_pay_withbio = "ATT_PAY_BIO";
	public static String att_withmob = "ATT_MOB";
	public static String att_pay_withmob = "ATT_PAY_MOB";
	public static String att_track_withmob = "ATT_TRACK_MOB";
	public static String att_track_pay_withmob = "ATT_TRACK_PAY_MOB";
	
	
	/*
	 * employee Device status
	 */
	public static String empDevice_ACTIVE = "ACTIVE";
	public static String empMobDevice_ACTIVE = "MOBACTIVE";
	public static String empDevice_INACTIVE = "INACTIVE";
	
	
	
	/*
	 * attendance modes
	 */
	public static String att_mode_Biometric = "BIOMETRIC";
	public static long devicePunchtimeIgnore = 10000;
	
	/*
	 * employee RO status
	 */
	public static String employeeRO_ACTIVE = "ACTIVE";
	public static String employeeRO_INACTIVE = "INACTIVE";
	
	/*
	 * organisation departments
	 */
	public static String[] Departments = {"FINANCE AND ACCOUNTS", "HUMAN RESOURCE", "SALES AND MARKETING",
			"PRODUCTION / OPERATIONS", "LOGISTICS", "ADMINISTRATION", "HOUSE KEEPING", "SECURITY"};
	
	/*
	 * organisation departments status
	 */
	public static String orgDept_ACTIVE = "ACTIVE";
	public static String orgDept_INACTIVE = "INACTIVE";
	
	
	/*
	 * user type 
	 */
	public static String user_type_ORGANISATION_ADMIN = "ORGANISATION_ADMIN";
	public static String user_type_COMPANY_EMPLOYEE = "COMPANY_EMPLOYEE";
	public static String emp_status_active = "ACTIVE";
	public static String restACTIVE_status = "ACTIVE";
	
	
	public static String grade_ACTIVE ="ACTIVE";
	public static String grade_INACTIVE="INACTIVE";
	
}
