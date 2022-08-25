<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*"%>
<%@ page isErrorPage="false" %>
<%@ page errorPage="errorPage.jsp" %>
<HEAD>
	<LINK href="styles/styles.css" type="text/css" rel="stylesheet">
<BODY class=SC>
    <BR><BR><BR>
<h3 align=center>Make a Parole request</h3>

<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	String PrisonerId = request.getParameter("PrisonerId");	String StaffId = request.getParameter("StaffId");	String RequestDate = request.getParameter("RequestDate");	String Reason = request.getParameter("Reason");	String Status = request.getParameter("Status");	String ApprovalDate = request.getParameter("ApprovalDate");	String From = request.getParameter("From");	String To = request.getParameter("To");	String ApprovedBy = request.getParameter("ApprovedBy");	
	try{
			
			con = com.PrisonManager.ConnectionPool.getConnection();
                        stmt =  con.createStatement();
	
			
			String Query = "Insert into parole (`PrisonerId`, `StaffId`, `RequestDate`, `Reason`, `Status`, `ApprovalDate`, `From`, `To`, `ApprovedBy`) values("+PrisonerId+","+StaffId+",'"+RequestDate+"','"+Reason+"','"+Status+"','"+ApprovalDate+"','"+From+"','"+To+"','"+ApprovedBy+"')";
			int result = stmt.executeUpdate(Query);
			if( result > 0)	{
				%><h3 align=center>Inserted into database sucessfully</h3><%
			}
			else{
				%><h3 align=center>Error in updating..please try again</h3><% 
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
