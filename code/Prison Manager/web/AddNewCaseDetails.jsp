 <HTML>
    <HEAD>

    <script LANGUAGE="Javascript" SRC="validate.js"></script>

    <LINK href="styles.css" type="text/css" rel="stylesheet">
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
			if(ChkMandatoryField(frm.JudgementDate,'JudgementDate')==false) return false;
			if(ChkDateField(frm.JudgementDate,'JudgementDate')==false) return false;
			if(ChkMandatoryField(frm.CaseStartDate,'CaseStartDate')==false) return false;
			if(ChkDateField(frm.CaseStartDate,'CaseStartDate')==false) return false;
			if(ChkMandatoryField(frm.VictimsDetails,'VictimsDetails')==false) return false;
			if(ChkMandatoryField(frm.exhibits,'exhibits')==false) return false;
			if(ChkMandatoryField(frm.evidenceDetails,'evidenceDetails')==false) return false;
		}
	</script>
	</HEAD>
	<Body class=SC>
	<H2 align=center>Case</H2>
	<FORM ACTION="SaveNewCaseDetails.jsp" onsubmit="return validate()">
	<TABLE align=center width="50%">

		<TR>
				<TH align="left">CaseType<FONT COLOR="red">*</FONT></TH>
				<TD><select name=CaseType class='ListBox'><option value=Civil>Civil</option><option value=Criminal>Criminal</option></select></TD>
		</TR>
		<TR>
				<TH align="left">CaseDetails<FONT COLOR="red">*</FONT></TH>
				<TD><textarea name=CaseDetails></textarea></TD>
		</TR>
		<TR>
				<TH align="left">CourtName<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='CourtName' value=''></TD>
		</TR>
		<TR>
				<TH align="left">CourtAddress<FONT COLOR="red">*</FONT></TH>
				<TD><textarea name=CourtAddress></textarea></TD>
		</TR>
		<TR>
				<TH align="left">JudgeName<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='JudgeName' value=''></TD>
		</TR>
		<TR>
				<TH align="left">JudgementDate<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='JudgementDate' value=''><img onkeypress="fnCalendar(this)" id="imgDate" style="CURSOR: hand" onClick="fnCalendar(this)" height="16" src="Images/CalDis.gif" width="16" border="0" name="imgDate" onMouseOver="fnEnableCalLookup(this)" onMouseOut="fnDisableCalLookup(this)" ></TD>
		</TR>
		<TR>
				<TH align="left">CaseStartDate<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='CaseStartDate' value=''><img onkeypress="fnCalendar(this)" id="imgDate" style="CURSOR: hand" onClick="fnCalendar(this)" height="16" src="Images/CalDis.gif" width="16" border="0" name="imgDate" onMouseOver="fnEnableCalLookup(this)" onMouseOut="fnDisableCalLookup(this)" ></TD>
		</TR>
		<TR>
				<TH align="left">VictimsDetails<FONT COLOR="red">*</FONT></TH>
				<TD><textarea name=VictimsDetails></textarea></TD>
		</TR>
		<TR>
				<TH align="left">exhibits<FONT COLOR="red">*</FONT></TH>
				<TD><textarea name=exhibits></textarea></TD>
		</TR>
		<TR>
				<TH align="left">evidenceDetails<FONT COLOR="red">*</FONT></TH>
				<TD><textarea name=evidenceDetails></textarea></TD>
		</TR>
		<TR><TH><INPUT TYPE="submit" value='Submit'></TH><TH><INPUT TYPE="reset" value='Clear'></TH></TR>
	</TABLE>
	<H6 align=center>Fields with <FONT SIZE="" COLOR="red">*</FONT> are mandatory </H6>
	</FORM>
	</BODY>

