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
<h3 align=center>Add New User</h3>

<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	String UserId = request.getParameter("UserId");	String Password = request.getParameter("Password");	String Auth = request.getParameter("Auth");	
	try{
			
			con = com.PrisonManager.ConnectionPool.getConnection();
                        stmt =  con.createStatement();
	
			
			String Query = "Insert into login values('"+UserId+"','"+Password+"','"+Auth+"')";
			int result = stmt.executeUpdate(Query);
			if( result > 0)	{
				%>
                                 <P align=center><B>User created sucessfully<B></P>
                                    <BR><BR>
                                    <P align=center><a href='ManageUsers.jsp'>User Home</a></P>
                                <%
			}
			else{
				%>
                                    <P align=center><B>Error in updating..please try again<B></P>
                                    <BR><BR>
                                    <P align=center><a href='AddNewUser.jsp'>Back</a></P>
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


