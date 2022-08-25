<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*"%>
<%@ page isErrorPage="false" %>
<%@ page errorPage="errorPage.jsp" %>
<HEAD>
    <LINK href="styles/styles.css" type="text/css" rel="stylesheet">
<BODY class=SC>
    <BR><BR><BR>
<%
if(!(request.getMethod().equals("POST")))
{

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	String Condition = "ParoleId";
	String[] ConValues = new String[2000];
	int ConCount=0,i=0;
	String Query1="";
%>
<FORM Name='DelForm' METHOD=POST ACTION="">
		
		<TABLE align=center width="25%" bordercolor=#D8D8D8 border=1>
                     <TR>
		<TH class='row_title' colspan=2>Delete Parole Request</TH>
		</TR>
		<TR>
			<TH><%=Condition.replace('`',' ').toUpperCase()%></TH>
			<TD><SELECT NAME="<%=Condition%>">
			<OPTION Value="">Select</OPTION>

<%
	try{
			con = com.PrisonManager.ConnectionPool.getConnection();
			stmt =  con.createStatement();

			if(Condition.trim().equalsIgnoreCase("undefined")){
				System.out.println("in if");
				Query1 = "Select * from parole";
			}
			else{
				System.out.println("in else");
				Query1 = "Select "+Condition+" from parole group by "+Condition;
			}
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
		<TR><TD align=center Colspan=2><Input type='Submit' name='submit' value='Delete'></TD></TR>
		</TABLE>
</FORM>
<H6 align=center> Select a record to delete from database </H6>
<%}else{%>
<%
	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	String Value = request.getParameter("ParoleId");
	try{
			con = com.PrisonManager.ConnectionPool.getConnection();
			stmt =  con.createStatement();
	
			
			String Query = "Delete from parole where ParoleId='"+Value+"'";
			int result = stmt.executeUpdate(Query);
			if( result > 0)	{
				%><P align=center><B>Deleted from the database sucessfully<B></P><%
			}
			else{
				%><P align=center><B>Error in deletion..please try again<B></P><% 
			}
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
