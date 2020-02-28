package com.lvhn.sqlServer;

import java.sql.*;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import com.lvhn.model.Report;

public class DBUtils {
	public static List<String> queryDeptName(String facility) throws SQLException {
		
		
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:sqlserver://" + "lsnr_websql" + ":1433" + ";instance=" + "lsnr_websql";
		String user = "webadm1n";
		String psw = "L2vh0W0eb5";
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			con = DriverManager.getConnection(url,user,psw);
        
			String sql = "Select DISTINCT DEPTNAME from ClinicalEngApp.dbo.[PM Flatfile web] WHERE FACILITY='Bangor Health Center'";
 
        PreparedStatement pstm = con.prepareStatement(sql);
 
        ResultSet rs = pstm.executeQuery();
        List<String> list = new ArrayList<String>();
        while (rs.next()) {
            String code = rs.getString(1);
           
            list.add(code);
        }
        return list;
    }catch (SQLException | ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		return null;
}
public static List<Report> queryProcess1(String facility, String deptName, String sort) throws SQLException {
		
		
		
		 
		  
		   
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:sqlserver://" + "lsnr_websql" + ":1433" + ";instance=" + "lsnr_websql";
		String user = "webadm1n";
		String psw = "L2vh0W0eb5";
		Connection con = null;
		PreparedStatement ps = null;
		String sortOrder = "";
		switch (sort) {
		  case "1":
			  sortOrder = " ORDER BY [CONTROL]";
		    break;
		  case "2":
			  sortOrder = " ORDER BY [NAME]";
		    break;
		  case "3":
			  sortOrder = " ORDER BY [MODEL]";
		    break;
		  case "4":
			  sortOrder = " ORDER BY [SERIAL]";
		    break;
		  case "5":
			  sortOrder = " ORDER BY [OVERDUE]";
		    break;
		  case "6":
			  sortOrder = " ORDER BY [PM FREQ]";
			break;
		  case "7":
			  sortOrder = " ORDER BY [DEVICECATEGORY]";
		    break;

		}

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			con = DriverManager.getConnection(url,user,psw);
        
			String sql = "Select * from ClinicalEngApp.dbo.[PM Flatfile web] WHERE FACILITY=? and DEPTNAME=? " + sortOrder;
 
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setString(1, facility);	
        pstm.setString(2, deptName);
        ResultSet rs = pstm.executeQuery();
        List<Report> list = new ArrayList<Report>();
        while (rs.next()) {
        	Report report = new Report();
            report.setControlNumber(rs.getString(1));
            report.setName(rs.getString(2));
            report.setModel(rs.getString(3));
            report.setSerial(rs.getString(4));
            report.setDeviceCategory(rs.getString(5));
            report.setFacility(rs.getString(6));
            report.setDeptName(rs.getString(7));
            report.setPMFrequency(rs.getString(8));
            report.setOverDue(rs.getString(9));
            list.add(report);
        }
        return list;
    }catch (SQLException | ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		
		return null;
}
public static List<Report> queryProcess2(String controlNumber, String sort) throws SQLException {
	
	
	
	 
	  
	   
	String driverName = "com.mysql.jdbc.Driver";
	String url = "jdbc:sqlserver://" + "lsnr_websql" + ":1433" + ";instance=" + "lsnr_websql";
	String user = "webadm1n";
	String psw = "L2vh0W0eb5";
	Connection con = null;
	PreparedStatement ps = null;
	String sortOrder = "";
	switch (sort) {
	  case "1":
		  sortOrder = " ORDER BY [CONTROL]";
	    break;
	  case "2":
		  sortOrder = " ORDER BY [NAME]";
	    break;
	  case "3":
		  sortOrder = " ORDER BY [MODEL]";
	    break;
	  case "4":
		  sortOrder = " ORDER BY [SERIAL]";
	    break;
	  case "5":
		  sortOrder = " ORDER BY [OVERDUE]";
	    break;
	  case "6":
		  sortOrder = " ORDER BY [PM FREQ]";
		break;
	  case "7":
		  sortOrder = " ORDER BY [DEVICECATEGORY]";
	    break;

	}

	try {
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		con = DriverManager.getConnection(url,user,psw);
    
		String sql = "Select * from ClinicalEngApp.dbo.[PM Flatfile web] WHERE CONTROL=? " + sortOrder;

    PreparedStatement pstm = con.prepareStatement(sql);
    pstm.setString(1, controlNumber);	
    
    ResultSet rs = pstm.executeQuery();
    List<Report> list = new ArrayList<Report>();
    while (rs.next()) {
    	Report report = new Report();
        report.setControlNumber(rs.getString(1));
        report.setName(rs.getString(2));
        report.setModel(rs.getString(3));
        report.setSerial(rs.getString(4));
        report.setDeviceCategory(rs.getString(5));
        report.setFacility(rs.getString(6));
        report.setDeptName(rs.getString(7));
        report.setPMFrequency(rs.getString(8));
        report.setOverDue(rs.getString(9));
        list.add(report);
    }
    return list;
}catch (SQLException | ClassNotFoundException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
	
	return null;
}
}
