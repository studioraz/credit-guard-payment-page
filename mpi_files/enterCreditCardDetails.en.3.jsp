<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" errorPage="/error.jsp"%>
<jsp:useBean id="transactionDetails" scope="request" type="com.creditguard.common.transactions.TransactionDetails" />
<%@ page import="java.text.DecimalFormat" %>
<%@ include file="/merchantPages/ResponsiveWebSources/includes/main.jsp" %>

<%! DecimalFormat formatter = new DecimalFormat("0.00"); %>
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setDateHeader("Expires", -1);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">

<head>
<meta http-equiv="X-UA-Compatible" content="IE=9">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="expires" content="-1">
<script src="merchantPages/ResponsiveWebSources/js/EN.js"></script>
<script src="merchantPages/ResponsiveWebSources/js/main.js"></script>

<meta name="viewport" content="width=device-width">
<link href="merchantPages/ResponsiveWebSources/css/normalize.css" rel="stylesheet" type="text/css" /> 
<link href="merchantPages/ResponsiveWebSources/css/grid.css" rel="stylesheet" type="text/css" /> 
<link href="merchantPages/ResponsiveWebSources/css/responsive.main.rtl.css" rel="stylesheet" type="text/css" /> 
<link href="merchantPages/ResponsiveWebSources/css/responsive.main.ltr.css" rel="stylesheet" type="text/css" />

<title>Secured Payment</title>
</head>
<body onload="onLoad();">

<!--  DISPLAY TRANSACTION INFORMATION -->
<div class="container">
	


<div class="grid_12" width="100%">
	<div class="grid_6 row1 logo">&nbsp;</div>
</div>
	
<div class="grid_12 row2 sep"></div>

<div class="grid_12 row2 page_title">Secured Payment</div>

<div class="grid_12 row2 page_desc">
		<em>In this page you can pay for the order you placed on the site.<br />
		The payment process is fully secure and complies with the highest standards of data protection.<br />
		Please first confirm the details of the payment amount and the installment details.<br />
		Then, please insert your credit card details as required below.<br />
		Payment for the order will only be auctioned after you click on the "Pay" button at the bottom on the screen.</em>
</div>

