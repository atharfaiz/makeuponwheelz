package com.bugfree.testgt.model.profile;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Working {

	@Id
	@GeneratedValue
	private int workingId;
	
	private String day;
	
	private int dayInt;
	private String openingTime;
	private String closingTime;
	private boolean open;
	public int getWorkingId() {
		return workingId;
	}
	public void setWorkingId(int workingId) {
		this.workingId = workingId;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public int getDayInt() {
		return dayInt;
	}
	public void setDayInt(int dayInt) {
		this.dayInt = dayInt;
	}
	public String getOpeningTime() {
		return openingTime;
	}
	public void setOpeningTime(String openingTime) {
		this.openingTime = openingTime;
	}
	public String getClosingTime() {
		return closingTime;
	}
	public void setClosingTime(String closingTime) {
		this.closingTime = closingTime;
	}
	public boolean isOpen() {
		return open;
	}
	public void setOpen(boolean open) {
		this.open = open;
	}
	
	
	
}
