package com.condosolutions.beans;

public class Location {
	
	private int ID;
	private String locationName;
	private String locationAddress;
	private String creationDate;
	private String updationDate;
	private String isSupervisor;
	
	public Location() {
		super();
	}

	public Location(int iD, String locationName, String locationAddress, String creationDate, String updationDate,
			String isSupervisor) {
		super();
		ID = iD;
		this.locationName = locationName;
		this.locationAddress = locationAddress;
		this.creationDate = creationDate;
		this.updationDate = updationDate;
		this.isSupervisor = isSupervisor;
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public String getLocationName() {
		return locationName;
	}

	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}

	public String getLocationAddress() {
		return locationAddress;
	}

	public void setLocationAddress(String locationAddress) {
		this.locationAddress = locationAddress;
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

	public String getIsSupervisor() {
		return isSupervisor;
	}

	public void setIsSupervisor(String isSupervisor) {
		this.isSupervisor = isSupervisor;
	}
	
	
	
}
