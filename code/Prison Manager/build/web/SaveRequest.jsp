<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*"%>
<%@ page isErrorPage="false" %>
<%@ page errorPage="errorPage.jsp" %>
<HEAD>
	<LINK href="styles/styles.css" type="text/css" rel="stylesheet">
<BODY class=SC>
    <BR><BR><BR>
<H3 align=center>Make a Request</H3>

<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	String RequestDate = request.getParameter("RequestDate");
        String RequestedBy = request.getParameter("RequestedBy");
        String PrisonerId = request.getParameter("PrisonerId");
        String Relationship = request.getParameter("Relationship");
        String Address = request.getParameter("Address");
        String TimeslotFrom = "";//request.getParameter("TimeslotFrom");
        String TimeslotTo = "";//request.getParameter("TimeslotTo");
        String StaffId = request.getParameter("StaffId");
        String RequestStatus = "Requested";
        String Purpose = request.getParameter("Purpose");	
        String StartTimeHHValue=request.getParameter("StartTimeHH");
        String StartTimeMMValue=request.getParameter("StartTimeMM");
        String EndTimeHHValue=request.getParameter("EndTimeHH");
        String EndTimeMMValue=request.getParameter("EndTimeMM");
        
        if(StartTimeHHValue.length()==1){
            StartTimeHHValue = "0"+StartTimeHHValue;
        }
        if(StartTimeMMValue.length()==1){
            StartTimeMMValue = "0"+StartTimeMMValue;
        }
        TimeslotFrom = StartTimeHHValue+":"+StartTimeMMValue;
        if(EndTimeHHValue.length()==1){
            EndTimeHHValue = "0"+EndTimeHHValue;
        }
        if(EndTimeMMValue.length()==1){
            EndTimeMMValue = "0"+EndTimeMMValue;
        }
        TimeslotTo = EndTimeHHValue+":"+EndTimeMMValue;
        
	try{
			con = com.PrisonManager.ConnectionPool.getConnection();
			stmt =  con.createStatement();
	
			
			String Query = "Insert into interviewrequests(`RequestDate`, `RequestedBy`, `PrisonerId`, 	`Relationship`, 	`Address`, 	`TimeslotFrom`, 	`TimeslotTo`, 	`StaffId`, 	`RequestStatus`, 	`Purpose`) values('"+RequestDate+"','"+RequestedBy+"',"+PrisonerId+",'"+Relationship+"','"+Address+"','"+TimeslotFrom+"','"+TimeslotTo+"',"+StaffId+",'"+RequestStatus+"','"+Purpose+"')";
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
