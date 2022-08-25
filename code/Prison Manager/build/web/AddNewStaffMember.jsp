<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*"%>
<%@ page isErrorPage="false" %>
<%@ page errorPage="errorPage.jsp" %>
<%

java.util.ArrayList DataList = com.PrisonManager.MyFunctions.getPropList("LocationId","Locationdetails");
java.util.Iterator DataItr = null;
 
if(DataList!=null){
    System.out.println("Data"+DataList); 
    DataItr = DataList.iterator();      
}

%>
<HEAD>
	<LINK href="styles/styles.css" type="text/css" rel="stylesheet">

    <script LANGUAGE="Javascript" SRC="Images/calender.js"></script>
    <script LANGUAGE="Javascript" SRC="utilities.js"></script>
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
			if(ChkMandatoryField(frm.Name,'Name')==false) return false;
			if(ChkAlphaField(frm.Name,'Name')==false) return false;
			if(ChkMandatoryField(frm.Age,'Age')==false) return false;
			if(ChkNumField(frm.Age,'Age')==false) return false;
			if(ChkMandatoryField(frm.Designation,'Designation')==false) return false;
			if(ChkAlphaField(frm.Designation,'Designation')==false) return false;
			if(ChkMandatoryField(frm.DateOfJoining,'DateOfJoining')==false) return false;
			if(ChkDateField(frm.DateOfJoining,'DateOfJoining')==false) return false;
			if(ChkMandatoryField(frm.Address,'Address')==false) return false;
			if(ChkMandatoryField(frm.Salary,'Salary')==false) return false;
			if(ChkNumField(frm.Salary,'Salary')==false) return false;
			if(ChkMandatoryField(frm.LocationId,'LocationId')==false) return false;
			if(ChkNumField(frm.LocationId,'LocationId')==false) return false;
		}
                function viewDetails()
                {
                      var frm = document.forms(0);  
                      var val = frm.LocationId.options(frm.LocationId.options.selectedIndex).value;
                      if(val==""){
                          alert("Please select Locationid to view details");
                          return false;
                      }
                      var url = "ShowLocationPopup.jsp?LocationId="+val;
                      fnPopupWindow(url,300,300);
                     // window.open(url,'','locationbar=no;addressbar=no;status=no;');
                }
	</script>
	</HEAD>
	<Body class=SC>
	<BR><BR><BR>
	<FORM ACTION="SaveNewStaffMember.jsp" onsubmit="return validate()">
	<TABLE align=center width="50%">
                  <TR>
				<TH class='row_title' colspan=2>Add New Staff member</TH>
		</TR>
		<TR>
				<TH align="left">Name<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text class=TextField name='Name' value=''></TD>
		</TR>
		<TR>
				<TH align="left">Age<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text class=TextField name='Age' value=''></TD>
		</TR>
		<TR>
				<TH align="left">Designation<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text class=TextField name='Designation' value=''></TD>
		</TR>
		<TR>
				<TH align="left">Date Of Joining<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text class=TextField name='DateOfJoining' value=''><img onkeypress="fnCalendar(this)" id="imgDate" style="CURSOR: hand" onClick="fnCalendar(this)" height="16" src="Images/CalDis.gif" width="16" border="0" name="imgDate" onMouseOver="fnEnableCalLookup(this)" onMouseOut="fnDisableCalLookup(this)" ></TD>
		</TR>
		<TR>
				<TH align="left">Address<FONT COLOR="red">*</FONT></TH>
				<TD><textarea name=Address class=TextField></textarea></TD>
		</TR>
		<TR>
				<TH align="left">Salary<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text class=TextField name='Salary' value=''></TD>
		</TR>
		<TR>
				<TH align="left">LocationId<FONT COLOR="red">*</FONT></TH>
				<TD>
                                     <Select name="LocationId" value= ""  class=ListBox>
                                        <Option value="">Select</Option>
                                        <%
                                        while(DataItr.hasNext()){
                                            String DataName = (String)DataItr.next();
                                            %><Option value=<%=DataName%> ><%=DataName%></Option><%
                                        }
                                        %>
                                        </Select>
                                    <a class=genlinks onclick = "viewDetails()"></a> 
                                 </TD>
		</TR>
		<TR><TH><INPUT TYPE="submit" value='Submit'></TH><TH><INPUT TYPE="reset" value='Clear'></TH></TR>
	</TABLE>
	<H6 align=center>Fields with <FONT SIZE="" COLOR="red">*</FONT> are mandatory </H6>
	</FORM>
	</BODY>

