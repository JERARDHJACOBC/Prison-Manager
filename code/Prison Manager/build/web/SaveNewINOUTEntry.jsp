<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*"%>
<%@ page isErrorPage="false" %>
<%@ page errorPage="errorPage.jsp" %>
<HEAD>
	<LINK href="styles/styles.css" type="text/css" rel="stylesheet">
<BODY class=SC>
    <BR><BR><BR>
<h3 align=center>Add new IN-OUT entry</h3>

<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	String PrisonerId = request.getParameter("PrisonerId");	
        String StaffId = request.getParameter("StaffId");	
        String InTime = request.getParameter("InTime");
        String OutTime = request.getParameter("OutTime");	
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
        String TimeslotFrom = StartTimeHHValue+":"+StartTimeMMValue+":00";
        if(EndTimeHHValue.length()==1){
            EndTimeHHValue = "0"+EndTimeHHValue;
        }
        if(EndTimeMMValue.length()==1){
            EndTimeMMValue = "0"+EndTimeMMValue;
        }
        String TimeslotTo = EndTimeHHValue+":"+EndTimeMMValue+":00";
        OutTime = OutTime+" "+TimeslotFrom;
        InTime = InTime+" "+TimeslotTo;
	try{
			
			con = com.PrisonManager.ConnectionPool.getConnection();
			stmt =  con.createStatement();
	
			
			String Query = "Insert into inoutregister ( `PrisonerId`, `StaffId`, `InTime`, `OutTime`, `Purpose`) values("+PrisonerId+","+StaffId+",'"+InTime+"','"+OutTime+"','"+Purpose+"')";
                        System.out.println(Query);
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
