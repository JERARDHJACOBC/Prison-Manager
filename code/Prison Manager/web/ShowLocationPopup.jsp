<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*"%>
<%@ page isErrorPage="false" %>
<%@ page errorPage="errorPage.jsp" %>
<HEAD>
	<LINK href="styles/styles.css" type="text/css" rel="stylesheet">

</HEAD>
<BODY class=SC>
<h3 align=center>Location Details</h3>

<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
        String LocationId = request.getParameter("LocationId");
	try{
			
			con = com.PrisonManager.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			String Query = "Select * from locationdetails where `locationid` = '"+LocationId+"'";
                        System.out.println("$(cursor)"+Query);
			rs = stmt.executeQuery(Query);
			%>
						<table align="center" width="60%">
							<tr class=row_title>
							<th align="left">LocationId</th><th align="left">StationCode</th><th align="left">Location</th><th align="left">State</th>
							</tr>
					<%
			int rCount=0;
			if(rs.next())
			{
					%>
					<tr class= '<%=(rCount%2!=0)? "row_even" : "row_odd"%>'>
						<td><%=rs.getString(1)%></td><td><%=rs.getString(2)%></td><td><%=rs.getString(3)%></td><td><%=rs.getString(4)%></td>
					</tr>
					<%
				rCount++;
			}
                         if (rCount == 0) {%><tr><td colspan=4 align=center>Sorry No records Found</td></tr><% }
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
</table>
<BR><BR><P align=center><a href=''onclick='window.close()'>Close Window</a></P>
</BODY>
