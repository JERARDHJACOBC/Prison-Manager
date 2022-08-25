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
			if(ChkMandatoryField(frm.PrisonerId,'PrisonerId')==false) return false;
			if(ChkNumField(frm.PrisonerId,'PrisonerId')==false) return false;
			if(ChkMandatoryField(frm.StaffId,'StaffId')==false) return false;
			if(ChkNumField(frm.StaffId,'StaffId')==false) return false;
			if(ChkMandatoryField(frm.RequestDate,'RequestDate')==false) return false;
			if(ChkDateField(frm.RequestDate,'RequestDate')==false) return false;
			if(ChkMandatoryField(frm.Reason,'Reason')==false) return false;
			if(ChkMandatoryField(frm.Status,'Status')==false) return false;
			//if(ChkMandatoryField(frm.ApprovalDate,'ApprovalDate')==false) return false;
			//if(ChkDateField(frm.ApprovalDate,'ApprovalDate')==false) return false;
			if(ChkMandatoryField(frm.From,'From')==false) return false;
			if(ChkDateField(frm.From,'From')==false) return false;
			if(ChkMandatoryField(frm.To,'To')==false) return false;
			if(ChkDateField(frm.To,'To')==false) return false;
			//if(ChkMandatoryField(frm.ApprovedBy,'ApprovedBy')==false) return false;
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
	<H3 align=center>Make Parole Request</H3>
	<FORM ACTION="SaveParoleRequest.jsp" onsubmit="return validate()">
	<TABLE align=center width="50%">

		<TR>
				<TH align="left">PrisonerId<FONT COLOR="red">*</FONT></TH>
				<TD> <Select name="PrisonerId" value= ""  class=ListBox>
                                        <Option value="">Select</Option>
                                        <%
                                        while(DataItr.hasNext()){
                                            String DataName = (String)DataItr.next();
                                            %><Option value=<%=DataName%> ><%=DataName%></Option><%
                                        }
                                        %>
                                        </Select>
                                    <a class=genlinks onclick = "viewDetails('PrisonerId','Prisoners')"></a> 
                               </TD>
		</TR>
		<TR>
				<TH align="left">StaffId<FONT COLOR="red">*</FONT></TH>
				<TD> 
                                   <Select name="StaffId" value= ""  class=ListBox>
                                        <Option value="">Select</Option>
                                        <%
                                        while(sDataItr.hasNext()){
                                            String sDataName = (String)sDataItr.next();
                                            %><Option value=<%=sDataName%> ><%=sDataName%></Option><%
                                        }
                                        %>
                                    </Select>
                                    <a class=genlinks onclick = "viewDetails('StaffId','StaffDetails')"></a>
                                </TD>
		</TR>
		<TR>
				<TH align="left">RequestDate<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text Class=TextField name='RequestDate' value=''><img onkeypress="fnCalendar(this)" id="imgDate" style="CURSOR: hand" onClick="fnCalendar(this)" height="16" src="Images/CalDis.gif" width="16" border="0" name="imgDate" onMouseOver="fnEnableCalLookup(this)" onMouseOut="fnDisableCalLookup(this)" ></TD>
		</TR>
		<TR>
				<TH align="left">Reason<FONT COLOR="red">*</FONT></TH>
				<TD><textarea name=Reason  Class=TextField ></textarea></TD>
		</TR>
		
		<TR>
				<TH align="left">From<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text Class=TextField name='From' value=''><img onkeypress="fnCalendar(this)" id="imgDate" style="CURSOR: hand" onClick="fnCalendar(this)" height="16" src="Images/CalDis.gif" width="16" border="0" name="imgDate" onMouseOver="fnEnableCalLookup(this)" onMouseOut="fnDisableCalLookup(this)" ></TD>
		</TR>
		<TR>
				<TH align="left">To<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text Class=TextField name='To' value=''><img onkeypress="fnCalendar(this)" id="imgDate" style="CURSOR: hand" onClick="fnCalendar(this)" height="16" src="Images/CalDis.gif" width="16" border="0" name="imgDate" onMouseOver="fnEnableCalLookup(this)" onMouseOut="fnDisableCalLookup(this)" ></TD>
		</TR>
		<Input type=hidden name='Status' value='Requested'>
                <Input type=Hidden name='ApprovalDate' value='0000-00-00'>
                <Input type=Hidden name='ApprovedBy' value='NA'></TD>
		
		<TR><TH><INPUT TYPE="submit" value='Submit'></TH><TH><INPUT TYPE="reset" value='Clear'></TH></TR>
	</TABLE>
	<H6 align=center>Fields with <FONT SIZE="" COLOR="red">*</FONT> are mandatory </H6>
	</FORM>
	</BODY>

