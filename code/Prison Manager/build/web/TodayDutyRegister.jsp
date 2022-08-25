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


<%
String Today = new java.sql.Date(System.currentTimeMillis()).toString();


	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	try{
			
			con = com.PrisonManager.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			String Query = "select A.Name ,B.DutyAs, B.ShiftStartsAt,B.ShiftEndsAt from staffdetails A, dutyregister B where B.DutyOn = '"+Today+"' and A.StaffId = B.StaffId order by `DutyAs`";
			rs = stmt.executeQuery(Query);
			%>
                         <h3 align=center>Duties as on <%=Today%></h3>
                         
						<table align="center" width="60%">
							<tr class=row_title>
							<th align="left">Name</th><th align="left">Duty As</th><th align="left">Shift Starts At</th><th align="left">Shift Ends At</th>
							</tr>
					<%
			int rCount=0;
			while(rs.next())
			{
					%>
					<tr class= '<%=(rCount%2!=0)? "row_even" : "row_odd"%>'>
						<td><%=rs.getString(1)%></td><td><%=rs.getString(2)%></td><td><%=rs.getString(3)%></td><td><%=rs.getString(4)%></td>
					</tr>
					<%
				rCount++;
			}
			if( rCount == 0)	{%><tr><td align=center  colspan=4>Sorry No records Found</td></tr><% }
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
