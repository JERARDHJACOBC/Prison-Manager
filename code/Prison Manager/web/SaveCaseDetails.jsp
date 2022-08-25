<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*"%>
<%@ page isErrorPage="false" %>
<%@ page errorPage="errorPage.jsp" %>
<HEAD>
	<LINK href="styles/styles.css" type="text/css" rel="stylesheet">
<BODY class=SC>
    <BR><BR>
<h3 align=center>Save Case details</h3>

<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	String CaseType = request.getParameter("CaseType");
        String CaseDetails = request.getParameter("CaseDetails");
        String CourtName = request.getParameter("CourtName");	
        String CourtAddress = request.getParameter("CourtAddress");
        String JudgeName = request.getParameter("JudgeName");	
        String JudgementDate = request.getParameter("JudgementDate");
        String CaseStartDate = request.getParameter("CaseStartDate");
        String VictimsDetails = request.getParameter("VictimsDetails");	
        String exhibits = request.getParameter("exhibits");	
        String evidenceDetails = request.getParameter("evidenceDetails");
        String PrisonerId = request.getParameter("PrisonerId");	
        String CaseId  = "0";
	try{
			con = com.PrisonManager.ConnectionPool.getConnection();
			stmt =  con.createStatement();
	
			
			String Query = "Insert into casedetails ( `CaseType`, `CaseDetails`, `CourtName`, `CourtAddress`, `JudgeName`, `JudgementDate`, `CaseStartDate`, `VictimsDetails`, `exhibits`, `evidenceDetails`, `PrisonerId`	)values('"+CaseType+"','"+CaseDetails+"','"+CourtName+"','"+CourtAddress+"','"+JudgeName+"','"+JudgementDate+"','"+CaseStartDate+"','"+VictimsDetails+"','"+exhibits+"','"+evidenceDetails+"',"+PrisonerId+")";
			int result = stmt.executeUpdate(Query);
			if( result > 0)	{
                        String selsql = "Select Caseid from casedetails where PrisonerId = '"+PrisonerId+"'";
                        rs = stmt.executeQuery(selsql);
                        if(rs.next()){
                            CaseId = rs.getString(1);
                        }
                        String sql = "update prisoners set CaseId = '"+CaseId+"' where PrisonerId = '"+PrisonerId+"'";
                        int x = stmt.executeUpdate(sql);
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


