<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*"%>
<%@ page isErrorPage="false" %>
<%@ page errorPage="errorPage.jsp" %>
<HEAD>
	<LINK href="styles/styles.css" type="text/css" rel="stylesheet">
<script LANGUAGE="Javascript" SRC="utilities.js"></script>
</HEAD>
<BODY class=SC>
    <BR><BR>
<h3 align=center>Duty Register</h3>
<P><a href='DutyRegisterXL.jsp'>Download Excel</a></P>
<P align=center>
    <a href='AssignDuty.jsp'><< Assign Duty >></a>
    |
    <a href='DeleteDuty.jsp'><< Unassign Duty >></a>
    
</P>

<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	try{
			
			con = com.PrisonManager.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			String Query = "Select * from DutyRegister order by `DutyId`";
			rs = stmt.executeQuery(Query);
			%>
						<table align="center" width="60%">
							<tr class=row_title>
							<th align="left">DutyId</th><th align="left">StaffId</th><th align="left">DutyOn</th><th align="left">ShiftStartsAt</th><th align="left">ShiftEndsAt</th><th align="left">DutyAs</th>
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
			if( rCount == 0)	{%><tr><td align=center  colspan=6>Sorry No records Found</td></tr><% }
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
