<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*"%>
<%@ page isErrorPage="false" %>
<%@ page errorPage="errorPage.jsp" %>
<HEAD>
	<LINK href="styles/styles.css" type="text/css" rel="stylesheet">
<script LANGUAGE="Javascript" SRC="utilities.js"></script>
<script>
   
    function validate(){
        var Opt = document.getElementsByName("InterviewId");
        var StartTimeHH = document.getElementsByName("StartTimeHH");
        var StartTimeMM = document.getElementsByName("StartTimeMM");
        var EndTimeHH = document.getElementsByName("EndTimeHH");
        var EndTimeMM = document.getElementsByName("EndTimeMM");
        var value = "";
        var intid="";
        var StartTimeHHValue = "";
        var StartTimeMMValue = "";
        var EndTimeHHValue = "";
        var EndTimeMMValue = "";
        for(i=0;i<Opt.length;i++){
            if(Opt[i].checked==true){
               StartTimeHHValue = StartTimeHH[i].value;
               StartTimeMMValue = StartTimeMM[i].value;
               EndTimeHHValue = EndTimeHH[i].value;
               EndTimeMMValue = EndTimeMM[i].value;
               intid = Opt[i].value;
               //alert(StartTimeHH[i].value+":"+StartTimeMM[i].value);
               //alert(EndTimeHH[i].value+":"+EndTimeMM[i].value);
               flag = true;
               break;
            }else{
               flag = false;
            }
        }
       if(flag==false){
           alert("Please select an option to provide slot");
           return false;
       }else{
        var url = "SaveSlot.jsp?InterviewId="+intid+"&StartTimeHHValue="
        +StartTimeHHValue+"&StartTimeMMValue="
        +StartTimeMMValue+"&EndTimeHHValue="
        +EndTimeHHValue+"&EndTimeMMValue="
        +EndTimeMMValue;
        
        document.forms(0).action = url;
        document.forms(0).submit();
       }
       return flag;
    }
</script>
</HEAD>
<BODY class=SC>
<H3 align=center>Provide Interview Slot</H3>
<Form name="ValidateRequestsForm" action="" onsubmit="return validate();">

<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	try{
			
			con = com.PrisonManager.ConnectionPool.getConnection();
                        stmt =  con.createStatement();
			String Query = "Select * from interviewrequests where RequestStatus=\'Approved\' order by `interviewid`";
			rs = stmt.executeQuery(Query);
			%>
						<table align="center" width="100%">
							<tr class=row_title>
							<th align="left">Select</th>
                                                         <th align="left">Interview Id</th>
                                                         <th align="left">Request Date</th>
                                                         <th align="left">Requested By</th>
                                                         <th align="left">Prisoner Id</th>
                                                         <th align="left">Relationship</th>
                                                         <th align="left">Address</th>
                                                         <th align="left">Timeslot From (HH:MM)</th>
                                                         <th align="left">Timeslot To (HH:MM)</th>
                                                         <th align="left">Staff Id</th>
                                                         <th align="left">Request Status</th>
                                                         <th align="left">Purpose</th>
							</tr>
					<%
			int rCount=0;
			while(rs.next())
			{
                            String InterviewId = rs.getString(1);
                            String Status = rs.getString(10);
					%>
					<tr class= '<%=(rCount%2!=0)? "row_even" : "row_odd"%>'>
                                                 <td><input type="radio" name="interviewid" value='<%=InterviewId%>'></td>
						 <td><%=InterviewId+""%></td>
                                                 <td><%=rs.getString(2)%></td>
                                                 <td><%=rs.getString(3)%></td>
                                                 <td><%=rs.getString(4)%></td>
                                                 <td><%=rs.getString(5)%></td>
                                                 <td><%=rs.getString(6)%></td>
                                                 <td align=center><B><%=rs.getString(7)%></B>
                                                     <Select Name="StartTimeHH" class="ListBox">
                                                     <script>
                                                         for(i=0;i<=20;i++){
                                                             document.writeln("<option value="+i+">"+i+"</option>");
                                                         }
                                                     </script>
                                                    </select>:<Select Name="StartTimeMM" class="ListBox">
                                                     <script>
                                                         for(i=0;i<=59;i+=15){
                                                             document.writeln("<option value="+i+">"+i+"</option>");
                                                         }
                                                     </script>
                                                    </select>
                                                    
                                                 </td>
                                                 <td align=center><B><%=rs.getString(8)%></B>
                                                    <Select Name="EndTimeHH" class="ListBox">
                                                     <script>
                                                         for(i=0;i<=20;i++){
                                                             document.writeln("<option value="+i+">"+i+"</option>");
                                                         }
                                                     </script>
                                                    </select>:<Select Name="EndTimeMM" class="ListBox">
                                                     <script>
                                                         for(i=0;i<=59;i+=15){
                                                             document.writeln("<option value="+i+">"+i+"</option>");
                                                         }
                                                     </script>
                                                    </select>
                                                 </td>
                                                 <td><%=rs.getString(9)%></td>
                                                 <td><%=Status%></td>
                                                 <td><%=rs.getString(11)%></td>
					</tr>
					<%
				rCount++;
			}
			if( rCount == 0)	{%><tr><td colspan=12 align=center>Sorry No records Found</td></tr><% }
                        else{
                            %><tr><td colspan=12 align=center>
                                
                                <Input type="Submit" value="Provide Slot" ></td></tr><% 
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
