<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>

<%
String n = request.getParameter("val");
if (n.length() > 0) {
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "SYSTEM", "1234");

		PreparedStatement ps = con.prepareStatement("delete from payregister where id ='" + n + "'");
		ps.executeUpdate();
		con.close();
		request.setAttribute("msg", "Record Has been Deleted");
	} catch (Exception e) {
		e.printStackTrace();
	}
} //end of if
%>
<jsp:forward page="admin.jsp"></jsp:forward>