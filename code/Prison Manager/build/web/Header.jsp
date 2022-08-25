<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<% String Userid=(String)session.getAttribute("UserID"); %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href='styles/styles.css' rel="stylesheet"/>
        <title></title>
    </head>
    <body class="Main">
    <table border="0" align="right" width="20%">
            <tr class="Top">
                <td align=right></td>
                <td align=right>Welcome&nbsp;&nbsp;<%=Userid%><br></td>
                <td align=right></td>
            </tr>
            <tr class="Top">
                <td align=right></td>
                <td align=right><a href='Logout.jsp' class='toplinks'>Logout</a></td>
                <td align=right></td>
            </tr>
    
        </table>
        
    </body>
</html>
