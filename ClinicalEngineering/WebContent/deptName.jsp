<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
      String facility=request.getParameter("count"); 
	  String buffer="<select name='des' ><option value='-1'>Select</option>"; 
     
    	 String driverName = "com.mysql.jdbc.Driver";
  		String url = "jdbc:sqlserver://" + "lsnr_websql" + ":1433" + ";instance=" + "lsnr_websql";
  		String user = "webadm1n";
  		String psw = "L2vh0W0eb5";
  		Connection con = null;
  		PreparedStatement ps = null;
  		
  		try {
  			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
  			con = DriverManager.getConnection(url,user,psw);
          
  			String sql = "Select DISTINCT DEPTNAME from ClinicalEngApp.dbo.[PM Flatfile web] WHERE FACILITY=?";
   
          PreparedStatement pstm = con.prepareStatement(sql);
   		  pstm.setString(1, facility);
          ResultSet rs = pstm.executeQuery();
          while(rs.next()){
        	 buffer=buffer+"<option value='"+rs.getString(1)+"'>"+rs.getString(1)+"</option>"; 
        	
            String fname = rs.getString(1);
            } 
          buffer=buffer+"</select>";  
          response.getWriter().println(buffer);
          System.out.println(buffer);
           
      }
  		catch (SQLException | ClassNotFoundException e) {
  			// TODO Auto-generated catch block
  			e.printStackTrace();
  		}
%>
</body>
</html>