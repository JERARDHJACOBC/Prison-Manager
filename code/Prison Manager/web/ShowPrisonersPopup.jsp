<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*"%>
<%@ page isErrorPage="false" %>
<%@ page errorPage="errorPage.jsp" %>
<HEAD>
	<LINK href="styles/styles.css" type="text/css" rel="stylesheet">

</HEAD>
<BODY class=SC>
<h3 align=center>View Prisoners</h3>

<%
	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
        String PrisonerId = request.getParameter("PrisonerId");
	try{
			
			con = com.PrisonManager.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			String Query = "Select * from prisoners where prisonerid = '"+PrisonerId+"'";
			rs = stmt.executeQuery(Query);
			%>
						<table align="center" width="60%">
							<tr class=row_title>
							<th align="left">PrisonerId</th><th align="left">Name</th><th align="left">Age</th><th align="left">caseid</th><th align="left">FromDate</th><th align="left">ToDate</th><th align="left">Mode</th><th align="left">Address</th>
							</tr>
					<%
			int rCount=0;
			if(rs.next())
			{
					%>
					<tr class= '<%=(rCount%2!=0)? "row_even" : "row_odd"%>'>
						<td><%=rs.getString(1)%></td><td><%=rs.getString(2)%></td><td><%=rs.getString(3)%></td><td><%=rs.getString(4)%></td><td><%=rs.getString(5)%></td><td><%=rs.getString(6)%></td><td><%=rs.getString(7)%></td><td><%=rs.getString(8)%></td>
					</tr>
					<%
				rCount++;
			}
			if( rCount == 0)	{%><tr><td align=center colspan=7>Sorry No records Found</td></tr><% }
			rs.close();
			stmt.close();
			con.close();
		}catch(Exception e){
			//rs.close();
			stmt.close();
			con.close();
			throw new Exception(e);
		}
	
%>
</BODY>

