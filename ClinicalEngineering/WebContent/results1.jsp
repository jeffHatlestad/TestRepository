
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
<script type="text/javascript">
function sortTable(n) {
	  var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
	  table = document.getElementById("myTable");
	  switching = true;
	  //Set the sorting direction to ascending:
	  dir = "asc"; 
	  /*Make a loop that will continue until
	  no switching has been done:*/
	  while (switching) {
	    //start by saying: no switching is done:
	    switching = false;
	    rows = table.rows;
	    /*Loop through all table rows (except the
	    first, which contains table headers):*/
	    for (i = 1; i < (rows.length - 1); i++) {
	      //start by saying there should be no switching:
	      shouldSwitch = false;
	      /*Get the two elements you want to compare,
	      one from current row and one from the next:*/
	      x = rows[i].getElementsByTagName("TD")[n];
	      y = rows[i + 1].getElementsByTagName("TD")[n];
	      /*check if the two rows should switch place,
	      based on the direction, asc or desc:*/
	      if (dir == "asc") {
	        if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
	          //if so, mark as a switch and break the loop:
	          shouldSwitch= true;
	          break;
	        }
	      } else if (dir == "desc") {
	        if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
	          //if so, mark as a switch and break the loop:
	          shouldSwitch = true;
	          break;
	        }
	      }
	    }
	    if (shouldSwitch) {
	      /*If a switch has been marked, make the switch
	      and mark that a switch has been done:*/
	      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
	      switching = true;
	      //Each time a switch is done, increase this count by 1:
	      switchcount ++;      
	    } else {
	      /*If no switching has been done AND the direction is "asc",
	      set the direction to "desc" and run the while loop again.*/
	      if (switchcount == 0 && dir == "asc") {
	        dir = "desc";
	        switching = true;
	      }
	    }
	  }
	}
</script>
<style>
table {
  border-spacing: 0;
  width: 100%;
  border: 1px solid #ddd;
}

th {
  cursor: pointer;
}

th, td {
  text-align: left;
  padding: 16px;
}

tr:nth-child(even) {
  background-color: #f2f2f2
}
</style>
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

<tr><th onclick="sortTable(0)">Control Number </th><th onclick="sortTable(1)">Name</th><th onclick="sortTable(2)">Model</th><th onclick="sortTable(3)">Serial Number</th><th onclick="sortTable(4)">PM Freq</th><th onclick="sortTable(5)">Device Category</th></tr>
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
 <td><%=repDetails.pmFreq%></td>
 <td><%=repDetails.deviceCategory%></td>
 
 
 </tr>
 <%
// }
}
%>
</table>
</div>
<%

