<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*"%>
<%@ page isErrorPage="false" %>
<%@ page errorPage="errorPage.jsp" %>
<%
String user = (String)session.getAttribute("UserID");
%>
<HEAD>
	<LINK href="styles/styles.css" type="text/css" rel="stylesheet">
<script LANGUAGE="Javascript" SRC="utilities.js"></script>
<script LANGUAGE="Javascript" SRC="Images/calender.js"></script>
<script>
    function ToggleStatus(){
        var Opt = document.getElementsByName("Paroleid");
        var Status = document.getElementsByName("Status");
        var ApprovalDate = document.getElementsByName("ApprovalDate");
        var ApprovedBy = document.getElementsByName("ApprovedBy");
        for(i=0;i<Opt.length;i++){
            if(Opt[i].checked==true){
               Status[i].disabled = false;
               ApprovedBy[i].value = '<%=user%>';
            }else{
                 Status[i].disabled = true;
                  ApprovedBy[i].value = 'NA'
            }
        }
    }
    function validate(){
        var Opt = document.getElementsByName("Paroleid");
        var Status = document.getElementsByName("Status");
        var ApprovalDate = document.getElementsByName("ApprovalDate");
        var ApprovedBy = document.getElementsByName("ApprovedBy");
        var value = "",pid="",apdate="",appby="";
        var flag = false;
        for(i=0;i<Opt.length;i++){
            if(Opt[i].checked==true){
               value = Status[i].value;
               pid = Opt[i].value;
               appdate = ApprovalDate[i].value;
               appby = ApprovedBy[i].value;
               flag = true;
               break;
            }else{
                flag=false;
            }
        }
        
        if(flag == false){
            alert("Please select an option to validate");
            return false;
        }else if(appdate!= '0000-00-00'&& appdate!=''){
          var myurl = "SaveParoleValidation.jsp?Paroleid="+pid+"&ApprovalDate="+appdate+"&ApprovedBy="+appby+"&Status="+value;
         
          document.forms(0).action = myurl;
          document.forms(0).submit();
        }else{
            alert("Please select a valid date to proceed");
            return false;
        }
        return false;
    }
</script>
</HEAD>
<BODY class=SC>
    <BR><BR>
<h3 align=center>Validate Paroles</h3>
<Form name="ValidateParoleRequestsForm" onsubmit="return validate();">
<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	try{
			
			con = com.PrisonManager.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			String Query = "Select * from parole where Status=\'Requested\' order by `paroleid`";
			rs = stmt.executeQuery(Query);
			%>
						<table align="center" width="60%">
							<tr class=row_title>
							<th align="left">Select</th>
                                                         <th align="left">PrisonerId</th>
                                                         <th align="left">StaffId</th>
                                                         <th align="left">RequestDate</th>
                                                         <th align="left">Reason</th>
                                                         <th align="left">Status</th>
                                                         <th align="left">Validated On</th>
                                                         <th align="left">From</th>
                                                         <th align="left">To</th>
                                                         <th align="left">Validated By</th>
							</tr>
					<%
			int rCount=0;
			while(rs.next())
			{
                            String ParoleId = rs.getString(1);
                            String PrisonerId = rs.getString(2);
                            String StaffId = rs.getString(3);
                            String Status = rs.getString(6);
                            String AppDate = rs.getString(7);
					%>
					<tr class= '<%=(rCount%2!=0)? "row_even" : "row_odd"%>'>
                                                 <td><input type="radio" name="Paroleid" value='<%=ParoleId%>'onclick="ToggleStatus()"></td>
                                                 <td><a href='ShowPrisonersPopup.jsp?PrisonerId=<%=PrisonerId%>' target="_new"><%=PrisonerId%></a></td>
                                                 <td><a href='ShowStaffPopup.jsp?StaffId=<%=StaffId%>' target="_new"><%=StaffId%><a></td>
                                                 <td><%=rs.getString(4)%></td>
                                                 <td><%=rs.getString(5)%></td>
                                                 <td>
                                                     <select name='Status' class='ListBox' disabled >
                                                         <option value="">Select</option>
                                                         <option value="Requested" <%=(Status.equals("Requested"))? "Selected": ""%>>Requested</option>
                                                         <option value="Approved" <%=(Status.equals("Approved"))? "Selected": ""%>>Approved</option>
                                                         <option value="Rejected" <%=(Status.equals("Rejected"))? "Selected": ""%>>Rejected</option>
                                                     </select>
                                                 </td>
                                                 <td><input type=text class="TextField" readonly value='<%=AppDate%>' name="ApprovalDate"><img onkeypress="fnCalendar(this)" id="imgDate" style="CURSOR: hand" onClick="fnCalendar(this)" height="16" src="Images/CalDis.gif" width="16" border="0" name="imgDate" onMouseOver="fnEnableCalLookup(this)" onMouseOut="fnDisableCalLookup(this)" ></td>
                                                 <td><%=rs.getString(8)%></td>
                                                 <td><%=rs.getString(9)%></td>
                                                 <td><input type=text class="TextField" readonly value='<%=rs.getString(10)%>' name='ApprovedBy'></td>
					</tr>
					<%
				rCount++;
			}
                         if (rCount == 0) {%><tr><td align=center  colspan=10>Sorry No records Found</td></tr><% }
			else{
                            %><tr><td colspan=10 align=center>
                                
                                <Input type="Submit" value="Validate" ></td></tr><% 
                        }
                        rs.close();
			stmt.close();
			con.close();
		}catch(Exception e){
			//rs.close();
			stmt.close();
			con.close();
			throw new Exception(e);
		}
	
%>
</FORM>
</BODY>
