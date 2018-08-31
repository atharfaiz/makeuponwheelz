package com.bugfree.testgt.commons;

import java.util.Calendar;
import java.util.Date;

public class DateRangeSplitter {

	private Date startDate;
	private Date endDate;
	
	
	public Date getStartDate() {
		return startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	
	public DateRangeSplitter(int month, int year){
		Date sDate = new Date();
		Date eDate = new Date();
		try{
			sDate.setDate(1);
			sDate.setMonth(month);
			sDate.setYear(year);
			sDate.setHours(0);
			sDate.setMinutes(0);
			sDate.setSeconds(0);
			
			Calendar cal = Calendar.getInstance();
			cal.setTime(sDate);
			
			eDate.setDate(cal.getMaximum(Calendar.DAY_OF_MONTH));
			eDate.setMonth(month);
			eDate.setYear(year);
			eDate.setHours(0);
			eDate.setMinutes(0);
			eDate.setSeconds(0);
			
			System.out.println("========sDate======"+sDate);
			System.out.println("=======eDate======="+eDate);
			
			this.startDate = sDate;
			this.endDate = eDate;
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public DateRangeSplitter(String dateRange){
		Date startDate = new Date();
		Date endDate = new Date();
		startDate.setDate(1);
		
		try{
			int startMonth = Integer.parseInt(dateRange.split("-")[0].trim().split("/", 2)[0])-1;
			int startYear = Integer.parseInt(dateRange.split("-")[0].trim().split("/", 2)[1])-1900;
			int endMonth = Integer.parseInt(dateRange.split("-")[1].trim().split("/", 2)[0])-1;
			int endYear = Integer.parseInt(dateRange.split("-")[1].trim().split("/", 2)[1])-1900;
			startDate.setDate(1);
			startDate.setMonth(startMonth);
			startDate.setYear(startYear);
			startDate.setHours(0);
			startDate.setMinutes(0);
			startDate.setSeconds(0);
			endDate.setMonth(endMonth);
			endDate.setYear(endYear);
			
			endDate.setHours(0);
			endDate.setMinutes(0);
			endDate.setSeconds(0);
			
			Calendar c = Calendar.getInstance();
			c.setTime(endDate);
			
			endDate.setDate(c.getActualMaximum(Calendar.DAY_OF_MONTH));
			
			System.out.println("===========startMonth============"+startMonth);
			System.out.println("===========startYear============"+startYear);
			System.out.println("===========endMonth============"+endMonth);
			System.out.println("===========endYear============"+endYear);
			this.startDate = startDate;
			this.endDate = endDate;
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
