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
<h3 align=center>View Paroles</h3>
<P><a href='ViewParoleXL.jsp'>Download Excel</a></P>

<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	try{
			
			con = com.PrisonManager.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			String Query = "Select * from parole order by `paroleid`";
			rs = stmt.executeQuery(Query);
			%>
						<table align="center" width="80%">
							<tr class=row_title>
							<th align="left">Parole Id</th>
                                                         <th align="left">Prisoner Id</th>
                                                         <th align="left">Staff Id</th>
                                                         <th align="left">Request Date</th>
                                                         <th align="left">Reason</th>
                                                         <th align="left">Status</th>
                                                         <th align="left">Validation Date</th>
                                                         <th align="left">From</th>
                                                         <th align="left">To</th>
                                                         <th align="left">Validated By</th>
							</tr>
					<%
			int rCount=0;
			while(rs.next())
			{
                            String ParoleId = rs.getString(1);
                            String PrisonerId = rs.getString(2);
                            String StaffId = rs.getString(3);
                            String AppDate = rs.getString(7);
					%>
					<tr class= '<%=(rCount%2!=0)? "row_even" : "row_odd"%>'>
                                                 <td><%=ParoleId%></td>
                                                 <td><a href='ShowPrisonersPopup.jsp?PrisonerId=<%=PrisonerId%>' target="_new"><%=PrisonerId%></a></td>
                                                 <td><a href='ShowStaffPopup.jsp?StaffId=<%=StaffId%>' target="_new"><%=StaffId%><a></td>
                                                 <td><%=rs.getString(4)%></td>
                                                 <td><%=rs.getString(5)%></td>
                                                 <td><%=rs.getString(6)%></td>
                                                 <td><%=AppDate%></td>
                                                 <td><%=rs.getString(8)%></td>
                                                 <td><%=rs.getString(9)%></td>
                                                 <td><%=rs.getString(10)%></td>
					</tr>
					<%
				rCount++;
			}
                         if (rCount == 0) {%><tr><td align=center  colspan=10>Sorry No records Found</td></tr><% }
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