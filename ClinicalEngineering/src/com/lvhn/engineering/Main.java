package com.lvhn.engineering;


import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.*;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Main
 */
@WebServlet("/Main")
public class Main extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Main() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, String> facility = new TreeMap<>();
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:sqlserver://" + "lsnr_websql" + ":1433" + ";instance=" + "lsnr_websql";
		String user = "webadm1n";
		String psw = "L2vh0W0eb5";
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			con = DriverManager.getConnection(url,user,psw);
		
		String sql = "Select DISTINCT FACILITY from ClinicalEngApp.dbo.[PM Flatfile web] order by FACILITY ASC";
		ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			String fname = rs.getString(1);
		facility.put(fname,fname);
		
		}
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 request.setAttribute("facility", facility);
		 
	        String registerForm = "Main.jsp";
	        RequestDispatcher dispatcher = request.getRequestDispatcher(registerForm);
	        dispatcher.forward(request, response);  
		
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		List<String> result = new ArrayList<String>();
	}

}
