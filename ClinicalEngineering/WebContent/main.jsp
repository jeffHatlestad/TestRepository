<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="com.lvhn.sqlServer.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">



<link rel="stylesheet" type="text/css" href="css/main.css">
<%HttpSession sess1 = request.getSession();  %>
<style>
.button {
  background-color: ##555555; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}

.resizedTextbox {width: 100px; height: 30px}
.resizedsubmit {width: 100px; height: 40px}
.select-css {
	display: block;
	font-size: 12px;
	font-family: sans-serif;
	font-weight: 600;
	color: #444;
	line-height: 1.3;
	padding: .6em 1.4em .5em .8em;
	width: 30%;
	max-width: 30%;
	box-sizing: border-box;
	margin: 0;
	border: 1px solid #aaa;
	box-shadow: 0 1px 0 1px rgba(0,0,0,.04);
	border-radius: .5em;
	-moz-appearance: none;
	-webkit-appearance: none;
	appearance: none;
	background-color: #fff;
	background-image: url('data:image/svg+xml;charset=US-ASCII,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%22292.4%22%20height%3D%22292.4%22%3E%3Cpath%20fill%3D%22%23007CB2%22%20d%3D%22M287%2069.4a17.6%2017.6%200%200%200-13-5.4H18.4c-5%200-9.3%201.8-12.9%205.4A17.6%2017.6%200%200%200%200%2082.2c0%205%201.8%209.3%205.4%2012.9l128%20127.9c3.6%203.6%207.8%205.4%2012.8%205.4s9.2-1.8%2012.8-5.4L287%2095c3.5-3.5%205.4-7.8%205.4-12.8%200-5-1.9-9.2-5.5-12.8z%22%2F%3E%3C%2Fsvg%3E'),
	  linear-gradient(to bottom, #ffffff 0%,#e5e5e5 100%);
	background-repeat: no-repeat, repeat;
	background-position: right .7em top 50%, 0 0;
	background-size: .65em auto, 100%;
}
.select-css::-ms-expand {
	display: none;
}
.select-css:hover {
	border-color: #888;
}
.select-css:focus {
	border-color: #aaa;
	box-shadow: 0 0 1px 3px rgba(59, 153, 252, .7);
	box-shadow: 0 0 0 3px -moz-mac-focusring;
	color: #222;
	outline: none;
}
.select-css option {
	font-weight:normal;
}
.select2-css {
	display: block;
	font-size: 12px;
	font-family: sans-serif;
	font-weight: 600;
	color: #444;
	line-height: 1.3;
	padding: .6em 1.4em .5em .8em;
	width: 10%;
	max-width: 10%;
	box-sizing: border-box;
	margin: 0;
	border: 1px solid #aaa;
	box-shadow: 0 1px 0 1px rgba(0,0,0,.04);
	border-radius: .5em;
	-moz-appearance: none;
	-webkit-appearance: none;
	appearance: none;
	background-color: #fff;
	background-image: url('data:image/svg+xml;charset=US-ASCII,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%22292.4%22%20height%3D%22292.4%22%3E%3Cpath%20fill%3D%22%23007CB2%22%20d%3D%22M287%2069.4a17.6%2017.6%200%200%200-13-5.4H18.4c-5%200-9.3%201.8-12.9%205.4A17.6%2017.6%200%200%200%200%2082.2c0%205%201.8%209.3%205.4%2012.9l128%20127.9c3.6%203.6%207.8%205.4%2012.8%205.4s9.2-1.8%2012.8-5.4L287%2095c3.5-3.5%205.4-7.8%205.4-12.8%200-5-1.9-9.2-5.5-12.8z%22%2F%3E%3C%2Fsvg%3E'),
	  linear-gradient(to bottom, #ffffff 0%,#e5e5e5 100%);
	background-repeat: no-repeat, repeat;
	background-position: right .7em top 50%, 0 0;
	background-size: .65em auto, 100%;
}
.button {background-color: #555555;}
 p {
  font-size: 12px;
}
</style>
<script type="text/javascript">

var xmlhttp;

	
 function showDepartname(facility){
	
	
	if (window.XMLHttpRequest)
	{// code for IE7+, Firefox, Chrome, Opera, Safari
		
	xmlhttp=new XMLHttpRequest();
	}
	else
	{// code for IE6, IE5
		
	xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	var url="deptName.jsp";
	
	
    url +="?count=" +facility;
  
    
    xmlhttp.onreadystatechange = function() {
    	
    	document.getElementById("deptName").innerHTML=xmlhttp.responseText; 
    	var result = xmlhttp.responseText;

    
  }
    

    xmlhttp.open("GET", url, true);
    
    xmlhttp.send();
    
   
   
      
	}
 
 
 	function deptInventory(facility, department, reporttype, sort){ 

 		if(reporttype=="2"){
 			window.location="results1.jsp?facility="+facility + "&department="
 		 		+ department + "&reporttype="+  reporttype + "&sort="+  sort;
 		}else{
 				window.location="results3.jsp?facility="+facility + "&department="
 	 		 	+ department + "&reporttype="+  reporttype + "&sort="+  sort;
 		}
 		
 		
 			
 	}
 	function controlNumberQuery(controlNumber, sort){ 

 		window.location="results2.jsp?controlNumber="+controlNumber + "&sort="+  sort;
 			
 		
 		
 			
 	}

</script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Drop Downlist</title>
</head>
<body>
<div class="table100-body js-pscroll">
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:sqlserver://" + "lsnr_websql" + ":1433" + ";instance=" + "lsnr_websql";%>
<%!String user = "webadm1n";%>
<%!String psw = "L2vh0W0eb5";%>



<table border=0 style="width:100%">
<tr>

<TD colspan=2><font size="4" face=verdana><B>Clinical Engineering Site</B></font></TD>
<td><img src="LVHN_logo.png" alt="" style="width:200px; height:auto;" align="right"></td>

</tr>
<tr>
<TD colspan=2><font size="2" face=verdana>Choose a department name and facility below to run an inventory report for the specified location.</font></TD>
</tr>
<tr>
<TD bgcolor="#c0c0c0" valign="top" align="left"  width="5%"><font size="2" face=verdana color="#000000">Select Location</font></TD>
<form action="results1.jsp" method="post">
<TD valign="top" align="left" bgcolor="#eeeeee" width="50%"><font size="1" face=verdana color="#000000">

<%

Connection con = null;
PreparedStatement ps = null;
try
{
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
con = DriverManager.getConnection(url,user,psw);
String sql = "Select DISTINCT FACILITY from ClinicalEngApp.dbo.[PM Flatfile web] order by FACILITY ASC";
ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery(); 
 

%>
<p>Select Name :</p>
&nbsp;&nbsp;
&nbsp;&nbsp;
&nbsp;&nbsp;
<select name="facility" id="facility" onchange="showDepartname(this.value)" class="select-css">
<option  value=''>Select Facility</option>
<%
while(rs.next())
{
String fname = rs.getString(1); 
sess1.setAttribute("facilityName", fname );
%>

<option value="<%=fname %>"><%=fname %></option>
<%
}
%>
<%
}
catch(SQLException sqe)
{ 
out.println(sqe);
}
%>
</select>
&nbsp;&nbsp;
&nbsp;&nbsp;
&nbsp;&nbsp;
&nbsp;&nbsp; 
&nbsp;&nbsp;
&nbsp;&nbsp;
&nbsp;&nbsp;
&nbsp;&nbsp;
&nbsp;&nbsp;
&nbsp;&nbsp;
&nbsp;&nbsp;
<select name='deptName' id='deptName' class="select-css">  
<option  value=''>Select Department</option>
       
 </select> 





</form>

&nbsp;&nbsp;
<p>Report Type:</p>&nbsp;&nbsp;
<select name="reporttype", id="reporttype" class="select-css">
<option value='2'>Department Inventory, Medical Equipment</option>
<option value='1'>Inventory Overdue Report</option>
</select>

&nbsp;&nbsp;<p>Sort By:</p>&nbsp;&nbsp;
<select name="sortby" id="sortby" class="select-css">
<option value='1'>Control Number</option>
<option value='2'>Name</option>
<option value='3'>Model</option>
<option value='4'>Serial Number</option>
<option value='5'>Overdue</option>
<option value='6'>PM Freq</option>
<option value='7'>Device Category</option>
</select>

</font></TD>

</tr>





<tr>
<TD colspan="2" valign="top" align="left"><input type="submit" value="Run Report" bgcolor="#c0c0c0" class="button" class="resizedsubmit" onclick="deptInventory(document.getElementById('facility').value, document.getElementById('deptName').value, document.getElementById('reporttype').value,document.getElementById('sortby').value)"></TD>
</tr>																																			

<tr>
<TD colspan=2><font size="2" face=verdana>To search for a specific control number, type in the control number to verify a single unit.</font></TD>
</tr>
<tr>
<TD bgcolor="#c0c0c0" valign="top" align="left"><font size="2" face=verdana color="#000000">Control Number</font></TD>

<TD valign="middle" align="left" bgcolor="#eeeeee" ><font size="3" face=verdana color="#000000"><input type="text" size="25" id="controlNumber" name="controlNumber" class="resizedTextbox" ></font></TD>
</tr>
<tr>
<TD colspan="2" valign="top" align="left"><input type="submit" value="Query Control Num" bgcolor="#c0c0c0" class="button" class="resizedsubmit" onclick="controlNumberQuery(document.getElementById('controlNumber').value, document.getElementById('sortby').value)"></TD>
</tr>


</table>



<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13" type="9af3670b2e6f1f4f52948db4-text/javascript"></script>
<script type="9af3670b2e6f1f4f52948db4-text/javascript">
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-23581568-13');
</script>

<script src="js/main.js" type="9af3670b2e6f1f4f52948db4-text/javascript"></script>
<script src="https://ajax.cloudflare.com/cdn-cgi/scripts/7089c43e/cloudflare-static/rocket-loader.min.js" data-cf-settings="9af3670b2e6f1f4f52948db4-|49" defer=""></script>
</div>
</body>
</html>