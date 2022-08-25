<%-- 
    Document   : Body
    Created on : Sep 9, 2008, 11:24:31 PM
    Author     : Pranavi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="styles/styles.css" rel="stylesheet"/>
    </head>
    <body class=SC>
        <BR><BR><BR><BR><BR><BR>
            <%
            String UserId = (String)session.getAttribute("UserID");
            UserId = UserId.toUpperCase();
            %>
        <H3 align=center><font color=white>Welcome <%=UserId%> to Prison Manager</font></H3>
        <H5 align=center><font color=white>Please navigate through the links provided</font></H5>
 
   
    </body>
</html>
