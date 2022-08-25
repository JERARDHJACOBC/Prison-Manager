<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*"%>
<%@ page isErrorPage="false" %>
<%@ page errorPage="errorPage.jsp" %>
<HEAD>
	<LINK href="styles/styles.css" type="text/css" rel="stylesheet">
</HEAD>
<BODY class=SC>
    <BR><BR>
<h3 align=center>View Case details</h3>

<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
        String caseid = request.getParameter("CaseId");
	try{
			
			con = com.PrisonManager.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			String Query = "Select * from casedetails where `caseid`='"+caseid+"'";
			rs = stmt.executeQuery(Query);
			%>
						<table align="center" width="100%">
							<tr class=row_title>
							<th align="left">Case id</th><th align="left">Case Type</th><th align="left">Case Details</th><th align="left">Court Name</th><th align="left">Court Address</th><th align="left">Judge Name</th><th align="left">Judgement Date</th><th align="left">Case Start Date</th><th align="left">Victims Details</th><th align="left">Exhibits</th><th align="left">Eevidence Details</th>
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
                         if (rCount == 0) {%><tr><td align=center colspan=11>Sorry No records Found</td></tr><% }
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