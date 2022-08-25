<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*"%>
<%@ page isErrorPage="false" %>
<%@ page errorPage="errorPage.jsp" %>
<HEAD>
	<LINK href="styles/styles.css" type="text/css" rel="stylesheet">
<BODY class=SC>
    <BR><BR><BR>
<h3 align=center>Add new Staff member</h3>

<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	String Name = request.getParameter("Name");	String Age = request.getParameter("Age");	String Designation = request.getParameter("Designation");	String DateOfJoining = request.getParameter("DateOfJoining");	String Address = request.getParameter("Address");	String Salary = request.getParameter("Salary");	String LocationId = request.getParameter("LocationId");	
	try{
			
			con = com.PrisonManager.ConnectionPool.getConnection();
                        stmt =  con.createStatement();
	
			
			String Query = "Insert into staffdetails (`Name`, `Age`, `Designation`, `DateOfJoining`, `Address`, `Salary`, `LocationId`)values('"+Name+"',"+Age+",'"+Designation+"','"+DateOfJoining+"','"+Address+"',"+Salary+","+LocationId+")";
			int result = stmt.executeUpdate(Query);
			if( result > 0)	{
				%>
                                 <P align=center><B>Staff created sucessfully<B></P>
                                   <BR><BR>
                                    <P align=center><a href='AddNewStaffMember.jsp'>Back</a></P> 
                                    
                                <%
			}
			else{
				%>
                                    <P align=center><B>Error in updating..please try again<B></P>
                                    <BR><BR>
                                    <P align=center><a href='AddNewStaffMember.jsp'>Back</a></P>
                                <% 
			}
			stmt.close();
			con.close();
		}catch(Exception e){
			stmt.close();
			con.close();
			throw new Exception(e);
		}
	
%>
</BODY>
