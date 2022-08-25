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
<h3 align=center>View Staff data</h3>

<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
        String StaffId = request.getParameter("StaffId");
	try{
			
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/prisonhouse","root","root");
			
                        stmt =  con.createStatement();
			String Query = "Select * from staffdetails where staffid = '"+StaffId+"'";
			rs = stmt.executeQuery(Query);
			%>
						<table align="center" width="60%">
							<tr class=row_title>
							<th align="left">StaffId</th><th align="left">Name</th><th align="left">Age</th><th align="left">Designation</th><th align="left">Date Of Joining</th><th align="left">Address</th><th align="left">Salary</th><th align="left">LocationId</th>
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
			if( rCount == 0)	{%><h3 align=center>Sorry No records Found</h3><% }
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

</PRE>