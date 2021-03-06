﻿<%@ page language="java" contentType="text/html; charset=utf-8"
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
<script src="merchantPages/ResponsiveWebSources/js/<%=lang%>.js"></script>
<script src="merchantPages/ResponsiveWebSources/js/main.js"></script>

<meta name="viewport" content="width=device-width">
<link href="merchantPages/ResponsiveWebSources/css/normalize.css" rel="stylesheet" type="text/css" /> 
<link href="merchantPages/ResponsiveWebSources/css/grid.css" rel="stylesheet" type="text/css" /> 
<link href="merchantPages/ResponsiveWebSources/css/responsive.main.rtl.css" rel="stylesheet" type="text/css" />
<link href="css/cg-design.css" rel="stylesheet" type="text/css" />
<%=responsiveEngCSS%>

<title><%=pageTitle%></title>
</head>
<body onload="onLoad();">

<!--  DISPLAY TRANSACTION INFORMATION -->
<div class="container">
	


<div class="grid_12" width="100%">
	<div class="grid_6 row1 logo">&nbsp;</div>
</div>
	
<div class="grid_12 row2 sep"></div>

<div class="grid_12 row2 page_title"><%=pageTitle%></div>

<div class="grid_12 row2 page_desc"><%=pageDesc%></div>

<form id="creditForm" onsubmit="return validateFormTrack2CardNo();" method="POST" action="ProcessCreditCard">
	<input type="hidden" name="txId" value="<%=mpiTxnId%>" />
	<input type="hidden" name="lang" value="<%=lang%>" />
	<input type="hidden" name="cardNumber" id="cardNumber" value="" autocomplete="off" />
	<input type="hidden" name="track2" id="track2" value="" autocomplete="off" />
	<input type="hidden" name="last4d" value="" autocomplete="off" />
	<input type="hidden" name="transactionCode" value="Phone" autocomplete="off" />
	<input type="hidden" id="listPaymentsInterestValues" name="listPaymentsInterestValues" value="<%=listPaymentsInterestValues%>" />
	<input type="hidden" id="listNumberOfPaymentsValues" name="listNumberOfPaymentsValues" value="<%=listNumberOfPaymentsValues%>" />
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
		<%=paymentDetails%> 
	</div>

	<div class="grid_12 row4">
			<div class="grid_1 row4 td_style_fieldName">
				<%=DynamicPaymentAmount%>:
			</div>

			<div id="amount" class="grid_3 row4 td_style_fieldValue">
				<%=amountForDisplay%>
			</div>

			<div class="responsive_page_line_break"></div>

			<div class="grid_1 row4 td_style_fieldName">
				 <%=paymentCEmail%>:
			</div>

			<div class="grid_3 row4 td_style_fieldValue responsive_value_field_width_limit">
				 <%=customerEmail%> 
			</div>
	</div>

	<div class="grid_12 row5">
			<div class="grid_1 row5 td_style_fieldName">
				 <%=paymentCurrency%>:
			</div>

			<div class="grid_3 row5 td_style_fieldValue">
				<%=currency%> 
			</div>

			<div class="responsive_page_line_break"></div>

			<div class="grid_1 row5 td_style_fieldName">
				<%=paymentOrderId%>:
			</div>

			<div class="grid_3 row5 td_style_fieldValue responsive_value_field_width_limit">
				<%=orderId%> 
			</div>
	</div>

	<div class="grid_12 row6">
			<div class="grid_1 row6 td_style_fieldName">
				<%=paymentDesc%>:
			</div>

			<div class="grid_8 row6 td_style_fieldValue responsive_value_field_width_limit">
				<%=description%>
			</div>
	</div>

	<div class="grid_12 row7 td_style_1">
		<%=CCDetails%>
	</div>

	<div class="grid_12 row8">
			<div class="grid_1 row8 td_style_fieldName">
				<%=CCNumber%>:
			</div>
			<div class="grid_8 row8 td_style_fieldValue">
				<input type="text" id="Track2CardNo" name="Track2CardNo" maxlength="80" width="100%" dir="ltr" autocomplete="off" onkeyup="limitInput(this,80)" onchange="return validateTrack2CardNo();" disabled />
			</div>
			<div class="grid_4 row8 td_style_invalidField invalid_field_place_holder">&nbsp;</div>
			<div class="grid_8 row8 td_style_invalidField" id="invalidCardNumber">&nbsp;</div>
			<div class="grid_4 row8 td_style_invalidField invalid_field_place_holder">&nbsp;</div>
			<div class="grid_8 row8 td_style_invalidField" id="invalidTrack2">&nbsp;</div>
	</div>

	<div class="grid_12 row9">
			<div class="grid_1 row9 td_style_fieldName">
				<%=CCExp%>:
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

	<div class="grid_12 row10">		
			<div class="grid_1 row10 td_style_fieldName">
				CVV:
			</div>
			<div class="grid_8 row10 td_style_fieldValue">
				<input type="text" pattern="[0-9]*" name="cvv" id="cvv" maxlength="4" style="width: 50px;" dir="ltr" autocomplete="off" onkeyup="limitInput(this,4)" onchange="return validateCvv();" disabled />
				<img id="qm" src="merchantPages/ResponsiveWebSources/images/qm.png"  onmouseover="showHideCVVhelp();" onmouseout="showHideCVVhelp();" style="cursor:pointer;"/>
				<div id="CVVhelp" style="display: none; position: absolute; border: 1px #cccccc solid; padding: 10px; background: white;">
				<img src="merchantPages/ResponsiveWebSources/images/cvv.jpg" />
				</div>
			</div>
			<div class="grid_4 row10 td_style_invalidField invalid_field_place_holder">&nbsp;</div>
			<div class="grid_8 row10 td_style_invalidField" id="invalidCvv">&nbsp;</div>
	</div>

	<!--
	<div class="grid_12 row11">
			<div class="grid_1 row11 td_style_fieldName">
				<%=cvv_wneb%>:
			</div>
			<div class="grid_8 row11 td_style_fieldValue">
				<select id="cvv_wneb" name="cvv_wneb" onchange="cvv_wneb_changed();" disabled >
					<option value=""></option>
					<option value="0"><%=cvv_wneb_0%></option>
					<option value="2"><%=cvv_wneb_2%></option>
					<option value="9"><%=cvv_wneb_9%></option>
				</select>
			</div>
			<div class="grid_4 row10 td_style_invalidField invalid_field_place_holder">&nbsp;</div>
			<div class="grid_8 row10 td_style_invalidField">&nbsp;</div>
	</div>
	-->

	<div class="grid_12 row12">
			<div class="grid_1 row12 td_style_fieldName">
				<%=CCPId%>:
			</div>
			<div class="grid_8 row12 td_style_fieldValue">
				<input type="text" pattern="[0-9]*" id="personalId" name="personalId" maxlength="9" dir="ltr" autocomplete="off" onkeyup="limitInput(this,9)" onchange="return validatePersonalId()" disabled />
			</div>
			<div class="grid_4 row12 td_style_invalidField invalid_field_place_holder">&nbsp;</div>
			<div class="grid_8 row12 td_style_invalidField" id="invalidPersonalId">&nbsp;</div>
	</div>

	<div id="divPayments" style="display:<%=showPayments%>"; >
	<div class="grid_12 rowPayments";>
		<div class="grid_4 rowPayments td_style_fieldPayments"><%=numberOfPaymentsLabel%></div>
		<div class="grid_3 rowPayments td_style_fieldValue">
			<%=NumberOfPaymentvalue%>
			<select id="numberOfPayments" name="numberOfPayments" style="display:<%=showSelectNumberOfPayments%>" onchange=<%=onchangeNumberOfPayments%>>
			<%=NumberOfPaymentsOptions%>
			</select>
			</div>
			<div class="grid_12 row12 td_style_invalidField" style="width: 100%;" id="invalidNumberOfPayments">&nbsp;</div>
			</div>
			<div class="grid_12 rowPayments"  style="display:<%=showFirstAndPeriodicalPayment%>"; >
			<div class="grid_4 rowPayments td_style_fieldPayments"><%=FirstPaymentLabel%></div>
			<div class="grid_2 rowPayments td_style_fieldValue">	
				<div id="firstPaymentDisp" class="data_style_payment" disabled="disabled" ><%=getFirstPayment()%></div>
			</div>
			<div class="responsive_page_line_break"></div>
			<div class="grid_4 rowPayments td_style_fieldPayments"><%=periodicalPaymentLabel%></div>
			<div class="grid_2 rowPayments td_style_fieldValue">
				<div id="periodicalPaymentDisp" class="data_style_payment" disabled="disabled" ><%=getPeriodicalPayment()%></div>
		</div>	
	</div>
	<div class="grid_12 rowPayments" style="display:<%=showPaymentsInterest%>">
		<div class="responsive_page_line_break"></div>
			<div class="grid_4 rowPayments td_style_fieldPayments"><%=paymentsInterestLabel%></div>
			<div class="grid_2 rowPayments td_style_fieldValue">
				<div id="paymentsInterestDisp" disabled="disabled" class="data_style_payment" ><%=paymentsInterest%></div>
		</div>
		</div>
	</div>

		<div id="form_buttons" class="grid_12 row13 td_style_fieldValue">
			<input type="submit" id="submitBtn" value="<%=formSend%>" disabled /> 
			<input id="resetBtn" type="reset" value="<%=formReset%>" onclick="clearFields()" disabled /> 
			<%=getCancelBtnHTML("")%>
		</div>

</form>

<%=getPayPalHTML()%>

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
