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
<h3 align=center>View Users</h3>
<P><a href='ViewUsersXL.jsp'>Download Excel</a></P>
<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	try{
			
			con = com.PrisonManager.ConnectionPool.getConnection();
                        stmt =  con.createStatement();
			String Query = "Select * from login order by `userid`";
			rs = stmt.executeQuery(Query);
			%>
						<table align="center" width="60%">
                                                      
							<tr class=row_title>
							<th align="left">User Id</th><th align="left">Role</th>
							</tr>
					<%
			int rCount=0;
			while(rs.next())
			{
					%>
					<tr class= '<%=(rCount%2!=0)? "row_even" : "row_odd"%>'>
						<td><%=rs.getString(1)%></td><td><%=rs.getString(3)%></td>
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
</table>
<BR>

</BODY>
