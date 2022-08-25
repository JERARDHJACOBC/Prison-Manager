<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*"%>
<%@ page isErrorPage="false" %>
<%@ page errorPage="errorPage.jsp" %>
<HEAD>
	<LINK href="styles/styles.css" type="text/css" rel="stylesheet">
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
			if(ChkMandatoryField(frm.UserId,'UserId')==false) return false;
			if(ChkAlphaField(frm.UserId,'UserId')==false) return false;
			if(ChkMandatoryField(frm.Password,'Password')==false) return false;
			if(ChkAlphaNumericField(frm.Password,'Password')==false) return false;
			if(ChkMandatoryField(frm.Auth,'Auth')==false) return false;
			if(ChkAlphaField(frm.Auth,'Auth')==false) return false;
		}
	</script>
	</HEAD>
	<Body class=SC>
	<BR><BR><BR>
	<FORM ACTION="SaveNewUser.jsp" onsubmit="return validate()">
	<TABLE align=center width="50%">
                 <TR>
				<TH class='row_title' colspan=3>Add New User</TH>
		</TR>
		<TR>
				<TH align="left">UserId<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='UserId' value=''></TD>
		</TR>
		<TR>
				<TH align="left">Password<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=password name='Password' value=''></TD>
		</TR>
		<TR>
				<TH align="left">Auth<FONT COLOR="red">*</FONT></TH>
				<TD><select name=Auth><option value=Admin>Admin</option><option value=Staff>Staff</option><option value=User>User</option></select></TD>
		</TR>
		<TR><TH><INPUT TYPE="submit" value='Submit'></TH><TH><INPUT TYPE="reset" value='Clear'></TH></TR>
	</TABLE>
	<H6 align=center>Fields with <FONT SIZE="" COLOR="red">*</FONT> are mandatory </H6>
        
	</FORM>
         <P align=center><a href='ManageUsers.jsp'>User Home</a></P>
	</BODY>