<form id="creditForm" onsubmit="return validateForm();" method="POST" action="ProcessCreditCard">
	<input type="hidden" name="txId" value="<%=mpiTxnId%>" />
	<input type="hidden" name="lang" value="<%=lang%>" />
	<input type="hidden" name="track2" id="track2" value="" autocomplete="off" />
	<input type="hidden" name="last4d" value="" autocomplete="off" />
	<input type="hidden" name="transactionCode" value="Phone" autocomplete="off" />
	<!--<input type="hidden" name="userData1" value="" />
	<input type="hidden" name="userData2" value="" />
	<input type="hidden" name="userData3" value="" />
	<input type="hidden" name="userData4" value="" />
	<input type="hidden" name="userData5" value="" />
	<input type="hidden" name="userData6" value="" />
	<input type="hidden" name="userData7" value="" />
	<input type="hidden" name="userData8" value="" />
	<input type="hidden" name="userData9" value="" />
	<input type="hidden" name="userData10" value="" />-->
	

	<div class="grid_12 row3 td_style_1">
		Secured Payments Details 
	</div>

	<div class="grid_12 row4">
			<div class="grid_1 row4 td_style_fieldName">
				Amount of charge:
			</div>

			<div id="amount" class="grid_3 row4 td_style_fieldValue">
				<%=amountForDisplay%>
			</div>

			<div class="responsive_page_line_break"></div>

			<div class="grid_1 row4 td_style_fieldName">
				 Payer Email:
			</div>

			<div class="grid_3 row4 td_style_fieldValue responsive_value_field_width_limit">
				 <%=customerEmail%> 
			</div>
	</div>

	<div class="grid_12 row5">
			<div class="grid_1 row5 td_style_fieldName">
				 Currency:
			</div>

			<div class="grid_3 row5 td_style_fieldValue">
				<%=currency%> 
			</div>

			<div class="responsive_page_line_break"></div>

			<div class="grid_1 row5 td_style_fieldName">
				Order ID:
			</div>

			<div class="grid_3 row5 td_style_fieldValue responsive_value_field_width_limit">
				<%=orderId%> 
			</div>
	</div>

	<div class="grid_12 row6">
			<div class="grid_1 row6 td_style_fieldName">
				Description:
			</div>

			<div class="grid_8 row6 td_style_fieldValue responsive_value_field_width_limit">
				<%=description%>
			</div>
	</div>

	<div class="grid_12 row7 td_style_1">
		Credit card details
	</div>

	<div class="grid_12 row8">
			<div class="grid_1 row8 td_style_fieldName">
				Card Number:
			</div>
			<div class="grid_8 row8 td_style_fieldValue">
				<input type="text" pattern="[0-9]*" id="cardNumber" name="cardNumber" maxlength="40" width="100%" dir="ltr" autocomplete="off" onkeyup="limitInput(this,40)" onchange="return validateCardNumber();" disabled />
			</div>
			<div class="grid_4 row8 td_style_invalidField invalid_field_place_holder">&nbsp;</div>
			<div class="grid_8 row8 td_style_invalidField" id="invalidCardNumber">&nbsp;</div>
			<div class="grid_4 row8 td_style_invalidField invalid_field_place_holder">&nbsp;</div>
			<div class="grid_8 row8 td_style_invalidField" id="invalidTrack2">&nbsp;</div>
	</div>
	<div class="grid_12 row9">
			<div class="grid_1 row9 td_style_fieldName">
				Card Expiration:
			</div>
			<div class="grid_8 row9 td_style_fieldValue">
				<select id="expYear" name="expYear" onchange="validateExpDateOnChange();" disabled >
					<%=expYear%>
				</select>
				-
				<select id="expMonth" name="expMonth" onchange="validateExpDateOnChange();" disabled >
					<option value=""></option>
					<option value="01">01</option>
					<option value="02">02</option>
					<option value="03">03</option>
					<option value="04">04</option>
					<option value="05">05</option>
					<option value="06">06</option>
					<option value="07">07</option>
					<option value="08">08</option>
					<option value="09">09</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
				</select>
			</div>
			<div class="grid_1 row9 invalid_field_place_holder">&nbsp;</div>
			<div class="grid_8 row9 td_style_invalidField" id="invalidCardExp">&nbsp;</div>
	</div>

	<%=getResponsivePaymentsHTML("EN",true)%>

		<div id="form_buttons" class="grid_12 row13 td_style_fieldValue">
			<input type="submit" id="submitBtn" value="Pay" disabled /> 
			<input id="resetBtn" type="reset" value="Reset" onclick="clearFields()" disabled /> 
			<%=getCancelBtnHTML("CANCEL")%>
		</div>

</form>

<%=getPayPalHTML("EN")%>

<div id="loading" class="loading_invisible"><p id="loadingMsg" class="loading_invisible"></p></div>

<div class="grid_12 row14" height="100%" style="max-height: 3em;">		
	<img class="row14 pci_image" width="12.1%" src="merchantPages/ResponsiveWebSources/images/pci_slice.gif" alt="pci logo" title="pci logo"/>
	<img class="row14 pci_image" width="16%" src="merchantPages/ResponsiveWebSources/images/mastercard_slice.gif" alt="mastercard" title="mastercard"/>
	<img class="row14 pci_image" width="16%" src="merchantPages/ResponsiveWebSources/images/visa_slice.gif" alt="visa" title="visa"/>
	<div class="responsive_page_line_break"></div>
	<!-- GeoTrust True Site [tm] Smart Icon tag. Do not edit. -->	
	<div class="row14 pci_image" width="16%">
		<SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript" SRC="//smarticon.geotrust.com/si.js"></SCRIPT>
	</div>
	<!-- end GeoTrust Smart Icon tag -->
</div>	
</div>


</body>

</html>
