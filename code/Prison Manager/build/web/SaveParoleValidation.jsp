<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*"%>
<%@ page isErrorPage="false" %>
<%@ page errorPage="errorPage.jsp" %>
<HEAD>
	<LINK href="styles/styles.css" type="text/css" rel="stylesheet">

</HEAD>
<BODY class=SC>
    <BR><BR><BR>
<h3 align=center>Validate Requests</h3>

<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	String Paroleid = request.getParameter("Paroleid");
        System.out.println("$(cursor)->"+Paroleid);
        String Status = request.getParameter("Status");
        String ApprovedBy = request.getParameter("ApprovedBy");
        String ApprovalDate = request.getParameter("ApprovalDate");
	
        try{
			
			con = com.PrisonManager.ConnectionPool.getConnection();
                        stmt =  con.createStatement();
	
			
			String Query = "update parole set Status = '"+Status+"'" +
                                ",ApprovedBy = '"+ApprovedBy+"'" +
                                ",ApprovalDate = '"+ApprovalDate+"'"+
                                " where Paroleid = '"+Paroleid+"'";
                        System.out.println("$(cursor)"+Query);
			int result = stmt.executeUpdate(Query);
			if( result > 0)	{
				%>
                                 <P align=center><B>Parole request validated<B></P>
                                    <BR><BR>
                                    <P align=center><a href='ValidateParole.jsp'>Back</a></P>
                                <%
			}
			else{
				%>
                                    <P align=center><B>Error in updating..please try again<B></P>
                                    <BR><BR>
                                    <P align=center><a href='ValidateParole.jsp'>Back</a></P>
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


