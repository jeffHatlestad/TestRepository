
<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<%@ page import="java.util.*" %>
<%@ page import="com.lvhn.sqlServer.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.lvhn.model.*" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "https://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="icon" type="image/png" href="images/icons/favicon.ico" />

<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">

<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">

<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">

<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>First JSP</title>
</head>
<%@ page import="java.util.Date" %>
<body>
<div class="table100-body js-pscroll">
<%
	String facility = request.getParameter("facility");
	String deptName = request.getParameter("department");
	String report1 =  request.getParameter("reporttype").toString() ;
	String sort =  request.getParameter("sort") ;
	String reportName="";
	
	List<Report> list = new ArrayList<Report>();
	//HttpSession sess = request.getSession(false); //use false to use the existing session
	//sess.getAttribute("username");//this will return username anytime in the session
	//sess.getAttribute("password");//this will return password Any time in the session
	 try {
         list = DBUtils.queryProcess1(facility, deptName,sort);
         
         HttpSession sess1 = request.getSession(false); //use false to use the existing session
         sess1.setAttribute("reportFinal", list);
     
     } catch (SQLException e) {
         e.printStackTrace();
         facility = e.getMessage();
     }
		if (report1.equals("2")){
			reportName="Department Inventory, Medical Equipment";
		}else{
			reportName="Inventory Overdue Report";
		}
	
	%>
    
</td>
<table>
<tr>
<TD colspan=7 style="text-align:center"><font size="5" face=verdana><B><%=reportName%> - <%=facility%>,<%=deptName %></B></font></TD>
</tr>
<tr>
	<TD colspan=7 style='text-align:center;'><font size="2" face=verdana>Does your equipment require a round safety sticker?<Br>No Sticker is required (Old sticker may be removed) if the PM Freq = Sampled, As Needed, or Not Required
</font><Br></TD>
	</tr>

	<tr>
	<TD colspan=7><font size="1" face=verdana></font><Br></TD>
	</tr>
</tr>
	<tr>
	<TD colspan=7 style='text-align:center;'><font size="2" face=verdana>Click on the header of any field (ie. Control Number, etc.) to change the sort order.</font><Br></TD>
	</tr>
	<tr>
	<TD colspan=7><font size="1" face=verdana></font><Br></TD>
	</tr>
	</table>
 
<table cellspacing="2" cellpadding="2">

<tr><th>Control Number</th><th>Name</th><th>Model</th><th>Serial Number</th><th>Overdue</th><th>Device Category</th></tr>
<%
// Iterating through subjectList
 
//if(request.getAttribute("reportFinal") != null)  // Null check for the object
//{
 Iterator<Report> iterator = list.iterator();  // Iterator interface
 
 while(iterator.hasNext())  // iterate through all the data until the last record
 {
 Report repDetails = iterator.next(); //assign individual employee record to the employee class object
 %>
 <tr>
 
 <td><%=repDetails.controlNumber%></td>
 <td><%=repDetails.name%></td>
 <td><%=repDetails.model%></td>
 <td><%=repDetails.serial%></td>
 <td><%=repDetails.overDue%></td>
 <td><%=repDetails.deviceCategory%></td>
 
 
 </tr>
 <%
// }
}
%>
</table>
</div>

<table border=0>

	<tr>
	<TD colspan=7 style='text-align:center;'><font size="2" face=verdana><a href="main.jsp">Click here to return to try another search.</a></font></TD>
	</tr>

</table>
<script src="vendor/jquery/jquery-3.2.1.min.js" type="9af3670b2e6f1f4f52948db4-text/javascript"></script>

<script src="vendor/bootstrap/js/popper.js" type="9af3670b2e6f1f4f52948db4-text/javascript"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js" type="9af3670b2e6f1f4f52948db4-text/javascript"></script>

<script src="vendor/select2/select2.min.js" type="9af3670b2e6f1f4f52948db4-text/javascript"></script>

<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js" type="9af3670b2e6f1f4f52948db4-text/javascript"></script>
<script type="9af3670b2e6f1f4f52948db4-text/javascript">
		$('.js-pscroll').each(function(){
			var ps = new PerfectScrollbar(this);

			$(window).on('resize', function(){
				ps.update();
			})
		});


	</script>

<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13" type="9af3670b2e6f1f4f52948db4-text/javascript"></script>
<script type="9af3670b2e6f1f4f52948db4-text/javascript">
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-23581568-13');
</script>

<script src="js/main.js" type="9af3670b2e6f1f4f52948db4-text/javascript"></script>
<script src="https://ajax.cloudflare.com/cdn-cgi/scripts/7089c43e/cloudflare-static/rocket-loader.min.js" data-cf-settings="9af3670b2e6f1f4f52948db4-|49" defer=""></script>
</body>
</html>