if(report1.equals("2")) {

%>

<%--<table border=0>
<tr>
	<tr>
	<TD colspan=7 align="center"><font size="2" face=verdana><a href="process1p.asp?facility2=<%=server.urlencode(TempFac)%>&deptname2=<%=server.urlencode(TempDept)%>&sortby=<%=server.urlencode(TempSortBy)%>&reporttype=<%=server.urlencode(TempReport)%>" target="_new">Click here to see a view a printable version.</a></font></TD>
	</tr>

<TD colspan=7><font size="4" face=verdana><B><%=ReportName%> - <% if TempDept<>"(None)" THEN response.write TempDept ELSE response.write "All Depts"%>, <% if TempFac<>"(None)" THEN response.write TempFac ELSE response.write "All Facilities"%></B></font></TD>

</tr>
	<tr>
	<TD colspan=7><font size="1" face=verdana></font><Br></TD>
	</tr>
<%IF TRIM(TempReport)<>"1" THEN%>
	<tr>
	<TD colspan=7><font size="1" face=verdana>Does your equipment require a round safety sticker?<Br>No Sticker is required (Old sticker may be removed) if the PM Freq = Sampled, As Needed, or Not Required
</font><Br></TD>
	</tr>
<%END IF%>
	<tr>
	<TD colspan=7><font size="1" face=verdana></font><Br></TD>
	</tr>
</tr>
	<tr>
	<TD colspan=7><font size="0" face=verdana>Click on the header of any field (ie. Control Number, etc.) to change the sort order.</font><Br></TD>
	</tr>
	<tr>
	<TD colspan=7><font size="1" face=verdana></font><Br></TD>
	</tr>

<tr>
<td bgcolor="#c0c0c0" valign="bottom" width="10%"><font size="1" face=verdana><a href="process1.asp?facility2=<%=server.urlencode(TempFac)%>&deptname2=<%=server.urlencode(TempDept)%>&sortby=1&reporttype=<%=server.urlencode(TempReport)%>">Control<Br>Number</font></a></td>
<td bgcolor="#c0c0c0" valign="bottom" width="27%"><font size="1" face=verdana><a href="process1.asp?facility2=<%=server.urlencode(TempFac)%>&deptname2=<%=server.urlencode(TempDept)%>&sortby=2&reporttype=<%=server.urlencode(TempReport)%>">Name</font></a></td>
<td bgcolor="#c0c0c0" valign="bottom" width="15%"><font size="1" face=verdana><a href="process1.asp?facility2=<%=server.urlencode(TempFac)%>&deptname2=<%=server.urlencode(TempDept)%>&sortby=3&reporttype=<%=server.urlencode(TempReport)%>">Model</a></font></td>
<td bgcolor="#c0c0c0" valign="bottom" width="15%"><font size="1" face=verdana><a href="process1.asp?facility2=<%=server.urlencode(TempFac)%>&deptname2=<%=server.urlencode(TempDept)%>&sortby=4&reporttype=<%=server.urlencode(TempReport)%>">Serial<Br>Number</a></font></td>
<%IF TRIM(TempReport)="1" THEN%>
   <td bgcolor="#c0c0c0" valign="bottom" width="18%"><font size="1" face=verdana><a href="process1.asp?facility2=<%=server.urlencode(TempFac)%>&deptname2=<%=server.urlencode(TempDept)%>&sortby=5&reporttype=<%=server.urlencode(TempReport)%>">Overdue</a></font></td>
<%ELSE%>
<td bgcolor="#c0c0c0" valign="bottom" width="18%"><font size="1" face=verdana><a href="process1.asp?facility2=<%=server.urlencode(TempFac)%>&deptname2=<%=server.urlencode(TempDept)%>&sortby=6&reporttype=<%=server.urlencode(TempReport)%>">PM Freq</a></font></td>
<%END IF%>
<td bgcolor="#c0c0c0" valign="bottom" width="26%"><font size="1" face=verdana><a href="process1.asp?facility2=<%=server.urlencode(TempFac)%>&deptname2=<%=server.urlencode(TempDept)%>&sortby=7&reporttype=<%=server.urlencode(TempReport)%>">Device<Br>Category</a></font></td>
</tr>



<%END IF%> --%>
<table>
	<tr>
	<TD colspan=7 style='text-align:center;'><font size="1" face=verdana>You may have other equipment in your area that is not permanently assigned to you, for example:</font><Br></TD>
	</tr>
	<tr>
	<TD colspan=2 style='text-align:center;'><font size="1" face=verdana></font><Br></TD>
	<TD colspan=2 style='text-align:center;'><font size="1" face=verdana>Device Category</font><Br></TD>
	<TD colspan=1 style='text-align:center;'><font size="1" face=verdana>PM Freq</font><Br></TD>
	<TD colspan=2 style='text-align:center;'><font size="1" face=verdana></font><Br></TD>
	</tr>
	<tr>
	<TD colspan=2 style='text-align:center;'><font size="1" face=verdana></font><Br></TD>
	<TD colspan=2 style='text-align:center;'><font size="1" face=verdana>ALARM, BED OCCUPANCY</font><Br></TD>
	<TD colspan=1 style='text-align:center;'><font size="1" face=verdana>Sampled</font><Br></TD>
	<TD colspan=2 style='text-align:center;'><font size="1" face=verdana></font><Br></TD>
	</tr>
	<tr>
	<TD colspan=2 style='text-align:center;'><font size="1" face=verdana></font><Br></TD>
	<TD colspan=2 style='text-align:center;'><font size="1" face=verdana>HEATING PAD, FLUID</font><Br></TD>
	<TD colspan=1 style='text-align:center;'><font size="1" face=verdana>Sampled</font><Br></TD>
	<TD colspan=2 style='text-align:center;'><font size="1" face=verdana></font><Br></TD>
	</tr>
	<tr>
	<TD colspan=2 style='text-align:center;'><font size="1" face=verdana></font><Br></TD>
	<TD colspan=2 style='text-align:center;'><font size="1" face=verdana>PACEMAKER, EXTERNAL</font><Br></TD>
	<TD colspan=1 style='text-align:center;'><font size="1" face=verdana>Semiannual</font><Br></TD>
	<TD colspan=2 style='text-align:center;'><font size="1" face=verdana></font><Br></TD>
	</tr>
	<tr>
	<TD colspan=2 style='text-align:center;'><font size="1" face=verdana></font><Br></TD>
	<TD colspan=2 style='text-align:center;'><font size="1" face=verdana>PUMP, DRAINAGE</font><Br></TD>
	<TD colspan=1 style='text-align:center;'><font size="1" face=verdana>Sampled</font><Br></TD>
	<TD colspan=2 style='text-align:center;'><font size="1" face=verdana></font><Br></TD>
	</tr>
	<tr>
	<TD colspan=2 style='text-align:center;'><font size="1" face=verdana></font><Br></TD>
	<TD colspan=2 style='text-align:center;'><font size="1" face=verdana>PUMP, FEEDING</font><Br></TD>
	<TD colspan=1 style='text-align:center;'><font size="1" face=verdana>Sampled</font><Br></TD>
	<TD colspan=2 style='text-align:center;'><font size="1" face=verdana></font><Br></TD>
	</tr>
	<tr>
	<TD colspan=2 style='text-align:center;'><font size="1" face=verdana></font><Br></TD>
	<TD colspan=2 style='text-align:center;'><font size="1" face=verdana>PUMP, PCA</font><Br></TD>
	<TD colspan=1 style='text-align:center;'><font size="1" face=verdana>Annual</font><Br></TD>
	<TD colspan=2 style='text-align:center;'><font size="1" face=verdana></font><Br></TD>
	</tr>
	<tr>
	<TD colspan=2 style='text-align:center;'><font size="1" face=verdana></font><Br></TD>
	<TD colspan=2 style='text-align:center;'><font size="1" face=verdana>PUMP, SCD</font><Br></TD>
	<TD colspan=1 style='text-align:center;'><font size="1" face=verdana>Sampled</font><Br></TD>
	<TD colspan=2 style='text-align:center;'><font size="1" face=verdana></font><Br></TD>
	</tr>
	<tr>
	<TD colspan=2 style='text-align:center;'><font size="1" face=verdana></font><Br></TD>
	<TD colspan=2 style='text-align:center;'><font size="1" face=verdana>PUMP, INFUSION</font><Br></TD>
	<TD colspan=1 style='text-align:center;'><font size="1" face=verdana>Sampled</font><Br></TD>
	<TD colspan=2 style='text-align:center;'><font size="1" face=verdana></font><Br></TD>
	</tr>
	<tr>
	<TD colspan=2 style='text-align:center;'><font size="1" face=verdana></font><Br></TD>
	<TD colspan=2 style='text-align:center;'><font size="1" face=verdana>PUMP, SYRINGE</font><Br></TD>
	<TD colspan=1 style='text-align:center;'><font size="1" face=verdana>Annual</font><Br></TD>
	<TD colspan=2 style='text-align:center;'><font size="1" face=verdana></font><Br></TD>
	</tr>
	<tr>
	<TD colspan=7 style='text-align:center;'><font size="1" face=verdana>If you have any other equipment in your area, or have a question about these reports, please call Clinical Engineering at 402-8525.</font><Br></TD>
	</tr>

	
	
	<tr>
	<TD colspan=7><font size="0" face=verdana></font><Br></TD>
	</tr>
	</table>

<%} %>
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
