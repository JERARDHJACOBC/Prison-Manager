<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*"%>
<%@ page isErrorPage="false" %>
<%@ page errorPage="errorPage.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link href="styles/styles.css" rel="stylesheet"/>
    </head>
    <body>
       
       <%

	Connection con=null;
	ResultSet rs=null,rs1=null;
	Statement stmt=null;
	String Auth = (String)session.getAttribute("Auth");	
	int flag=0;
	try{
     	  con = com.PrisonManager.ConnectionPool.getConnection();
	  stmt =  con.createStatement();
	  String Query = "select MenuId,Name,Executable,Target from menuitems where Auth = '"+Auth+"' and MenuLevel=1";
	  System.out.println("[Query]"+Query);
          rs = stmt.executeQuery(Query);
	  while(rs.next())	
	   {
    
              String MenuId = rs.getString(1);
              String MenuName = rs.getString(2);
              String Executable = rs.getString(3);
              String Target = rs.getString(4);
	     	%>
                    <a href="<%=Executable%>" target="<%=Target%>" 
                    onclick="alert('<%=MenuId%>')">
                        <%=MenuName%>
                    </a> <BR>
                <%
           }
	  stmt.close();
	  con.close();
	}catch(Exception e){
	  con.close();
          throw new Exception(e);
	}
	
%>
    </body>
</html>
