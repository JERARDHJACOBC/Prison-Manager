<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<%@page contentType="application/vnd.ms-excel"%>
<%response.setHeader("Content-Disposition","attachment;filename=Report.xls");%>

<HEAD>
</HEAD>
<BODY class=SC>
<h2 align=center>IN-OUT Register</h2>

<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	try{
			
                         con = com.PrisonManager.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			String Query = "Select * from inoutregister order by `Inoutid`";
			rs = stmt.executeQuery(Query);
			%>
						<table class=notebook border=1>
							<tr class=row_title>
							<th class=row_title>S.No</th><th class=row_title>Prisoner Id</th><th class=row_title>Staff Id</th><th class=row_title>In Time</th><th class=row_title>Out Time</th><th class=row_title>Purpose</th>
							</tr>
					<%
			int rCount=0;
			while(rs.next())
			{
					%>
					<tr class= '<%=(rCount%2!=0)? "row_even" : "row_odd"%>'>
						<td><%=rs.getString(1)%></td><td><%=rs.getString(2)%></td><td><%=rs.getString(3)%></td><td><%=rs.getString(4)%></td><td><%=rs.getString(5)%></td><td><%=rs.getString(6)%></td>
					</tr>
					<%
				rCount++;
			}
			if( rCount == 0)	{%><h3 align=center>Sorry No records Found</h3><% }
			rs.close();
			stmt.close();
			con.close();
		}catch(Exception e){
			//rs.close();
			stmt.close();
			con.close();
			%><%=e%><%
		}
	
%>
</BODY>

</PRE>