<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.text.SimpleDateFormat,java.util.Date"%>
<%@ page isErrorPage="false" %>
<%@ page errorPage="errorPage.jsp" %>
<%java.util.Date dt=new Date();
 SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
 %>
<%String sysdate="";
  
  System.out.println("sysdate"+dt);
  sysdate=df.format(dt);
  System.out.println("sys"+sysdate);
%>
<HEAD>
	<LINK href="styles/styles.css" type="text/css" rel="stylesheet">
<script LANGUAGE="Javascript" SRC="utilities.js"></script>
</HEAD>
<BODY class=SC>
<h3 align=center>Today Interview Slots</h3>
<P><a href='ViewRequestsXL.jsp'>Download Excel</a></P>

<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	try{
			
			con = com.PrisonManager.ConnectionPool.getConnection();
                        stmt =  con.createStatement();
			String Query = "Select * from interviewrequests where RequestDate like '%"+sysdate+"%'and RequestStatus='Approved'order by `interviewid`";
			rs = stmt.executeQuery(Query);
			%>
						<table align="center" width="100%">
							<tr class=row_title>
							<th align="left">Interview Id</th><th align="left">Request Date</th><th align="left">Requested By</th><th align="left">Prisoner Id</th><th align="left">Relationship</th><th align="left">Address</th><th align="left">Timeslot From</th><th align="left">Timeslot To</th><th align="left">Staff Id</th><th align="left">Request Status</th><th align="left">Purpose</th>
							</tr>
					<%
			int rCount=0;
			while(rs.next())
			{
					%>
					<tr class= '<%=(rCount%2!=0)? "row_even" : "row_odd"%>'>
						<td><%=rs.getString(1)%></td><td><%=rs.getString(2)%></td><td><%=rs.getString(3)%></td><td><%=rs.getString(4)%></td><td><%=rs.getString(5)%></td><td><%=rs.getString(6)%></td><td><%=rs.getString(7)%></td><td><%=rs.getString(8)%></td><td><%=rs.getString(9)%></td><td><%=rs.getString(10)%></td><td><%=rs.getString(11)%></td>
					</tr>
					<%
				rCount++;
			}
			if( rCount == 0)	{%><tr><td colspan=11 align=center>Sorry No records Found</td></tr><% }
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
