package com.condosolutions.beans;

public class ShiftLog {
	private int ID;
	private String startTime;
	private String endTime;
	private String relieved;
	private String relievedBy;
	private String equipments;
	private String creationDate;
	private String updationDate;
	private String logText;
	private String shiftLogFor;//Add User Id primary key here as foreign key 
	
	public ShiftLog(int iD, String startTime, String endTime, String relieved, String relievedBy, String equipments,
			String creationDate, String updationDate, String logText, String shiftLogFor) {
		super();
		ID = iD;
		this.startTime = startTime;
		this.endTime = endTime;
		this.relieved = relieved;
		this.relievedBy = relievedBy;
		this.equipments = equipments;
		this.creationDate = creationDate;
		this.updationDate = updationDate;
		this.logText = logText;
		this.shiftLogFor = shiftLogFor;
	}

	
	public ShiftLog() {
		super();
	}


	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getRelieved() {
		return relieved;
	}

	public void setRelieved(String relieved) {
		this.relieved = relieved;
	}

	public String getRelievedBy() {
		return relievedBy;
	}

	public void setRelievedBy(String relievedBy) {
		this.relievedBy = relievedBy;
	}

	public String getEquipments() {
		return equipments;
	}

	public void setEquipments(String equipments) {
		this.equipments = equipments;
	}

	public String getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(String creationDate) {
		this.creationDate = creationDate;
	}

	public String getUpdationDate() {
		return updationDate;
	}

	public void setUpdationDate(String updationDate) {
		this.updationDate = updationDate;
	}

	public String getLogText() {
		return logText;
	}

	public void setLogText(String logText) {
		this.logText = logText;
	}

	public String getShiftLogFor() {
		return shiftLogFor;
	}

	public void setShiftLogFor(String shiftLogFor) {
		this.shiftLogFor = shiftLogFor;
	}
	
}
