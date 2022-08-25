<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*"%>
<%@ page isErrorPage="false" %>
<%@ page errorPage="errorPage.jsp" %>
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
			if(ChkMandatoryField(frm.Name,'Name')==false) return false;
			if(ChkAlphaField(frm.Name,'Name')==false) return false;
			if(ChkMandatoryField(frm.Age,'Age')==false) return false;
			if(ChkNumField(frm.Age,'Age')==false) return false;
			if(ChkMandatoryField(frm.caseid,'caseid')==false) return false;
			if(ChkNumField(frm.caseid,'caseid')==false) return false;
			if(ChkMandatoryField(frm.FromDate,'FromDate')==false) return false;
			if(ChkDateField(frm.FromDate,'FromDate')==false) return false;
			if(ChkMandatoryField(frm.ToDate,'ToDate')==false) return false;
			if(ChkDateField(frm.ToDate,'ToDate')==false) return false;
			if(ChkMandatoryField(frm.Mode,'Mode')==false) return false;
			if(ChkAlphaField(frm.Mode,'Mode')==false) return false;
			if(ChkMandatoryField(frm.Address,'Address')==false) return false;
                        return fnValidateDate(frm.FromDate.value,frm.ToDate.value);
		}
	</script>
	</HEAD>
	<Body class=SC>
	<BR><BR><BR>
	<FORM ACTION="SavePrisoner.jsp" onsubmit="return validate()">
	<TABLE align=center width="50%">
                <TR>
				<TH class='row_title' colspan=6>New Prisoner</TH>
		</TR>
		<TR>
				<TH align="left">Name<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text class='TextField' name='Name' value=''></TD>
		</TR>
		<TR>
				<TH align="left">Age<FONT COLOR="red">*</FONT></TH>
                                <TD><Input type="number" class='TextField' name='Age' value=''>
                                     <Input type=hidden class='TextField' name='caseid' value='0'></TD>
		</TR>

		<TR>
				<TH align="left">FromDate<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text class='TextField' name='FromDate' value=''><img onkeypress="fnCalendar(this)" id="imgDate" style="CURSOR: hand" onClick="fnCalendar(this)" height="16" src="Images/CalDis.gif" width="16" border="0" name="imgDate" onMouseOver="fnEnableCalLookup(this)" onMouseOut="fnDisableCalLookup(this)" ></TD>
		</TR>
		<TR>
				<TH align="left">ToDate<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text class='TextField' name='ToDate' value=''><img onkeypress="fnCalendar(this)" id="imgDate" style="CURSOR: hand" onClick="fnCalendar(this)" height="16" src="Images/CalDis.gif" width="16" border="0" name="imgDate" onMouseOver="fnEnableCalLookup(this)" onMouseOut="fnDisableCalLookup(this)" ></TD>
		</TR>
		<TR>
				<TH align="left">Mode<FONT COLOR="red">*</FONT></TH>
				<TD><select name=Mode class='Listbox'><option value=Remand>Remand</option><option value=Imprison>Imprison</option></select></TD>
		</TR>
		<TR>
				<TH align="left">Address<FONT COLOR="red">*</FONT></TH>
				<TD><textarea name=Address class='TextField'></textarea></TD>
		</TR>
		<TR><TH><INPUT TYPE="submit" value='Submit'></TH><TH><INPUT TYPE="reset" value='Clear'></TH></TR>
	</TABLE>
	<H6 align=center>Fields with <FONT SIZE="" COLOR="red">*</FONT> are mandatory </H6>
	</FORM>
	</BODY>


