<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*"%>
<%@ page isErrorPage="false" %>
<%@ page errorPage="errorPage.jsp" %>
<HEAD>
	<LINK href="styles/styles.css" type="text/css" rel="stylesheet">
<BODY class=SC>
    <BR><BR>
<h3 align=center>Assign Duty</h3>

<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	String StaffId = request.getParameter("StaffId");
        String DutyOn = request.getParameter("DutyOn");
        String ShiftStartsAt = "";
        String ShiftEndsAt = "";
        String DutyAs = request.getParameter("DutyAs");	
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
        ShiftStartsAt = StartTimeHHValue+":"+StartTimeMMValue;
        if(EndTimeHHValue.length()==1){
            EndTimeHHValue = "0"+EndTimeHHValue;
        }
        if(EndTimeMMValue.length()==1){
            EndTimeMMValue = "0"+EndTimeMMValue;
        }
        ShiftEndsAt = EndTimeHHValue+":"+EndTimeMMValue;
	try{
			
			con = com.PrisonManager.ConnectionPool.getConnection();
			stmt =  con.createStatement();
	
			
			String Query = "Insert into DutyRegister (`StaffId`, `DutyOn`, `ShiftStartsAt`, `ShiftEndsAt`, `DutyAs`) values('"+StaffId+"','"+DutyOn+"','"+ShiftStartsAt+"','"+ShiftEndsAt+"','"+DutyAs+"')";
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
