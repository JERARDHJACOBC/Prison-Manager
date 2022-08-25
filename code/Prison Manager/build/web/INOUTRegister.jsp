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
<h3 align=center>IN-OUT Register</h3>
<P><a href='INOUTRegisterXL.jsp'>Download Excel</a></P>
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
						<table align="center" width="60%">
							<tr class=row_title>
							<th align="left">S.No.</th><th align="left">Prisoner Id</th><th align="left">Staff Id</th><th align="left">In Time</th><th align="left">Out Time</th><th align="left">Purpose</th>
							</tr>
					<%
			int rCount=0;
			while(rs.next())
			{
                                                 String Inoutid = rs.getString(1);
                                                 String PrisonerId = rs.getString(2);
                                                 String StaffId = rs.getString(3);
                                                 String Intime = rs.getString(4);
                                                 String Outtime = rs.getString(5);
                                                 String Purpose = rs.getString(6);
					%>
					<tr class= '<%=(rCount%2!=0)? "row_even" : "row_odd"%>'>
						 <td><%=Inoutid%></td>
                                                  <td><a href='ShowPrisonersPopup.jsp?PrisonerId=<%=PrisonerId%>' target="_new"><%=PrisonerId%></a></td>
                                                 <td><a href='ShowStaffPopup.jsp?StaffId=<%=StaffId%>' target="_new"><%=StaffId%><a></td>
                                                 <td><%=Intime%></td>
                                                 <td><%=Outtime%></td>
                                                 <td><%=Purpose%></td>
					</tr>
					<%
				rCount++;
			}
			if( rCount == 0)	
                        {%><tr><td align=center colspan=6>Sorry No records Found</td></tr><% }
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