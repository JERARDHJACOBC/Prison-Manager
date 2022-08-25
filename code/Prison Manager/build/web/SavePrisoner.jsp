
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*"%>
<%@ page isErrorPage="false" %>
<%@ page errorPage="errorPage.jsp" %>

<HEAD>
	<LINK href="styles/styles.css" type="text/css" rel="stylesheet">
</HEAD>
<BODY class=SC>
<h2 align=center>Add Prisoner details</h2>

<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	String Name = request.getParameter("Name");
        String Age = request.getParameter("Age");
        String caseid = "0";
        String FromDate = request.getParameter("FromDate");
        String ToDate = request.getParameter("ToDate");	
        String Mode = request.getParameter("Mode");
        String Address = request.getParameter("Address");
        String PrisonerId = "0";
	try{
			
			con = com.PrisonManager.ConnectionPool.getConnection();
			stmt =  con.createStatement();
                        
			
			String Query = "Insert into prisoners (`Name`, `Age`, `caseid`, `FromDate`,`ToDate`, `Mode`, `Address`) values('"+Name+"',"+Age+","+caseid+",'"+FromDate+"','"+ToDate+"','"+Mode+"','"+Address+"')";
			int result = stmt.executeUpdate(Query);
                        String sql = "select PrisonerId from prisoners where name='"+Name+"' and age='"+Age+"' and FromDate = '"+FromDate+"' and ToDate = '"+ToDate+"' and Address = '"+Address+"'";
			System.out.println("$(cursor)"+sql);
                        rs = stmt.executeQuery(sql);
                        if(rs.next()){
                            PrisonerId = rs.getString(1);
                        }
                        if( result > 0)	{
				%><h3 align=center>Inserted into database sucessfully</h3>
                                 <jsp:forward page="AddCaseDetails.jsp">
                                     <jsp:param name="PrisonerId" value="<%=PrisonerId%>"/>
                                 </jsp:forward>
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

