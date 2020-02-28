package com.lvhn.model;

public class Report {
	public String controlNumber;
    public String name;
    public String model;
    public String serial;
    public String deviceCategory;
    public String facility;
    public String pmFreq;
    public String deptName;
    public String overDue;
    
 // one constructor
    public Report() {
       
    	  this.controlNumber = "";
          this.name = "";
          this.model = "";
          this.serial = "";
          this.deviceCategory = "";
          this.facility = "";
          this.pmFreq = "";
          this.deptName = "";
          this.overDue= "";
    }
        
    // the Bicycle class has
    // four methods
    public void setControlNumber(String newValue) {
        controlNumber = newValue;
    }
        
    public void setName(String newValue) {
        name = newValue;
    }
    public void setModel(String newValue) {
        model = newValue;
    }
        
    public void setSerial(String newValue) {
        serial = newValue;
    }
    public void setDeviceCategory(String newValue) {
        deviceCategory = newValue;
    }
        
    public void setFacility(String newValue) {
        facility = newValue;
    }
    public void setPMFrequency(String newValue) {
        pmFreq = newValue;
    }
        
    public void setDeptName(String newValue) {
        deptName = newValue;
    }
    public void setOverDue(String newValue) {
        overDue = newValue;
    }



}
