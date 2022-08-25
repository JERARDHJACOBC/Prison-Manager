<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*"%>
<%@ page isErrorPage="false" %>
<%@ page errorPage="errorPage.jsp" %>
<HEAD>
    <LINK href="styles/styles.css" type="text/css" rel="stylesheet">
<BODY class=SC>
    <BR><BR><BR><BR>

<H3 align=center>Approve Interview Request</H3>
<%
if(!(request.getMethod().equals("POST")))
{

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	String Condition = "InterviewID";
	String[] ConValues = new String[2000];
	int ConCount=0,i=0;
	String Query1="";
%>
<FORM Name='SaveRequestStatus.jsp' METHOD=POST ACTION="">
			
		<TABLE align=center width="25%" bordercolor=#D8D8D8 border=1>
		<TR>
			<TH>Interview Id</TH>
			<TD><SELECT NAME="InterviewId" class='ListBox'>
			<OPTION Value="">Select</OPTION>

<%
	try{            con = com.PrisonManager.ConnectionPool.getConnection();
			stmt =  con.createStatement();

			
				Query1 = "Select * from interviewrequests where RequestStatus='Requested' order by `interviewid` ";
			
			
			String str="";
			System.out.println(Query1);
			rs = stmt.executeQuery(Query1);
			int rCount=0;
				while(rs.next()){
					String x = rs.getString(1);
					ConValues[i]=x;
					%><OPTION Value=<%=ConValues[i]%>><%=ConValues[i]%></OPTION><%
					i++;
				}
			stmt.close();
			con.close();
		}catch(Exception e){
			stmt.close();
			con.close();
			throw new Exception(e);
		}
%>
		</SELECT></TD>
		</TR>
                <TR>
                    <TH>Request Type</TH>
                    <TD>
                        
                       <SELECT NAME="Status" class='ListBox'>
			<OPTION Value="">Select</OPTION>
                        <OPTION Value="Requested">Requested</OPTION>
                        <OPTION Value="Approved">Approved</OPTION>
                        <OPTION Value="Rejected">Rejected</OPTION>
                    </TD>
                </TR>
		<TR><TD align=center Colspan=2><Input type='Submit' name='submit' value='submit request'></TD></TR>
		</TABLE>
</FORM>

<%}else{%>
<%
	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	String InterviewID = request.getParameter("InterviewId");
        String Status = request.getParameter("Status");
         System.out.println(InterviewID+" hi   "+Status);
	try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/prisonhouse","root","root");
			stmt =  con.createStatement();
	
			String Query = "update interviewrequests set RequestStatus = '"+Status+"'" +
                                " where interviewid = '"+InterviewID+"'";
                        int ij = stmt.executeUpdate(Query);
                        
                        
                        if(ij==1)
                        {%>
                            <P align=center><B>Interview request validated<B></P>
                                    <BR><BR>
                       <% }
else
{%>
                            <P align=center><B>Error in updating..please try again<B></P>
                                    <BR><BR>
                       <% }
			
			stmt.close();
			con.close();
		}catch(Exception e){
			stmt.close();
			con.close();
			throw new Exception(e);
		}
%>

<%}%>

</BODY>
