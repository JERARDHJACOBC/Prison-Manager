<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*"%>
<%@ page isErrorPage="false" %>
<%@ page errorPage="errorPage.jsp" %>
<%
java.util.ArrayList DataList = com.PrisonManager.MyFunctions.getPropList("prisonerid","prisoners");
java.util.Iterator DataItr = null;
 
if(DataList!=null){
    System.out.println("Data"+DataList); 
    DataItr = DataList.iterator();      
}

java.util.ArrayList sDataList = com.PrisonManager.MyFunctions.getPropList("staffid","staffdetails");
java.util.Iterator sDataItr = null;
 
if(sDataList!=null){
    System.out.println("sData"+sDataList); 
    sDataItr = sDataList.iterator();      
}

%>
<HEAD>
    <LINK href="styles/styles.css" type="text/css" rel="stylesheet">
    <script LANGUAGE="Javascript" SRC="utilities.js"></script>
    <script LANGUAGE="Javascript" SRC="Images/calender.js"></script>
    <script LANGUAGE="Javascript" >
		function ChkMandatoryField(F,T){
			var val= F.value;
			if(val==""){alert(T+" is mandatory");return false;}
		}
		function ChkNumField(F,T){
			var val = F.value;
			if(isNaN(val)==true||val==""){alert("Please enter numbers for "+T);return false;}
		}
		function ChkAlphaNumericField(F,T){
			var val = F.value;
			var pattern = /^([a-zA-Z0-9]{1,250})$/;
			if(!(pattern.test(val)==true)){alert("Please enter alphabets or numbers for "+T);return false;}
		}
		function ChkAlphaField(F,T){
			var val = F.value;
			var pattern = /^([a-zA-Z ]{1,250})$/;
			if(!(pattern.test(val)==true)){alert("Please enter text for "+T);return false;}
		}
		function ChkEmailField(F,T){
			var val = F.value;
			var pattern = /^([a-zA-Z0-9\_\.]{4,25})$/;
			if(!(pattern.test(val)==true)){alert("Please enter valid email for "+T);return false;}
		}
		function ChkDateField(F,T)
		{
			var val = F.value;
		    var pattern = /^[0-9]{4}-[0-9]{2}-[0-9]{2}$/;
		    if(!(pattern.test(val)==true)){alert("Please enter valid date format (yyyy-mm-dd) for "+T);return false;}
		}
		function validate()
		{
			var frm = document.forms(0);
			if(ChkMandatoryField(frm.StaffId,'StaffId')==false) return false;
			if(ChkMandatoryField(frm.DutyOn,'DutyOn')==false) return false;
			if(ChkDateField(frm.DutyOn,'DutyOn')==false) return false;
			if(ChkMandatoryField(frm.DutyAs,'DutyAs')==false) return false;
                         
                        return fnValidateTime(frm.StartTimeHH.value,frm.StartTimeMM.value,frm.EndTimeHH.value,frm.EndTimeMM.value);
		}
                  function viewDetails(objid,tablename)
                {
                     var obj = document.getElementById(objid);
                      var frm = document.forms(0);  
                      var val = obj.options(obj.options.selectedIndex).value;
                      if(val==""){
                          alert("Please select "+obj.name+" to view details");
                          return false;
                      }
                      var url="";
                      if(tablename=="StaffDetails")
                        url = "ShowStaffPopup.jsp?"+obj.name+"="+val+"&TableName="+tablename;
                      if(tablename=="Prisoners")
                        url = "ShowPrisonersPopup.jsp?"+obj.name+"="+val+"&TableName="+tablename;   
                      fnPopupWindow(url,300,300);
                }
	</script>
	</HEAD>
	<Body class=SC>
             <BR><BR>
	<H3 align=center>Assign Duty</H3>
	<FORM ACTION="SaveDuty.jsp" onsubmit="return validate()">
	<TABLE align=center width="50%">

		<TR>
				<TH align="left">Staff Id<FONT COLOR="red">*</FONT></TH>
				<TD> <Select name="StaffId" value= ""  class=ListBox>
                                        <Option value="">Select</Option>
                                        <%
                                        while(DataItr.hasNext()){
                                            String DataName = (String)DataItr.next();
                                            %><Option value=<%=DataName%> ><%=DataName%></Option><%
                                        }
                                        %>
                                        </Select>
                                    <a class=genlinks onclick = "viewDetails('StaffId','StaffDetails')"></a> 
                               </TD>
		</TR>
		<TR>
				<TH align="left">Duty On<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='DutyOn' value=''><img onkeypress="fnCalendar(this)" id="imgDate" style="CURSOR: hand" onClick="fnCalendar(this)" height="16" src="Images/CalDis.gif" width="16" border="0" name="imgDate" onMouseOver="fnEnableCalLookup(this)" onMouseOut="fnDisableCalLookup(this)" ></TD>
		</TR>
		<TR>
				<TH align="left">Shift From(HH:MM)<FONT COLOR="red">*</FONT></TH>
				<TD>
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
                                 </TD>
		</TR>
		<TR>
				<TH align="left">Shift To (HH:MM)<FONT COLOR="red">*</FONT></TH>
				<TD>
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
                                     </Select>
                                </TD>
		</TR>
		<TR>
				<TH align="left">Duty As<FONT COLOR="red">*</FONT></TH>
				<TD><select name=DutyAs><option value=Centry>Centry</option><option value=Outpost>Outpost</option><option value=General>General</option><option value=Escort>Escort</option></select></TD>
		</TR>
		<TR><TH><INPUT TYPE="submit" value='Submit'></TH><TH><INPUT TYPE="reset" value='Clear'></TH></TR>
	</TABLE>
	<H6 align=center>Fields with <FONT SIZE="" COLOR="red">*</FONT> are mandatory </H6>
	</FORM>
	</BODY>

