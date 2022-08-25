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
String PrisonerId = request.getParameter("PrisonerId");	
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
			if(ChkMandatoryField(frm.CaseType,'CaseType')==false) return false;
			if(ChkAlphaField(frm.CaseType,'CaseType')==false) return false;
			if(ChkMandatoryField(frm.CaseDetails,'CaseDetails')==false) return false;
			if(ChkMandatoryField(frm.CourtName,'CourtName')==false) return false;
			if(ChkAlphaField(frm.CourtName,'CourtName')==false) return false;
			if(ChkMandatoryField(frm.CourtAddress,'CourtAddress')==false) return false;
			if(ChkMandatoryField(frm.JudgeName,'JudgeName')==false) return false;
			if(ChkAlphaField(frm.JudgeName,'JudgeName')==false) return false;
			if(ChkDateField(frm.JudgementDate,'JudgementDate')==false) return false;
			if(ChkMandatoryField(frm.CaseStartDate,'CaseStartDate')==false) return false;
			if(ChkDateField(frm.CaseStartDate,'CaseStartDate')==false) return false;
			if(ChkMandatoryField(frm.VictimsDetails,'VictimsDetails')==false) return false;
			if(ChkMandatoryField(frm.exhibits,'exhibits')==false) return false;
			if(ChkMandatoryField(frm.evidenceDetails,'evidenceDetails')==false) return false;
			if(ChkMandatoryField(frm.PrisonerId,'PrisonerId')==false) return false;
			if(ChkNumField(frm.PrisonerId,'PrisonerId')==false) return false;
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
	<BR><BR><BR>
	<FORM ACTION="SaveCaseDetails.jsp" onsubmit="return validate()">
	<TABLE align=center width="50%">

		<TR>
				<TH align="left">Case Type<FONT COLOR="red">*</FONT></TH>
				<TD><select name=CaseType><option value=Civil>Civil</option><option value=Criminal>Criminal</option></select></TD>
		</TR>
		<TR>
				<TH align="left">Case Details<FONT COLOR="red">*</FONT></TH>
				<TD><textarea class="TextField"  name=CaseDetails></textarea></TD>
		</TR>
		<TR>
				<TH align="left">Court Name<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text  class="TextField"  name='CourtName' value=''></TD>
		</TR>
		<TR>
				<TH align="left">Court Address<FONT COLOR="red">*</FONT></TH>
				<TD><textarea class="TextField"  name=CourtAddress></textarea></TD>
		</TR>
		<TR>
				<TH align="left">Judge Name<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text  class="TextField"  name='JudgeName' value=''></TD>
		</TR>
		<TR>
				<TH align="left">Judgement Date</TH>
				<TD><Input type=text  class="TextField"  name='JudgementDate' value='' readonly><img onkeypress="fnCalendar(this)" id="imgDate" style="CURSOR: hand" onClick="fnCalendar(this)" height="16" src="Images/CalDis.gif" width="16" border="0" name="imgDate" onMouseOver="fnEnableCalLookup(this)" onMouseOut="fnDisableCalLookup(this)" ></TD>
		</TR>
		<TR>
				<TH align="left">Case Start Date<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text  class="TextField"  name='CaseStartDate' value=''  readonly><img onkeypress="fnCalendar(this)" id="imgDate" style="CURSOR: hand" onClick="fnCalendar(this)" height="16" src="Images/CalDis.gif" width="16" border="0" name="imgDate" onMouseOver="fnEnableCalLookup(this)" onMouseOut="fnDisableCalLookup(this)" ></TD>
		</TR>
		<TR>
				<TH align="left">Victims Details<FONT COLOR="red">*</FONT></TH>
				<TD><textarea class="TextField"  name=VictimsDetails></textarea></TD>
		</TR>
		<TR>
				<TH align="left">Exhibits<FONT COLOR="red">*</FONT></TH>
				<TD><textarea class="TextField"  name=exhibits></textarea></TD>
		</TR>
		<TR>
				<TH align="left">Evidence Details<FONT COLOR="red">*</FONT></TH>
				<TD><textarea class="TextField"  name=evidenceDetails></textarea></TD>
		</TR>
		<TR>
				<TH align="left">PrisonerId<FONT COLOR="red">*</FONT></TH>
				<TD> <Select name="PrisonerId" value= "<%=PrisonerId%>"  class=ListBox>
                                        <Option value="<%=PrisonerId%>"><%=PrisonerId%></Option>
                                   
                                    <a class=genlinks onclick = "viewDetails('PrisonerId','Prisoners')"></a> 
                               </TD>
		</TR>
		<TR><TH><INPUT TYPE="submit" value='Submit'></TH><TH><INPUT TYPE="reset" value='Clear'></TH></TR>
	</TABLE>
	<H6 align=center>Fields with <FONT SIZE="" COLOR="red">*</FONT> are mandatory </H6>
	</FORM>
	</BODY>


