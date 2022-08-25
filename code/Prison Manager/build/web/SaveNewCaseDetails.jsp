<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>


	<script LANGUAGE="Javascript" SRC="validate.js"></script>


	<LINK href="styles/styles.css" type="text/css" rel="stylesheet">

</HEAD>
<BODY class=SC>
<h2 align=center>Case</h2>

<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	String CaseType = request.getParameter("CaseType");	String CaseDetails = request.getParameter("CaseDetails");	String CourtName = request.getParameter("CourtName");	String CourtAddress = request.getParameter("CourtAddress");	String JudgeName = request.getParameter("JudgeName");	String JudgementDate = request.getParameter("JudgementDate");	String CaseStartDate = request.getParameter("CaseStartDate");	String VictimsDetails = request.getParameter("VictimsDetails");	String exhibits = request.getParameter("exhibits");	String evidenceDetails = request.getParameter("evidenceDetails");	
	try{
			
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/prisonhouse","root","root");
			stmt =  con.createStatement();
	
			
			String Query = "Insert into casedetails values('"+CaseType+"','"+CaseDetails+"','"+CourtName+"','"+CourtAddress+"','"+JudgeName+"','"+JudgementDate+"','"+CaseStartDate+"','"+VictimsDetails+"','"+exhibits+"','"+evidenceDetails+"')";
			int result = stmt.executeUpdate(Query);
			if( result > 0)	{
				%>
                                 <P align=center><B>Case details inserted sucessfully<B></P>
                                <%
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


